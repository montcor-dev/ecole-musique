# app/controllers/interactions_controller.rb
class InteractionsController < ApplicationController
  before_action :set_interaction, only: %i[ show edit update destroy ]
  before_action :set_person, only: %i[ index new create ]

  # GET /students/1/interactions or /teachers/1/interactions
  def index
    @interactions = if @person
                      @person.interactions.order(interaction_date: :desc)
    else
                      Interaction.all.order(interaction_date: :desc)
    end
  end

  # GET /interactions/1
  def show
  end

  # GET /students/1/interactions/new
  def new
    @interaction = @person.interactions.new
  end

  # GET /interactions/1/edit
  def edit
  end

  # POST /students/1/interactions
  def create
    @interaction = @person.interactions.new(interaction_params)

    respond_to do |format|
      if @interaction.save
        format.html { redirect_to @interaction, notice: "Interaction was successfully created." }
        format.json { render :show, status: :created, location: @interaction }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @interaction.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /interactions/1
  def update
    respond_to do |format|
      if @interaction.update(interaction_params)
        format.html { redirect_to @interaction, notice: "Interaction was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @interaction }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @interaction.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /interactions/1
  def destroy
    @interaction.destroy!

    respond_to do |format|
      format.html { redirect_to interactions_path, notice: "Interaction was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_interaction
    @interaction = Interaction.find(params.expect(:id))
  end

  # Resolve @person from whichever nested route we came through.
  def set_person
    @person = if params[:student_id]
                Student.find(params[:student_id]).person
    elsif params[:teacher_id]
                Teacher.find(params[:teacher_id]).person
    end
  end

  def interaction_params
    params.expect(interaction: [ :interaction_date, :note, :follow_up_needed, :follow_up_due_date, :interaction_type ])
  end
end
