class WalletsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wallet, only: [:show, :update, :destroy, :edit]

  def index
    @wallets = current_user.wallets.includes(:transactions).page(params[:page])
  end

  def new
    @wallet = current_user.wallets.new
  end

  def create
    @wallet = current_user.wallets.new(wallet_params)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to @wallet, notice: 'Wallet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @wallet.destroy
    respond_to do |format|
      format.html { redirect_to wallets_url, notice: 'Wallet was successfully destroyed.' }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to @wallet, notice: 'Wallet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end



  def show
  end

  def wallet_params
    params.require(:wallet).permit(:title)
  end

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end
end
