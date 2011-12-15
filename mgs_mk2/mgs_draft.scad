
gear_module = 0.5;
motor_gear_teeth = 14;
motor_gear_mounting_part_length=7;
motor_gear_mounting_part_dia = 10;
motor_gear_gear_length=6;

driven_gear_teeth=80;
driven_gear_length=4;
driven_gear_hub_length=4;
driven_gear_hub_dia = 20;
// nema 14 motor

motor_mounting_hole_dia=3.5; // m3
motor_mounting_hole_distance = 26;
motor_size=35;
motor_depth = 38.2;
motor_shaft_length = 21.75;
motor_flange_dia = 22;
motor_flange_height = 2;
motor_shaft_dia = 5;


mount_thickness = 4;


module motor_mount_part(){
	difference(){
		cube(size=[motor_size,motor_size,mount_thickness]);
		translate([motor_size/2,motor_size/2,0]){
			cylinder(r=motor_flange_dia/2, h=mount_thickness);	
			// motor mounting holes
			translate(v=[-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,0])  cylinder(r=motor_mounting_hole_dia/2,h=mount_thickness);
			translate(v=[motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,0])  cylinder(r=motor_mounting_hole_dia/2,h=mount_thickness);
			translate(v=[-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,0])  cylinder(r=motor_mounting_hole_dia/2,h=mount_thickness);
			translate(v=[motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,0])  cylinder(r=motor_mounting_hole_dia/2,h=mount_thickness);
		} 
	}

}

module motor(){
	union(){
		cube(size=[motor_size, motor_size, motor_depth]);
		translate(v=[motor_size/2,motor_size/2,motor_depth]) cylinder(r=motor_flange_dia/2,h=motor_flange_height);

		translate(v=[motor_size/2,motor_size/2,motor_depth+motor_flange_height]) cylinder(r=motor_shaft_dia/2,h=motor_shaft_length);
	}
}



motor_mount_part();


// parts

// motor
#translate(v=[0,0,-motor_depth]) motor();

// motor gear
#translate(v=[motor_size/2,motor_size/2,motor_flange_height+7]){
	 cylinder(r1=motor_gear_mounting_part_dia/2,r2=(gear_module*motor_gear_teeth)/2, h=motor_gear_mounting_part_length) ;
	 translate(v=[0,0,motor_gear_mounting_part_length]) cylinder(r=(gear_module*motor_gear_teeth)/2, h=motor_gear_gear_length);
}
// driven gear
#translate(v=[motor_size/2,(gear_module*driven_gear_teeth),7]){
	translate(v=[0,0,10]) cylinder(r=(gear_module*driven_gear_teeth)/2,h=driven_gear_hub_length);
	translate(v=[0,0,-30])  cylinder(r=5/2,h=50);
}

