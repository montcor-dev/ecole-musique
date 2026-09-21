class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @student.build_person
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "Student created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
    @student.build_person unless @student.person  # Ensure person existsf
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private

def student_params
  params.expect(student: [
    :niveau, :date_premier_contact, :date_inscription, :date_fin, :statut, :style, :instrument, :source, :teacher_id,
    person_attributes: [ :titre, :formule, :tutoiement, :prenom, :nom, :adresse, :cp, :lieu, :telephone, :telephone_2, :email, :date_naissance, :a_propos ]
  ])
end
end
