class Nema17 < CrystalScad::Assembly
	
	attr_accessor :args
  def initialize(args={})		
		@args=args			
		@args[:length] = 47
		@args[:holding_torque] = 4400

		@motor_flange_output_dia = @args[:bolt_output_dia] || 22.5
		@motor_flange_output_height  = @args[:motor_flange_output_height] || 10

		@motor_OD=42.7
		@motor_mounting_hole_distance=31.4
		@motor_mounting_hole_diam=3.0
		@motor_height=47.0
		@motor_shaft_OD=5.0
		@motor_shaft_height = 22.7
		@motor_flange_dia = 22.0
		@motor_flange_height = 2.0	 

		@@bom.add(description) unless args[:no_bom] == true
  end

	def description
		"Nema 17 stepper, length=#{@args[:length]} with holding torque of #{@args[:holding_torque]} g*cm"
	end

	def threads_top
		holes = []
		[-1,1].each do |i|	
			[-1,1].each do |f|	
				holes << ScrewThread.new(x:i*@motor_mounting_hole_distance/2,y:f*@motor_mounting_hole_distance/2,size:3,depth:2.5)
			end		
		end
		holes
	end

	# ported from Tom Cramer's scad version
	def part(show)
		base = outline.linear_extrude(height:(@motor_height/6)*4,center:true).color("DimGray")

		base+= outline.linear_extrude(height:(@motor_height/6),center:true).translate(z:(@motor_height/1.5+@motor_height/6-0.1)/2).color("LightGrey") 		
		base+= outline.linear_extrude(height:(@motor_height/6),center:true).translate(z:-(@motor_height/1.5+@motor_height/6-0.1)/2).color("LightGrey") 		
		
		flange=cylinder(d:@motor_flange_dia,h:@motor_flange_height,center:true).translate(z:(@motor_height+@motor_flange_height-0.01)/2).color("LightGrey")

		# for output cut
		flange=cylinder(d:@motor_flange_output_dia,h:@motor_flange_output_height).translate(z:(@motor_height+@motor_flange_height-0.01)/2).color("LightGrey") if !show
				
		shaft = cylinder(d:@motor_shaft_OD,h:@motor_shaft_height,center:true).translate(z:(@motor_shaft_height+@motor_height+@motor_flange_height)/2).color("WhiteSmoke")

		# screw holes
		[-1,1].each do |i|	
			[-1,1].each do |f|	
				base-= cylinder(d:@motor_mounting_hole_diam,h:@motor_height+1,center:true).translate(x:i*@motor_mounting_hole_distance/2,y:f*@motor_mounting_hole_distance/2,z:0).color("DimGray")
			end
		end


		motor = base+flange+shaft
		# move motor that z is 0
		motor.translate(z:@motor_height/2)		
	end
	
	def outline
		polygon(points:[[-@motor_mounting_hole_distance/2,-@motor_OD/2],[-@motor_OD/2,-@motor_mounting_hole_distance/2],[-@motor_OD/2,@motor_mounting_hole_distance/2],[-@motor_mounting_hole_distance/2,@motor_OD/2],[@motor_mounting_hole_distance/2,@motor_OD/2],[@motor_OD/2,@motor_mounting_hole_distance/2],[@motor_OD/2,-@motor_mounting_hole_distance/2],[@motor_mounting_hole_distance/2,-@motor_OD/2]])
	end

end
