require 'date'
require 'time'
class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @question.start_time = Time.now
    @question.save

  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    @question.start_time = Time.now
    @question.save
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.time = DateTime.now()

    respond_to do |format|
      if @question.save
        format.html { redirect_to root_path }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    puts params
    @question = Question.find(params[:id])
    if params[:commit] == 'Answer'
      @question.resolved = true
      @question.end_time = Time.now
      @question.username = current_user.email.split('@')[0]
      if @question.update(update_question_params)
        redirect_to solve_path
      end
    end

    if params[:commit] == 'Escalate'
      @question.escalated = true
      @question.username = current_user.email.split('@')[0]
      if @question.update(update_question_params)
        redirect_to solve_path
      end
    end 
    
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :description)
    end
    def update_question_params
      params.require(:question).permit(:answer)
    end

end
