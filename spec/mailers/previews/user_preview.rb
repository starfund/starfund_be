# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def welcome_ppv
    UserMailer.with(user: User.first.id, organization: Organization.first.id).welcome_ppv
  end
end
