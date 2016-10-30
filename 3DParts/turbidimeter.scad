



screw_head_width = 6.2;
screw_head_height= 2.4;
screw_shaft_width = 2.48;

cuvette_width = 12.5;

collar_width= 2.0;
wall_width = collar_width + screw_head_height*2;

collar_height = 5;
hole_width = 10;
height = cuvette_width + 2*wall_width;
width = height;
echo("Core height: ",height);

$fs= 0.5;

module screw_slot(){
    translate([0,2*screw_head_height,screw_head_width/2])
    rotate([90,0,0])
    union(){
        cylinder(d=screw_head_width, h=screw_head_height);
        cylinder(d=screw_shaft_width, h=2*screw_head_height+2);
        translate([-screw_head_width/2, 0, 0])
            cube([screw_head_width, screw_head_width, screw_head_height]);
        translate([-screw_shaft_width/2, 0, 0])
            cube([screw_shaft_width, screw_head_width, 2*screw_head_height+2]);
    }
}

module turbidimeter_center(){
    difference(){
        union(){
            cube([cuvette_width + 2*wall_width,cuvette_width + 2*wall_width,height]);
            translate ([wall_width-collar_width, wall_width-collar_width, wall_width]) 
                cube([cuvette_width+2*collar_width,cuvette_width+2*collar_width, height+collar_height]);
        }
        translate ([wall_width, wall_width, wall_width/2]) 
            cube([cuvette_width,cuvette_width, height+ collar_height+2]);
        translate([cuvette_width/2 + wall_width,0,height/2]) rotate([90,0,0]) 
            cylinder(d=hole_width, h = 100, center=true);
        
        translate([0,cuvette_width/2 + wall_width,height/2]) rotate([0,90,0]) 
            cylinder(d=hole_width, h = 100, center=true);
        
        
        
        
        translate([width/2,0,height-hole_width/2])
            rotate([0,0,0])
                screw_slot();
        
        
        translate([width/2,0,hole_width/2])
            rotate([0,180,0])
                screw_slot();
        
        
        translate([width/2,width,height-hole_width/2])
            rotate([0,0,180])
                screw_slot();
        
        translate([width/2,width,hole_width/2])
            rotate([0,180,180])
                screw_slot();
                
                
        translate([0,width/2,height-hole_width/2])
            rotate([0,0,-90])
                screw_slot();   
            
        translate([0,width/2,hole_width/2])
            rotate([0,180,-90])
                screw_slot();
           
        translate([width,width/2,height-hole_width/2])
            rotate([0,0,90])
                screw_slot();   
            
        translate([width,width/2,hole_width/2])
            rotate([0,180,90])
                screw_slot();
        
        
    }
    
}


turbidimeter_center();