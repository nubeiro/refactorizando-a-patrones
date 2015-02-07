use <king.scad>
$fn = 100;


module queen(col) {
	color(col)union() {
		// Head
		translate([0,0,122])
			intersection() {
				sphere(20);
				translate([0,0,57])
					cube(100,true);
			}
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
