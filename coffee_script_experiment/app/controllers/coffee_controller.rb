class CoffeeController < ApplicationController
  def index
    
  end
  def ajax
    @user = User.create user_params
    respond_to :js
  end
  private
    def user_params
      params.permit(:name)
    end
end
