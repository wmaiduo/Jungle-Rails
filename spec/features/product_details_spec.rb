require 'rails_helper'

RSpec.feature "Visitor navigates to a single product", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    page = first('.btn-default').click

    puts page
    # DEBUG

    sleep(0.1)
    save_screenshot

    # VERIFY

  end
end
