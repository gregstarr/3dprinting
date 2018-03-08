module Bed(height=8, thickness=10, rod_separation=60, rod_radius=2, screw_radius=1.6,
            gap=15, fit_factor=1.15, top_thickness=8, hole_radius=15) {
                
    // Foot Module
    module Foot(gap=15, thickness=10, fit_factor=1.15, rod_radius=2) {
        translate([thickness/2, thickness/2, -gap/2])
        difference() {
            union() {
                cube([thickness, thickness, gap], center=true);
                translate([-thickness/2, 0, -gap/2]) rotate([0, 90, 0]) 
                    cylinder(r=thickness/2, h=thickness);
            }
            translate([-thickness/2-1, 0, -gap/2]) rotate([0, 90, 0]) 
                    cylinder(r=fit_factor*rod_radius, h=thickness+2);
        }
    }
    
    
    translate([(rod_separation+thickness)/2, (rod_separation+thickness)/2, 
                gap+height/2]){
    
        // bed with holes
        difference() {
            cube([rod_separation+thickness, rod_separation+thickness, 
                height], center=true);
            translate([5,13,height/2-3]) cylinder(r=3, h=4);
            translate([-5,13,height/2-3]) cylinder(r=3, h=4);
            translate([5,13,-1-height/2]) cylinder(r=screw_radius, h=height+2);
            translate([-5,13,-1-height/2]) cylinder(r=screw_radius, h=height+2);
            translate([0,-rod_separation/2+hole_radius+4,-height/2-1])
                cylinder(r=hole_radius, h=height+4);
        }
        
        // place rod grabbers
        for(x = [-(rod_separation+thickness)/2, (rod_separation-thickness)/2]) {
            for(y = [-(rod_separation+thickness)/2, (rod_separation-thickness)/2]) {
                translate([x, y, -height/2]) Foot();
            }
        }
        
        translate([-top_thickness/2-rod_separation/4,thickness/2+rod_separation/2,height/2])
            rotate([180,0,0]) Foot(gap=4, rod_radius=1.5, thickness=top_thickness);
        translate([rod_separation/4-top_thickness/2,thickness/2+rod_separation/2,height/2])
            rotate([180,0,0]) Foot(gap=4, rod_radius=1.5, thickness=top_thickness);
    
    }
}

Bed($fa=.5, $fs=.5);
%translate([24,66,27]) rotate([0,90,0]) cylinder(r=1.5,h=22, $fn=10);