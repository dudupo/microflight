include <./utilits.scad>;
include <./Tripod_head.scad>
include <./Timber.scad>

// Todo, find the exactly distance 

module Tripod(){
    difference(){
        cube([ulcfside,ulcsside,height ], center=true);
        // translate([ulcfside/2-mm,0,height/2 - cm/2 + 20*mm]){
        translate([ulcfside/2, 0, height/2 - mm ]){
            rotate(90, [0,1,0]){
                TripodHead_screw();
            }
        }
        translate([-ulcfside/2 ,0,height/2 - mm]){
            rotate(-90, [0,1,0]){
                TripodHead_screw();
            }
        }
        translate([0,0,-height/2 ]){
            rotate(180, [0,1,0]){
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
        translate( [ 0, ulcsside/2  , 2*cm ] )
        rotate(-90, [1,0,0]){   
            import("../ULC.stl", convexity=3);
        }
    }
}
rotate(-30, [0,0,1]){
    translate([0,0, height/2 + 6*cm ]){
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


// module mmmm(){
    
        
// }


// render(){
// translate([0,0, height]){
// mmmm();
// }
// }

// loadcellpath = "davidponar/workspace/STP-STEP-to-STL-Python-Converter/3DModelsToConvert/Converted-STLs/ULC.STEP.stl";

