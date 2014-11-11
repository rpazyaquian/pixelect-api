require 'rails_helper'

RSpec.describe "Comments", :type => :request do
  describe "Comments API" do

    before(:all) { @image_set = FactoryGirl.create(:image_set) }

    describe '#index' do

      before (:all) { FactoryGirl.create_list(:comment, 10, image_set: @image_set) }

      it "lists all comments in image set" do
        get "/image_sets/#{@image_set.id}/comments"

        # expect(response.status).to eq 200
        expect(json['comments'].length).to eq 10
      end
    end

    describe '#create' do

      before(:all) do
        @comment_attributes = FactoryGirl.attributes_for(:comment, text: "test comment", image_set: @image_set)
      end

      context "when not signed in" do
        it "responds with login error" do
          post "/image_sets/#{@image_set.id}/comments/", comment: @comment_attributes

          # expect(response.status).to eq 401  # doesn't know who you are
        end

      end
      context "when signed in" do
        it "adds the comment to the image set" do
          post "/image_sets/#{@image_set.id}/comments/", comment: @comment_attributes

          # expect(response.status).to eq 200  # ok
          expect(response['image_set_id']).to eq @image_set.id
        end
      end
    end

    describe '#show' do

      before (:all) do
        @comment = FactoryGirl.create(:comment, image_set: @image_set2)
      end

      it "displays a particular comment" do
        get "/image_sets/#{@image_set.id}/comments/#{@comment.id}"

        # expect(response.status).to eq 200
        expect(json['id']).to eq @comment.id
      end
    end

    # describe '#destroy' do
    #   context "when not signed in" do
    #   end
    #   context "when signed in" do
    #     context "when user is not owner of image set" do
    #     end
    #     context "when user is owner of image set" do
    #     end
    #   end
    # end
  end
end
