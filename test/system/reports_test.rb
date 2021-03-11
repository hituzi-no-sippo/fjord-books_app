# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    login
  end

  test 'creating a Report' do
    visit reports_url
    click_on I18n.t('views.common.new')

    fill_in Report.human_attribute_name(:title), with: 'Report Test Title'
    fill_in Report.human_attribute_name(:content), with: 'Report Test Body'
    click_on I18n.t('helpers.submit.create')

    assert_text I18n.t('controllers.common.notice_create', name: Report.model_name.human)
    click_on I18n.t('views.common.back')
  end
end
