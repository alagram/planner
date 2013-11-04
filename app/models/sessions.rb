class Sessions < ActiveRecord::Base

  has_many :invitations, class_name: "SessionInvitation"
  has_many :sponsor_sessions
  has_many :sponsors, through: :sponsor_sessions

  scope :upcoming, ->  { where("date_and_time > ?",  DateTime.now) }

  def attending_invitations
    invitations.accepted
  end
end
