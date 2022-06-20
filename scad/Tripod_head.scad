

include <./utilits.scad>;

cm          =   10;
mm          =   0.01 * cm;
radious     =   5   * cm;
height      =   8   * cm;
ulcfside    =   3   * cm;
ulcsside    =   1.5 * cm;


module loadcell_base_screw() {
    hole_through(name="M1", l=2*cm, cld=1, h=1, hcld=1);
}

module TripodHead_screw() {
    hole_through(name="M1", l=3*cm, cld=0.1, h=1, hcld=0.1);
}

module TripodHead() {
    translate([0.5*ulcfside, 0 , 0] ){
        difference(){
            cube([mm, ulcsside ,cm], center=true);
            translate([0,0,-cm/2 - 3*mm]){
                rotate(90, [0,1,0]){
                    translate([-20*mm,0,cm]){
                        TripodHead_screw();
                    }
                }
            }
        }
    }
    translate([-0.5*ulcfside, 0 , 0] ){
        difference(){
            cube([mm, ulcsside ,cm], center=true);
            translate([0,0,-cm/2 - 3*mm]){
                rotate(90, [0,1,0]){
                    translate([-20*mm,0,cm]){
                        TripodHead_screw();
                    }
                }
            }
        }
    }
    translate([0, 0.5*ulcsside , 0] ){
        cube([ulcfside, mm ,cm], center=true);
    }
    translate([0, -0.5*ulcsside , 0] ){
        cube([ulcfside, mm ,cm], center=true);
    }

    difference() {
        cube([ulcfside, ulcsside ,mm], center = true);
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
