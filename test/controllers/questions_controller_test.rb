require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { description: @question.description, end_time: @question.end_time, escalated: @question.escalated, resolved: @question.resolved, start_time: @question.start_time, time: @question.time, title: @question.title, user_id: @question.user_id, username: @question.username } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { description: @question.description, end_time: @question.end_time, escalated: @question.escalated, resolved: @question.resolved, start_time: @question.start_time, time: @question.time, title: @question.title, user_id: @question.user_id, username: @question.username } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end