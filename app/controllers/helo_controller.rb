class HeloController < ApplicationController
  layout 'helo'

  def index
    @header = 'layout sample'
    @footer = 'copyright PIYO HOGE 2019'
    @title = 'New Layout'
    @msg = 'this is sample page!'
  end

  def other
    redirect_to action: :index, params: {'msg': 'from other page'}
  end

  def piyo
  end

end
