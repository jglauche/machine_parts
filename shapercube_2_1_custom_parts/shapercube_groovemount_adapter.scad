
file="shapercube_groovemount_adapter.dxf";
union(){
	linear_extrude(file=file,layer="0",height=4.6);
	
	translate(v=[0,0,4.6]) linear_extrude(file=file,layer="1",height=4.7);
	

}
