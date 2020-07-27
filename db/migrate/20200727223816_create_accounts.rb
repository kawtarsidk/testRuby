class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
