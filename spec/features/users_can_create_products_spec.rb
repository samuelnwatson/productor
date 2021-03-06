require "rails_helper"

RSpec.feature "users can create products" do
  let!(:user)     { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category) }
  let(:product)   { FactoryGirl.build(:product) }

  scenario "when signed in" do
    login_as(user)
    visit root_path
    click_on "New product"

    fill_in "Title", with: product.title
    fill_in "Description", with: product.description
    check "#{category.name}"
    attach_file "Photo", "spec/fixtures/photo.png"
    click_on "Create product"

    expect(page).to have_content "product created"
    expect(page).to have_content "#{product.title}"
    expect(page).to have_content "#{product.description}"
    expect(page).to have_content "#{category.name}"
    expect(page).to have_content "photo.png"
  end

  scenario "when anonymous" do
    visit root_path
    expect(page).to_not have_content "New product"
  end
end
