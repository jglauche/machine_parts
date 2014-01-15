#!/usr/bin/ruby1.9.3
require "rubygems"
require "crystalscad"
include CrystalScad


class Angle < CrystalScad::Assembly
  def initialize(args={})
    @x=30
    @y=@x
    @thickness = 6
    @side_thickness = 2
  end
  
  
  def part(show)
    base = wall(show)    
    base += wall(show).mirror(x:1).rotate(y:90)
    base += side
    base += side.translate(y:@y)
    
  end
  
  def wall(show)
    res = cube(x:@x,y:@y,z:@thickness)
    b = Bolt.new(4,12)
    res -= b.output.mirror(z:1).translate(x:@x/2+@thickness,y:@y/2,z:@thickness)
    res += b.show.mirror(z:1).translate(x:@x/2+@thickness,y:@y/2,z:@thickness) if show
    res
  end
  
  def side
    hull(cube(x:@x,y:@side_thickness,z:@thickness),
         cube(x:@thickness,y:@side_thickness,z:@y)
        ) 
  end
  
end

a=Angle.new.output
a.save("tslot_angle.scad")
