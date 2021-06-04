class ExchangeCurrenciesController < ApplicationController
  before_action :authenticate_user!

  def new
    @currencies = current_user.account_currencies
  end

  def create
    source_currency = params[:source_currency]
    target_currency = params[:destination_currency]

    current_user.exchange_currency(source_currency,
                                   params[:source_amount],
                                   target_currency,
                                   ExchangeRate.new(source_currency, target_currency, params[:exchange_rate]))
    redirect_to :profile
  end
end