class CreateUsers <ActiveRecord::Migration    
  def change            
    create_table :users do |t|
      t.string :name
      t.string :slack
      t.string :github
      t.string :twitter
      t.string :website
      t.text :bio
      t.text :availability
      t.string :application

      t.timestamps null: false
     end
   end
end