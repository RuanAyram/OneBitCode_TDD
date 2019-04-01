require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /weapons" do
    it "returns success status" do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "the weapon's name is present" do
      weapons = create_list(:weapon, 2)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end

    it "the weapon's current_power is present" do
      weapons = create_list(:weapon, 2)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.current_power.to_s)
      end
    end

    it "the weapon's title is present" do
      weapons = create_list(:weapon, 2)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end

    it "the weapon's links is present" do
      weapons = create_list(:weapon, 2)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include("/weapons/#{weapon.id}")
      end
    end
  end

  describe "POST /weapons" do
    context "when it has valid parameters" do
      it "creates the weapon with correct attributes" do
        weapon_attributes = FactoryBot.attributes_for(:weapon)
        post weapons_path, params: {weapon: weapon_attributes}
        expect(Weapon.last).to have_attributes(weapon_attributes)
      end
    end

    context "when it has no valid parameters" do
      it "does not create weapon" do
        expect {
          post weapons_path, params: {weapon: { name: '', description: '', level: '' }}
        }.to_not change(Weapon, :count)
      end
    end
  end

  describe "DELETE /weapon/:id" do
    context "when it has valid parameters" do
      it "destroy weapon" do
        weapon = create(:weapon)
        expect {
          delete weapon_path(weapon)
        }.to change{ Weapon.count }.by(-1)
      end
    end
  end

  describe "GET /weapon/:id" do
    context "show weapon's parameters" do
      it "all weapon's attributes" do
        weapon = create(:weapon)
        get weapon_path(weapon)
        expect(response.body).to include(weapon.name, weapon.description, weapon.level.to_s, weapon.current_power.to_s, weapon.title)
      end
    end
  end
end
