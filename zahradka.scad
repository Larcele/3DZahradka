$fn = 70;

delta = 2;

rP = 22 * delta; //r policiek
vP = 1 * delta; //vyska policiek
rG = 10 * delta; //r gule
distance = 7 * delta;
startY = 5 * delta;
pCount = 1 * delta; //pocet policiek



difference() {

    intersection() {

        //policky
        color("red")
        for (j = [0:pCount]) {  //generuje od dola hore
            
                translate([0, 0, startY + distance *j]) {
                    cube([rP, rP, vP], center=true);
                }
        }
        //hlavna gula
        translate([0, 0, startY + distance]) {
            sphere(rG, center=true);
        }
    }
    
    //vyrezy v kazdej policke. Neviem ich spravit ovalne :/
    //Trochu je to skarede v preview-e, 
    //ale ked sa to vyrenderuje tak to vidiet pekne.
    for (j = [0:pCount]) {  //generuje od dola hore
        translate([0, 0, startY + distance * j]) {
            cube([rP/2*0.8, rP/2*0.8, vP], center=true);
        }
    }
}

//podstava
translate([0, 0, startY + distance - rG]) {
    cylinder(h=vP, r=vP*3, center=true);
}

//vrch
translate([0, 0, startY + distance + rG]) {
    cylinder(h=vP, r=vP*3, center=true);
}



//}