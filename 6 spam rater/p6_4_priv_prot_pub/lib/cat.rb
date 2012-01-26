# To change this template, choose Tools | Templates
# and open the template in the editor.

class Cat
  #attr_accessor :name, :breed, :speed
  
  def initialize(name, breed, speed)
    @name = name
    @breed = breed
    @racing_speed = speed
    
  end

  def breed
    @breed
  end

  def racing_speed
    @racing_speed
  end

  public :breed
  protected :racing_speed
end 