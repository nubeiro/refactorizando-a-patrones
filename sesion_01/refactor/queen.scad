include <constants.scad>
use <dome.scad>

module queen_head () {
	HEAD_SIZE = 20;
	HEAD_POSITION = [0,0,57];
	HEAD_CUBE_SIZE = 100; 
	translate([0,0,122])
		dome(HEAD_SIZE, HEAD_POSITION, HEAD_CUBE_SIZE, DO_CENTER);
	translate([0,0,120])
		difference() {
			difference() {
				cylinder(20,12,30);
				translate([0,0,8])
					cylinder(20,12,30);
			}
			for (i=[1:3])
				translate([0,0,35])
					rotate(i*360/3)
						cube([100,8,50],true);
		}
		translate([0,0,145])
			sphere(5);
}

module queen(color) {
	color(color) union() {
		queen_head();
			// Body
  			cylinder(120,18,12);
			// Base
  			intersection() {
				sphere(30);
				translate([0,0,50])
					cube(100,true);				
			}
			// Collar
  			translate([0, 0, 110])
    			intersection() {
      			cylinder(20,20,0);
     	 			translate([0, 0, 7])
        				mirror([0, 0, 1])
          				cylinder(20,20,0);
    			}
			}
		}

queen("white");