


include <./utilits.scad>;

module arm() {

    rotate(80, [1,0,0]) {
        cube( [width, sidelength, length ]  ,center=true);
    }

    translate([0, -length/2 -cm, cos(teta)*0.5*length  ]) {
        difference() {
            rotate(90, [1,0,0]) {
                cube( [width, sidelength, 3*length/4 ]  ,center=true);
            }
            for( i=[0:3]){
                translate([0,-i*cm,1*cm]) {
                    screw(M2_cap_screw, 25);
                    // hole_through(name="M2", l= 2*cm, cld= 0.5, h= 10 , hcld=0.5);
                }
            }
        }
    }
}

module Timber_stl() stl("Timber") {
    rotation_sym(1*cm, 3, 0, 1)  translate( [0, -length/2 + cm, 0 ] ) arm();
}

// Timber();