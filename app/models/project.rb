class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :snapshot
end
