class AddLanguageToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :language, index: true
    add_foreign_key :events, :languages
  end
end
