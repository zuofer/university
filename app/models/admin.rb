class Admin < ApplicationRecord
  has_one :invitation_token, dependent: :destroy
  after_create :create_invitation_token

  def create_invitation_token
    InvitationToken.create(admin_id: id, token: SecureRandom.urlsafe_base64(6, false))
  end
end
