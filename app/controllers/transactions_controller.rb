class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :update, :destroy, :edit]


  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = current_user.transactions.new
  end

  def create
    byebug
    @transaction = current_user.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'transaction was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'transaction was successfully destroyed.' }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def transaction_params
    params.require(:transaction).permit(:title ,:amount, :wallet_id, :type)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
