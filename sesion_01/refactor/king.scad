include <constants.scad>

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
color = "white";
king(color);