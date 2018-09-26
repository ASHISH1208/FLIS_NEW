class CreateVillageOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :village_officers,:id=>false do |t|
      t.string :village,:primary_key=>true
      t.string :name,:null=>false
      t.string :password,:null=>false 
 
    end
  end
end
