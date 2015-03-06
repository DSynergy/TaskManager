require_relative '../test_helper'

class TaskCreationTest < FeatureTest


  def test_user_creates_a_task
    visit '/'
    click_link_or_button('New Task')
    assert_equal '/tasks/new', current_path
    fill_in 'task[title]', with: 'Eat ice cream'
    fill_in 'task[description]', with: 'Posion!'
    click_link_or_button('Submit Query')
    assert_equal '/tasks', current_path
    within('#tasks') do
      assert page.has_content?('Eat ice cream')
    end
  end

end
