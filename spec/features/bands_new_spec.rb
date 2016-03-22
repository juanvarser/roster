describe "the signin process", :type => :feature do
  before :each do
    Band.make(:email => 'user@example.com', :password => 'password')
  end

  it "signs me in" do
    visit 'users/7/bands/new'
    within("#new_band") do
      fill_in 'band_name', :with => 'The Scatergories'
      fill_in 'description', :with => 'Lorem ipsum sit dolor amet'
      fill_in 'cache', :with => 'abcde'
      fill_in 'band_comission', :with => '10'
    end
    click_button 'Save'
    expect(page).to have_content 'Success'
  end
end