DO_CENTER = true;
RIGHT = 90;
GRANULARITY = 100;

use <queen.scad>

$fn = GRANULARITY;

module dome(radius, position, size, center) {
	intersection() {
		sphere(radius);
		translate(position)
			cube(size, center);
	}
}

module head() {
	CONE_POSITION = [0, 0, 120];	
	CONE_HEIGHT = 20;
	CONE_LOWER_RADIUS = 12;
	CONE_UPPER_RADIUS = 20;
	
	DOME_POSITION = CONE_POSITION + [0, 0, CONE_HEIGHT];
	DOME_HEIGHT = 20;
	DOME_INTERSECTION_POSITION = [0, 0, 50];
	DOME_INTERSECTION_CUBE_SIZE = 100;
	
	CROSS_HEIGHT = 28;
	VERTICAL_BEAM_POSITION = DOME_POSITION + [0, 0, CROSS_HEIGHT];
	BEAM_THICKNESS = 4;
	VERTICAL_BEAM_LENGTH = 20;
	VERTICAL_BEAM_DIMENSIONS = [BEAM_THICKNESS, BEAM_THICKNESS, VERTICAL_BEAM_LENGTH];
	
	HORIZONTAL_BEAM_HEIGHT = 30;
	HORIZONTAL_BEAM_POSITION = DOME_POSITION + [0, 0, HORIZONTAL_BEAM_HEIGHT];
	HORIZONTAL_BEAM_WIDTH = 16;
	HORIZONTAL_BEAM_DIMENSIONS = [BEAM_THICKNESS, HORIZONTAL_BEAM_WIDTH, BEAM_THICKNESS];

	translate(CONE_POSITION)
		cylinder(
			CONE_HEIGHT, 
			CONE_LOWER_RADIUS, 
			CONE_UPPER_RADIUS
		);
	translate(DOME_POSITION)
		dome(DOME_HEIGHT, DOME_INTERSECTION_POSITION, DOME_INTERSECTION_CUBE_SIZE, DO_CENTER);
	translate(VERTICAL_BEAM_POSITION)
		cube(VERTICAL_BEAM_DIMENSIONS, DO_CENTER);
	translate(HORIZONTAL_BEAM_POSITION)
		cube(HORIZONTAL_BEAM_DIMENSIONS, DO_CENTER);
}

module body() {
	HEIGHT = 120;
	LOWER_RADIUS = 18;
	HIGHER_RADIUS = 12;
	cylinder(HEIGHT, LOWER_RADIUS, HIGHER_RADIUS);
}

module base() {
	RADIUS = 30;
	POSITION = [0, 0, 50];
	SIZE = 100;
	dome(RADIUS, POSITION, SIZE, DO_CENTER);
}

module collar() {
	POSITION = [0, 0, 110];
	HEIGHT = 20;
	LOWER_RADIUS = 20;
	UPPER_RADIUS = 0;
	MIRRORED_POSITION = [0, 0, 7];
	MIRROR_PLANE = [0, 0, 1];

  	translate(POSITION)
		intersection() {
      	cylinder(HEIGHT, LOWER_RADIUS, UPPER_RADIUS);
     	 	translate(MIRRORED_POSITION)
        		mirror(MIRROR_PLANE)
          		cylinder(HEIGHT, LOWER_RADIUS, UPPER_RADIUS);
    	}
}

module king(color) {	
	rotate(RIGHT)
		color(color) 
			union() {
				base();
				body();
				collar();
				head();
			}
}
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

module rook(col) {
	color(col)union() {
		// Top
		translate([0,0,120])
			difference() {
				union() {
					cylinder(25,40,40);
					translate([0,0,-10])
						cylinder(10,30,40);
				}
				union() {
					translate([0,0,1])
						cylinder(30,30,30);
					for (i=[1:3])
						translate([0,0,35])
							rotate(i*360/3)
								cube([100,15,50],true);
				}
			}
			// Body
			cylinder(120,30,30);
			// Base
			intersection() {
				sphere(40);
				translate([0,0,50])
					cube(100,true);
			}
			// Collar
			translate([0,0,95])
				intersection() {
					cylinder(30,40,0);
					translate([0,0,7])
						mirror([0,0,1])
							cylinder(30,40,0);
				}
			}
		}

module bishop(col) {
	color(col)union() {
		// Top
  		translate([0, 0, 120])
			difference() {
   	   			union() {
   	     			sphere(r = 20);
   	     				translate([0, 0, 10])
   	       				cylinder(h = 30, r1 = 20 * cos(30), r2 = 0);

   	     				translate([0, 0, 40])
   	       				sphere(r = 6);
   	   				}
   	   			rotate([45, 0, 0])
   	     			translate([-20, 0, 0])
   	       			cube([40, 5, 40]);
   	 	}
	// Body
  	cylinder(120,18,12);

	// Base
  	intersection(){
		sphere(30);
		translate([0,0,50])
			cube(100,true);
				}
	
	// Collar
  	translate([0, 0, 90])
    	intersection() {
      		cylinder(20,20,0);
      	translate([0, 0, 7])
        	mirror([0, 0, 1])
          	cylinder(20,20,0);
    	}
	}
}

module knight(col){
	rotate(90)
	color(col)union(){
		// Head
		
		translate([0,0,70])
			difference(){
				intersection(){
					sphere(75/2);
					cube([75,30,75],true);
					}
				translate([-15,0,-10])
					rotate([0,-45,0])
						cube([50,50,15],true);
				}

		// Body
		translate([0,0,20])
			cube([30,30,40],true);

		// Base
  		intersection(){
			sphere(30);
			translate([0,0,50])
				cube(100,true);
					}
	}
}

module pawn(col){
	color(col)union(){
		//Top
		translate([0,0,95])
			sphere(20);
		// Body
  		cylinder(80,18,12);
		translate([0,0,78])
			cylinder(4,25,25);
		
		// Base
  		intersection(){
			sphere(30);
			translate([0,0,50])
				cube(100,true);
					}
	}
}

// Section 1 - All pieces, in proper configuration

/*
// White Side
for(i=[-4:3])
	translate([100*i,-100,0])
		rotate(180)
			pawn("white");
translate([0,-200,0])
	rotate(180)
		king("white");
translate([-100,-200,0])
	rotate(180)
		queen("white");
translate([-400,-200,0])
	rotate(180)
		rook("white");
translate([300,-200,0])
	rotate(180)
		rook("white");
translate([-300,-200,0])
	rotate(180)
		knight("white");
translate([200,-200,0])
	rotate(180)
		knight("white");
translate([-200,-200,0])
	rotate(180)
		bishop("white");
translate([100,-200,0])
	rotate(180)
		bishop("white");

// Black Side
for(i=[-4:3])
	translate([100*i,100,0])
		pawn("black");
translate([-100,200,0])
	king("black");
translate([0,200,0])
	queen("black");
translate([-400,200,0])
	rook("black");
translate([300,200,0])
	rook("black");
translate([-300,200,0])
	knight("black");
translate([200,200,0])
	knight("black");
translate([-200,200,0])
	bishop("black");
translate([100,200,0])
	bishop("black");
*/

//Section 2 - One of each piece


translate([100,100,0])
	rook("white");
translate([100,0,0])
	bishop("white");
translate([-100,100,0])
	pawn("white");
translate([-100,0,0])
	queen("white");
translate([-100,-100,0])
	king("white");
translate([100,-100,0])
	knight("white");
