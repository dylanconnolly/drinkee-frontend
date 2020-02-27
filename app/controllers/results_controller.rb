class ResultsController < ApplicationController
  def index
    render file: '/public/404' unless current_user

    @results = BackEndApi.new.get_results(current_user.id)
  end
end
