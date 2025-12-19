////////////////////////////////////////////////////////////////////////////////
// Parametric Filament Info Card
// © 2025 by Morgan Conner
// Licensed under CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
//
////////////////////////////////////////////////////////////////////////////////

$fa=$preview?1:.4;
$fs=$preview?2:.4;

/* [Filament Information] */

Filament_Type = ""; // [PLA,PETG,ABS,ASA,HIPS,PA,PAHT,PC,PET,PPA,PPS,PVA,TPU]

// If none of the above, enter here
Filament_Type_Override = "PETG";

Filament_Modifier = "None"; // [None,Aero,Basic,CF,Clear,Draft,Easy,Eco,FR,GF,Glow,HF,HS,Marble,Matte,Metal,Plus,Pro,Pro+,Recycle,Rock,Silk,Silk+,Sparkle,Stone,Super,Turbo,Wood]

// If none of the above, enter here
Filament_Modifier_Override = "";

Filament_Brand = "SUNLU";

Filament_Color = "WHITE";

// Range or preferred value
Filament_Nozzle_Temperature = "";

// Range or preferred value
Filament_Bed_Temperature = "";

// Range or preferred value
Filament_Print_Speed = "";

/* [Basic Settings] */

// Must use "Custom" for the variables in the Custom section to apply.
Layout_Style = "Custom"; // [Card,Tile,Swatch,Custom]

Detail_Style = "Emboss"; // [Emboss, Deboss]

Rounded_Corners = true; // [true:false]

Keyhole = true; // [true:false]

Border = true; // [true:false]

// Does not apply to Tile or Swatch layout
TD_Strip = true; // [true:false]

// Must match your intended print settings
Layer_Height = 0.2; // [0.06:0.02:0.6]

/* [Labels] */

Nozzle_Temperature_Label = "";
Bed_Temperature_Label = "";
Print_Speed_Label = "";
Temperature_Units = "";
// Volumetric Flow - mm3/s, Layer Speed - mm/s
Print_Speed_Units = ""; //[mm3/s, mm/s]

/* [Keyhole Settings] */
Keyhole_Shape = "Circle"; // [Triangle,Circle,Square,Pentagon,Octagon]

/* [Custom] */
// Not all fonts are printable at small sizes. Choose thoughtfully.
Font_Custom="Orbitron"; //font

Font_Size_Type=6; // [4:.25:10]

Font_Size_Modifier=4; // [4:.25:10]

Font_Size_Brand=5; // [4:.25:10]

Font_Size_Color=4; // [4:.25:10]

Font_Size_Data=4; // [4:.25:10]

Line_Gap=2.25; // [1:.25:10]

Card_Width=60; // [20:5:150]

Card_Depth=32; // [20:5:150]

// Number of layers
Card_Height=12; // [5:1:30]

// Text and Border layers
Card_Detail_Height=2; // [2:1:10]

// Between inside border and text
Text_Top_Offset = 2; // [0:.25:10]

// Between inside border and text
Text_Left_Offset = 1; // [0:.25:10]

// Between inside border and text
Text_Right_Offset = 1; // [0:.25:10]

// Overrides Detail Style and generates a fill for the negative space of the deboss style
Generate_Fill = false; // [true:false]

// Rounding radius of the card corners
Corner_Radius=5; // [0:10]

Border_Thickness=1; // [0:5]

// Offset from edge to detail or text
Edge_Spacing=1; // [1:5]

// Depth of transmission distance strip
TD_Strip_Depth = 10; // [4:1:10]

// Extra space below the strip
TD_Strip_Bottom_Offset = 0; // [0:10]

Keyhole_Size = 5; // [2:5]

Keyhole_Location = 1; // [0:Top Right, 1:Top, 2:Top Left, 3:Left, 4:Bottom Left, 5:Bottom, 6:Bottom Right, 7:Right]

