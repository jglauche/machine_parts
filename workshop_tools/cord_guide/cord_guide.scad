$fn=64;


module screw(){
    union(){
        cylinder(r=4.1/2,h=40);
        cylinder(r2=3.5/2,r1=7.8/2,h=4);
    }
}


module cord_guide(cord_diameter, cord_count, additional_thickness=3, cord_distance=5){
    difference(){
        union(){
            for(i = [-1:cord_count+1]){    
                translate([0,i*(cord_diameter+cord_distance*2),0]) difference(){          
                   cube([cord_diameter+additional_thickness, cord_diameter+cord_distance*2, 10]);        
                   translate([cord_diameter/2,cord_diameter/2+cord_distance,-0.1]) cylinder(r=cord_diameter/2,h=20);
                   translate([-cord_diameter/2,cord_distance,-0.1])    cube([cord_diameter,cord_diameter,20]);
                   translate([cord_diameter+additional_thickness+0.1,0,5]) rotate([0,-90,0]) screw(); 
                   translate([cord_diameter+additional_thickness+0.1,cord_diameter+cord_distance*2,5]) rotate([0,-90,0]) screw(); 
                
                
                }
            
            }
        }
    
   translate([-0.1,-cord_diameter-cord_distance*3,-0.1]) cube([cord_diameter+additional_thickness+0.2, cord_diameter+cord_distance*2, 10.2]);   
   translate([-0.1,(cord_diameter+cord_distance*2)*(cord_count+1)+cord_distance,-0.1]) cube([cord_diameter+additional_thickness+0.2, cord_diameter+cord_distance*2, 10.2]);   
   
    }
}

//screw();
rotate([0,-90,0]) cord_guide(10,4);
