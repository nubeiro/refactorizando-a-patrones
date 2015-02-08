module dome(radius, position, size, center) {
	intersection() {
		sphere(radius);
		translate(position)
			cube(size, center);
	}
}
