class ChangeCodeTypeToProoject < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :code, :text
  end
end
