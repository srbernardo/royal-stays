class List < ApplicationRecord
  belongs_to :user
  validates :name, presence :true, length: {minimum: 4, maximum: 30}
end
