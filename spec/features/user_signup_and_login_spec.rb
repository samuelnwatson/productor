require "rails_helper"

RSpec.feature "users can sign up and login" do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit root_path
    click_on "login or sign up"
  end

  context "when signing up" do
    scenario "with valid input" do
      click_on "Sign up"
      fill_in "Name", with: Faker::StarWars.name
      fill_in "Email", with: Faker::Internet.email
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Sign up"

      expect(page).to have_content "Logout"
      expect(page).to have_content "Hi!"
    end

    scenario "with invalid input" do
      click_on "Sign up"
      click_on "Sign up"

      expect(page).to_not have_content "Logout"
    end
  end

  context "when logging in" do
    scenario "with valid input" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"

      expect(page).to have_content "Logout"
      expect(page).to have_content "Hi! #{user.name}"
    end

    scenario "with invalid input" do
      click_on "Log in"

      expect(page).to_not have_content "Logout"
    end
  end
end
