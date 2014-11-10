require 'rails_helper'

RSpec.describe "ImageSets", :type => :request do
  describe "Image Sets API" do
    describe '#index' do

      before(:all) { FactoryGirl.create_list(:image_set, 10) }

      it "lists all image sets" do
        get '/image_sets'
        # hello!

        # expect(response.status).to eq 200
        expect(json.length).to eq(10)
      end

    end
    describe '#create' do

      before (:all) do
        @image_set_attributes = FactoryGirl.attributes_for(:image_set, question: "test set")
      end

      it "creates a new image set" do
        post '/image_sets', image_set: @image_set_attributes

        # expect(response.status).to eq 201  # created
        expect(json['question']).to eq 'test set'
      end
    end
    describe '#show' do

      before (:all) do
        @image_set = FactoryGirl.create(:image_set)
      end

      it "shows the specified image set" do
        get "/image_sets/#{@image_set.id}"

        # expect(response.status).to eq 200
        expect(json['id']).to eq @image_set.id
      end

    end
    # describe '#destroy' do

    #   before (:all) do
    #     @image_set = FactoryGirl.create(:image_set)
    #   end

    #   context "when not signed in" do
    #     it "responds with login error" do
    #       delete "/image_sets/#{@image_set.id}"

    #       expect(response.status).to eq 401  # unauthorized (server doesn't know who client (user) is)
    #     end
    #   end

    #   context "when signed in" do
    #     context "when user is not owner of image set" do
    #       it "responds with permissions error" do
    #         delete "/image_sets/#{@image_set.id}"

    #         expect(response.status).to eq 403  # forbidden (user not permitted to do this action)
    #       end
    #     end

    #     context "when user is owner of image set" do
    #       it "deletes the image set" do
    #         delete "/image_sets/#{@image_set.id}"

    #         expect(response.status).to eq 200  # successfully deleted
    #       end
    #     end
    #   end

    # end
  end
end
