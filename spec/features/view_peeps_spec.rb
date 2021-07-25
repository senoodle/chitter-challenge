feature 'Posting a peep' do

  scenario 'User can view peep after submission' do

    visit('/peeps')
    click_button('Post your peep')
    expect(current_path).to eq('/submitpeep')
    fill_in('peep', with: 'My first peep.')
    click_button('Submit')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'My first peep.'
  end
end
