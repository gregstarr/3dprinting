use <motor_and_rod_mount.scad>

module PullyAndRodMount(fit_factor=1.05) {
    Structure();
    translate([48, 5, 32]) cylinder(r=4, h=4);
    translate([48, 5, 36]) cylinder(r=2.5/fit_factor, h=4);
}

PullyAndRodMount($fs=.5, $fa=.5);