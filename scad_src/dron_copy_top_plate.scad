include<utils.scad>
include<hexagone.scad>

/*dif() {*/
// tpu top_bot scale to 2.5
/*scale([1,1,2.6])*/
/*intersection() {*/
    /*rotate([180,0,0])*/
        /*dif() {*/
            /*import("/home/leo/Downloads/164_Bottom_Frame.stl");*/
            /*mv(0,0,12) {*/
                /*cube([600,600,11.99], center=true);*/
            /*}*/
        /*}*/
    /*mv(-300,-300,-1)*/
    /*cube([600,600,2]);*/
/*}*/

//tpu bot scale to 0.5mm
/*mv(0,0,1.4)*/
/*intersection() {*/
    /*rotate([180,0,0])*/
        /*dif() {*/
            /*import("/home/leo/Downloads/164_Bottom_Frame.stl");*/
            /*mv(0,0,12) {*/
                /*cube([600,600,11.99], center=true);*/
            /*}*/
        /*}*/
    /*mv(-300,-300,-4.5)*/
    /*cube([600,600,0.5]);*/
/*}*/

    /*union() {*/
        /*mv(100-38/4, -145, -5)*/
            /*cube([20,20,3]);*/

        /*mv(100-38/4, -65, -5)*/
            /*cube([20,20,3]);*/

        /*mv(100-4, -135, -5)*/
            /*cube([8,90,3]);*/
    /*}*/
/*}*/
// bot pla to scale maybe 2.5 mm
font = "DIN Schablonierschrift";
dif() {
    intersection() {
        mv(-119,38,-10)
            cube([38,128,10]);
        rot(0,0,180)
            dif() {
                rotate([180,0,0])
                    dif() {
                        import("/home/leo/Downloads/164_Bottom_Frame.stl");
                        mv(0,0,12) {
                            cube([600,600,11.99], center=true);
                        }
                    }
                mv(-300,-300,-3)
                    cube([600,600,4]);
            }
    }
    union() {
        mv(-100,150,0)
            cylinder(h=200,d=8, center=true);
        mv(-100,40,0)
            cylinder(h=200,d=17, center=true);
    linear_extrude(height=100, center=true)
    mv(-95,90,0)
    rot(0,0,90)
    text("LEOMAN", font=font, center=true);
    }
}



