$fn = 70;

delta = 2;

nSin = 11.5 * delta; // zmena velkosti zvislej policky vnutorna
nSout = nSin/0.68 ; // zmena velkosti zvislej policky vnutorna
rP = 22 * delta; //r policiek
rZ = 9 * delta; // r zvislych policok
vP = 0.4 * delta; //vyska policiek
vO = 0.4 * delta; // vyska podstavy, strechy
vC = 15 * delta; // vyska cylindra co reze hornu a dolnu policku zvnutra
rG = 10 * delta; //r gule
distance = 7 * delta;
startY = 5 * delta;
pCount = 2 * delta; //pocet policiek

module SphereShelves() {
    difference() {
        difference() {
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

            //vnutorna gula
            translate([0, 0, startY + distance]) {
               sphere(rG-5, center=true);
            }
        }

        // vyrez hornej a spodnej policky
        translate([0, 0, startY + distance]) {
            cylinder(h=vC, r=vP*8, center=true);
        }
    }
}

//podstava
translate([0, 0, startY + distance - rG]) {
    cylinder(h=vO, r=vP*6, center=true);
}

//vrch
translate([0, 0, startY + distance + rG]) {
    cylinder(h=vO, r=vP*6, center=true);
}

//zvisly panel

module SphereVertical() {
    difference() {
        union() {
            difference() {
                translate([0, 0, startY + distance]) {
                    rotate([0,90,0]) {
                        resize(newsize = [0,nSout,0]) cylinder(h=vO, r = rZ, center=true);
                    }
                }
                
                translate([0, 0, startY + distance]) {
                    rotate([0,90,0]) {
                        resize(newsize = [0,nSin,0]) cylinder(h=vO+1, r = rZ*0.7, center=true);
                    }
                }
            }

            translate([0, 0, startY + distance +rZ]) {
                    cube([vO,6,5], center=true);
            }
            
            translate([0, 0, startY + distance -rZ]) {
                    cube([vO,6,5], center=true);
            }
        }
        SphereShelves();
    }
}


