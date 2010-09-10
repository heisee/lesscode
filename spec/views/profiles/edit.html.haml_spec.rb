require 'spec_helper'

describe "profiles/edit.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :new_record? => false,
      :name => "MyString",
      :zip_code => "MyString",
      :location => "MyString",
      :company_name => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    rendered.should have_selector("form", :action => profile_path(@profile), :method => "post") do |form|
      form.should have_selector("input#profile_name", :name => "profile[name]")
      form.should have_selector("input#profile_zip_code", :name => "profile[zip_code]")
      form.should have_selector("input#profile_location", :name => "profile[location]")
      form.should have_selector("input#profile_company_name", :name => "profile[company_name]")
    end
  end
end
