require 'rails_helper'

RSpec.describe "UserExams", type: :request do
  describe "POST /user_exams" do
    let(:exam) { FactoryBot.create(:exam) }
    let(:user) { FactoryBot.create(:user) }
    let(:params) {
      {
        first_name: user.first_name,
        last_name: user.last_name,
        phone_number: user.phone_number,
        college_id: exam.college_id,
        exam_id: exam.id,
        start_time: exam.start_time + 10.minutes
      }
    }

    subject { post '/user_exams', params: { user_exam: params } }

    context 'when unsuccessful' do
      it 'returns 400 when no college is found' do
        params[:college_id] = nil
        subject
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['error']).to eq('College not found')
      end

      it 'returns 400 when no exam is found' do
        params[:exam_id] = nil
        subject
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['error']).to eq('Exam not found')
      end

      it 'returns 400 when start_time is invalid' do
        params[:start_time] = exam.start_time - 10.minutes
        subject
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['error']).to eq('Invalid start time')
      end

      it 'returns 400 when user find or create fails' do
        allow_any_instance_of(ActiveRecord::Relation).to receive(:find_or_create_by).and_raise('boom')
        subject
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['error']).to eq('Error creating user exam')
      end
    end

    context 'when successful' do
      it 'returns a 200 success' do
        subject
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['message']).to eq('User exam created')
      end

      it 'creates a user_exam' do
        expect { subject }.to change { UserExam.count }.from(0).to(1)
      end
    end
  end
end
