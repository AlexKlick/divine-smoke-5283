require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end
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
  end
  describe 'class methods' do
    describe 'g_plants' do
      it 'returns the plant name for garden that have less than 100 days til harvest' do
        expect(@garden.g_plants).to eq ["lilly", "sunflower", "strawberry"]
        expect(@garden2.g_plants).to eq ["blueberry"]
        expect(@garden.g_plants).to_not include("blueberry")
      end
    end
  end
end
