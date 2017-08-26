require "rails_helper"

RSpec.feature "users can create products" do
  let!(:user)     { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.build(:category) }
  let!(:product) { FactoryGirl.create(:product) }

  scenario "when signed in" do
    login_as(user)
    visit root_path
    click_on "New category"

    fill_in "Name", with: category.name
    click_on "Create category"

    expect(page).to have_content "category created"
    expect(page).to have_content "#{category.name}"

    product.categories << category
    product.save

    visit category_path(category)

    expect(page).to have_content "#{product.title}"

  end

  scenario "when anonymous" do
    visit root_path
    expect(page).to_not have_content "New category"
  end
end
