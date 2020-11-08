include<utils.scad>
include<hexagone.scad>


key_external_diam=36;

key_spacing_need=5;
key_spacing = (key_external_diam)+key_spacing_need;
key_midle_offset=key_spacing/3;

//+5 on move
joystick_external_diam=10;

joystick_botsiz=64;
joystick_pos_y=joystick_botsiz/2;
echo(joystick_pos_y);
echo(joystick_pos_y+joystick_botsiz+key_external_diam);
//first key (up left) 132
echo(key_spacing);
//keythumb 96
echo(joystick_pos_y+joystick_botsiz+key_external_diam-key_external_diam);
//key index
echo(60+joystick_botsiz/2);
//joystik decalage hauteur

table_x=240;
table_y=600;

keyplayer_total_y=key_external_diam*4+key_spacing*4;

/*mv(80,64+32,0)*/
/*#cylinder(h=1000,d=10);*/

module keyplayer3() {
    cylinder(h=20,d=key_external_diam);
    mv(-key_midle_offset,key_spacing, 0)
        cylinder(h=20,d=key_external_diam);
    mv(-key_midle_offset,key_spacing*2, 0)
        cylinder(h=20,d=key_external_diam);
}

module key_thumb() {
    mv(key_spacing+key_external_diam,-key_external_diam, 0)
        cylinder(h=20,d=key_external_diam);
}

module key_index() {
    mv(-key_spacing,key_spacing_need*2,0)
    cylinder(h=20,d=key_external_diam);
}


module one_player() {
    mv(60,joystick_pos_y,0) {
        mv(joystick_botsiz/2, joystick_botsiz/2,0)
        #cylinder(h=60,d=10);
        cube([joystick_botsiz, joystick_botsiz, 20]);
    }

    // means the first key is at the location below

    color([1,0,0])
        mv(80,joystick_pos_y+joystick_botsiz+key_external_diam,0) {
            key_index();
            key_thumb();
            keyplayer3();
            mv(key_spacing,0,0)
                keyplayer3();
        }
}

mv(0,0,-300) {
    cube([table_x,table_y,10]);
    one_player();
    mv(0,330,0)
        one_player();
}


side_bot_curve_diam=70;
cube([table_x,table_y,10]);


module curve_1() {
    mv(side_bot_curve_diam/1.5,0,side_bot_curve_diam/2+10){
        rot(-90,0,0){
            cylinder(h=table_y, d=side_bot_curve_diam);}}
}

dif () {
cube([100, 5,500]);

mv(40,0,0)
rot(0,-5,0)
hull() {
    hull() {
        mv(100,0,0)
            curve_1();
        curve_1();
    }

    hull() {
        mv(100,0,500)
            curve_1();
        mv(0,0,500)
            curve_1();
    }
}
}
/*one_player();*/
/*mv(0,keyplayer_total_y,0)*/
/*one_player();*/
