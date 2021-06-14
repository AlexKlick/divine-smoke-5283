require 'rails_helper'

RSpec.describe 'Garden Show' do
  before(:each) do
    @garden = Garden.create(name:'Sunny Acres', organic: true)
    @garden2 = Garden.create(name:'Sunny Acres', organic: true)

    @plot1 = Plot.create(number: 25, size:"large", direction:"west", garden_id:@garden.id)
    @plot2 = Plot.create(number: 10, size:"medium", direction:"south", garden_id:@garden.id)
    @plot3 = Plot.create(number: 10, size:"medium", direction:"south", garden_id:@garden2.id)

    @plant1 = Plant.create(name:'lilly', description:'pretty flower', days_til_harvest: 10)
    @plant2 = Plant.create(name:'sunflower', description:'pretty flower, tasty seeds', days_til_harvest: 20)
    @plant3 = Plant.create(name:'strawberry', description:'yummy', days_til_harvest: 30)
    @plant4 = Plant.create(name:'apple', description:'johnny appleseed', days_til_harvest: 101)
    @plant5 = Plant.create(name:'blueberry', description:'tasty', days_til_harvest: 1)

    @plant_plots1 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant1.id)
    @plant_plots2 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant2.id)
    @plant_plots3 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant3.id)
    @plant_plots4 = PlantPlot.create(plot_id: @plot1.id ,plant_id:@plant4.id)
    @plant_plots5 = PlantPlot.create(plot_id: @plot2.id ,plant_id:@plant1.id)
    @plant_plots6 = PlantPlot.create(plot_id: @plot2.id ,plant_id:@plant2.id)
    @plant_plots7 = PlantPlot.create(plot_id: @plot3.id ,plant_id:@plant5.id)

    visit "/gardens/#{@garden.id}"
  end
  # As a visitor
  # When I visit an garden's show page
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest

  it 'has a unique list of all plants that are in the garden plots and only plants with less than 100 days til harvest' do
    #should see plants 1-3 in garden, only once

    expect(page).to have_content(@plant1.name, count: 1)
    expect(page).to have_content(@plant2.name, count: 1)
    expect(page).to have_content(@plant3.name, count: 1)
    expect(page).to_not have_content(@plant4.name)
    expect(page).to_not have_content(@plant5.name)
  end

  # As a visitor
  # When I visit a garden's show page,
  # Then I see the list of plants is sorted by the number of plants that appear in any of that garden's 
  # plots from most to least(Note: you should only make 1 database query to retrieve the sorted list of plants)

  it 'has the plant list sorted by # number of that plant which is in the garden (plant popularity?)' do
    #this story was a little confusing to read, but I think it's asking for the plants sorted by number of times they appear
    #in plots within the garden?

    #so we should see plants 1-2 first and the rest, besides 5, after
    # this = @plant1.name
    # that = @plant2.name
    # expect(this).to appear_before(that)
    # expect(@plant2.name).to appear_before(@plant3.name)
    # expect(@plant1.name).to appear_before(@plant4.name)
    # expect(@plant2.name).to appear_before(@plant4.name)

    #appear_before is showing undefined method.. not sure why

    @plot4 = Plot.create(number: 10, size:"medium", direction:"south", garden_id:@garden.id)
    @plant_plots8 = PlantPlot.create(plot_id: @plot4.id ,plant_id:@plant2.id)
  binding.pry
    #adding in an extra plant 2 so it should come before plant 1 now
  save_and_open_page
    expect(page.text.index(@plant1.name)).to be < page.text.index(@plant3.name)
    expect(page.text.index(@plant2.name)).to be < page.text.index(@plant1.name)
    expect(page.text.index(@plant2.name)).to be < page.text.index(@plant3.name)
  end

end