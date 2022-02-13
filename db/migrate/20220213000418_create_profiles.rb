class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :github_url
      t.string :github_user
      t.integer :followers
      t.integer :following
      t.integer :stars
      t.integer :last_year_contributions
      t.string :profile_picture_url
      t.string :organization
      t.string :location

      t.timestamps
    end
  end
end
