class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @expenses = current_user.expenses.order(created_at: :desc)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
    @expense = Expense.new
    @selected_category_ids = []
  end

  def create
    primary_category_id = params[:expense][:primary_category_id]
    additional_category_ids = params[:additional_category_ids] || []

    name = params[:expense][:name]
    amount = params[:expense][:amount]

    @expense = Expense.new(name:, amount:, user: current_user)

    if @expense.save
      ExpenseCategory.create(expense_id: @expense.id, category_id: primary_category_id)

      additional_category_ids.each do |category_id|
        next if category_id.blank?

        ExpenseCategory.create(expense_id: @expense.id, category_id:)
      end

      redirect_to category_path(primary_category_id), notice: 'Expense was successfully created.'
    else
      @categories = current_user.categories
      render :new
    end
  end

  def edit; end

  def update
    if @expense.update(expense_params)
      @expense.category_ids = params[:expense][:category_ids]
      redirect_to @expense, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id, category_ids: [])
  end
end
