class Cat < ApplicationRecord
    belongs_to :user
    validates :name, :age, :enjoys, :story, :image, presence: true
end
