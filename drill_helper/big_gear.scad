
driven_gear_teeth=80;
driven_gear_length=4;
driven_gear_hub_length=4;
driven_gear_hub_dia = 20;
driven_shaft_length=40;
gear_module=0.5;

$fn=120;

module big_gear(){
	cylinder(r=(gear_module*driven_gear_teeth)/2,h=driven_gear_length);
	translate([0,0,driven_gear_length])cylinder(r=driven_gear_hub_dia/2,h=driven_gear_hub_length);
}

module drill_bushing(){
	difference(){
		union(){
			cylinder(r=(5+0.3)/2,h=4);
			translate(v=[0,0,4])cylinder(r=(8+0.3)/2,h=2);
		}
		cylinder(r=(2.5)/2,h=6);
	}
	
}


rotate(a=180,v=[0,1,0])difference(){
	union(){		
		cube(size=[50,50,10]);
	//	#translate(v=[15,0,-4]) cube(size=[20,8,4]);
	}
	#translate(v=[25,25,0]) big_gear();
	#translate(v=[25,5,driven_gear_length+driven_gear_hub_length/2]) rotate(a=90,v=[1,0,0]){
		 drill_bushing();
		 translate(v=[0,0,-15]) cylinder(r=1.5,h=25);
	}	

}

