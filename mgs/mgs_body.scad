// (c) 2011 by Joachim Glauche
// License: GPLv3

// Warning: lots of QND stuff

include <shapes.scad>


bot_hex=7.3;
file="extruder.dxf";
spring_length_min=13.5;
spring_dia=7; 
bolt_dia=4.4;
ptfe_hole=5.6; // 10.7;


module motor_mount(){
union(){
linear_extrude(file,height=2, layer="0");
translate(v=[0,0,2]) linear_extrude(file,height=5, layer="1");
translate(v=[0,0,7]) linear_extrude(file,height=10.5, layer="2");
}
}


module main_body(){

union(){
linear_extrude(file,height=2, layer="t_0");

translate(v=[0,0,2]) linear_extrude(file,height=5, layer="t_1");


difference(){

translate(v=[0,0,7]) linear_extrude(file,height=21, layer="t_2");

translate(v=[17.8,22.4,12]) rotate(a=90,v=[0,1,0]) cylinder(r=spring_dia/2, h=spring_length_min);
translate(v=[-18,22.4,12]) rotate(a=90,v=[0,1,0])  cylinder(r=bolt_dia/2,h=50);	

translate(v=[0,32.6,0]){
	translate(v=[17.8,22,12]) rotate(a=90,v=[0,1,0]) cylinder(r=spring_dia/2, h=spring_length_min);
	translate(v=[-18,22.4,12]) rotate(a=90,v=[0,1,0])  cylinder(r=bolt_dia/2,h=50);	
}


translate(v=[17.8,22.4,24]) rotate(a=90,v=[0,1,0]) cylinder(r=spring_dia/2, h=spring_length_min);
translate(v=[-18,22.4,24]) rotate(a=90,v=[0,1,0])  cylinder(r=bolt_dia/2,h=50);	

translate(v=[0,32.6,0]){
	translate(v=[17.8,22,24]) rotate(a=90,v=[0,1,0]) cylinder(r=spring_dia/2, h=spring_length_min);
	translate(v=[-18,22.4,24]) rotate(a=90,v=[0,1,0])  cylinder(r=bolt_dia/2,h=50);	
}

// filament guide

translate(v=[-4.5,70,18]) rotate(a=90,v=[1,0,0]) cylinder(h=60, r=2.2);

// ptfe hole

translate(v=[-4.5,18,18]) rotate(a=90,v=[1,0,0]) cylinder(h=10, r=ptfe_hole/2);

// mounting hole
//translate(v=[10.5,24-5,18]) rotate(a=90,v=[1,0,0]) hexagon(bot_hex,15+10);	

translate(v=[16.5,15,18]) rotate(a=90,v=[1,0,0]) cylinder(h=40, r=2.2);	



}

}

}



z=6;
center=36;
bolt_hex=7.5;
z_offset = 4;
module sc_mount(){
difference(){
	cube(size=[70,28,z]);
	translate(v=[0,z_offset,0]){
		// PTFE hole
  		translate(v=[center,14,0]) cylinder(r=ptfe_hole/2,h=z);
   	
	 	// normal wades mount

		translate(v=[center-28.5,14,0]) cylinder(r=bolt_dia/2,h=z);
	// 	translate(v=[center-28.5,14,1]) rotate(a=30,v=[0,0,1]) hexagon(bolt_hex,z);
		#translate(v=[center-28.5-bolt_hex/2,14-bolt_hex/2,-z/2+1]) cube(size=[bolt_hex,bolt_hex,z]);
	
	  	translate(v=[center+21.5,14,0]) cylinder(r=bolt_dia/2,h=z);
  	//	#translate(v=[center+21.5,14,1]) rotate(a=30,v=[0,0,1]) hexagon(bolt_hex,z);
		#translate(v=[center+21.5-bolt_hex/2,14-bolt_hex/2,-z/2+1]) cube(size=[bolt_hex+10,bolt_hex,z]);
	}	
}
}





module body_with_mount(){
union(){
	main_body();
	translate(v=[-40.5,12,0]) rotate(a=90,v=[1,0,0]) sc_mount();
}
}



//translate(v=[-90,5,0]) motor_mount();
body_with_mount();
translate(v=[-25,85,0]) rotate(a=180,v=[0,0,1]) body_with_mount();



