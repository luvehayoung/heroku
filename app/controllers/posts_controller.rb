class PostsController < ApplicationController
    
    def index
        unless user_signed_in?
            redirect_to "/users/sign_in"
        end
        @allPost = Post.all
    end
    
    def create
        newPost = Post.new
        
        newPost.title = params[:title]
        newPost.content = params[:content]
        
        newPost.save
        
        redirect_to "/index"
    end
    
    def show
        @thisPost = Post.find(params[:id])
        @comments = Comment.where(:post_id => params[:id])
    end
    
    def edit
        @editPost = Post.find(params[:id])
    
    end

    def update
        @updatePost = Post.find(params[:id])
        @updatePost.title = params[:title]
        @updatePost.content = params[:content]
        @updatePost.save
        
        redirect_to '/index'
    end
    
    def delete
        @deletePost = Post.find(params[:id])
        @deletePost.destroy
        
        redirect_to '/index'
    end
end
