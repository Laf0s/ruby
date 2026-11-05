class HiController < ApplicationController
  def index
    @student = 'Я - студент Андрій Яцишин'
    @time = Time.now
    @message = 'прийшло з Контролера'
  end
end