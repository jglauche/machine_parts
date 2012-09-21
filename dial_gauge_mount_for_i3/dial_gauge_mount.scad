
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
            cube([x,y,z]);
            translate([0,-8,40])cube([x,y+4,40]);
        
        }  


        translate([x/2,0,40]) rotate([90,0,0])cylinder(r=dial_base_dia/2,h=25);  
        translate([x/2,-10,60]) rotate([0,0,0])cylinder(r=4.1,h=25);  
        translate([x/2,-8,60]) rotate([0,0,0])cylinder(r=4.1,h=25);  
        translate([x/2,-7,60]) rotate([0,0,0])cylinder(r=4.1,h=25);  
        
        translate([5,y+0.1,6]) rotate([90,0,0]) cylinder(r=1.8, h=y+0.2);
        translate([5+space_between_holes,y+0.1,6]) rotate([90,0,0]) cylinder(r=1.8, h=y+0.2);

     
        translate([5,10,75]) rotate([90,0,0]) cylinder(r=1.8, h=30);
       
        translate([5+space_between_holes,10,75]) rotate([90,0,0]) cylinder(r=1.8, h=30);
            
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

rotate([-90,0,0]){
   dial_gauge_mount();
   translate([0,-5,-12]) rotate([0,0,0]) dial_gauge_clamp();
}

//   translate([0,-18,70]) dial_gauge_clamp();
//   color("silver") translate([x/2,y-5,37]) rotate([90,180,0]) dial_gauge();

module dial_gauge(){
    union(){
        cylinder(r=dial_base_dia/2,h=25);
        translate([0,-dial_base_to_tip+14,7]) rotate(a=[90,0,0]) cylinder(r=dial_mount_dia/2,h=dial_base_to_tip);
    }

}



