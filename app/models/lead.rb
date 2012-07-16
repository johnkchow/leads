class Lead < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :organization

  has_many :email_histories

  validates :email, :first_name, :organization, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :email, :uniqueness => true

  def get_binding
    binding
  end

  def email=(value)
    super(value.downcase)
  end

  def organization=(value)
    super(value.strip)
  end
end
