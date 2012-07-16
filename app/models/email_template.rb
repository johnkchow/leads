class EmailTemplate < ActiveRecord::Base
  attr_accessible :text, :name, :subject

  has_many :email_history

  validates :name, :text, :presence => true
end
