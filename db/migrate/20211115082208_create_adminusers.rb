class CreateAdminusers < ActiveRecord::Migration[5.2]
  def change
    create_table :adminusers do |t|
      t.string :uid2
      t.string :pass2

      t.timestamps
    end
  end
end
