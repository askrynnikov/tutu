class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end

  def pass_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы сдали билет')
  end
end
