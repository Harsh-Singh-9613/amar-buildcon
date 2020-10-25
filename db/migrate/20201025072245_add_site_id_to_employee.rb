class AddSiteIdToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :site, index: true, foreign_key: true
  end
end
