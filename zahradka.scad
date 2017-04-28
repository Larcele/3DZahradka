$fn = 70;

delta = 2;

rP = 22 * delta; //r policiek
vP = 1 * delta; //vyska policiek
rG = 10 * delta; //r gule
distance = 7 * delta;
startY = 5 * delta;
pCount = 2 * delta; //pocet policiek



intersection() {

    color("red")
    for (j = [0:pCount]) {  //generuje od dola hore :D
        translate([0, 0, startY + distance *j]) {
            cube([rP, rP, vP], center=true);
        }
    }
    
    translate([0, 0, startY + distance]) {
        sphere(rG, center=true);
    }

}

//podstava
translate([0, 0, startY + distance - rG]) {
    cylinder(h=vP, r=vP*3, center=true);
}

translate([0, 0, startY + distance + rG]) {
    cylinder(h=vP, r=vP*3, center=true);
}

//vrch


//}