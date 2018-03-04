$fs=.5;
$fa=.5;

use <stepper_motor_wheel.scad>

module PullyWheel() {
    difference() {
        wheel(r=10, height=5);
        translate([0,0,-1]) cylinder(h=7, r=5.5);
    }
}

PullyWheel($fs=.5, $fa=.5);