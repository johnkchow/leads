class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :email

      t.timestamps
    end
  end
end
