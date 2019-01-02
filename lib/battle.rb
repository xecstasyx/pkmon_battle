class Battle

  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
    validate
  end

  # For now, movements will be random
  # Attackers always attack first, then defenders attack.
  # Battle Ends when 1 of the Pokemons runs out of HP.
  def start
    puts "Battle will begin!".yellow
    puts "\n"
    puts "\n"
    sleep 2

    attacking_now = @attacker
    defending_now = @defender
    attacker_current_hp = @attacker.base_hp
    defender_current_hp = @defender.base_hp

    until attacker_current_hp <= 0 || defender_current_hp <= 0 do
      # Attacks!
      current_atk = attacking_now.moves.sample
      current_atk_dmg = calculateDamage(current_atk, defending_now).to_i
      puts "#{attacking_now.name} attacks #{defending_now.name}!".green
      puts "#{attacking_now.name} uses #{current_atk.name} and does #{current_atk_dmg} to #{defending_now.name}!".purple
      sleep 1
      
      # Defends!
      if defending_now == @defender
        defender_current_hp = defender_current_hp - current_atk_dmg
        hp_to_show = "#{defender_current_hp}/#{@defender.base_hp}"
      elsif defending_now == @attacker
        attacker_current_hp = attacker_current_hp - current_atk_dmg
        hp_to_show = "#{attacker_current_hp}/#{@attacker.base_hp}"
      end

      puts "#{defending_now.name} current hp: #{hp_to_show}".white
      puts "\n"
      sleep 1

      # Turn ends
      if attacker_current_hp <= 0 || defender_current_hp <= 0
        puts "#{defending_now.name} fainted!".red
        puts "\n"
        puts "Battle is over!".yellow
        puts "\n"
        puts "The winner is... #{attacking_now.name}!!!".green
        puts "\n"
      else
        puts "Now its #{defending_now.name} turn!!".blue
        puts "\n"
      end
      temp_attacker = attacking_now
      temp_defender = defending_now

      attacking_now = temp_defender
      defending_now = temp_attacker
      sleep 2
    end
    

  end
  
  def attack_efficiency(attack_type, defender_type)
    # Súper eficaz: 2 x daño
    # Neutral: 1 x daño
    # No muy eficaz: 0.5 x daño
    # "Fire > Grass",
    # "Fire < Water",
    # "Fire = Electic",
    # "Water < Grass",
    # "Water < Electric"
    case attack_type
    when "Fire"
      if defender_type ==  "Grass"
        2        
      elsif defender_type == "Water"
        0.5
      else
        1
      end
    
    when "Water"
      if defender_type == "Grass"
        0.5
      elsif defender_type == "Electric"
        0.5
      elsif defender_type == "Fire"
        2
      else
        1
      end

    when "Grass"
      if defender_type == "Fire"
        0.5
      elsif defender_type == "Water"
        2
      else
        1
      end

    when "Electric"
      if defender_type == "Water"
        2
      else
        1
      end

    else
      1
    end
  end

  # daño = 50 * (ataque / defensa) * eficacia (por probabilidad de daño)
  def calculateDamage(attacker_move, defender)
    efficiency = self.attack_efficiency(attacker_move.type, defender.type)
    damage = 40 * (attacker_move.power / defender.base_def) * efficiency 
  end

  def efficiency_to_word

  end


  private
    def validate
      raise "Should add a pokemon as attacker" unless @attacker.class.eql?(Pokemon)
      raise "Should add a pokemon as defender" unless @defender.class.eql?(Pokemon)
    end
end