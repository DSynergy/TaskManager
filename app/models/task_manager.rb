require 'sequel'

class TaskManager

  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.postgres('task_manager_test')
    else
      @database ||= Sequel.postgres('task_manager_dev')
    end
  end
  #creating two different databases depending on whether testing or otherwise

  def self.create(tasks)
    task_attributes = { 'title' => tasks[:title], 'description' => tasks[:description] }
    dataset = database[:tasks]
    dataset.insert(task_attributes)
  end

  def self.raw_tasks
    dataset.to_a
  end

  def self.all
    dataset.select
  end

  def self.raw_task(id)
    raw_tasks.where(:id => id)
  end

  def self.find(id)
    dataset.where(:id => id)
  end

  def self.update(id, task)
    dataset.where(:id => id).update(:title => task[:title], :description => task[:description])
      # target[:title] = task[:title]
      # target[:description] = task[:description]
  end

  def self.delete(id)
    dataset.where(:id => id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database[:tasks]
  end
end
