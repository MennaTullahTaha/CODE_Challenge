class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end 

    def index
        @posts = Post.all
    end 

    def new
    end 

    def create
        @post = Post.new(white_list)
        @post.save
        redirect_to @post
    end 

    private
    def white_list
        params.require(:post).permit(:title, :category, :fulfilled, :body)
    end

end
