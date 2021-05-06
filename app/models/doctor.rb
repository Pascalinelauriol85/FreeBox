class Doctor < ApplicationRecord
  belongs_to :city
  belongs_to :speciality
  has_many :appointments
  has_many :patients, through: :appointments
end
