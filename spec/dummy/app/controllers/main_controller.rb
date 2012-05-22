class MainController < ApplicationController
  before_filter :authenticate!, :only => 'private'

  def index
  end

  def private
    render :text => 'hi'
  end
end
