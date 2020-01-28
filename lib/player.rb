require 'pry'


class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @life_points = 10
        @name = name
    end

    def show_state
        puts "#{@name} à #{@life_points} points de vie"
    end

    def gets_damage (dm)
        @life_points = @life_points - dm
        
        puts "Le joueur #{@name} a été tué !" if @life_points <= 0
    end

    def attacks (p2)
        puts "le joueur #{@name} attaque le joueur #{p2.name} "
        damage_dealed = compute_damage
        puts " "
        puts "il lui inflige #{damage_dealed} points de dommages !"
        p2.gets_damage(damage_dealed)
        puts " "
    end

    def compute_damage
        return rand(1..6)
    end
end 

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @weapon_level = 1
        super(name)
        @life_points = 100
    end

    def show_state
        puts "#{@name} à #{@life_points} points de vie et une arme de niveau #{@weapon_level} !"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand (1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        if new_weapon_level > @weapon_level
            @weapon_level = new_weapon_level
            puts "Youhou ! elle est meilleur que ton arme actuelle : tu la prends !"
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle.."
        end
    end

    def search_health_pack
        try = rand (1..6)
        if try == 1
            puts "Tu n'as rien trouvé... "
        elsif try >= 2 && try <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie!"
            if @life_points <= 50
                @life_points += 50
            else
                not_real = @life_points + 50
                much = not_real - 100
                @life_points += (50-much)
            end
        else
            puts "Waow, tu as trouvé un pack de +80 points de vie!!!"
            @life_points + 80 >= 100 ? @life_points = 100 : @life_points + 80
        end
    end




end
