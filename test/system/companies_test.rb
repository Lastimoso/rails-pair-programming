require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit companies_url
    click_on "New company"

    fill_in "Founded at", with: @company.founded_at
    fill_in "Headquarters city", with: @company.headquarters_city
    fill_in "Headquarters country", with: @company.headquarters_country
    fill_in "Industries", with: @company.industries
    fill_in "Keywords", with: @company.keywords
    fill_in "Linkedin url", with: @company.linkedin_url
    fill_in "Metadata", with: @company.metadata
    fill_in "Name", with: @company.name
    fill_in "Url", with: @company.url
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit company_url(@company)
    click_on "Edit this company", match: :first

    fill_in "Founded at", with: @company.founded_at
    fill_in "Headquarters city", with: @company.headquarters_city
    fill_in "Headquarters country", with: @company.headquarters_country
    fill_in "Industries", with: @company.industries
    fill_in "Keywords", with: @company.keywords
    fill_in "Linkedin url", with: @company.linkedin_url
    fill_in "Metadata", with: @company.metadata
    fill_in "Name", with: @company.name
    fill_in "Url", with: @company.url
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit company_url(@company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
