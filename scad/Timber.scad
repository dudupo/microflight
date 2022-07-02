


include <./utilits.scad>;


use  <threadlib/threadlib.scad>;

module drill_thread() {
    bolt("UNC-#4", turns=5, higbee_arc=40);
}

use <NopSCADlib/lib.scad>; 


module arm() {

    rotate(80, [1,0,0]) {
        cube( [width, sidelength, length ]  ,center=true);
    }

    translate([0, -length/2 -cm, cos(teta)*0.5*length  ]) {
        difference() {
            rotate(90, [1,0,0]) {
                cube( [width, sidelength, 3*length/4 ]  ,center=true);
            }
            for( i=[0:4]){
                translate([0,-i*cm]) {
                   drill_thread();
                }
            }
        }
    }
}

module Timber_stl() stl("Timber") {
    rotation_sym(1*cm, 3, 0, 1)  translate( [0, -length/2 + cm, 0 ] ) arm();
}



// translate([0, cm , 0]) { 
// rotate(-90, [1,0,0]){   
//     import("../ULC.stl", convexity=3);
// }
// }
// translate ([0,0,5*cm]) {
// // Timber_stl();
//     bolt("UNC-#4", turns=5, higbee_arc=40);
//     translate([0, 0, -10*cm]){
//         // bolt("UNC-4", turns=50, higbee_arc=40);
//         bolt("UNF-1/4", turns = 5, higbee_arc=40);

//     }
// }