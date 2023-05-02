class SendEmployeeMailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
  
    @user = User.find(user_id)
    @employee = Employee.create(
      name: @user.name,
      email: @user.email,
      contact: @user.contact,
      user_id: @user.id
    )
    EmployeeMailer.welcome_employee_mail(@employee).deliver_later
  end
end
