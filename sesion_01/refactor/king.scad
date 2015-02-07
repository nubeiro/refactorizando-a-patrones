module head() {
	DO_CENTER = true;

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
		intersection() {
			sphere(DOME_HEIGHT);
			translate(DOME_INTERSECTION_POSITION)
				cube(DOME_INTERSECTION_CUBE_SIZE, DO_CENTER);
		}
	translate(VERTICAL_BEAM_POSITION)
		cube(VERTICAL_BEAM_DIMENSIONS, DO_CENTER);
	translate(HORIZONTAL_BEAM_POSITION)
		cube(HORIZONTAL_BEAM_DIMENSIONS, DO_CENTER);
}

module body() {
	cylinder(120,18,12);
}

module base() {
	intersection() {
		sphere(30);
		translate([0,0,50])
			cube(100,true);
	}
}

module collar() {
  	translate([0, 0, 110])
		intersection() {
      	cylinder(20,20,0);
     	 	translate([0, 0, 7])
        		mirror([0, 0, 1])
          		cylinder(20,20,0);
    	}
}

module king(color) {	
	rotate(90)
		color(color) 
			union() {
				head();
				body();
				base();
				collar();
			}
}
color = "white";
king(color);