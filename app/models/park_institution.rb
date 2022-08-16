class ParkInstitution < ApplicationRecord
  belongs_to :park
  belongs_to :institution
end
