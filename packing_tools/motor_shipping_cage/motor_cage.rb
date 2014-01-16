#!/usr/bin/ruby1.9.3
require "rubygems"
require "crystalscad"
require "./nema17"
include CrystalScad


class MotorCage < CrystalScad::Assembly
  def initialize(args={})
    @motor_height=47
    @bottom_height=3
    @height = @motor_height+@bottom_height
    @size=42.5
    @wall = 4
    @grid_cut = 24    
  end

  def part(show)
    res = mount(show)
    res += mount(show).translate(x:@size+@wall)
    
  end
  
  def mount(show)
    motor = Nema17.new

    
    res = cube([@size+@wall,@size+@wall,@height]).center_xy
    
    res -= cube([@size,@size,@height]).center_xy.translate(z:@bottom_height)
    res -= cube([@grid_cut*2,@grid_cut,@height]).center_xy.translate(z:@bottom_height)

    res += motor.show.translate(z:@bottom_height) if show
      
  end

end


res = MotorCage.new.show
res.save("motor_cage.scad")

