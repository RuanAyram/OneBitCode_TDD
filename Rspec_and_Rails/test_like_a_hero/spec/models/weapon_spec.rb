require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "returns the weapon current power" do
    weapon = create(:weapon)
    power_weapon = (weapon.power_base + ((weapon.level - 1) * weapon.power_step))
    expect(weapon.current_power).to eq(power_weapon)
  end

  it "returns the correct weapon title" do
    weapon = create(:weapon)
    expect(weapon.title).to eq("#{weapon.name} ##{weapon.level}")
  end
end
