class ExampleAnswersController < ApplicationController
  before_action :set_example_answer, only: [:show, :edit, :update, :destroy]
  before_action :admin_user
  
  # GET /example_answers
  # GET /example_answers.json
  def index
    @example_answers = ExampleAnswer.all
  end

  # GET /example_answers/1
  # GET /example_answers/1.json
  def show
  end

  # GET /example_answers/new
  def new
    @example_answer = ExampleAnswer.new
  end

  # GET /example_answers/1/edit
  def edit
  end

  # POST /example_answers
  # POST /example_answers.json
  def create
    @example_answer = ExampleAnswer.new(example_answer_params)

    respond_to do |format|
      if @example_answer.save
        format.html { redirect_to @example_answer, notice: 'Example answer was successfully created.' }
        format.json { render :show, status: :created, location: @example_answer }
      else
        format.html { render :new }
        format.json { render json: @example_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /example_answers/1
  # PATCH/PUT /example_answers/1.json
  def update
    respond_to do |format|
      if @example_answer.update(example_answer_params)
        format.html { redirect_to @example_answer, notice: 'Example answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @example_answer }
      else
        format.html { render :edit }
        format.json { render json: @example_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /example_answers/1
  # DELETE /example_answers/1.json
  def destroy
    @example_answer.destroy
    respond_to do |format|
      format.html { redirect_to example_answers_url, notice: 'Example answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example_answer
      @example_answer = ExampleAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_answer_params
      params.require(:example_answer).permit(:example_answer)
    end
end
