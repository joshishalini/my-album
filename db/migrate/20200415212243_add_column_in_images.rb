class AddColumnInImages < ActiveRecord::Migration[5.2]
  def change
 		add_column :images, :album_id, :integer
  end
end
