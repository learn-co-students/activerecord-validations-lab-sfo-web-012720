class Author < ActiveRecord::Base
    validates :name, length: { minimum: 2 }
    validates :name, uniqueness: true
    validates :phone_number, length: { is: 10 }
end
