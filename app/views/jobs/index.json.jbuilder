json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :headquarters, :job_description, :how_to_apply, :company_name, :company_url, :email, :highlight, :paid
  json.url job_url(job, format: :json)
end
