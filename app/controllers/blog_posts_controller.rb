class BlogPostsController < ApplicationController

    before_action :set_blog_post, only: %i[ show edit update destroy ]

    def show
    end

    def new
      @blog_post = BlogPost.new
    end

    def edit
    end

    def new
        @blog_post = BlogPost.new
        @blog_post.user_id = params[:user]
    end

    def create
      @blog_post = BlogPost.new(blog_post_params)

      respond_to do |format|
        if @blog_post.save
          format.html { redirect_to user_path(@blog_post.user_id), notice: "Blog post was successfully created." }
          format.json { render :show, status: :created, location: user_path(@blog_post.user_id) }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @blog_post.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      old_img = @blog_post.img
      respond_to do |format|
        if @blog_post.update(blog_post_params)
          if old_img != @blog_post.img && !(old_img.nil? || old_img.empty?)
            Cloudinary::Uploader.destroy(old_img) 
          end
          format.html { redirect_to user_path(@blog_post.user_id), notice: "Blog post was successfully updated." }
          format.json { render :show, status: :ok, location: @blog_post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @blog_post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @blog_post.destroy
      respond_to do |format|
        Cloudinary::Uploader.destroy(@blog_post.img) unless @blog_post.img.nil? || @blog_post.img.empty?
        format.html { redirect_to user_path(@blog_post.user_id), notice: "Blog post was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private 

    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:user_id, :title, :post, :img)
    end

end