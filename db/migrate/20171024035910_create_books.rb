class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :ISBN
      t.date :year_published
      t.text :synopsis

      t.timestamps
    end
  end
end
