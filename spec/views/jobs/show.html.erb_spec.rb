require 'rails_helper'

RSpec.describe "jobs/show", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "Title",
      :headquarters => "Headquarters",
      :job_description => "MyText",
      :how_to_apply => "MyText",
      :company_name => "Company Name",
      :company_url => "Company Url",
      :email => "Email",
      :highlight => false,
      :paid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Headquarters/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Company Url/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
