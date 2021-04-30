class UserExamsController < ApplicationController
  before_action :set_college
  before_action :set_exam
  before_action :check_valid_start

  def create
    begin
      user = User.find_or_create_by(request_params.slice(:first_name, :last_name, :phone_number))
      user_exam = UserExam.create(
        start_time: DateTime.parse(request_params[:start_time]),
        user_id: user.id,
        exam_id: @exam.id
      )
      render json: {message: 'User exam created'}, status: 200
    rescue => error
      bad_request('Error creating user exam')
    end
  end

  private

  def request_params
    params.require(:user_exam).permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
  end

  def set_college
    @college = College.find(request_params[:college_id])
    rescue ActiveRecord::RecordNotFound
      bad_request('College not found')
  end

  def set_exam
    @exam = @college.exams.find(request_params[:exam_id])
    rescue ActiveRecord::RecordNotFound
      bad_request('Exam not found')
  end

  def check_valid_start
    valid_time = DateTime.parse(request_params[:start_time]).between?(@exam.start_time, @exam.end_time)
    bad_request('Invalid start time') unless valid_time
  end

  def bad_request(message)
    payload = {
      error: message
    }
    render json: payload, status: :bad_request
  end
end
