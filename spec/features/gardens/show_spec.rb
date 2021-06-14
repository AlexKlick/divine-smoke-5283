require 'rails_helper'

RSpec.describe 'Garden Show' do
  before(:each) do
    @garden = Garden.create(name:'Sunny Acres', organic: true)
    @plot1 = Plot.create(number: 25, size:"large", direction:"west", garden_id:@garden.id)
    @plot2 = Plot.create(number: 10, size:"medium", direction:"south", garden_id:@garden.id)
    @plant1 = Plant.create(name:'lilly', description:'pretty flower', days_til_harvest: 10)
    @plant2 = Plant.create(name:'sunflower', description:'pretty flower, tasty seeds', days_til_harvest: 20)
    @plant3 = Plant.create(name:'strawberry', description:'yummy', days_til_harvest: 30)
    @plant4 = Plant.create(name:'apple', description:'johnny appleseed', days_til_harvest: 101)
    @plant_plots1 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant1.id)
    @plant_plots2 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant2.id)
    @plant_plots3 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant3.id)
    @plant_plots4 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant4.id)
    @plant_plots5 = PlantPlot.create(plot_id: @plot2.id ,plant_id:@plant1.id)
    @plant_plots6 = PlantPlot.create(plot_id: @plot2.id ,plant_id:@plant2.id)

  end
  # As a visitor
  # When I visit an garden's show page
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest

  it 'has a unique list of all plants that are in the garden plots and only plants with less than 100 days til harvest' do
    #should see plants 1-3 in garden, only once
    visit "/gardens/#{@garden.id}"
    expect(page).to have_content(@plant1.name, count: 1)
    expect(page).to have_content(@plant2.name, count: 1)
    expect(page).to have_content(@plant3.name, count: 1)
  end

end