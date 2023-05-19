require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  test "#score should return the correct score" do
    company = Company.new(
      founded_at: 2002,
      employee_count: 50,
      industries: ["Software", "Tracking Technology"],
    )

    assert_equal 255, company.score
  end
end
