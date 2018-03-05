use <motor_and_rod_mount.scad>

module PullyAndRodMount(fit_factor=1.05) {
    Structure();
    translate([36, 5, 62]) cylinder(r=4, h=4);
    translate([36, 5, 64]) cylinder(r=2.5/fit_factor, h=4);
}

PullyAndRodMount($fs=.5, $fa=.5);