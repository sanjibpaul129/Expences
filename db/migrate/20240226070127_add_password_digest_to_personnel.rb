class AddPasswordDigestToPersonnel < ActiveRecord::Migration[5.2]
  def change
    add_column :personnels, :password_digest, :string
  end
end
