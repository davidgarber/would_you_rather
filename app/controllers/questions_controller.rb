class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @comments = Comment.all
  end


  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question saved!"
      respond_to do |format|
        format.html {  redirect_to questions_path }
        format.js
      end
    else
      flash[:alert] = "errors!"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      respond_to do |format|
        format.html {  redirect_to questions_path }
        format.js
      end
    else
      redirect_to  edit_question_path(@question)
    end


  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html {  redirect_to questions_path }
      format.js
    end
  end


  private
  def question_params
    params.require(:question).permit(:title, :answer_a, :answer_b)
  end

end
