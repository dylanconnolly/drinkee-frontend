class FriendNotifierMailer < ApplicationMailer
  def inform(user, current_drink, friend_contact)
    @user = user
    @drink = current_drink
    mail(to: friend_contact, subject: "#{user.first_name} has sent you a #{@drink.name}")
  end
end
