class User < ActiveRecord::Base
	belongs_to :department
  has_many :categories_users
  has_many :categories, through: :categories_users
	has_secure_password validations: false

	validates :au_user_name, presence: true
  validates :au_user_name, uniqueness: true
	validates :password, presence: true, on: :create, length: {minimum: 3}

  def self.search_by_last_name(search_term)

    return [] if search_term.blank?
    #binding.pry
    where("last_name LIKE ?", "%#{search_term}%")
    #binding.pry
    #return @result
  end

end


 