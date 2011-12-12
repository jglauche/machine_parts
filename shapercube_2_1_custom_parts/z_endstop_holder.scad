// Endstop holder for Shapercube

// Fork from Prusa Mendel repository
// Original work by Josef Průša (josefprusa@me.com) / prusadjs.cz
// Additional contributions:
// * Modified for Shapercube Z axis by Joachim Glauche (info [at ] gli-concept [dot] de)
// License: GNU GPL v3

m8_diameter = 8.7;
m3_diameter = 3;
m4_diameter = 4.3;

module endstop(){
outer_diameter = m8_diameter/2+2.2;
screw_hole_spacing = 9.5;
opening_size = m8_diameter-1.5; //openingsize

difference(){
	union(){


		translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = 20);
		translate([outer_diameter, 0, 0]) cube([7.5,outer_diameter*2,10]);
		translate([-20, 0, 0]) cube([34, 6, 10]);
		translate([-20, 0, 0]) cube([20, 6, 15]);

	}




	//translate([9, outer_diameter-opening_size/2, 0]) cube([18,opening_size,20]);
	translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);
	//translate([17, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m4_diameter/2, $fn = 10);
	translate([-6, 17, 11]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
	translate([-(6+screw_hole_spacing), 17, 11]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
}
}
endstop();

