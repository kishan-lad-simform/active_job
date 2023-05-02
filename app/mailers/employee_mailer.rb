class EmployeeMailer < ApplicationMailer
  def welcome_employee_mail(employee)
    get_details(employee)
    mail( 
      to: @email, 
      subject: "Welcome Email for Employee"
    )
  end

  private
    def get_details(employee)
      @employee = employee
      @email = @employee.email
      @name = @employee.name
    end
end
