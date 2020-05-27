class AddColumnsToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :s_id, :string
    add_column :artists, :s_image_url, :string
    add_column :artists, :s_uri, :string
  end
end
