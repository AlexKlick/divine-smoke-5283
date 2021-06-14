class Garden < ApplicationRecord
  has_many :plots

  def g_plants
    plants =  self.plots.
    select('plots.*, plants.name, plants.days_til_harvest').
    joins(:plants).where('plants.days_til_harvest < 100').
    pluck('plants.name')
    plants.sort_by{|key,val| plants.count(val)}
    plant_count = plants.map{|val| plants.count(val)}
    plants.uniq
  end
end
