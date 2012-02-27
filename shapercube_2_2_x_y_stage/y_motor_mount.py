
bolt_distance = 18 #check me
bolt_dia = 4.2
rod_size=8
bolt_margin = 4

motor_size=17 # use nema 17 profile

if motor_size == 17:
	motor_total_size = 42
	motor_hole_dia = 3
	motor_hole_distance = 31
	motor_cutout=23

def motor_mount(size, hole_distance, hole_dia, center_cutout, thickness):
	res = Box(size, size, thickness)
	# center hole
	res-= Cylinder(d=center_cutout, h=thickness).translate(size/2,size/2)
	# mounting holes
	res-= Cylinder(d=hole_dia, h=thickness).translate((size-hole_distance)/2,(size-hole_distance)/2)
	res-= Cylinder(d=hole_dia, h=thickness).translate((size+hole_distance)/2,(size-hole_distance)/2)
	res-= Cylinder(d=hole_dia, h=thickness).translate((size-hole_distance)/2,(size+hole_distance)/2)
	res-= Cylinder(d=hole_dia, h=thickness).translate((size+hole_distance)/2,(size+hole_distance)/2)
	
	return res
	

# TODO: rod mount
def base_mount(height = 5):
	x = bolt_distance+bolt_margin
	y = bolt_dia+2*bolt_margin
	
	res=Box(x, y ,height)
	res-=Cylinder(d=bolt_dia, h=height).translate(bolt_margin,y/2,0)
	res-=Cylinder(d=bolt_dia, h=height).translate(bolt_distance,y/2,0)
	return res


def y_motor_mount1():	
	res=base_mount()
	res+=motor_mount(42,31,3+0.5,22+2,6).rotate((0,1,0),90).translate(12,-42,0)
	return res
	
result = y_motor_mount1()