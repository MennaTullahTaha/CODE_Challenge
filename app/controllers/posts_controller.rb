class PostsController < ApplicationController
    before_action :set_post, except: [:index, :new, :create,:orphanage_posts]

    def show
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
    end

    def update 
        if @post.update(white_list)
            flash[:notice] = "Post was updated successfully."
            redirect_to @post
        else
            render 'edit' 
        end   
    end 

    def destroy 
        @post.destroy
        redirect_to posts_path
    end

    def orphanage_posts
        @posts = Post.where(orphanage_id: params[:orphanage_id])
    end

    private

    def white_list
        params.require(:post).permit(:title, :category, :fulfilled, :body)
    end

    def set_post
        @post = Post.find(params[:id])
    end 


end
