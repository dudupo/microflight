

include <./utilits.scad>;


use <threadlib/threadlib.scad>;
module loadcell_base_screw() {
    bolt("UNF-1/4", turns = 5, higbee_arc=40);
}

module TripodHead_screw() {
    bolt("UNF-1/4", turns = 5, higbee_arc=40);
}
use <NopSCADlib/lib.scad>; 

module TripodHead_stl()
stl("TripodHead") {
    translate([0.5*ulcfsideHead, 0 , 0] ){
        // difference(){
            cube([mm, ulcssideHead ,cm], center=true);
            translate([0,0,-cm/2 + 3*mm]){
                rotate(-90, [0,1,0]){
                    // translate([0,0,cm]){
                        TripodHead_screw();
                    // }
                }
            }
        // }
    }
    translate([-0.5*ulcfsideHead, 0 , 0] ){
        difference(){
            cube([mm, ulcssideHead ,cm], center=true);
            translate([0,0,-cm/2 + 3*mm]){
                rotate(-90, [0,1,0]){
                    // translate([0,0,cm]){
                        TripodHead_screw();
                    // }
                }
            }
        }
    }
    translate([0, 0.5*ulcssideHead , 0] ){
        cube([ulcfsideHead, mm ,cm], center=true);
    }
    translate([0, -0.5*ulcssideHead , 0] ){
        cube([ulcfsideHead, mm ,cm], center=true);
    }

    difference() {
        cube([ulcfsideHead, ulcssideHead ,mm], center = true);
        translate([0,0,mm]){
           loadcell_base_screw();
        }
    }
    // Todo:    (1) add hole in the center - which will 
    //          connect into the load cell 
    //          (2) add holes in the wals, which will connnected
    //          to the adapters (tripods).

}
// TripodHead();
