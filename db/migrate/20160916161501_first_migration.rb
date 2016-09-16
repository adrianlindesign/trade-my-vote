class FirstMigration < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :email
      t.string :user_state
      t.string :candidate
    end
  end
end
