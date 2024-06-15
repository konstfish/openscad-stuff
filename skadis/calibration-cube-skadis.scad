cube_size = 20.1;
wall_thickness = 2;
depth = 15;
grid_size = 4;

total_width = grid_size * cube_size + (grid_size + 1) * wall_thickness;
total_height = total_width;

// pegboard
length = 34.8;
width = 4.5;
height = 4.4;
cube_side = 4.4;
cube_distance_center = 8;
cube_gap = 16;


peg_1 = (total_width - 34.7) / 2;
peg_2 = peg_1 + 34.7 + width;

module hook_shape() {
    translate([-length/2, -width/2, 0])
        cube([length, width, height]);

    translate([cube_distance_center - cube_side/2, width/2, 0])
        cube([cube_side, cube_side, cube_side]);

    translate([-cube_distance_center - cube_side/2, width/2, 0])
        cube([cube_side, cube_side, cube_side]);
}

module base_panel_with_bottom() {
    difference() {
        cube([total_width, total_height, depth + wall_thickness + 9.5]);

        for (x = [0 : grid_size - 1]) {
            for (y = [0 : grid_size - 1]) {
                translate([x * (cube_size + wall_thickness) + wall_thickness, 
                           y * (cube_size + wall_thickness) + wall_thickness, 
                           wall_thickness + 9.5])
                    cube([cube_size, cube_size, depth]);
            }
        }
    }
}

module main() {
    difference() {
        base_panel_with_bottom();
        
        translate([total_width/3.5, peg_1, 2.25])
        rotate([90, 0, 0])
          hook_shape();
        
        translate([total_width/3.5, peg_2, 2.25])
        rotate([90, 0, 0])
          hook_shape();
    }
}

main();