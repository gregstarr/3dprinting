module MotorMount(border_width=2, height=10, fit_factor=1.025) {
    // Motor Specifications
    motor_diameter=28;
    motor_height=20;
    hole_position=17.5;
    hole_radius=2;
    bracket_width=7;
    // Mount Definition
    translate([0,bracket_width/2,0])
    difference() {
        translate([-(hole_position+hole_radius+border_width),
            -hole_radius-border_width,0]) 
            cube([2*(hole_position+hole_radius+border_width),
                motor_diameter/2+bracket_width/2+border_width,height]);
        translate([0,0,-1]) cylinder(r=fit_factor*motor_diameter/2, h=motor_height);
        translate([hole_position, 0, -1]) cylinder(r=hole_radius, h=height+2);
        translate([-hole_position, 0, -1]) cylinder(r=hole_radius, h=height+2);
    }
}

module Structure(rod_separation=100, rod_radius=2,thickness=12, fit_factor=1.05) {
    motor_height=20;
    // foot pads module
    module FootPad(h=4) {
        difference() {
            translate([0,-thickness,0]) cube([thickness, 3*thickness, h]);
            translate([thickness/2, -thickness/2, -1]) 
                cylinder(r=thickness/4, h=h+2);
            translate([thickness/2, 3*thickness/2, -1]) 
                cylinder(r=thickness/4, h=h+2);
        }
    }
    
    // main structure
    difference() {
        cube([rod_separation+thickness, thickness, motor_height+thickness]);
        
        // under gap
        translate([thickness,-1,-1])
        cube([rod_separation-thickness,thickness+2, motor_height+1]);
        
        // rod holes
        translate([thickness/2, -1, motor_height+thickness/2]) 
        rotate([-90,0,0]) cylinder(r=fit_factor*rod_radius, h=thickness+2);
        translate([thickness/2+rod_separation, -1, motor_height+thickness/2]) 
        rotate([-90,0,0]) cylinder(r=fit_factor*rod_radius, h=thickness+2);
    }
    
    FootPad();
    translate([rod_separation, 0, 0]) FootPad();
}

module MotorAndRodMount() {
    Structure();
    translate([48, -19, 20]) MotorMount(height=12);
}

MotorAndRodMount($fs=.5, $fa=.5);