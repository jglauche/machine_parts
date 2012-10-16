
use <../mgs_prusa/nema_motor.scad>;

$fn=32;

space_between_holes = 30;
space_from_holes_to_bed = 70;
dial_mount_dia = 8;
dial_base_to_tip = 42;
dial_base_dia=58;


x = space_between_holes+10;
y = 5;
z= 80;


module dial_gauge_mount(){

    difference(){
        union(){
            cube([x,y,z+55]);
            translate([0,-8,40])cube([x,y+4,40]);
        
        }  


        translate([x/2,0,40]) rotate([90,0,0])cylinder(r=dial_base_dia/2,h=25);  
        translate([x/2,-10,60]) rotate([0,0,0])cylinder(r=4.1,h=25);  
        translate([x/2,-8,60]) rotate([0,0,0])cylinder(r=4.1,h=25);  
        
        
     
        translate([5,10,75]) rotate([90,0,0]) cylinder(r=1.8, h=30);
       
        translate([5+space_between_holes,10,75]) rotate([90,0,0]) cylinder(r=1.8, h=30);
       // #translate([x/2,30,z+34]) rotate(a=90,v=[1,0,0]) nema();
        translate([x/2,y+0.2,z+34]) rotate(a=90,v=[1,0,0]) cylinder(r=12,h=12);
        // motor holes
        translate([x/2-16,y+0.2,z+34-16]) rotate(a=90,v=[1,0,0]) cylinder(r=2,h=12);
        translate([x/2-16,y+0.2,z+34+16]) rotate(a=90,v=[1,0,0]) cylinder(r=2,h=12);
        translate([x/2+16,y+0.2,z+34-16]) rotate(a=90,v=[1,0,0]) cylinder(r=2,h=12);
        translate([x/2+16,y+0.2,z+34+16]) rotate(a=90,v=[1,0,0]) cylinder(r=2,h=12);
    
        #translate([0,-1,-30])cube([x,y+4,40]);
        
    
    }

}

module dial_gauge_clamp(){
    difference(){
        cube([x,10,10]);
        translate([5,11,5]) rotate([90,0,0]) cylinder(r=1.8, h=30);
        translate([5+space_between_holes,11,5]) rotate([90,0,0]) cylinder(r=1.8, h=30);
        // nut traps
        translate([5,2.5,5]) rotate([90,0,0]) cylinder(r=3.6, h=3,$fn=6);
        translate([5+space_between_holes,2.5,5]) rotate([90,0,0]) cylinder(r=3.6, h=3,$fn=6);
 

        translate([x/2,11,-1]) rotate([0,0,0])cylinder(r=4.1,h=25);  
                
    }

}

module production(){
rotate([-90,0,0]){
   dial_gauge_mount();
   #translate([-15,-5,52]) rotate([0,90,0]) dial_gauge_clamp();
}
}
production();

module dev(){
   dial_gauge_mount();
   translate([0,-18,70]) dial_gauge_clamp();
   color("silver") translate([x/2,y-5,37]) rotate([90,180,0]) dial_gauge();
}
//dev();

module dial_gauge(){
    union(){
        cylinder(r=dial_base_dia/2,h=25);
        translate([0,-dial_base_to_tip+14,7]) rotate(a=[90,0,0]) cylinder(r=dial_mount_dia/2,h=dial_base_to_tip);
    }

}



