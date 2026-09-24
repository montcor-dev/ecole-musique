require "test_helper"

class InteractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interaction = interactions(:one)
    @student = students(:one)
  end

  test "should get index" do
    get student_interactions_url(@student)
    assert_response :success
  end

  test "should get new" do
    get new_student_interaction_url(@student)
    assert_response :success
  end

  test "should create interaction" do
    assert_difference("Interaction.count") do
      post student_interactions_url(@student), params: {
        interaction: {
          interaction_date: @interaction.interaction_date,
          interaction_type: @interaction.interaction_type,
          note: @interaction.note,
          follow_up_needed: @interaction.follow_up_needed,
          follow_up_due_date: @interaction.follow_up_due_date
        }
      }
    end

    assert_redirected_to interaction_url(Interaction.last)
  end

  test "should show interaction" do
    get interaction_url(@interaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_interaction_url(@interaction)
    assert_response :success
  end

  test "should update interaction" do
    patch interaction_url(@interaction), params: {
      interaction: {
        interaction_date: @interaction.interaction_date,
        interaction_type: @interaction.interaction_type,
        note: @interaction.note,
        follow_up_needed: @interaction.follow_up_needed,
        follow_up_due_date: @interaction.follow_up_due_date
      }
    }
    assert_redirected_to interaction_url(@interaction)
  end

  test "should destroy interaction" do
    assert_difference("Interaction.count", -1) do
      delete interaction_url(@interaction)
    end

    assert_redirected_to student_interactions_url(@student)
  end
end
