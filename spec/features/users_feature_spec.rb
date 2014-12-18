require 'rails_helper'

context 'user not signed in and on the homepage' do
  it "should see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end

   it "should not see 'Add a restaurant' link" do
    visit('/')
    expect(page).not_to have_link('Add a restaurant')
  end
end

context 'user signed in on the homepage' do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it "should see a 'sign out' link" do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it "should see a 'Add a restaurant' link" do
    visit('/')
    expect(page).to have_link('Add a restaurant')
  end

  it "should not see a 'sign in' link and a 'sign up' link" do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  # it 'once restaurant added, cannot be deleted by a different user' do
    # click_link 'Add a restaurant'
    # fill_in 'Name', with: 'KFC'
    # click_button 'Create Restaurant'
    # click_link('Sign out')
    # click_link('Sign up')
    # fill_in('Email', with: 'different_user@example.com')
    # fill_in('Password', with: 'testtest')
    # fill_in('Password confirmation', with: 'testtest')
    # click_button('Sign up')
    # click_link 'Delete KFC'
    # expect(page).to have_content 'error'
    # expect(page).to have_content 'KFC'
  # end



end

