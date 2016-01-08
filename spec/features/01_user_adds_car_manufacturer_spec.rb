require 'rails_helper'

feature "user adds car manufacturer", %{

  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:
  [x] I must specify a manufacturer name and country.
  [x] If I do not specify the required information, I am presented with errors.
  [x] If I specify the required information, the manufacturer is recorded and
  I am redirected to the index of manufacturers.

} do

  scenario "user successfully adds car manufacturer" do
    visit new_manufacturer_path

    fill_in 'Name', with: 'Honda'
    fill_in 'Country', with: 'Japan'
    click_button 'Create Manufacturer'

    expect(page).to have_content("Manufacturer added successfully")
    expect(page).to have_content("Honda")
  end

  scenario "user unsuccessfully adds car manufacturer and sees errors" do
    visit new_manufacturer_path

    click_button 'Create Manufacturer'

    expect(page).to have_content("Add a New Manufacturer:")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Country can't be blank")
    expect(page).to_not have_content("Manufacturer added successfully")
  end
end
