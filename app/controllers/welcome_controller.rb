class WelcomeController < ApplicationController
  def index
    @posts = Post.order_by(created_at: 'desc')
    @post = Post.new
  end
end
