require_relative '../test_helper'

class TaskCreationTest < FeatureTest


  def test_user_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    visit '/tasks/1/edit'
    fill_in 'task[title]', with: 'Eat ice cream'
    fill_in 'task[description]', with: 'Posion!'
    click_link_or_button('edit')
    assert_equal '/tasks/1', current_path
    assert page.has_content?('Eat ice cream')
  end


end
