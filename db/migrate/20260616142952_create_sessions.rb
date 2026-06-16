class CreateSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :sessions do |t|
      t.references :game, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
