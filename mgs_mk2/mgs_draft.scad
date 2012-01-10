
gear_module = 0.5;

motor_gear_teeth = 14;
motor_gear_mounting_part_length=7;
motor_gear_mounting_part_dia = 10;
motor_gear_gear_length=6;

driven_gear_teeth=80;
driven_gear_length=4;
driven_gear_hub_length=4;
driven_gear_hub_dia = 20;

filament_drive_gear_teeth = 20;
filament_drive_gear_length = 5;
filament_drive_gear_hub_length=7.8;
filament_drive_gear_hub_dia = 10;

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
		cube(size=[motor_size,motor_size+16,mount_thickness]);
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


module bearing_625() {
	difference(){
		cylinder(r=8, h=5);
		cylinder(r=2.5, h=5);
	}
}


// parts

// motor
#translate(v=[0,0,-motor_depth]) motor();

// motor gear
translate(v=[motor_size/2,motor_size/2,motor_flange_height+10]){
	 cylinder(r1=motor_gear_mounting_part_dia/2,r2=(gear_module*motor_gear_teeth)/2, h=motor_gear_mounting_part_length) ;
	 translate(v=[0,0,motor_gear_mounting_part_length]) cylinder(r=(gear_module*motor_gear_teeth)/2, h=motor_gear_gear_length);
}

// driven gear
translate(v=[motor_size/2,(gear_module*driven_gear_teeth),10]){
	// big gear
	translate(v=[0,0,10]) cylinder(r=(gear_module*driven_gear_teeth)/2,h=driven_gear_length);
	// hub of big gear
	translate(v=[0,0,10+driven_gear_length]) cylinder(r=driven_gear_hub_dia/2,h=driven_gear_hub_length);
	
	// shaft
	translate(v=[0,0,-20])  cylinder(r=5/2,h=50);

	// filament_drive_gear 
	translate(v=[0,0,5]) color([170/255,0,0])   cylinder(r=(gear_module*filament_drive_gear_teeth)/2,h=filament_drive_gear_length);
	translate(v=[0,0,2.2-filament_drive_gear_length]) cylinder(r=filament_drive_gear_hub_dia/2,h=filament_drive_gear_hub_length);
	
	// 625 ZZ bearings
	color([0,0.7,0.6]) {
		translate(v=[0,0,-8.1]) bearing_625();
		translate(v=[0,0,18]) bearing_625();
	}
}	




