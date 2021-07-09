require 'rails_helper'
RSpec.describe HotelsController, type: :request do
    before do
        @user = build(:user)
        @user.save
    end
    context "For helper method" do
    end
end
