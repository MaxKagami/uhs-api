class Document < ApplicationRecord
  belongs_to :document_group
  has_many :form_mappings
  has_many :service_mappings
end
