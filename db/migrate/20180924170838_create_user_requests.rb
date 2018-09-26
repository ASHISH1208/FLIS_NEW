class CreateUserRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requests,:id=>false do |t|
      t.string :name,:null=>false
      t.string :address,:null=>false
      t.string :village,:null=>false
      t.bigint :contact_no,:primary_key=>true
      t.string :email
      t.text   :loss_info,:null=>false
      t.bigint :loss_amount,:null=>false
      t.integer :status,:default=>-1 
    end
  end
end
