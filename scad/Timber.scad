
cm              = 10               ;
sidelength      = 0.5   * cm       ;
width           = 0.5   * cm       ;
length          = 10    * cm       ;
delta           = 4     * cm       ;
discenter       = 1.1   * cm       ;
teta            = 80               ;


include <./utilits.scad>;

include <nutsnbolts/materials.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;

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
                    hole_through(name="M2", l= 2*cm, cld= 0.5, h= 10 , hcld=0.5);
                }
            }
        }
    }
}

module Timber(){
    rotation_sym(1*cm, 3, 0, 1)  translate( [0, -length/2 + cm, 0 ] ) arm();
}

Timber();