if (Layout_Style == "Swatch") {
    cardSize= [
        20, // X dimension of info card
        20, // Y dimension of info card
        10, // Z dimension of info card
        3, // inset height of the border
        Rounded_Corners ? 5 : 0, // Corner Radius
        Border ? 1 : 0, // Border Thickness
        1, // Edge Gap
        0, //Text_Top_Offset,
        0, //Text_Left_Offset,
        0, //Text_Right_Offset,
        0, //TD_Strip_Bottom_Offset
        Layer_Height,
        Detail_Style
    ];

    infoStrings=[
        "", // Strings array index matches size array index, this is the spacer in index 0
        "",
        "",
        "",
        "",
        "",
        "",
        ""
    ];
    infoSizes=[0, 0, 0, 0, 0, 0, 0, 0];
    infoText = [infoStrings, infoSizes, "Orbitron"];
    keyholeCfg = [Keyhole, Keyhole_Shape, 0, 3];
    tdStrip = [false, 0, Layer_Height, 0, 0];
    infoCard(cardSize, infoText, tdStrip, keyholeCfg);
}
else if (Layout_Style=="Tile") {
    cardSize= [
        30, // X dimension of info card
        30, // Y dimension of info card
        10, // Z dimension of info card
        3, // inset height of borders and text
        Rounded_Corners ? 5 : 0, // Corner Radius
        Border ? 1 : 0, // Border Thickness
        1, // Edge Gap
        3, //Text_Top_Offset,
        0, //Text_Left_Offset,
        0, //Text_Right_Offset,
        0, //TD_Strip_Bottom_Offset
        Layer_Height,
        Detail_Style
    ];

    infoStrings=[
        "", // Strings array index matches size array index, this is the spacer in index 0
        Filament_Type_Override == "" ? Filament_Type : Filament_Type_Override,
        Filament_Modifier_Override == "" ? (Filament_Modifier == "None" ? "" : Filament_Modifier) : Filament_Modifier_Override,
        Filament_Brand,
        Filament_Color,
        "",
        "",
        ""
    ];
    infoSizes=[1, 5, 4, 4, 4, 0, 0, 0];
    infoText = [infoStrings, infoSizes, "Orbitron"];

    keyholeCfg = [Keyhole, Keyhole_Shape, 0, 3];

    tdStrip = [false, 0, Layer_Height, 0, 0];

    infoCard(cardSize, infoText, tdStrip, keyholeCfg);

}
else if (Layout_Style=="Card") {

    cardSize= [
        80, // X dimension of info card
        TD_Strip ? 45 : 40, // Y dimension of info card
        15, // Z dimension of info card
        3, // inset height of borders and text
        Rounded_Corners ? 5 : 0, // Corner Radius
        Border ? 1 : 0, // Border Thickness
        Border ? 1 : 2, // Edge Gap
        (!Border && TD_Strip) ? 1 : 2, //Text_Top_Offset,
        Border ? 1 : 0, //Text_Left_Offset,
        Border ? 1 : 0, //Text_Right_Offset,
        0, //TD_Strip_Bottom_Offset
        Layer_Height,
        Detail_Style
    ];

    infoStrings=[
        "", // Strings array index matches size array index, this is the spacer in index 0
        Filament_Type_Override == "" ? Filament_Type : Filament_Type_Override,
        Filament_Modifier_Override == "" ? (Filament_Modifier == "None" ? "" : Filament_Modifier) : Filament_Modifier_Override,
        Filament_Brand,
        Filament_Color,
        str(Nozzle_Temperature_Label, " ", Filament_Nozzle_Temperature, " ", Temperature_Units),
        str(Bed_Temperature_Label, " ", Filament_Bed_Temperature, " ", Temperature_Units),
        str(Print_Speed_Label, " ", Filament_Print_Speed, " ", Print_Speed_Units)
    ];
    infoSizes=[2.25, 6, 4, 5, 4, 4, 4, 4];
    infoText = [infoStrings, infoSizes, "Orbitron"];

    tdStrip = [TD_Strip, 5, Layer_Height];

    keyholeCfg = [Keyhole, Keyhole_Shape, TD_Strip ? 7 : 6, 6];

    infoCard(cardSize, infoText, tdStrip, keyholeCfg);

}
else {
    cardSize= [
        Card_Width, // X dimension of info card
        Card_Depth, // Y dimension of info card
        Card_Height, // Z dimension of info card
        Card_Detail_Height, // inset height of borders and text
        // Corner Radius, if enabled
        (Rounded_Corners && (Corner_Radius > 0)) ? Corner_Radius : 0,
        // Border Thickness, if enabled
        (Border && (Border_Thickness > 0)) ? Border_Thickness : 0,
        Edge_Spacing,
        Text_Top_Offset,
        Text_Left_Offset,
        Text_Right_Offset,
        TD_Strip_Bottom_Offset,
        Layer_Height,
        Generate_Fill ? "Fill" : Detail_Style
    ];

    infoStrings=[
        "", // Strings array index matches size array index, this is the spacer in index 0
        Filament_Type_Override == "" ? Filament_Type : Filament_Type_Override,
        Filament_Modifier_Override == "" ? (Filament_Modifier == "None" ? "" : Filament_Modifier) : Filament_Modifier_Override,
        Filament_Brand,
        Filament_Color,
        str(Nozzle_Temperature_Label, " ", Filament_Nozzle_Temperature, " ", Temperature_Units),
        str(Bed_Temperature_Label, " ", Filament_Bed_Temperature, " ", Temperature_Units),
        str(Print_Speed_Label, " ", Filament_Print_Speed, " ", Print_Speed_Units)
    ];
    infoSizes=[
        Line_Gap, // Strings array index matches size array index, this is the spacer in index 0
        Font_Size_Type,
        Font_Size_Modifier,
        Font_Size_Brand,
        Font_Size_Color,
        Font_Size_Data,
        Font_Size_Data,
        Font_Size_Data
    ];
    infoText = [infoStrings, infoSizes, Font_Custom];

    tdStrip = [
        TD_Strip,
        TD_Strip_Depth,
        Layer_Height
    ];

    keyholeCfg = [Keyhole, Keyhole_Shape, Keyhole_Location, Keyhole_Size];

    infoCard(cardSize, infoText, tdStrip, keyholeCfg);
}

