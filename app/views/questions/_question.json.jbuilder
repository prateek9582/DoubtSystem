json.extract! question, :id, :title, :description, :time, :resolved, :escalated, :username, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)
