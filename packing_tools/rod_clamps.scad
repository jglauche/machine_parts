// makes printed rod clamps
$fn=64;

module rod(size=8.2){
	translate([size/2,25,3+size*0.75]) rotate([0,0,0]) cube([size+0.1,50,4], center=true);
	translate([size/2,0,size*0.75]) rotate([0,90,90]) cylinder(h = 50, r=size/2);

}


module clamp_2x8(size=8.2){
  difference(){
	 cube([24,28,10]);
  	 translate([0,-25,0]) rod(size);
	 translate([10,-25,0]) rod(size);
	}
}

module clamp_4x8(size=8.2){
	difference(){
 		cube([44,28,10]);
		translate([0,-25,0]) rod(size);
 		translate([10,-25,0]) rod(size);
 		translate([20,-25,0]) rod(size);
 		translate([30,-25,0]) rod(size);
	}
}


module clamp(rod_size, base, count, height=28, spacing=2){
	difference(){
		cube([(rod_size+spacing)*count+spacing,height,rod_size+2]);
		for(i=[0:count-1]){
			#translate([spacing+i*(rod_size+spacing),base,0]) rod(rod_size);
		}
	}

}

//rotate([-90,0,0]) clamp_2x8();
//rotate([-90,0,0]) clamp_4x8();
// rotate([-90,0,0]) clamp_2x8(8);


rotate([90,0,0]) clamp(8,3,2);
