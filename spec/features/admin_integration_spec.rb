require 'spec_helper'

describe 'An Admin' do

  before do
    sign_in_admin
  end

  it 'Admins can sign in' do
    page.text.should have_content "Signed in successfully."
  end

end