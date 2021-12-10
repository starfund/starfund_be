class UserMailer < ApplicationMailer
  def welcome_ppv
    @user = User.find(params[:user])
    @organization = Organization.find(params[:organization])
    attachments['cover_image'] = @organization.cover_photo.download
    mail(to: @user.email, subject: 'Enjoy your upcoming PPV event')
  end
end