// Assemble content for the info card
module infoCard(cardSize, infoText, tdStrip, keyholeCfg) {
    if (cardSize[12] == "Deboss") {

        edgeDelta = cardSize[5] > 0 ? cardSize[5] + (cardSize[6] * 2) : (1.5 * cardSize[6]);
        contentWidth = cardSize[0] - (edgeDelta*2);
        textWidth = contentWidth - cardSize[8] - cardSize[9];

        difference() {
            linear_extrude(cardSize[2] * cardSize[11])
                roundrect(size=[cardSize[0],cardSize[1]], radius=cardSize[4]);

            debossBorder(cardSize);

            translate([
                -((contentWidth/2)-cardSize[8]),
                (cardSize[1] / 2) - edgeDelta - cardSize[7],
                ((cardSize[2] - cardSize[3]) * cardSize[11]) + .001
            ])
                linear_extrude((cardSize[3] * cardSize[11]) + .001)
                    infoText(infoText[0], infoText[1], infoText[2], textWidth);

            if(tdStrip[0]) {
                tdVerticalShift = (cardSize[1] / 2) - edgeDelta - cardSize[10];
                translate([-(contentWidth/2),-tdVerticalShift, (cardSize[2] * cardSize[11]) + .002])
                rotate([0,180,0])
                    mTDstrip(size=[contentWidth, tdStrip[1], cardSize[2]], layer=tdStrip[2]);
            }

            if(keyholeCfg[0]) {
                keyholeOffset =
                    (keyholeCfg[2] % 2 == 0 ? max(cardSize[4] / 2, edgeDelta) : edgeDelta)
                    + (keyholeCfg[3] / 2) + 1;
                shifter = [
                    keyholeXDirection(keyholeCfg[2]) * ((cardSize[0] / 2) - keyholeOffset),
                    keyholeYDirection(keyholeCfg[2]) * ((cardSize[1] / 2) - keyholeOffset),
                    -.002];
                translate(shifter)
                    linear_extrude((cardSize[2] * cardSize[11]) + .004)
                        mKeyhole(keyholeCfg);
            }
        }
     } else if (cardSize[12] == "Emboss") {

        edgeDelta = cardSize[5] > 0 ? cardSize[5] + cardSize[6] : (1.5 * cardSize[6]);
        contentWidth = cardSize[0] - (edgeDelta*2);
        textWidth = contentWidth - cardSize[8] - cardSize[9];
        stripSpaceDepth = tdStrip[0] ? (cardSize[6] * 2) + cardSize[10] + tdStrip[1] : 0.001;
        carveOutDepth = cardSize[1] - (cardSize[5] * 2) - stripSpaceDepth;

        difference() {
            linear_extrude(cardSize[2] * cardSize[11])
                roundrect(size=[cardSize[0],cardSize[1]], radius=cardSize[4]);

            translate([
                0,
                ((cardSize[1] - carveOutDepth) / 2) - cardSize[5],
                ((cardSize[2] - cardSize[3]) * cardSize[11])
            ])
                linear_extrude((cardSize[3] * cardSize[11]) + .001)
                    roundrect(
                        size=[cardSize[0] - (cardSize[5] * 2), carveOutDepth],
                        radius= (cardSize[5] <=0 && tdStrip[0]) ? 0 : cardSize[4] - cardSize[5]
                    );

            if(tdStrip[0]) {
                tdVerticalShift = (cardSize[1] / 2) - edgeDelta - cardSize[10];
                translate([-(contentWidth/2),-tdVerticalShift, (cardSize[2] * cardSize[11]) + .002])
                    rotate([0,180,0])
                        mTDstrip(size=[contentWidth, tdStrip[1], cardSize[2]],
                            layer=tdStrip[2]);
            }

            if(keyholeCfg[0]) {
                keyholeOffset = (keyholeCfg[2] % 2 == 0 ? max(cardSize[4] / 2, edgeDelta) : edgeDelta) + (keyholeCfg[3] / 2) + 1;
                shifter = [
                    keyholeXDirection(keyholeCfg[2]) * ((cardSize[0] / 2) - keyholeOffset),
                    keyholeYDirection(keyholeCfg[2]) * ((cardSize[1] / 2) - keyholeOffset),
                    -.002];
                translate(shifter)
                    linear_extrude((cardSize[2] * cardSize[11]) + .004)
                        mKeyhole(keyholeCfg);
            }
        }
        translate([
            -((contentWidth/2)-cardSize[8]),
            (cardSize[1] / 2) - edgeDelta - cardSize[7],
            ((cardSize[2] - cardSize[3]) * cardSize[11]) + .001
        ])
            linear_extrude((cardSize[3] * cardSize[11]) + .001)
                infoText(infoText[0], infoText[1], infoText[2], textWidth);

    } else if(cardSize[12] == "Fill") {
        edgeDelta = cardSize[5] > 0 ? cardSize[5] + (cardSize[6] * 2) : (1.5 * cardSize[6]);
        contentWidth = cardSize[0] - (edgeDelta*2);
        textWidth = contentWidth - cardSize[8] - cardSize[9];

        debossBorder(cardSize);

        translate([
            -((contentWidth/2)-cardSize[8]),
            (cardSize[1] / 2) - edgeDelta - cardSize[7],
            ((cardSize[2] - cardSize[3]) * cardSize[11]) + .001
        ])
            linear_extrude((cardSize[3] * cardSize[11]) + .001)
                infoText(infoText[0], infoText[1], infoText[2], textWidth);

    }
}

