class StudentsController < ApplicationController

        def new
            @student = Student.new
        end

        def index
            @students = Student.all
        end

        def show
            @student = Student.find(params[:id])

        end
        
        def create
            @student = Student.create(students_param(:first_name,:last_name))
            redirect_to student_path(@student)
        
        end


        def edit
            @student = Student.find(params[:id])
        end

        def update
            @student= Student.find(params[:id])
            @student.update(students_param(:first_name,:last_name))
            redirect_to student_path(@student)
        end



private

        def students_param(*args)
            params.require(:student).permit(*args)
        end


end
