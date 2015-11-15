class Task
  attr_accessor :title, :description, :completed
  
  def initialize(title, description)
    @title = title
    @description = description
    @completed = "No"
  end
end

