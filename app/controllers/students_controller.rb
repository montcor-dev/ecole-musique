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
    @student.build_person unless @student.person  # Ensure person exists
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # soft-delete students (mark as "ancien")
  def destroy
    @student.update(status: "ancien")
    redirect_to students_path, notice: "Student marked as ancien"
  end

  private

  def student_params
    params.expect(student: [
      :level, :first_contact_date, :enrollment_date, :end_date, :status, :style, :instrument, :source, :teacher_id,
      person_attributes: [ :id, :title, :greeting_formula, :use_tu, :first_name, :last_name, :address, :postal_code, :city, :phone, :phone_2, :email, :date_of_birth, :about_me ]
    ])
  end
end
