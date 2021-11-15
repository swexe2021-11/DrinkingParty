class CreateAdminusers < ActiveRecord::Migration[5.2]
  def change
    create_table :adminusers do |t|
      t.integer :name
      t.integer :password

      t.timestamps
    end
  end
end
