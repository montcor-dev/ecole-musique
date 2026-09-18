class InteractionsController < ApplicationController
  before_action :set_interaction, only: %i[ show edit update destroy ]

  # GET /interactions or /interactions.json
  def index
    # @interactions = Interaction.all
    if params[:student_id]
      @interactions = Interaction.where(student_id: params[:student_id]).order(date_interaction: :desc)
    else
      @interactions = Interaction.all.order(date_interaction: :desc)
    end
  end

  # GET /interactions/1 or /interactions/1.json
  def show
  end

  # GET /interactions/new
  def new
    @interaction = Interaction.new
  end

  # GET /interactions/1/edit
  def edit
  end

  # POST /interactions or /interactions.json
  def create
    @interaction = Interaction.new(interaction_params)

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

  # PATCH/PUT /interactions/1 or /interactions/1.json
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

  # DELETE /interactions/1 or /interactions/1.json
  def destroy
    @interaction.destroy!

    respond_to do |format|
      format.html { redirect_to interactions_path, notice: "Interaction was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interaction
      @interaction = Interaction.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def interaction_params
      params.expect(interaction: [ :date_interaction, :student_id, :moyen, :note, :suivi_necessaire, :suivi_delai, :auteur, :interaction_type, :annexes ])
    end
end
