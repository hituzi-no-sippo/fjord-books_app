# frozen_string_literal: true

module LoginHelper
  def login
    visit root_url

    fill_in User.human_attribute_name(:email),    with: users(:alice).email
    fill_in User.human_attribute_name(:password), with: 'alice_pleasance_liddell'

    click_button I18n.t('devise.sessions.new.sign_in')
  end
end
