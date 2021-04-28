class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description

      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
