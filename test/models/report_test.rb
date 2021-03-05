# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    owner = User.new(email: 'owner@example.com')
    report = owner.reports.new(title: 'test title', content: 'test content')

    assert report.editable?(owner)

    non_owner = User.new(email: 'non_owner@example.com')

    assert_not report.editable?(non_owner)
  end
end
