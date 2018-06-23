# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Authentication filtering", type: :system do
  before do
    driven_by(:rack_test)
  end
  it "allows authentication by domain users" do
    visit "/auth/developer"

    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "jdoe@devcaffeine.com"

    click_button "Sign In"

    expect(page).to have_content("Welcome John Doe")
  end

  it "refuses authentication from unknown domains" do
    visit "/auth/developer"

    fill_in "Name", with: "Mike Smith"
    fill_in "Email", with: "smith@gmail.com"

    click_button "Sign In"

    expect(page).to have_content("not authorized for your domain!")
  end
end
