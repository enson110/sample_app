require 'spec_helper'

describe "StaticPages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path}

    let(:heading) { 'Sample App' }
    let(:page_title) { 'Home'}

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "No.1 micropost.")
        FactoryGirl.create(:micropost, user: user, content: "No.2 micropost.")
        sign_in user
        visit root_path
      end

      it "should render the users feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading){ 'Help' }
    let(:page_title){ 'Help' }
  end

  describe "Contact" do
    before { visit contact_path }

    let(:heading){ 'Contact' }
  end

  describe "About Us" do
    before { visit about_path }

    let(:heading) { 'About Us' }
    let(:page_title){ 'About Us' }
  end
end
