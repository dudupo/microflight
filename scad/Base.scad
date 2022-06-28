
include <./utilits.scad>;


module single_hole(cld){
    screw(M4_cap_screw, 25);
    // hole_through(name="M4", l=Base_height + 2*cm, cld=cld, h=Base_height, hcld=0);
}
    
module holes(){
    for ( j = [1:4]) {
        rotation_sym(delta*j ,3, Base_height, 0) single_hole(0.2);
    }

    zeropoint   =  -Base_sidelength/2 + 2*cm; 
    hist        =  round(Base_sidelength/discenter) *cm;
    
    for ( i = [0:1]){
        for ( j = [0:1] ){
            translate([zeropoint + i*hist, zeropoint + j*hist, Base_height + 2*cm]){
                single_hole(5);
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

