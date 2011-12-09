
union(){
linear_extrude("adapter.dxf", height=5, layer="0");

translate(v=[0,0,5]) linear_extrude("adapter.dxf", height=5, layer="1");

}