

base_dia = 39;

mount_min = 19;
mount_max = 31;

//bottom_thickness = 2;
total_thickness = 4.5;

ptfe_hole=3.7;


difference(){
	translate(v=[-35,-6,0]) cube(size=[70,12,total_thickness]);
	

	cylinder(r=ptfe_hole, h=total_thickness);

	translate(v=[24,0,0]) cylinder(r=3, h=total_thickness);
	translate(v=[23,-3,0]) cube(size=[7,6,total_thickness]);
	translate(v=[29,0,0]) cylinder(r=3, h=total_thickness);

	translate(v=[-24,0,0]) cylinder(r=3, h=total_thickness);
	translate(v=[-30,-3,0]) cube(size=[7,6,total_thickness]);
	translate(v=[-29,0,0]) cylinder(r=3, h=total_thickness);

}




