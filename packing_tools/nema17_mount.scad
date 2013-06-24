

module motor_mount(
size = 42.5,
size_grid_cut = 32,
size_z_cut = 36,
height=40,
wall_thickness=3.0,
bottom_thickness=3.3){

difference(){
    cube([size+wall_thickness*2,size+wall_thickness*2,height], center=true);
    
    translate([0,0,bottom_thickness]){
        cube([size,size,height], center=true);
        cube([size_grid_cut*2,size_grid_cut,height], center=true);   
        cube([size_grid_cut,size_grid_cut*2,height], center=true);   
    
    
    }
    translate([0,0,-1]) cube([size_z_cut,size_z_cut,height], center=true); 
        
}
}

union(){
    motor_mount();
    translate([45,0,0]) motor_mount();
    translate([45*2,0,0]) motor_mount();
    translate([0,45,0]) motor_mount();
    translate([45,45,0]) motor_mount();
    

}
