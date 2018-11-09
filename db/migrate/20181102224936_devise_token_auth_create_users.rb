class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tokens, :json
    add_column :users, :provider, :string, :null => false, :default => 'email'
    add_column :users, :uid, :string, :null => false, :default => ''
    add_column :users, :sign_in_count, :integer, :default => 0, :null => false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_index :users, [:uid, :provider], unique: true
  end
end
