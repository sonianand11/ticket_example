# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  status_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Ticket < ApplicationRecord
  belongs_to :status
  belongs_to :user

  before_create :set_default_status

  scope :closed, -> {where(status_id: Status.closed.id)}
  scope :in_last_month, -> { where(updated_at: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)}
  scope :in_current_month, -> { where(updated_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month)}

  def set_default_status
    self.status = Status.open
  end

end
