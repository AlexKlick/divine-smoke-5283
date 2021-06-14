class Garden < ApplicationRecord
  has_many :plots

  def g_plants
    plots.select('plots.*, plants.name, plants.days_til_harvest').joins(:plants).where('plants.days_til_harvest < 100').pluck('plants.name').uniq
  end
end
