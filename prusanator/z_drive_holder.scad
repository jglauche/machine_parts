
include <shapes.scad>;

dia = 36;
d_shape_dist = 6;
hole_dia=5;
hole_dist=14;
base_thickness =4;
hex_size=13.8;
hex_size2 = 19;
shaft_height = 30;


module base(){
	difference(){
		cylinder(r=dia/2,h=base_thickness);
		// d-shape
		translate(v=[-dia/2,-dia/2,0]) cube(size=[dia,d_shape_dist,base_thickness]);
		// mounting holes
		rotate(a=-30,v=[0,0,1]) translate(v=[hole_dist,0,0]) cylinder(r=hole_dia/2,h=base_thickness);
		rotate(a=90,v=[0,0,1]) translate(v=[hole_dist,0,0]) cylinder(r=hole_dia/2,h=base_thickness);
		rotate(a=210,v=[0,0,1]) translate(v=[hole_dist,0,0]) cylinder(r=hole_dia/2,h=base_thickness);
		#translate(v=[0,0,base_thickness/2]) hexagon(hex_size,base_thickness);

	}
}




union(){
	base();

	translate(v=[0,0,shaft_height/2+base_thickness]) difference(){
		hexagon(hex_size2,shaft_height);
		hexagon(hex_size,shaft_height);
	}
}



