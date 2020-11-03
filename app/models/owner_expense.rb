class OwnerExpense < ApplicationRecord
  belongs_to :owner
  belongs_to :site
end
