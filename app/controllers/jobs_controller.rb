class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  # GET /jobs
  # GET /jobs.json
  def index
    # @jobs = Job.all
    @jobs = Job.where(paid: true, created_at: (Time.now - 1.month)..Time.now)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    # If job is younger than 15 minutes, check payment
    if(Time.now.between?(@job.created_at.time, @job.created_at.time + 16.minute))
      if @job.bitcoin_invoice.is_paid?
        @job.paid = true
        @job.save
      else
        @job.paid = false
      end
      # flash[:notice] = "Checking payment #{@job.bitcoin_invoice.is_paid?}. Job.paid: #{@job.paid}"
    else
      # flash[:notice] = "Not checking payment"
      @job.paid
    end

  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        @job.bitcoin_invoice.bitpay_invoice["redirectURL"] = url_for(@job)

        JobMailer.welcome_email(@job).deliver

        format.html { redirect_to @job.bitcoin_invoice.bitpay_invoice["url"], notice: 'Job was successfully created.' }
        # format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:title, :headquarters, :job_description, :how_to_apply, :company_name, :company_url, :email, :highlight, :paid)
  end
end
