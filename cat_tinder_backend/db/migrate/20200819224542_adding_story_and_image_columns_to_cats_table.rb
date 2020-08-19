class AddingStoryAndImageColumnsToCatsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :story, :text
    add_column :cats, :image, :text
  end
end
