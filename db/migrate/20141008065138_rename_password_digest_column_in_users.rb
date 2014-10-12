class RenamePasswordDigestColumnInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :passwordDigest, :password_digest
  end
end
