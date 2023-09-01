class QuestionsController < ApplicationController
  skip_before_action :authenticate_user! ,only: %i[index show]
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @questions = Question.all
  end

  def mypost
	  @questions = current_user.questions.all
  end
  
  def new
    @question = current_user.questions.new
  end
  
  def show
    @user = User.find(@question.user_id)
    @answers = @question.answers.all
    @answer = @question.answers.new
  end
  
  def create
    @question = current_user.questions.new(question_params)
    if @question.save!
      redirect_to question_path(@question)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @question.destroy! 
    redirect_to questions_path
  end
  
  private
  
    def set_question
      @question = Question.find(params[:id])
    end
    
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
