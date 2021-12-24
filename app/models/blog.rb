class Blog < ApplicationRecord
  
  validates :content, presence: true
  validates :title,presence: true , length: {in: 1..75}
end
