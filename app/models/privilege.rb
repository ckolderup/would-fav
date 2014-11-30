class Privilege < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection

  enum level: [:read, :add, :edit, :owner]
end
