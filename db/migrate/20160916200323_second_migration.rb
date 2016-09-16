class SecondMigration < ActiveRecord::Migration
  def change
    add_column :voters, :paired, :boolean
    rename_column :voters, :candidate, :desired_candidate
  end
end
