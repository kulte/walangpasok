class CreateCancellations < ActiveRecord::Migration
  def change
    create_table :cancellations do |t|
      t.integer :tweet_id
      t.text :text
      t.string :levels
      t.datetime :suspended_until
      t.string :location
      t.string :url

      t.timestamps
    end
  end
end
