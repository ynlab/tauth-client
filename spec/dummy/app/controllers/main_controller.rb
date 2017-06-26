class MainController < ApplicationController
  before_action :authenticate!, :only => 'private'

  def index
  end

  def private
    render :text => 'hi'
  end
end
