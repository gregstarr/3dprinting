module Bed(height=5, thickness=10, rod_separation=100, rod_radius=2, screw_radius=2,
            gap=15) {
                
    // Foot Module
    module Foot() {
        translate([thickness/2, thickness/2, -gap/2])
        difference() {
            union() {
                cube([thickness, thickness, gap], center=true);
                translate([-thickness/2, 0, -gap/2]) rotate([0, 90, 0]) 
                    cylinder(r=thickness/2, h=thickness);
            }
            translate([-thickness/2-1, 0, -gap/2]) rotate([0, 90, 0]) 
                    cylinder(r=1.05*rod_radius, h=thickness+2);
        }
    }
    
    
    translate([(rod_separation+thickness)/2, (rod_separation+thickness)/2, 
                gap+height/2]){
    
    // bed with holes
    difference() {
        cube([rod_separation+thickness, rod_separation+thickness, 
            height], center=true);
        for(x = [-(rod_separation+thickness)/4, (rod_separation+thickness)/4]) {
            for(y = [-(rod_separation+thickness)/4, (rod_separation+thickness)/4]) {
                translate([x, y, 0]) cylinder(r=screw_radius, h=height+2, 
                    center=true);
            }
        }
    }
    
    // place rod grabbers
    for(x = [-(rod_separation+thickness)/2, (rod_separation-thickness)/2]) {
        for(y = [-(rod_separation+thickness)/2, (rod_separation-thickness)/2]) {
            translate([x, y, -height/2]) Foot();
        }
    }
    
    //place string grabber
    difference() {
        translate([0, -thickness/4, -(height+thickness)/2]) 
            cube([thickness, thickness/2, thickness], center=true);
        translate([0,-1,-gap-height/2+10.5]) rotate([90, 0, 0])
            cylinder(r=2, h=thickness, center=true);
    }
    
}
}

Bed($fa=.5, $fs=.5);