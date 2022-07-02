
include <./utilits.scad>;


use  <threadlib/threadlib.scad>;
module single_hole(turns) {
    bolt("M6", turns=turns, higbee_arc=40);
}
use <NopSCADlib/lib.scad>; 

    
module holes(){
    for ( j = [1:4]) {
        rotation_sym(delta*j ,3, Base_height, 0) single_hole(20);
    }

    zeropoint   =  -Base_sidelength/2 + 2*cm; 
    hist        =  round(Base_sidelength/discenter) *cm;
    
    for ( i = [0:1]){
        for ( j = [0:1] ){
            translate([zeropoint + i*hist, zeropoint + j*hist, Base_height + 2*cm]){
                single_hole(20);
            }
        }
    }

}
module Base_stl() stl("Base")  {
    difference(){
        cube([Base_sidelength,Base_sidelength,Base_height], center=true);
        holes();
    }
}

Base_stl();
