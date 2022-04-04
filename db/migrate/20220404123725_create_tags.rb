class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    # タグの名前は重複しないようにnameカラムに一位性制約をかける
    add_index :tags, :name, unique: true
  end
end
