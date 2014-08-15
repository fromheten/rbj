require 'rails_helper'

RSpec.describe "jobs/edit", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "MyString",
      :headquarters => "MyString",
      :job_description => "MyText",
      :how_to_apply => "MyText",
      :company_name => "MyString",
      :company_url => "MyString",
      :email => "MyString",
      :highlight => false,
      :paid => false
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input#job_title[name=?]", "job[title]"

      assert_select "input#job_headquarters[name=?]", "job[headquarters]"

      assert_select "textarea#job_job_description[name=?]", "job[job_description]"

      assert_select "textarea#job_how_to_apply[name=?]", "job[how_to_apply]"

      assert_select "input#job_company_name[name=?]", "job[company_name]"

      assert_select "input#job_company_url[name=?]", "job[company_url]"

      assert_select "input#job_email[name=?]", "job[email]"

      assert_select "input#job_highlight[name=?]", "job[highlight]"

      assert_select "input#job_paid[name=?]", "job[paid]"
    end
  end
end
