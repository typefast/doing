require './task.rb'
class ToDo
  attr_accessor :tasks
  
  def initialize()
    @tasks = []
  end
  
  
  
  def add_tasks
    puts "Add task"
    puts "Enter a title: "
    title = gets.chomp.downcase
    puts "Enter a description: "
    desc = gets.chomp.downcase
    task= Task.new(title, desc)
    tasks.push(task)
  end
  
  def list_tasks
    tasks.each do |item|
      puts "Title: #{item.title} Description: #{item.description}"
    end
  end
end

todo = ToDo.new
todo.add_tasks
todo.add_tasks
todo.list_tasks
