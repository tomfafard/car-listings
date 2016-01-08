require 'rails_helper'

feature "user adds car manufacturer", %{

  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:
  [x] I must specify the manufacturer, color, year, and mileage of the car
  (an association between the car and an existing manufacturer should be created).
  [x] Only years from 1920 and above can be specified.
  [x] I can optionally specify a description of the car.
  [x] If I enter all of the required information in the required formats, the car
  is recorded and I am presented with a notification of success.
  [x] If I do not specify all of the required information in the required formats,
  the car is not recorded and I am presented with errors.
  [x] Upon successfully creating a car, I am redirected back to the index of cars.

} do

  let!(:manufacturer_1) { FactoryGirl.create(:manufacturer) }
  let!(:manufacturer_2) { FactoryGirl.create(:manufacturer) }

  scenario "user successfully adds car" do
    visit new_car_path

    select manufacturer_2.name, from: "Manufacturer"
    fill_in "Color", with: "Blue"
    fill_in "Year", with: "2006"
    fill_in "Mileage", with: "102000"
    click_button "Create Car"

    expect(page).to have_content("Car added successfully")
    expect(page).to have_content("Manufacturer 2")
  end

  scenario "user unsuccessfully adds car and sees errors" do
    visit new_car_path

    click_button "Create Car"

    expect(page).to have_content("Add a New Car:")
    expect(page).to have_content("Color can't be blank")
    expect(page).to have_content("Year can't be blank")
    expect(page).to_not have_content("Manufacturer 2")
  end
end
