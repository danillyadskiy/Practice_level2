require 'spec_helper'

describe "Static pages" do

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/help'
      expect(page).to have_content('Help')
    end

  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/about'
      expect(page).to have_content('About Us')
    end

  end
end
