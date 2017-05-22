# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Status < ApplicationRecord
  def self.open
    find_by_name "open"
  end
  def self.processing
    find_by_name "processing"
  end
  def self.closed
    find_by_name "closed"
  end
end
