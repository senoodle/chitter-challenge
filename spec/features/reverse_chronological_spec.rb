feature 'Reverse chronological order' do
  scenario 'user can see peeps in reverse chronological order' do

    visit('/peeps')
    click_button('Post your peep')
    fill_in('peep', with: 'My first peep.')
    click_button('Submit')
    click_button('Post your peep')
    fill_in('peep', with: 'My second peep.')
    click_button('Submit')



    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'My first peep.'


  end
end
