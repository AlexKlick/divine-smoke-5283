require 'rails_helper'

RSpec.describe 'Plot Index' do
  before(:each) do
    @plot1 = Plot.create(number: 25, size:"large", direction:"west")
    @plot2 = Plot.create(number: 10, size:"medium", direction:"south")
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
  end
  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see names of all that plot's plants
  it 'has a list of the plot numbers and under each number there are the plot plants' do
    visit '/plots'
    #expect to find all plants in plot1, only plants1/2 in plot 2
    within('#plot1') do
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to have_content(@plant4.name)
    end
    within('#plot2') do
    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to_not have_content(@plant3.name)
    expect(page).to_not have_content(@plant4.name)
    end
  end

  
end