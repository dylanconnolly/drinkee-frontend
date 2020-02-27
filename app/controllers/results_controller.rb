class ResultsController < ApplicationController
  def index
    if current_user
      @results = BackEndApi.new.get_results(current_user.id)
    else
      render file: '/public/404' unless current_user
    end
  end
end
