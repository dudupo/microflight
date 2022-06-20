# 0 "./Base.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "./Base.c"




cm = 10 ;
sidelength = 30 * cm ;
height = 3 * cm ;
delta = 4 * cm ;
discenter = 2.5 * cm ;

include <nutsnbolts/materials.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;



module rotation_sym(r, N) {
     for (i = [0:N-1]) {
        translate([r*cos(i*2*180/(N)),r*sin(i*2*180/N),height]) {
            children();
        }
    }
}

module single_hole(){
    hole_through(name="M4", l=height, cld=0.2, h=height, hcld=0);
}


module holes(){
    for ( j = [1:4]) {
        rotation_sym(delta*j ,3) single_hole();
    }

    zeropoint = -sidelength/2 + 2*cm;
    hist = round(sidelength/discenter) *cm;

    for ( i = [0:1]){
        for ( j = [0:1] ){
            translate([zeropoint + i*hist, zeropoint + j*hist, height]){
                single_hole();
            }
        }
    }

}
module Base() {
    difference(){
        cube([sidelength,sidelength,height], center=true);
        holes();
    }
}


render(){
    Base();
}
