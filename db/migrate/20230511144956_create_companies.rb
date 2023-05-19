class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :url
      t.string :linkedin_url
      t.string :founded_at
      t.integer :employee_count
      t.string :headquarters_country
      t.string :headquarters_city
      t.string :industries, array: true, null: false, default: []
      t.string :keywords, array: true, null: false, default: []
      t.jsonb :metadata, null: false, default: {}

      t.timestamps
    end

    add_index :companies, :name, unique: true
    add_index :companies, :metadata, using: 'gin'
  end
end
