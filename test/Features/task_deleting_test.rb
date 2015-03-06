require_relative '../test_helper'

class TaskDeletionTest < FeatureTest


  def test_user_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    visit '/tasks'
    click_link_or_button('delete')
    assert_equal '/tasks', current_path
    within('#tasks') do
      refute page.has_content?('a description')
    end
  end

end
