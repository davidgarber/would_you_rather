class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

	def show
	    @question = Question.find(params[:question_id])
	    @comment = Comment.find(params[:id])
	end

	def new
	    @question = Question.find(params[:question_id])
	    @comment = @question.comments.new
  end

	def create
	  @question = Question.find(params[:question_id])
	  @comment = @question.comments.new(comment_params)
	  if @comment.save
	     flash[:notice] = "Project added!!"

  	   respond_to do |format|
        format.html {  redirect_to question_path(@comment.question)}
        format.js
      end
	  else
	    render :new
	  end

	end

	def edit
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to question_comment_path(@question, @comment)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to question_path(@question)

  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
