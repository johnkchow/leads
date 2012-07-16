class CreateEmailHistories < ActiveRecord::Migration
  def change
    create_table :email_histories do |t|
      t.integer :lead_id
      t.timestamp :sent_at
      t.integer :template_id

      t.timestamps
    end
  end
end
