class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.string :text
      t.float :rating
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
