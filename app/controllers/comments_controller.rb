class CommentsController < ApplicationController


  def index

        @post = Post.find(params[:post_id])
        @comments=@post.comments

  end

	def create
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.create(params[:comment])
    	redirect_to post_path(@post)
  	end


	def show
   
    	@comment = Comment.find(params[:id])

    	respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @post }
    	end
  	end


  def edit
   
    @comment = Comment.find(params[:id])
  end


  def update
    

    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
 
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

end
