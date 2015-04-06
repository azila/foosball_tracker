class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :match_date
      t.belongs_to :player_1, index: true
      t.belongs_to :player_2, index: true
      t.integer :player_1_score
      t.integer :player_2_score
      t.timestamps
    end
  end
end
