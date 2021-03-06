# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime
#  updated_at :datetime
#  poll_id    :integer
#

class Option < ActiveRecord::Base
  belongs_to :poll

  has_many :votes

  validates :text, presence: { message: 'The poll option can\'t be blank.' }

  def percentage_of_votes
    poll_votes_total = poll.votes.size
    percentage = votes.size.to_f / (poll_votes_total.zero? ? 1 : poll_votes_total).to_f

    (percentage * 100).to_i
  end
end
