$fa=.5;
$fs=.5;

use <bed.scad>
use <motor_and_rod_mount.scad>
use <pully_and_rod_mount.scad>
use <stepper_motor_wheel.scad>
use <pully_wheel.scad>

MotorAndRodMount();
translate([0, 288, 0]) PullyAndRodMount();

translate([6, 0, 26]) rotate([-90,0,0]) color([.1,.1,.1]) cylinder(r=2, h=300);
translate([106, 0, 26]) rotate([-90,0,0]) color([.1,.1,.1]) cylinder(r=2, h=300);

%translate([111, 80, 26]) rotate([0, 0, 90]) Bed();

color([.3,.6,.8]) translate([48, -5, 36]) StepperMotorWheel();
color([.3,.6,.8]) translate([48, 295, 36]) PullyWheel();