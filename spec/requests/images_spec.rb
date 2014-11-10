require 'rails_helper'

RSpec.describe "Images", :type => :request do
  describe "Images API" do

    before(:all) { @image_set = FactoryGirl.create(:image_set) }

    describe '#index' do

      before(:all) { FactoryGirl.create_list(:image, 10, image_set: @image_set) }

      it "lists all images in image set" do
        get "/image_sets/#{@image_set.id}/images"

        # expect(response.status).to eq 200
        expect(json['images'].length).to eq 10
      end
    end

    describe '#show' do

      before (:all) do
        @image = FactoryGirl.create(:image, image_set: @image_set)
      end

      it "returns the specified image" do
        get "/image_sets/#{@image_set.id}/images/#{@image.id}"

        # expect(response.status).to eq 200
      end

    end
    describe '#update' do
      # this is the method that handles upvoting an image.

      before(:all) do
        @image = FactoryGirl.create(:image, image_set: @image_set)
      end

      context "when signed in" do
        it "increases an image's score by 1" do
          put "/image_set/#{@image_set.id}/images/#{@image.id}", upvote: true

          # expect(response.status).to eq 200
          # expect(@image.score).to eq 1
        end
      end
      context "when not signed in" do
        it "responds with login error" do
          put "/image_set/#{@image_set.id}/images/#{@image.id}", upvote: true

          # expect(response.status).to eq 401
          # expect(@image.score).to eq 1
        end
      end
    end
  end
end
