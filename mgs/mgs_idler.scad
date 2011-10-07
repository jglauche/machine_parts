// (c) 2011 by Joachim Glauche
// License: GPLv3


include <shapes.scad>

bolt_dia=4.7;
bot_hex=7.5;
distance=32.6;
distance2=12;
length=50;

bearing_dia=23;
bearing_height=8.2;
bearing_shaft_dia=8.4;



rotate(a=180,v=[1,0,0]){
difference(){

cube(size=[length,24, 12]);

translate(v=[(length-distance)/2 ,6,0]) cylinder(r=bolt_dia/2,h=30);	
translate(v=[(length-distance)/2,6,2]) hexagon(bot_hex,12);	

translate(v=[(length-distance)/2+distance,6,0]) cylinder(r=bolt_dia/2,h=30);	
translate(v=[(length-distance)/2+distance,6,2]) hexagon(bot_hex,12);	

translate(v=[0,12,0]){
translate(v=[(length-distance)/2 ,6,0]) cylinder(r=bolt_dia/2,h=30);	
translate(v=[(length-distance)/2,6,2]) hexagon(bot_hex,12);	

translate(v=[(length-distance)/2+distance,6,0]) cylinder(r=bolt_dia/2,h=30);	
translate(v=[(length-distance)/2+distance,6,2]) hexagon(bot_hex,12);	

}



#rotate(a=90,v=[1,0,0])  translate(v=[length/2,10,-12-bearing_height/2]) cylinder(r=bearing_dia/2, h=bearing_height);
#rotate(a=90,v=[1,0,0])  translate(v=[length/2, 10,-23]) cylinder(r=bearing_shaft_dia/2, h=21);


}
}