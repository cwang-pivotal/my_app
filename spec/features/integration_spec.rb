require 'spec_helper'

describe 'my_app' do
  it 'renders hello world' do
    visit 'https://www.firstbankcard.com/dynapp/da/S75BSGCC2DN3Q'

    fill_in 'First Name*', with: 'Chris'
    fill_in 'Last Name*', with: 'Wang'

    click_on 'Continue'

    within '.toast-message' do
      expect(page).to have_content 'You must have a valid physical address'
    end
  end
end