// Generate informational text
module infoText(textStrings, fontSizes, font, width) {
    if (width < 20) {
        square([.001, .001], center=true);
    } else if (width < 40) {
        tileText(textStrings, fontSizes, font);
    } else {
        cardText(textStrings, fontSizes, font, width);
    }
}

// Arrange the text for the tile layout
module tileText(textStrings, fontSizes, font) {
    text(textStrings[1], size=fontSizes[1], font=font, halign="left", valign="top");
    line2top = fontSizes[1] + fontSizes[0];
    translate([0, -line2top, 0])
        text(textStrings[2], size=fontSizes[2], font=font, halign="left", valign="top");
    line3top = line2top + fontSizes[2] + fontSizes[0];
    translate([0, -line3top, 0])
        text(textStrings[3], size=fontSizes[3], font=font, halign="left", valign="top");
    line4top = line3top + fontSizes[3] + fontSizes[0];
    translate([0, -line4top, 0])
        text(textStrings[4], size=fontSizes[4], font=font, halign="left", valign="top");
}

// Arrange the text for the card layout
module cardText(textStrings, fontSizes, font, width) {
    // String 0 is ignored and size 0 is the spacer

    // Place string 1 (filament type) in the top right
    translate([width, 0, 0])
       text(textStrings[1], size=fontSizes[1], font=font, halign="right", valign="top");

    // Place string 2 (filament modifier) below type in the top right
    translate([width, -fontSizes[1] - fontSizes[0], 0])
        text(textStrings[2], size=fontSizes[2], font=font, halign="right", valign="top");

    // Place string 3 (filament brand) at the top left
    text(textStrings[3], size=fontSizes[3], font=font, halign="left", valign="top");

    // Place string 4 (filament color) on line 2
    line2height = - fontSizes[3] - fontSizes[0];
    translate([0, line2height, 0])
        text(textStrings[4], size=fontSizes[4], font=font, halign="left", valign="top");

    // Place string 5 (nozzle temps) on line 3
    line3height = line2height - fontSizes[4] - fontSizes[0];
    translate([0, line3height, 0])
        text(textStrings[5], size=fontSizes[5], font=font, halign="left", valign="top");

