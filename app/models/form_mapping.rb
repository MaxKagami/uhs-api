class FormMapping < ApplicationRecord
  belongs_to :document_form
  belongs_to :document
end