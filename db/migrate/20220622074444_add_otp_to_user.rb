class AddOtpToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :otp, :integer
  end
end
