class Project < ApplicationRecord
  has_many :materials
  has_many :tasks
  belongs_to :user
end
