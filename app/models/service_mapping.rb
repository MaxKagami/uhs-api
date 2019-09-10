class ServiceMapping < ApplicationRecord
  belongs_to :service
  belongs_to :document
end
