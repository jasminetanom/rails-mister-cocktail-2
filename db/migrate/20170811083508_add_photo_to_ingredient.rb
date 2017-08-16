class AddPhotoToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :photo, :string
  end
end
