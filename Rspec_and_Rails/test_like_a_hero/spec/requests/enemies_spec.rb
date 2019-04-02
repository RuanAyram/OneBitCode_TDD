require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "GET /enemies" do
    it "returns success status" do
      get enemies_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /enemies/:id" do
    let(:enemy) { create(:enemy) }

    it "returns success status" do
      get enemies_path(:enemy)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /enemies" do
    context "when have valid attributes" do
      it "creates the enemy with correct attributes" do
        enemy_attributes = attributes_for(:enemy)
        post enemies_path, params: enemy_attributes
        expect(Enemy.last).to have_attributes(enemy_attributes)
      end
    end

    context "when does not have valid attributes" do
      it "does not create enemy" do
        expect {
          post enemies_path, params: { name: '', level: '' }
        }.to_not change(Enemy, :count)
      end
    end
  end

  describe "PUT /enemies" do
    context "when the enemy exists" do
      let(:enemy) { create(:enemy) }
      let(:enemy_attributes) { attributes_for(:enemy) }

      before(:each) { put "/enemies/#{enemy.id}", params: enemy_attributes }

      it "return status code 200" do
        expect(response).to have_http_status(200)
      end

      it "updates the record" do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end

      it "returns the enemy updated" do
        expect(enemy.reload).to have_attributes(json.except("created_at", "updated_at"))
      end
    end

    context "when the enemy does not exists" do
      before(:each) { put "/enemies/0", params: attributes_for(:enemy) }

      it "return status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Enemy with 'id'=0/)
      end
    end
  end

  describe "DELETE /enemies" do
    context "when the enemy exists" do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }

      it "return status code 200" do
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do
        expect { enemy.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "when the enemy does not exists" do
      before(:each) { delete "/enemies/0" }

      it "return status code 404" do
        expect(response).to have_http_status(404)
      end

      it "return a not found message" do
        expect(response.body).to match(/Couldn't find Enemy with 'id'=0/)
      end
    end
  end
end
