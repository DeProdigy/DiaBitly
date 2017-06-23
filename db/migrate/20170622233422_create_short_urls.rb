class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table @short_url do |t|
      t.string :original_url
      t.string :redirect_url

      t.timestamps
    end
  end
end
