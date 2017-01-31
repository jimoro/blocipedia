class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborators
  has_many :wikis, through: :collaborators

  enum role: [:standard, :premium, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end


  #
  # user story: "As a user, I should be able to accomplish: Offer three user roles - standard, premium and admin"
  #
  #
  # "As a standard user, I should be to #show any wiki, but only modify my own wikis"
  #
  # "As a premium user, I should be able to modify any wiki"
  #
  # "As an admin user, I should be able to delete any wiki"

end
