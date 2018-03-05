$fa = .5;
$fs = .5;

module shaft(height=10) {
    difference() {
        difference() {
            cylinder(r=2.5, h=height);
            translate([1.5,-height/2,-1]) cube([height,height,height+2]);
        }
        translate([-height-1.5,-height/2,-1]) cube([height,height,height+2]);
    }
}

module wheel(radius=10, height=5) {
    difference() {       
        cylinder(r=radius, h=height);
        translate([0,0,height/2]) 
        scale([1,1,5/3]) rotate_extrude() {
            translate([radius,0]) circle(r=.4*height);
        }
    }
}

module StepperMotorWheel(fit_factor=1.05) {
    difference(){
        wheel();
        translate([0,0,-1]) scale(fit_factor*[1,1,1]) shaft(height=12);
    }
}

StepperMotorWheel($fs=.5, $fa=.5);