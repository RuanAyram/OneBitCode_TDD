class Enemy < ApplicationRecord
  enum kind: [ :goblin, :orc, :demon, :dragon ]

  #### VALIDATIONS
  validates :level, numericality: {greater_than: 0, less_than_or_equal_to: 99}
  validates_presence_of :name, :power_base, :power_step, :level, :kind

  def current_power
    (self.power_base + ((self.level-1)*self.power_step))
  end
end
