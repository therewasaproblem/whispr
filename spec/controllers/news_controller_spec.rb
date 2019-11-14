require 'rails_helper'

RSpec.describe NewsController, :type => :controller do
  it "should be able to run" do
      get :index
      expect(response.status).to eq(200)
  end
end
