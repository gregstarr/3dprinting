$fa=.5;
$fs=.5;

difference() {
    union() {
        cube([22,33,40]);
        translate([0,0,3.5]) rotate([0,90,0]) cylinder(r=3.5, h=22);
    }
    translate([-1,-5,7]) cube([24,33,40]);
    translate([11, 36, -1]) cylinder(r=6, h=42);
    translate([-1,0,3.5]) rotate([0,90,0]) cylinder(r=1.6, h=24);
}