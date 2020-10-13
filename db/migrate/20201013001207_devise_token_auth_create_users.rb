class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      change_table :users do |t|
        ## Required
        t.string :provider, :null => false, :default => "email"
        t.string :uid, :null => false, :default => ""

        ## Lockable
        # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
        # t.string   :unlock_token # Only if unlock strategy is :email or :both
        # t.datetime :locked_at

        ## Tokens
        t.json :tokens

      end

      add_index :users, [:uid, :provider],     unique: true
      # add_index :users, :unlock_token,       unique: true
    end
  end
end
