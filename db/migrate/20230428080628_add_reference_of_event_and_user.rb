class AddReferenceOfEventAndUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :registrations, :user, foreign_key: true
    add_reference :registrations, :event, foreign_key: true
  end
end
