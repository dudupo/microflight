include <./utilits.scad>;
include <./Tripod_head.scad>
include <./Timber.scad>

// Todo, find the exactly distance 


//! Project description in Markdown format before the first include.
$pp1_colour = "grey";           // Override any global defaults here if required, see NopSCADlib/global_defs.scad.
// include <NopSCADlib/lib.scad>   // Includes all the vitamins and utilities in NopSCADlib but not the printed parts.


module Tripod_stl() stl("Tripod"){
    difference(){
        cube([ulcfside,ulcsside,height ], center=true);
        translate([ulcfside/2, 0, height/2 - 3*mm ]){
            rotate(90, [0,1,0]){
                TripodHead_screw();
            }
        }
        translate([-ulcfside/2 ,0,height/2 - 3*mm]){
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
        Tripod_stl();
    }
    translate([0,0, height/2]){
        TripodHead_stl();
        translate( [ 0, ulcsside/2  , 2*cm ] )
        rotate(-90, [1,0,0]){   
            import("../ULC.stl", convexity=3);
        }
    }
}

include <./Base.scad>


module main_assembly()
assembly("main") {
    

    rotate(-30, [0,0,1]){
        translate([0,0, height/2 + 6*cm ]){
            Timber_stl();
        }
        rotate(30, [0,0,1]){
            rotation_sym(length, 3, 0, 0) set_Tripod(); 
        }
    }

    translate([0,0, -height/2 - 4*cm ]){
        // render(){
            color([0.35,0.15,0.5]){
                Base_stl();
            }

        // }
    }

}


//! Assembly instructions in Markdown format in front of each module that makes an assembly.


if($preview)
    main_assembly();

// module mmmm(){
    
        
// }


// render(){
// translate([0,0, height]){
// mmmm();
// }
// }

// loadcellpath = "davidponar/workspace/STP-STEP-to-STL-Python-Converter/3DModelsToConvert/Converted-STLs/ULC.STEP.stl";

