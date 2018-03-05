$fa=1;
$fs=1.5;

module StringGrabber(length = 25, bolt_radius=3.2, screw_radius=1.6) {
    difference() {
        cube([length, 10, 10]);
        translate([length/5,2,5]) rotate([90,0,0]) 
            cylinder(r=bolt_radius, h=3, $fn=6);
        translate([3*length/5,2,5]) rotate([90,0,0]) 
            cylinder(r=bolt_radius, h=3, $fn=6);
        translate([2*length/5,5,-1]) cylinder(r=bolt_radius, h=3, $fn=6);
        translate([4*length/5,5,-1]) cylinder(r=bolt_radius, h=3, $fn=6);
        translate([length/5,11,5]) rotate([90,0,0]) cylinder(r=screw_radius, h=12);
        translate([3*length/5,11,5]) rotate([90,0,0]) cylinder(r=screw_radius, h=12);
        translate([2*length/5,5,-1]) cylinder(r=screw_radius, h=12);
        translate([4*length/5,5,-1]) cylinder(r=screw_radius, h=12);
    }
}

StringGrabber($fa=.5, $fs=.5);