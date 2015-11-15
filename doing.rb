require './task.rb'
require 'yaml'
class ToDo
  attr_accessor :tasks
  
  def initialize()
    @tasks = []
    load()
  end
  
  def load
    if File.exists?("tasks.yml")
      @tasks = YAML.load_file("tasks.yml")
    end
  end
  
  def save
    File.open("tasks.yml", "w") do |file|
      file.write(tasks.to_yaml)
    end
  end
  
  def run
    while true
    puts "what do you want to do?"
    puts "1. Add task"
    puts "2. Show tasks"
    puts "3. Exit"
    puts "4. Delete a task"
    action = gets.chomp.downcase
    
    case action
    when "1"
      add_tasks
    when "2"
      puts "List of Tasks"
      list_tasks
    when "3"
      puts "Thanks, Goodbye"
      save()
      exit(0)
    when "4"
      puts "Delete a task"
      delete()
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
    task = Task.new(title, desc)
    tasks.push(task)
  end
  
  def delete
    puts "Enter a title of a task: "
    title = gets.chomp.downcase
    
    tasks.each do |task|
      if task.title == title
        puts "The task #{task.title} was deleted."
        tasks.delete(task)
      end
    end
    
  end
  
  def list_tasks
    puts "Title".ljust(20) + "Description".ljust(20)
    puts "-" * 40
    tasks.each do |task|
      puts "#{task.title}".ljust(20) + "#{task.description}".ljust(20)
    end
    puts "\n\n"
  end
end

todo = ToDo.new
todo.run
