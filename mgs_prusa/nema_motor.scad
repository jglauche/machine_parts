echo("nema_motor.scad"); 
//©2011 Tom Cramer
//license GNU GPL v2

include<configuration.scad>

//nema17
motor_OD=42.7;
motor_mounting_hole_distance=31.4;
motor_mounting_hole_diam=m3_diam;
motor_height=47;
motor_shaft_OD=5;
motor_shaft_height = 22.7;
motor_flange_dia = 22;
motor_flange_height = 2;

//nema14
//motor_OD=35;
//motor_mounting_hole_distance=26;
//motor_mounting_hole_diam=m3_diam;
//motor_height=38.2;
//motor_shaft_OD=5;
//motor_shaft_height = 21.75;
//motor_flange_dia = 22;
//motor_flange_height = 2;


with_pulley=false;


//show
//translate([0,0,-motor_height/2])nema();
//nema_bolts();
//nema();

module nema(){



if(with_pulley){
color(PlasticRed)translate([0,0,26])rotate([0,0,0])import("pulley.stl");
}
	difference(){
		union(){
		color(Silver)translate([0,0,(motor_shaft_height+motor_height+motor_flange_height)/2])cylinder(r=motor_shaft_OD/2,h=motor_shaft_height,$fn=18,center=true);
		color(Aluminum)translate([0,0,(motor_height+motor_flange_height-0.01)/2])cylinder(r=motor_flange_dia/2,h=motor_flange_height,$fn=36,center=true);
		color(BlackPaint)linear_extrude(height=(motor_height/6)*4,center=true) outline();
		color(Aluminum)translate([0,0,(motor_height/1.5+motor_height/6-0.1)/2])linear_extrude(height=(motor_height/6),center=true) outline();
		color(Aluminum)translate([0,0,-(motor_height/1.5+motor_height/6-0.1)/2])linear_extrude(height=(motor_height/6),center=true) outline();
		}

	translate([motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,0])cylinder(r=motor_mounting_hole_diam/2,h=motor_height+1,$fn=8,center=true);
	translate([-motor_mounting_hole_distance/2,motor_mounting_hole_distance/2,0])cylinder(r=motor_mounting_hole_diam/2,h=motor_height+1,$fn=8,center=true);
	translate([-motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,0])cylinder(r=motor_mounting_hole_diam/2,h=motor_height+1,$fn=8,center=true);
	translate([motor_mounting_hole_distance/2,-motor_mounting_hole_distance/2,0])cylinder(r=motor_mounting_hole_diam/2,h=motor_height+1,$fn=8,center=true);
	//color(Silver)translate([0,0,(motor_shaft_height+motor_height+motor_flange_height)/2])cylinder(r=motor_shaft_OD/2,h=motor_shaft_height,$fn=18,center=true);
	}

}

module outline(){
 
polygon(points=[[-motor_mounting_hole_distance/2,-motor_OD/2],[-motor_OD/2,-motor_mounting_hole_distance/2],[-motor_OD/2,motor_mounting_hole_distance/2],[-motor_mounting_hole_distance/2,motor_OD/2],[motor_mounting_hole_distance/2,motor_OD/2],[motor_OD/2,motor_mounting_hole_distance/2],[motor_OD/2,-motor_mounting_hole_distance/2],[motor_mounting_hole_distance/2,-motor_OD/2]]);

}
