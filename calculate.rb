require "awesome_print"

require_relative "lib/pokemon"
require_relative "lib/pokemon_move"
require_relative "lib/battle"

move_sets = [
  PokemonMove.new("Tackle", 70, "Normal"),
  PokemonMove.new("Razor Leaf", 90, "Grass"),
  PokemonMove.new("Ember", 90, "Fire")
]

# :name, :moves, :base_def, :type, :base_hp
attacker = Pokemon.new("Bulbasaur", [ move_sets[0], move_sets[1] ], 80, "Grass", 160)
# :name, :moves, :base_def, :type, :base_hp
defender = Pokemon.new("Charmander", [ move_sets[0], move_sets[2] ], 60, "Fire", 170)

battle = Battle.new(attacker,defender)
battle.start

