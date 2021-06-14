class Garden < ApplicationRecord
  has_many :plots

  def g_plants
    plots.select('plots.*, plants.name').joins(:plants).pluck('plants.name').uniq
  end
end
