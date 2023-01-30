=begin
class String
    def shoutify
        self.upcase + "!"
    end 
end

puts "help".shoutify


#Dog = Class.new

class Dog
    def bark
        puts "woof"
    end
    def walkies
        puts self
    end
    def colour=(colo)
        @colou = colo
    end
    def observe
        puts "You see a " + @colou + " dog"
    end
end
fido = Dog.new
fido.bark
fido.walkies
fido.colour = "gr"
fido.observe



class Robot
    def initialize(legs, arms)
        @legs = legs
        @arms = arms
    end
    def add_leg(count)
        @legs += count
    end
    def walk
        puts "I'm walking on my " + @legs.to_s + " legs and " + @arms.to_s + " arms"
    end
end
robot = Robot.new(100, "66")
robot.add_leg(4)
robot.walk
=end

class Airport
  def initialize
    @hangar = []
  end

  def land(planex)
    @hangar.push(planex)
  end

  def take_off(planex)
    if @hangar.length < 1
      puts "Error: there are no planes to take off"
    end

    if @hangar.include?(planex)
      @hangar.delete(planex)
      puts planex
    else
      puts "Error: plane not in hangar"
    end
  end

  def hangar_report
    if @hangar.length == 1
      puts "There is 1 plane in the hangar"
      puts "#{@hangar} is in the hangar"
    else
      puts "There are #{ @hangar.length } planes in the hangar"
      puts "#{@hangar} is in the hangar"    
    end
  end
end

class Plane
    def initialize(plane_name)
        @plane_name = plane_name
    end
end
cessna = Plane.new("cessna")
heathrow = Airport.new
heathrow.take_off(cessna)
heathrow.hangar_report
heathrow.land(cessna)
heathrow.hangar_report
heathrow.take_off(cessna)