class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end 

    def index
        @posts = Post.all
    end 

    def new
        @post = Post.new
    end 

    def create
        @post = Post.new(white_list)
        if @post.save
            flash[:notice] = "Post was created successfully."
            redirect_to @post
        else
            render 'new'
        end
    end 

    private
    def white_list
        params.require(:post).permit(:title, :category, :fulfilled, :body)
    end

end
