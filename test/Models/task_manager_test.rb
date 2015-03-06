require_relative '../test_helper'

class TaskManagerTest < ModelTest
  def test_it_creates_a_task
    dataset = TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = dataset.find(1)
    assert_equal "a title", task.id
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def make_3_things
    3.times do |thing|
      TaskManager.create({ :title       => "a title",
                           :description => "a description"})
   end
  end

  # def test_raw_tasks
  #   assert_equal TaskManager.raw_tasks.count, 0
  #   make_3_things
  #   assert_equal TaskManager.raw_tasks.count, 3
  # end

  def test_all
    make_3_things
    all_mapped = TaskManager.all
    assert_equal all_mapped.count, 3
  end

  def test_find
    make_3_things
    id = 3
    assert_equal "a title", task.title
    assert_equal "a description", task.description
  end

  def test_update
    make_3_things
    TaskManager.update(3, {title: "Heya", description: "oi"})
    assert_equal TaskManager.find(3).description,  "oi"
  end

  def test_delete
    make_3_things
    id = 3
    TaskManager.delete(3)
    assert_equal 2, TaskManager.all.count
  end

   def test_delete_all
    make_3_things
    TaskManager.delete_all
    assert_equal 0, TaskManager.all.count
   end

end
