

include <./utilits.scad>;




module loadcell_base_screw() {
    // hole_through(name="M1", l=2*cm, cld=1, h=1, hcld=1);
    screw(M4_hex_screw, 25);

}

module TripodHead_screw() {
    // hole_through(name="M1", l=6*cm, cld=1, h=1, hcld=1);
    // $fn=60;
    // hole_through(name="M1", l=20*cm, cld=1, h=1, hcld=1);
    screw(M4_hex_screw, 4);
    //  screw("M1.6x2.5");
}

module TripodHead_stl()
stl("TripodHead") {
    translate([0.5*ulcfsideHead, 0 , 0] ){
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
    translate([-0.5*ulcfsideHead, 0 , 0] ){
        difference(){
            cube([mm, ulcssideHead ,cm], center=true);
            translate([0,0,-cm/2 + 3*mm]){
                rotate(90, [0,1,0]){
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
