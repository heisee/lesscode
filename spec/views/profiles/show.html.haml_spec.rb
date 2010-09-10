require 'spec_helper'

describe "profiles/show.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :name => "Name",
      :zip_code => "Zip Code",
      :location => "Location",
      :company_name => "Company Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Zip Code".to_s)
    rendered.should contain("Location".to_s)
    rendered.should contain("Company Name".to_s)
  end
end
