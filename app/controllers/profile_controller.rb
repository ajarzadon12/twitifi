class ProfileController < ApplicationController
    def index
        @posts = Post.order_by(created_at: 'desc')
    end
end
