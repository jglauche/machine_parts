$fn=32;
module spool(dia=300, core_dia=52.5, thickness=100){

	color([0.1,0.1,0.1]) difference(){
		cylinder(r=dia/2, h=thickness);
		cylinder(r=core_dia/2,h=thickness);	
	}

}

module stand_with_side_mount(height=170, plate_thickness=12){

	difference(){
		union(){
			cylinder(r=10, h=height);
			translate([-10,-10,height]) cube([20,20,40]);
		}
		translate([-plate_thickness/2,-10,height+10]) cube([plate_thickness,20,30]);
		translate([-50,0,height+15]) rotate([0,90,0]) cylinder(r=1.5,h=100);
		translate([-50,0,height+30]) rotate([0,90,0]) cylinder(r=1.5,h=100);
	

		translate([0,10,3]) rotate([90,0,0]) cylinder(r=4.5, h=20);
		translate([0,10,2]) rotate([90,0,0]) cylinder(r=4.5, h=20);
	}

}

module stand_with_top_mount(height=170){

	difference(){
		union(){
			cylinder(r=10, h=height);
			translate([-35,-10,height]) cube([70,20,6]);
		}
  		translate([25,0,height-10]) rotate([0,0,0]) cylinder(r=1.9, h=20);
   		translate([25,0,height]) cylinder(r2=1.9,r1=3.4, h=3); 
   		translate([-25,0,height-10]) rotate([0,0,0]) cylinder(r=1.9, h=20);
	    translate([-25,0,height]) cylinder(r2=1.9,r1=3.4, h=3); 
   		

		translate([0,10,3]) rotate([90,0,0]) cylinder(r=4.5, h=20);
		translate([0,10,2]) rotate([90,0,0]) cylinder(r=4.5, h=20);
	}

}


//spool();
//translate([0,-10,-15]) rotate([90,0,0]) 
rotate([180,0,0])  stand_with_top_mount();
