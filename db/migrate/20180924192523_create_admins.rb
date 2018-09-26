class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins,:id=>false do |t|
      t.string :name,:primary_key=>true
      t.string :password,:null=>false
  
    end
  end
end
