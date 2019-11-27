class Transaction < ApplicationRecord
  belongs_to :worker
  belongs_to :company
  belongs_to :job
end
