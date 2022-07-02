// include <nutsnbolts/materials.scad>;
// include <nutsnbolts/cyl_head_bolt.scad>;
include <NopSCADlib/lib.scad>; 
// use <NopSCADlib/vitamins/insert.scad>


cm              = 10               ;
sidelength      = 0.5   * cm       ;
width           = 1     * cm       ;
length          = 10    * cm       ;
delta           = 4     * cm       ;
discenter       = 1.1   * cm       ;
teta            = 80               ;

// -------------------------------------------

Base_sidelength     = 30    * cm       ;
Base_height         = 1     * cm       ;
// delta               = 4     * cm       ;
// discenter           = 1.1   * cm       ;

// -------------------------------------------

mm          =   0.1         * cm    ;
radious     =   5           * cm    ;
height      =   8           * cm    ;
ulcfside    =   52.2        * mm    ;
ulcsside    =   21.2        * mm    ;

ulcfsideHead    =   52.2        * mm  + mm   ;
ulcssideHead    =   21.2        * mm  + mm   ;
// ------------------------------------------------------


// cm          =   10;
// mm          =   0.01 * cm;
// radious     =   5   * cm;
// height      =   8   * cm;
// ulcfside    =   3   * cm;
// ulcsside    =   1.5 * cm;




module blabla(){
    cube([10,10,10], center = true);

}


module rotation_sym(r, N, z, rot) {
     for (i = [0:N-1]) {
        rotate(  - rot* i*2*180/(N), [0,0,1] ) {
            translate([r*cos(i*2*180/(N)),r*sin(i*2*180/N),z]) {
                children();
            }
        }
    }
}
