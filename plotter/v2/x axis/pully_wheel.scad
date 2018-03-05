$fs=.5;
$fa=.5;

use <stepper_motor_wheel.scad>

module PullyWheel(fit_factor=1.05) {
    difference() {
        wheel(r=10, height=5);
        translate([0,0,-1]) cylinder(h=7, r=fit_factor*5.5);
    }
}

PullyWheel($fs=.5, $fa=.5);