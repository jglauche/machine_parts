$fn=64;


// taken from Prusa 3 repository
module screw(h=20, r=2, r_head=3.5, head_drop=0, slant=true, poly=false, $fn=64){
    //makes screw with head
    //for substraction as screw hole
    if (poly) {
        cylinder_poly(h=h, r=r, $fn=$fn);
    } else {
        cylinder(h=h, r=r, $fn=$fn);
    }
    if (slant) {
        translate([0, 0, head_drop-0.01]) cylinder(h=r_head, r2=0, r1=r_head, $fn=$fn);
    }

    if (head_drop > 0) {
        translate([0, 0, -0.01]) cylinder(h=head_drop+0.01, r=r_head, $fn=$fn);
    }
}


module angle(x,y,thickness, side_thickness){
    difference(){
        
        union(){
            cube([x,y,thickness]);
            translate([0,0,0]) rotate([90,0,0]) cube([x,y,thickness]);
            
            hull(){
                translate([0,y-side_thickness,0]) cube([side_thickness,side_thickness,thickness]);
                translate([0,-side_thickness,0]) cube([side_thickness,side_thickness,y]);            
            }
            hull(){
                translate([x-side_thickness,y-side_thickness,0]) cube([side_thickness,side_thickness,thickness]);
                translate([x-side_thickness,-side_thickness,0]) cube([side_thickness,side_thickness,y]);            
            }
        
        }    
        for(f=[0:y/20]){ 
            for(i=[0:x/20]){ 
                translate([10+20*i,5+15*f,thickness]) rotate([0,180,0]) screw();
                translate([10+15*i,0,10+10*f]) rotate([90,0,0]) screw();
            }       
        }
      //  translate([-0.1,10,13.5]) rotate([0,90,0]) cylinder(r=2.7,h=6);

    }

}
angle(20,25,6,2);

