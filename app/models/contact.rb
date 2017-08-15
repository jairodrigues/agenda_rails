class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :adress
  has_many :phones
  
  accepts_nested_attributes_for :adress
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  
  validates :name, length: {minimum: 3} ,presence: true
  validates :email, presence: true
  
  
end
    