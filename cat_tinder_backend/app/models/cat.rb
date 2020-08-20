class Cat < ApplicationRecord
    validates :name, :age, :enjoys, :story, :image, presence: true
    validates :enjoys, length: { minimum: 10 }
end
