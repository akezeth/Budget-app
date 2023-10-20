require 'rails_helper'

RSpec.describe 'category#index', type: :feature do
  before(:each) do
    @user1 = User.create(
      id: 2,
      name: 'cosmas wasswa',
      email: 'cosy@gmail.com',
      password: 'Cosy1234'
    )

    sign_in @user1

    @categories = [
      Category.create(
        id: 1,
        user_id: @user1.id,
        name: 'Food',
        icon: 'https://unsplash.com/photos/a-table-topped-with-plates-of-food-and-utensils-w6udFN7vybs'
      ),
      Category.create(
        id: 2,
        user_id: @user1.id,
        name: 'Stationery',
        icon: 'https://unsplash.com/photos/F_-0BxGuVvo'
      )
    ]

    visit categories_path
  end

  describe '#Indexpage' do
    it 'can see the category name.' do
      @categories.each do |category|
        expect(page).to have_content(category.name)
      end
    end

    it 'can see the category icon.' do
      @categories.each do |category|
        expect(page).to have_css("img[src='#{category.icon}']")
      end
    end

    it 'redirects to the new category form when clicking "Add a new Category"' do
      click_link('Add a New Category')
      expect(page).to have_current_path(new_category_path)
    end
  end
end
