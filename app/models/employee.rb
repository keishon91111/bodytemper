class Employee < ApplicationRecord
has_many :bodytemperatures
# , dependent: :destroy, dependent: :edit
validates :name, presence: true
validates :number, presence: true

validates :number, numericality: { only_integer: true }

validates :name, uniqueness: true
validates :number, uniqueness: true
end
