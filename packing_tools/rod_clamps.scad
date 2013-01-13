// make printed rod clamps
$fn=64;

module rod(){
	translate([7,25,3+6]) rotate([0,0,0]) cube([8.3,50,4], center=true);
	translate([7,0,6]) rotate([0,90,90]) cylinder(h = 50, r=4.1);

}


module clamp_2x8(){
  difference(){
	 cube([24,28,10]);
  	 translate([0,-25,0]) rod();
	 translate([10,-25,0]) rod();
	}
}

module clamp_4x8(){
	difference(){
 		cube([44,28,10]);
		translate([0,-25,0]) rod();
 		translate([10,-25,0]) rod();
 		translate([20,-25,0]) rod();
 		translate([30,-25,0]) rod();
	}
}

rotate([-90,0,0]) clamp_4x8();