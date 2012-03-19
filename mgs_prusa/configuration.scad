echo("configuration.scad"); 
//©2011 Tom Cramer"
//license GNU GPL v2, or any later ....
//pdiam based on Nophead's : http://hydraraptor.blogspot.com/2011/02/polyholes.html 


tolerance=0.2;
function pdiam(diam)=(diam) / cos (180 / max(round(2 * diam),3))+tolerance;

m3_diam=pdiam(3);
m3_nut=pdiam(6.4);
m3_nut_H=3.8;
m3_cap=pdiam(5.5);
m3_cap_H=4;
m4_diam=pdiam(4);
m4_nut=pdiam(8.1);
m4_nut_H=4;
m4_cap=pdiam(7);
m4_cap_H=4.8;
m5_diam=pdiam(5);
m5_cap=pdiam(8.5);
m5_cap_H=5.1;
m8_diam=pdiam(8);
m8_nut=pdiam(15);
m8_nut_H=8;
624_H=5;
624_diam=pdiam(13);
608_H=7;
608_diam=pdiam(22);
x_smoothRod_dist=50;
nema17_OD=42.7;
nema17_mounting_hole_dist=31.4;
nema17_ID_clearance=22;
nema17_mounting_hole_distance=nema17_mounting_hole_dist;
nema17_height=47;
nema17_shaft_OD=5;

Oak = [0.65, 0.5, 0.4];
Pine = [0.85, 0.7, 0.45];
Birch = [0.9, 0.8, 0.6];
FiberBoard = [0.7, 0.67, 0.6];
BlackPaint = [0.2, 0.2, 0.2];
Iron = [0.36, 0.33, 0.33];
Steel = [0.65, 0.67, 0.72];
Stainless = [0.45, 0.43, 0.5];
Aluminum = [0.77, 0.77, 0.8];
Brass = [0.88, 0.78, 0.5];
Transparent = [1, 1, 1, 0.2];
Silver=[230/255,230/255,230/255];
PlasticGreen=[0,1,0];
PlasticRed=[1,0,0];
PlasticBlue=[0,0,1];


//***prusa conversions:

smooth_rod_diameter=m8_diam;
threaded_rod_diameter=m8_diam;
m3_diameter=m3_diam;
m4_diameter=m4_diam;
m8_diameter=m8_diam;
m3_nut_diameter=m3_nut;
m4_nut_diameter=m4_nut;
m8_nut_diameter=m8_nut;

module nut(d,h,horizontal=true){
cornerdiameter =  (d / 2) / cos (180 / 6);
cylinder(h = h, r = cornerdiameter, $fn = 6);
if(horizontal){
for(i = [1:6]){
	rotate([0,0,60*i]) translate([-cornerdiameter-0.2,0,0]) rotate([0,0,-45]) cube(size = [2,2,h]);
}}
}

// Based on nophead research
module polyhole(d,h) {
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n);
}




module roundcorner(diameter){
	difference(){
		cube(size = [diameter,diameter,99], center = false);
		translate(v = [diameter, diameter, 0]) cylinder(h = 100, r=diameter,$fn=round(diameter*4), center=true);
	}
}

//teardrop(3/2,12);

module teardrop (r=8,h=20,rotation=0)
{
$fn=18;
translate([-h/2,0,0])	
rotate([-270,rotation,90])
	linear_extrude(height=h)
	{
		circle(r=r);
		polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,r],[-0.5*r,r],[-r*cos(30),r*sin(30)]],
				paths=[[0,1,2,3,4]]);
	}
}
//nema_bolts(12,limit=false);
module nema_bolts(long=12,rotation=0,limit=false){
translate([0,0,0]){

			color(Stainless)translate([0,nema17_mounting_hole_distance/2,nema17_mounting_hole_distance/2,])teardrop(r=m3_diam/2,h=long,rotation=rotation);
			color(Stainless)translate([-long/4,nema17_mounting_hole_distance/2,nema17_mounting_hole_distance/2])teardrop(r=m3_cap/2,h=long/2,rotation=rotation);

color(Stainless)translate([0,-nema17_mounting_hole_distance/2,nema17_mounting_hole_distance/2])teardrop(r=m3_diam/2,h=long,rotation=rotation);
			color(Stainless)translate([-long/4,-nema17_mounting_hole_distance/2,nema17_mounting_hole_distance/2])teardrop(r=m3_cap/2,h=long/2,rotation=rotation);	

color(Stainless)translate([0,-nema17_mounting_hole_distance/2,-nema17_mounting_hole_distance/2])teardrop(r=m3_diam/2,h=long,rotation=rotation);
			color(Stainless)translate([-long/4,-nema17_mounting_hole_distance/2,-nema17_mounting_hole_distance/2])teardrop(r=m3_cap/2,h=long/2,rotation=rotation);

if(!limit){
color(Stainless)translate([0,nema17_mounting_hole_distance/2,-nema17_mounting_hole_distance/2])teardrop(r=m3_diam/2,h=long,rotation=rotation);
			color(Stainless)translate([-long/4,nema17_mounting_hole_distance/2,-nema17_mounting_hole_distance/2])teardrop(r=m3_cap/2,h=long/2,rotation=rotation);	
}

}		
}