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

class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :organizers, class_name: "User"
  has_many :taggings
  has_many :tags, through: :taggings

  def slug_candidates
    [
      :title,
      [:title, :location],
    ]
  end

  def all_tags=(names)
    #code
    self.tags = names.split(",").map do |t|
      Tag.where(name: t.strip).first_or_create!
    end
  end

  def all_tags
    #code
    tags.map(&:name).join(", ")
  end
end
