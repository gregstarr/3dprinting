module Bed(height=8, thickness=10, rod_separation=100, rod_radius=2, screw_radius=1.6,
            gap=15, fit_factor=1.15) {
                
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
                    cylinder(r=fit_factor*rod_radius, h=thickness+2);
        }
    }
    
    
    translate([(rod_separation+thickness)/2, (rod_separation+thickness)/2, 
                gap+height/2]){
    
        // bed with holes
        difference() {
            cube([rod_separation+thickness, rod_separation+thickness, 
                height], center=true);
            for(x = [-(rod_separation+thickness)/3, (rod_separation+thickness)/3]) {
                for(y = [-(rod_separation+thickness)/3, (rod_separation+thickness)/3]) {
                    translate([x, y, 0]) cylinder(r=screw_radius, h=height+2, 
                        center=true);
                }
            }
            #translate([5,5,height/2-3]) cylinder(r=3, h=4);
            #translate([-5,5,height/2-3]) cylinder(r=3, h=4);
            translate([5,5,-1-height/2]) cylinder(r=screw_radius, h=height+2);
            translate([-5,5,-1-height/2]) cylinder(r=screw_radius, h=height+2);
        }
        
        // place rod grabbers
        for(x = [-(rod_separation+thickness)/2, (rod_separation-thickness)/2]) {
            for(y = [-(rod_separation+thickness)/2, (rod_separation-thickness)/2]) {
                translate([x, y, -height/2]) Foot();
            }
        }
    
    }
}

Bed($fa=.5, $fs=.5);