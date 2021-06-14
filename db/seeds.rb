# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@garden = Garden.create(name:'Sunny Acres', organic: true)
@plot1 = Plot.create(number: 25, size:"large", direction:"west", garden_id:@garden.id)
@plot2 = Plot.create(number: 10, size:"medium", direction:"south", garden_id:@garden.id)
@plant1 = Plant.create(name:'lilly', description:'pretty flower', days_til_harvest: 10)
@plant2 = Plant.create(name:'sunflower', description:'pretty flower, tasty seeds', days_til_harvest: 20)
@plant3 = Plant.create(name:'strawberry', description:'yummy', days_til_harvest: 30)
@plant4 = Plant.create(name:'apple', description:'johnny appleseed', days_til_harvest: 40)
@plant_plots1 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant1.id)
@plant_plots2 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant2.id)
@plant_plots3 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant3.id)
@plant_plots4 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant4.id)
@plant_plots5 = PlantPlot.create(plot_id: @plot2.id ,plant_id:@plant1.id)
@plant_plots6 = PlantPlot.create(plot_id: @plot2.id ,plant_id:@plant2.id)