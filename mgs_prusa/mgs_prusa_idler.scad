include<configuration.scad>
// next stuff is copied from PrusaMendel, merged with Guidler stuff from GregFrost

wade_block_height=55;
wade_block_width=24;
wade_block_depth=28;

block_bevel_r=6;

base_thickness=7;
base_length=70;
base_leadout=25;

nema17_hole_spacing=1.2*25.4; 
nema17_width=1.7*25.4;
nema17_support_d=nema17_width-nema17_hole_spacing;

screw_head_recess_diameter=m3_nut_diameter_horizontal;
screw_head_recess_depth=3;

motor_mount_rotation=25;
motor_mount_translation=[50.5,34,0];
motor_mount_thickness=9;

m8_clearance_hole=8.8;
hole_for_608=22.3;
608_diameter=22;

block_top_right=[wade_block_width,wade_block_height];

layer_thickness=0.4;
filament_feed_hole_d=4;
filament_diameter=3;
filament_feed_hole_offset=filament_diameter+0.5;
idler_nut_trap_depth=7.5;
idler_nut_thickness=3;

gear_separation=7.4444+32.0111 +0.25;
filament_pinch=[
	motor_mount_translation[0]-gear_separation-filament_feed_hole_offset-filament_diameter/2,
	motor_mount_translation[1],
	wade_block_depth/2];
idler_axis=filament_pinch-[608_diameter/2,0,0];
idler_fulcrum_offset=608_diameter/2+3.5+m3_diameter/2;
idler_fulcrum=idler_axis-[0,idler_fulcrum_offset,0];
idler_corners_radius=4; 
idler_height=12;
idler_608_diameter=608_diameter+2;
idler_608_height=8.25;
idler_mounting_hole_across=8;
idler_mounting_hole_up=15;
idler_short_side=wade_block_depth-2;
idler_hinge_r=m3_diameter/2+3.5;
idler_hinge_width=6.5;
idler_end_length=(idler_height-2)+5;
idler_mounting_hole_diameter=m4_diameter+0.5;
idler_mounting_hole_elongation=4;
idler_long_top=idler_mounting_hole_up+idler_mounting_hole_diameter/2+idler_mounting_hole_elongation+2.5+1;
idler_long_bottom=idler_fulcrum_offset;
idler_long_side=idler_long_top+idler_long_bottom;

guide_height=14.3;
guide_length=10;

rotate(a=-90,v=[0,1,0]) wadeidler();

module wadeidler() 
{
	difference()
	{
		union()
		{
			//The idler block.
			translate(idler_axis+[-idler_height/2+2,+idler_long_side/2-idler_long_bottom,0]){
				cube([idler_height,idler_long_side,idler_short_side],center=true);

		        //Filament Guide.
		        translate([guide_height/2+idler_height/2-1,idler_long_side/2-guide_length/2,0])
			        cube([guide_height+1,guide_length,8],center=true);
	        }

			// The fulcrum Hinge
			translate(idler_fulcrum)
			rotate([0,0,-30])
			{
				cylinder(h=idler_short_side,r=idler_hinge_r,center=true,$fn=60);
				translate([-idler_end_length/2,0,0])
				cube([idler_end_length,idler_hinge_r*2,idler_short_side],center=true);
			}		
		}
		//Filament Path	
		translate(idler_axis+[guide_height,+idler_long_side-idler_long_bottom-guide_length/2,0])
		{
		cube([7,guide_length+2,3.5],center=true);
		translate([-7/2,0,0])
		rotate([90,0,0])
		cylinder(h=guide_length+4,r=3.5/2,center=true,$fn=66);
		}

	
		//Back of idler.
		translate(idler_axis+[-idler_height/2+2-idler_height,
			idler_long_side/2-idler_long_bottom-10,0])
		cube([idler_height,idler_long_side,idler_short_side],center=true);

		//Slot for idler fulcrum mount.
		translate(idler_fulcrum)
		{
			cylinder(h=idler_short_side-2*idler_hinge_width,
				r=idler_hinge_r+0.5,center=true,$fn=60);
			rotate(-30)
			translate([0,-idler_hinge_r-0.5,0])
			cube([idler_hinge_r*2+1,idler_hinge_r*2+1,
				idler_short_side-2*idler_hinge_width],center=true);
		}

		//Bearing cutout.
		translate(idler_axis)
		{
			difference()
			{
				cylinder(h=idler_608_height,r=idler_608_diameter/2,
					center=true,$fn=60);
			//	for (i=[0,1])
			//	rotate([180*i,0,0])
			//	translate([0,0,6.9/2])
			//	cylinder(r1=12/2,r2=16/2,h=2);
			}
			cylinder(h=idler_short_side-6,r=m8_diameter/2-0.25/*Tight*/,
				center=true,$fn=20);
		}

		//Fulcrum hole.
		translate(idler_fulcrum)
		rotate(360/12)
		cylinder(h=idler_short_side+2,r=m3_diameter/2+0.2,center=true,$fn=80);

		//Nut trap for fulcrum screw.
		translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
		rotate(360/16)
		cylinder(h=3,r=m3_nut_diameter/2+0.1,$fn=6);

		for(idler_screw_hole=[-1,1])
		translate(idler_axis+[2-idler_height,0,0])
		{
			//Screw Holes.
			translate([-1,idler_mounting_hole_up,
				idler_screw_hole*idler_mounting_hole_across])
			rotate([0,90,0])
			{
				cylinder(r=idler_mounting_hole_diameter/2,h=idler_height+2,$fn=16);
				translate([0,idler_mounting_hole_elongation,0])
				cylinder(r=idler_mounting_hole_diameter/2,h=idler_height+2,$fn=16);
				translate([-idler_mounting_hole_diameter/2,0,0])
				cube([idler_mounting_hole_diameter,idler_mounting_hole_elongation,
					idler_height+2]);
			}

			// Rounded corners.
			render()
			translate([idler_height/2,idler_long_top,
				idler_screw_hole*(idler_short_side/2)])
			difference()
			{
				translate([0,-idler_corners_radius/2+0.5,-idler_screw_hole*(idler_corners_radius/2-0.5)])
				cube([idler_height+2,idler_corners_radius+1,idler_corners_radius+1],
					center=true);
				rotate([0,90,0])
				translate([idler_screw_hole*idler_corners_radius,-idler_corners_radius,0])
				cylinder(h=idler_height+4,r=idler_corners_radius,center=true,$fn=40);
			}
		}
	}
}



