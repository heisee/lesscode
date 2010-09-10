require 'spec_helper'

describe "profiles/index.html.haml" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :name => "Name",
        :zip_code => "Zip Code",
        :location => "Location",
        :company_name => "Company Name"
      ),
      stub_model(Profile,
        :name => "Name",
        :zip_code => "Zip Code",
        :location => "Location",
        :company_name => "Company Name"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Zip Code".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Location".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Company Name".to_s, :count => 2)
  end
end
