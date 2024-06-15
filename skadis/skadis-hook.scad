length = 34.8; // Length of the rectangle
width = 4.5; // Width of the rectangle
height = 4.2; // Height of the rectangle

// Parameters for the cubes
cube_side = 4.4; // Side length of each cube
cube_distance_center = 8; // Distance from the center of the rectangle to the center of each cube
cube_gap = 16; // Distance between the centers of the two cubes

// Create the base rectangle
translate([-length/2, -width/2, 0])
    cube([length, width, height]);

// Create the first cube
translate([cube_distance_center - cube_side/2, width/2, 0])
    cube([cube_side, cube_side, height]);

// Create the second cube
translate([-cube_distance_center - cube_side/2, width/2, 0])
    cube([cube_side, cube_side, height]);
    
translate([13, -10, 0])
    cube([cube_side, 10, height]);
  
translate([-17.4, -13, 0])
    cube([cube_side, 11, height]);

translate([-13, -13, 0])
    cube([6, cube_side, height]);