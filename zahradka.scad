$fn = 70;

delta = 2;

rP = 22 * delta; //r policiek
vP = 1 * delta; //vyska policiek
rG = 10 * delta; //r gule
distance = 7 * delta;
startY = 5 * delta;
pCount = 1 * delta; //pocet policiek
rotationPts = 360 / 4;
sphereOutlineWidth = 8 * delta* 0.5;


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


SphereOutline(sphereOutlineWidth);

rotate([0,0,rotationPts]) {
    SphereOutline(sphereOutlineWidth);
}
rotate([0,0,rotationPts * 2]) {
    SphereOutline(sphereOutlineWidth);
}
rotate([0,0,rotationPts * 3]) {
    SphereOutline(sphereOutlineWidth);
}
rotate([0,0,rotationPts * 4]) {
    SphereOutline(sphereOutlineWidth);
}

module SphereOutline(width)
{
    difference() {
        translate([0, 0, startY + distance]) {
            sphere(rG, center=true);
        }
        
        translate([width, 0, startY + distance]) {
            sphere(rG, center=true);
        }
        
        translate([0, width, startY + distance]) {
            sphere(rG, center=true);
        }
        
        translate([-width, 0, startY + distance]) {
            sphere(rG, center=true);
        }
    }
}
