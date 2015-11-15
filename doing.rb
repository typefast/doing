require './task.rb'
class ToDo
  attr_accessor :tasks
  
  def initialize()
    @tasks = []
  end
  
  def run
    while true
    puts "what do you want to do?"
    puts "1. add task"
    puts "2. show tasks"
    action = gets.chomp.downcase
    
    case action
    when "1"
      add_tasks
    when "2"
      puts "List of Tasks"
      list_tasks
    else
      puts "Enter a number."
    end
    end
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
    puts "\n\n"
  end
end

todo = ToDo.new
todo.run
