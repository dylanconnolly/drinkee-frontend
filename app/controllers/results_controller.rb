class ResultsController < ApplicationController
  def index
    render file: '/public/404' unless current_user
  end
end
