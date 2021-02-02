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

    def edit
        @post = Post.find(params[:id])
    end 

    def update 
        @post = Post.find(params[:id])
        if @post.update(white_list)
            flash[:notice] = "Post was updated successfully."
            redirect_to @post
        else
            render 'edit' 
        end   
    end 

    def destroy 
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
    def white_list
        params.require(:post).permit(:title, :category, :fulfilled, :body)
    end

end
