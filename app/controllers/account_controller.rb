class AccountController < ApplicationController
  def index
    @accounts = Account.paginate(page: params[:page])
  end

  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(account_params)
    @account.save
    render 'new'
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      flash[:success] = 'account updated'
      redirect_to @account
    else
      render 'edit'
    end
  end

  def delete
    Account.find(params[:id]).destroy
    flash[:success] = 'Account deleted'
    render 'new'
  end
end
