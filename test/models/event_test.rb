# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  title        :string
#  start_date   :datetime
#  end_date     :datetime
#  location     :string
#  agenda       :text
#  address      :text
#  organizer_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
