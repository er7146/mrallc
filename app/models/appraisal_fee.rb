class Appraisal_fee < ActiveRecord::Base
  validates :description, presence: true
  validates :fee, presence: true
end
