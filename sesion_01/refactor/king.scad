module head() {
	translate([0,0,120])
		cylinder(20,12,20);
	translate([0,0,140])
		intersection() {
			sphere(20);
			translate([0,0,50])
				cube(100,true);
		}
		translate([0,0,168])
			cube([4,4,20],true);
		translate([0,0,170])
			cube([4,16,4],true);
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