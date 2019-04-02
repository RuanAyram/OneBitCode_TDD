require 'rails_helper'

RSpec.describe Enemy, type: :model do
  it "returns the enemy current power" do
    enemy = create(:enemy)
    power_weapon = (enemy.power_base + ((enemy.level - 1) * enemy.power_step))
    expect(enemy.current_power).to eq(power_weapon)
  end

  context "validates presence of enemy attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:power_base) }
    it { should validate_presence_of(:power_step) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:kind) }
  end
end
