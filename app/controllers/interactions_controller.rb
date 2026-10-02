# app/controllers/interactions_controller.rb
class InteractionsController < ApplicationController
  before_action :set_interaction, only: %i[ show edit update destroy ]
  before_action :set_person, only: %i[ index new create show edit update destroy]

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
    @interaction = @person.interactions.build
    @interaction.interaction_date = Time.current  # Optional: default to now
  end

  # GET /interactions/1/edit
  def edit
  end

# POST /students/1/interactions
def create
  @interaction = @person.interactions.build(interaction_params)
  if @interaction.save
    redirect_to [ @student || @teacher, @interaction ], notice: "Interaction created successfully."
  else
    render :new, status: :unprocessable_entity
  end
end

  # PATCH/PUT /interactions/1
  def update
    if @interaction.update(interaction_params)
      redirect_to [ @student || @teacher, @interaction ], notice: "Interaction updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /interactions/1
  def destroy
    @interaction.destroy
    redirect_to [ @student || @teacher, :interactions ], notice: "Interaction deleted successfully."
  end

  private

  # Find the specific interaction by ID
  def set_interaction
    @interaction = Interaction.find(params[:id])
  end

  # Set @person (and @student/@teacher) from nested route params
  def set_person
    if params[:student_id]
      @student = Student.find(params[:student_id])
      @person = @student.person
    elsif params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @person = @teacher.person
    end
  end

  # Strong parameters - only allow these fields for mass assignment
  def interaction_params
    params.expect(interaction: [ :interaction_date, :note, :follow_up_needed, :follow_up_due_date, :interaction_type ])
  end
end
