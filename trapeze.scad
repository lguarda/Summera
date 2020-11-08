module trapeze(base, top, height, lentgth) {
    scale([1,1,height])
        hull() {
            square([base,0.0001], center=true);
            mv(0,lentgth,0)
                square([top,0.0001], center=true);
        }
}
