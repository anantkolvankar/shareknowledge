#load seed data for the following tables
puts "---- Load Seed Categories and its data----"
categories_name = ["Ruby", "Git", "Rails", "Jquery", "Server Configuration"]
 categories_name.each do |category_name|
    Category.create(name: category_name)
    puts "Loaded '#{category_name}' for Categories"
 end