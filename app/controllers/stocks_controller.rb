class StocksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    result        = Scenarios::Stocks::Create.call(params)
    response_body = Serializers::Stock.proceed(result)
    status        = result.success? ? 200 : 422

    render json: response_body, status: status
  end

  def index
    result        = Scenarios::Stocks::Index.call
    response_body = Serializers::Stock.proceed(result)
    status        = result.success? ? 200 : 422

    render json: response_body, status: status
  end

  def update
    result        = Scenarios::Stocks::Update.call(params)
    response_body = Serializers::Stock.proceed(result)
    status        = result.success? ? 200 : 422

    render json: response_body, status: status
  end

  def destroy
    result        = Scenarios::Stocks::Delete.call(params)
    response_body = Serializers::Stock.proceed(result)
    status        = result.success? ? 200 : 422

    render json: response_body, status: status
  end
end