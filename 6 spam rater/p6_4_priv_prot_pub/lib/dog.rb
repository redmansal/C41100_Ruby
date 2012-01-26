# To change this template, choose Tools | Templates
# and open the template in the editor.

class Dog
  #attr_accessor :name, :breed, :speed
  
  def initialize(name, breed, speed)
    @name = name
    @breed = breed
    @racing_speed = speed
    
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def racing_speed
    @racing_speed
  end

  def racing_speed_private
    @racing_speed
  end

  def sit
    puts "I am #{@name} and I am now going to sit"
    rollover
  end

  def rollover
    puts "This rolling over stuff is great"
  end

  def fetch
    puts "#{@name} loves fetching sticks"
  end

  def chase_your_tail
    puts "I love to chase my tale for some reason"
  end


  def race(animal)
    if @racing_speed > animal.racing_speed
      puts "#{@name} is the winner"
    elsif @racing_speed.equal(animal.racing_speed)
      puts "Its a draw"
    else
      puts "#{animal.name} is the winner"
    end
  end

  def race2(animal)
    if @racing_speed > animal.racing_speed_private
      puts "#{@name} is the winner"
    elsif @racing_speed.equal(animal.racing_speed_private)
      puts "Its a draw"
    else
      puts "#{animal.name} is the winner"
    end
  end



  public :name
  public :breed
  protected :racing_speed
  private :racing_speed_private
  public :sit
  private :rollover
  public :fetch
  protected :chase_your_tail
  public :race
  public :race2
end 