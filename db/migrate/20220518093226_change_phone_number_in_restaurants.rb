class ChangePhoneNumberInRestaurants < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :phone_number, :string
    change_column :reviews, :rating, :integer
  end
end
