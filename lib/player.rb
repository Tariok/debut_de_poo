class Player
  attr_accessor :name, :life_points
  @@all_player = []

  def initialize (name)
    @name = name
    @life_points = 10
    @@all_player << self
  end

  def self.all
    return @@all_player
  end 

  def show_state
    puts "#{@name} à #{@life_points} point de vie"
  end

  def gets_damage(how_many_damage)
    @life_points = @life_points - how_many_damage
    if @life_points <= 0
      puts "#{@name} DECEDE"
    end
  end

  def compute_damage
    return rand(1..6)
  end
  
  def attacks(an_other_player)
    damage = compute_damage
    puts "Le joueur #{@name} met son meilleur coup de tête a #{an_other_player.name}"
    puts "#{an_other_player.name} Viens de perdre #{damage} point de vie aie aie aie\n\n"
    an_other_player.gets_damage(damage)
  end

  
end

class HumanPlayer < Player
  attr_accessor :name, :life_points, :weapon_level
  @@all_player = []

  def initialize (name)
    @name = name
    @life_points = 100
    @weapon_level = 1
    @@all_player << self
  end

  def self.all
    return @@all_player
  end 

  def show_state
    puts "#{@name} à #{@life_points} point de vie et une arme #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end
  
  def attacks(an_other_player)
    damage = compute_damage
    puts "Le joueur #{@name} met son meilleur coup de tête a #{an_other_player.name}"
    puts "#{an_other_player.name} Viens de perdre #{damage} point de vie aie aie aie\n\n"
    an_other_player.gets_damage(damage)
  end

  def search_weapon
    rand_number = rand(1..6)
    puts "tu as trouver une arme de niveau #{rand_number}"
    if @weapon_level < rand_number
      puts "super une arme meilleur que la mienne \n"
      @weapon_level = rand_number
    elsif @weapon_level == 6
      puts "j'ai deja la meilleur arme possible ici\n"
    else
      puts "l'arme est pas ouf je vais tester un autre jour\n"
    end
  end

  def search_health_pack
    search_health_random = rand(1..6)
    if search_health_random == 1
      puts "Tu n'as rien trouvé... "
    elsif search_health_random == 6
      puts " Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = life_points + 80
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = life_points + 50
    end

  end
end