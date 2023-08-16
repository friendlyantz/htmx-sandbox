class ProgressBarController < ApplicationController
  # DEVELOPMENT PURPOSES ONLY
  skip_before_action :verify_authenticity_token  

  def index; end  

  def start
    @percent = 0
    render partial: 'progress'
  end

  def job
    @percent = params[:percent].to_i
    @percent += 10
    render partial: 'finished' and return if @percent >= 100
    render partial: 'progress'
  end
end
