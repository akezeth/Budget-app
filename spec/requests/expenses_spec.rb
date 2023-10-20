require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) do
    User.create(name: 'Aklilu', email: 'akezeth@gmail.com', password: 'ake123', password_confirmation: 'ake123')
  end
  let(:category) { Category.create(name: 'Groceries', icon: 'icon.png', user:) }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'assigns the requested expense to @expense' do
      expense = Expense.create(name: 'Milk', amount: 5, user:) # Include the user
      ExpenseCategory.create(expense_id: expense.id, category_id: category.id)
      get :show, params: { category_id: category.id, id: expense.id }

      expect(assigns(:expense)).to eq(expense)
    end

    it 'renders the show template' do
      expense = Expense.create(name: 'Milk', amount: 2.99, user:) # Include the user
      get :show, params: { category_id: category.id, id: expense.id }

      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new expense to @expense' do
      get :new, params: { category_id: category.id }
      expect(assigns(:expense)).to be_a_new(Expense)
    end

    it 'assigns the current user\'s categories to @categories' do
      get :new, params: { category_id: category.id }
      expect(assigns(:categories)).to eq(user.categories)
    end

    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new expense' do
        expect do
          post :create,
               params: { category_id: category.id,
                         expense: { name: 'Bread', amount: 1.99, primary_category_id: category.id,
                                    additional_category_ids: [] } }
        end.to change(Expense, :count).by(1)
      end

      it 'creates a new expense category' do
        expect do
          post :create,
               params: { category_id: category.id,
                         expense: { name: 'Bread', amount: 1.99, primary_category_id: category.id,
                                    additional_category_ids: [] } }
        end.to change(ExpenseCategory, :count).by(1) # Adjusted for primary category only
      end

      it 'sets a notice message' do
        post :create,
             params: { category_id: category.id,
                       expense: { name: 'Bread', amount: 1.99, primary_category_id: category.id,
                                  additional_category_ids: [] } }
        expect(flash[:notice]).to eq('Expense was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new expense' do
        expect do
          post :create,
               params: { category_id: category.id,
                         expense: { name: '', amount: 1.99, primary_category_id: category.id,
                                    additional_category_ids: [] } }
        end.not_to change(Expense, :count)
      end

      it 'renders the new template' do
        post :create,
             params: { category_id: category.id,
                       expense: { name: '', amount: 1.99, primary_category_id: category.id,
                                  additional_category_ids: [] } }
        expect(response).to render_template(:new)
      end
    end
  end
end
