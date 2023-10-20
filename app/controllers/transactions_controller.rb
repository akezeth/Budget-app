class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @transactions = current_user.transactions.order(created_at: :desc)
  end

  def show
    @transaction = transaction.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
    @transaction = transaction.new
    @selected_category_ids = []
  end

  def create
    primary_category_id = params[:transaction][:primary_category_id]
    additional_category_ids = params[:additional_category_ids] || []

    name = params[:transaction][:name]
    amount = params[:transaction][:amount]

    @transaction = transaction.new(name:, amount:, user: current_user)

    if @transaction.save
      transactionCategory.create(transaction_id: @transaction.id, category_id: primary_category_id)

      additional_category_ids.each do |category_id|
        next if category_id.blank?

        transactionCategory.create(transaction_id: @transaction.id, category_id:)
      end

      redirect_to category_path(primary_category_id), notice: 'transaction was successfully created.'
    else
      @categories = current_user.categories
      render :new
    end
  end

  def edit; end

  def update
    if @transaction.update(transaction_params)
      @transaction.category_ids = params[:transaction][:category_ids]
      redirect_to @transaction, notice: 'transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'transaction was successfully destroyed.'
  end

  private

  def set_transaction
    @transaction = transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id, category_ids: [])
  end
end
