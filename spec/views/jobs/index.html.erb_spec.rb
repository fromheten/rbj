require 'rails_helper'

RSpec.describe "jobs/index", :type => :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :title => "Title",
        :headquarters => "Headquarters",
        :job_description => "MyText",
        :how_to_apply => "MyText",
        :company_name => "Company Name",
        :company_url => "Company Url",
        :email => "Email",
        :highlight => false,
        :paid => false
      ),
      Job.create!(
        :title => "Title",
        :headquarters => "Headquarters",
        :job_description => "MyText",
        :how_to_apply => "MyText",
        :company_name => "Company Name",
        :company_url => "Company Url",
        :email => "Email",
        :highlight => false,
        :paid => false
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Headquarters".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Url".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
