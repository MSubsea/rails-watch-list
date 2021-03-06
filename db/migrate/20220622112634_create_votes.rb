class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.text :content
      t.integer :rating
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
