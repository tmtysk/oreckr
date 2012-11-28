class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :access_key_id
      t.string :secret_access_key
      t.string :s3_bucket_name

      t.timestamps
    end
  end
end
