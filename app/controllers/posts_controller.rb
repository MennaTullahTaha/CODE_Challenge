class PostsController < ApplicationController
    before_action :set_post, except: [:index, :new, :create,:orphanage_posts, :orphanage_posts]
    before_action :require_orphanage, except: [:show, :index, :orphanage_posts]
    before_action :is_verified?, except: [:index]
    before_action :require_same_orphanage, only: [:edit, :update, :destroy]

    def show
    end 

    def index
        @posts = Post.paginate(page: params[:page], per_page: 5)
    end 

    def new
        @post = Post.new
    end 

    def create
        @post = Post.new(white_list)
        @post.orphanage = current_user
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
        @posts = Post.where(orphanage_id: params[:orphanage_id]).paginate(page: params[:page], per_page: 5)
    end

    private

    def white_list
        params.require(:post).permit(:title, :category, :fulfilled, :body)
    end

    def set_post
        @post = Post.find(params[:id])
    end 

    def require_same_orphanage
        if current_user.class.name == "Orphanage"
            if current_user != @post.orphanage
                flash[:alert] = "This account is permitted to only edit or delete posts created by it."
                redirect_to @post
            end 
        else 
            flash[:alert] = "You aren't permitted to perfom this action."
            redirect_to @post
        end 
    end
end
