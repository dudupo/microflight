include <./utilits.scad>;
include <./Tripod_head.scad>
include <./Timber.scad>

cm          =   10;
mm          =   0.01 * cm;
radious     =   5   * cm;
height      =   8   * cm;
ulcfside    =   3   * cm;
ulcsside    =   1.5 * cm;

// Todo, find the exactly distance 

module Tripod(){
    difference(){
        cube([ulcfside,ulcsside,height ], center=true);
        translate([ulcfside/2-mm,0,height/2 - cm/2 + 20*mm]){
            rotate(90, [0,1,0]){
                TripodHead_screw();
            }
        }
        translate([-ulcfside/2+mm,0,height/2 - cm/2 + 20*mm]){
            rotate(-90, [0,1,0]){
                TripodHead_screw();
            }
        }
        translate([0,0,-height/2 ]){
            rotate(190, [0,1,0]){
                TripodHead_screw();
            }
        }
    }
}

module set_Tripod(){ 
    color([1,0,0]) {
        Tripod();
    }
    translate([0,0, height/2]){
        TripodHead();
    }
}

rotate(-30, [0,0,1]){
    translate([0,0, height/2 + 4*cm ]){
        Timber();
    }
    rotate(30, [0,0,1]){
        rotation_sym(length, 3, 0, 0) set_Tripod(); 
    }
}
include <./Base.scad>
translate([0,0, -height/2 - 4*cm ]){
    // render(){
        color([0.35,0.15,0.5]){
            Base();
        }

    // }
}