    // Place string 6 (bed temps) on line 4
    line4height = line3height - fontSizes[5] - fontSizes[0];
    translate([0, line4height, 0])
        text(textStrings[6], size=fontSizes[6], font=font, halign="left", valign="top");

    // Place string 7 (print speeds) on line 5
    line5height = line4height - fontSizes[6] - fontSizes[0];
    translate([0, line5height, 0])
        text(textStrings[7], size=fontSizes[7], font=font, halign="left", valign="top");
}

// Create a rounded rectangle (or just a rectangle if radius is zero)
module roundrect(size, radius) {
    size = is_undef(size[0]) ? [size, size] : size;
    if (radius > 0) {
        corners = [(size[0]/2)-radius, (size[1]/2)-radius];

        hull() {
            translate([corners[0],corners[1],0]) circle(radius);
            translate([-corners[0],corners[1],0]) circle(radius);
            translate([corners[0],-corners[1],0]) circle(radius);
            translate([-corners[0],-corners[1],0]) circle(radius);
        }
    } else {
        square([size[0], size[1]], center=true);
    }
}

module debossBorder(cardSize) {
    if(cardSize[5] > 0) {
        translate([0,0,((cardSize[2] - cardSize[3]) * cardSize[11]) + .002])
        linear_extrude((cardSize[3] * cardSize[11]) + .002)
        mBorder([cardSize[0],cardSize[1]], cardSize[4], cardSize[6], cardSize[5]);
    }
}

// Create a border shape
module mBorder(size, radius, borderGap, borderWidth) {
    outsideDiff = borderGap * 2;
    insideDiff = (borderGap + borderWidth)*2;
    if ( radius > 0 ) {
        difference() {
            roundrect([(size[0]-outsideDiff), (size[1]-outsideDiff)], radius - borderGap);
            roundrect([(size[0]-insideDiff), (size[1]-insideDiff)], radius - borderGap - borderWidth);
        }
    } else {
        difference() {
            square([(size[0]-outsideDiff), (size[1]-outsideDiff)], true);
            square([(size[0]-insideDiff), (size[1]-insideDiff)], true);
        }
    }
}

// Generate a strip of varying height cubes to provide a sense of the transmission distance
module mTDstrip(size, layer) {
    segmentWidth = size[0] / size[2];
    for(i=[2:size[2]-2]) {
        translate([-((i*segmentWidth)+(segmentWidth/2)),0,0])
            cube([segmentWidth + .001, size[1], (size[2] - i) * layer]);
    }
}
// Keyhole related functions

// X vector lookup
function keyholeXDirection(loc) = lookup(loc, [
    [0,1], // Top Right
    [1,0], // Top
    [2,-1], // Top Left
    [3,-1], // Left
    [4,-1], // Bottom Left
    [5,0], // Bottom
    [6,1], // Bottom Right
    [7,1] // Right
]);

// Y Vector lookup
function keyholeYDirection(loc) = lookup(loc, [
    [0,1], // Top Right
    [1,1], // Top
    [2,1], // Top Left
    [3,0], // Left
    [4,-1], // Bottom Left
    [5,-1], // Bottom
    [6,-1], // Bottom Right
    [7,0] // Right
]);

// Rotations for pentagons
function keyholeDirection(loc) = lookup(loc, [
    [0,45], // Top Right
    [1,90], // Top
    [2,135], // Top Left
    [3,180], // Left
    [4,225], // Bottom Left
    [5,270], // Bottom
    [6,315], // Bottom Right
    [7,0] // Right
]);

// Make keyhole shape and rotate to correct orientation
module mKeyhole(keyholeCfg) {
    if (keyholeCfg[1] == "Triangle") {
        rotate([0,0,keyholeDirection(keyholeCfg[2])])
            translate([1,0,0]) offset(r=1)
                difference() {
                    rotate([0,0,45]) square((keyholeCfg[3]/sqrt(2)) - 1,true);
                    translate([-(keyholeCfg[3]/2),0,0]) square(keyholeCfg[3], true);
                }
    } else if (keyholeCfg[1] == "Square") {
        offset(r=1) square((keyholeCfg[3]/sqrt(2)) - 1, true);
    } else if (keyholeCfg[1] == "Pentagon") {
        rotate([0,0,keyholeDirection(keyholeCfg[2])])
            offset(r=1)
                circle(d=keyholeCfg[3] - 1, $fn=5);
    } else if (keyholeCfg[1] == "Octagon") {
        circle(d=keyholeCfg[3], $fn=8);
    } else {
        circle(d=keyholeCfg[3]);
    }
}