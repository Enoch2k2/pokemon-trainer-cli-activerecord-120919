class AddAttributesToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :poke_type_1, :string
    add_column :pokemons, :poke_type_2, :string
    add_column :pokemons, :description, :string
  end
end
