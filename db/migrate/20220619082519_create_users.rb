class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      
       ## Database authenticatable
       t.string :email, null: false, default: ""
       t.string :password_digest, null: false, default: ""
       t.string :full_name, null: false
       t.string :mobile_number, null: false
       t.integer :role,null: false,default:0

       ## Recoverable
       t.string   :reset_password_token
       t.datetime :reset_password_sent_at

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
