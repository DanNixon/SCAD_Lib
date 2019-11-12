use <PanelNutFixing.scad>;
use <RackPanel.scad>;

function internal_dims(config) = config[0];
function material_thickness(config) = config[1][0];
function material_tolerance(config) = config[1][1];
function side_panel_padding(config) = config[2];
function screw_hole_radius(config) = config[3][0];
function xy_panel_screws(config) = config[3][1];
function xz_panel_screws(config) = config[3][2];
function xy_panel_tabs_width(config) = config[4][0][0];
function xy_panel_tabs(config) = config[4][0][1];
function xz_panel_tabs_width(config) = config[4][1][0];
function xz_panel_tabs(config) = config[4][1][1];
function rack_panel_u(config) = config[5][0];
function rack_panel_hole_r(config) = config[5][1];
function rack_panel_corner_r(config) = config[5][2];
function rack_panel_offset(config) = config[5][3];

module PositionSidePanelFixings(positions=[], width=0, along_y=0)
{
  rotate([0, 0, 90*along_y])
  {
    for(pos = positions)
    {
      translate([pos-0.05, width/2, 0])
        children();
      translate([pos-0.05, -width/2, 0])
        children();
    }
  }
}

module PositionPanelFixings(config, positions=[], side=1)
{
  x = (0.05 + (internal_dims(config)[0] / 2)) * side;

  for(pos = positions)
  {
    translate([x, pos, 0])
      rotate([0, 0, 90 * side])
        children(0);
  }
}

module PositionPanelTabs(config, positions=[], side=1, width=5)
{
  PositionPanelFixings(config,
                       positions=positions,
                       side=side)
    translate([0, 0.05-material_thickness(config)/2, 0])
      square([width-material_tolerance(config), material_thickness(config)], center=true);
}

module XYPanel2D(config)
{
  y = internal_dims(config)[1] + (2 * material_thickness(config));
  difference()
  {
    union()
    {
      square([internal_dims(config)[0], y], center=true);

      PositionPanelTabs(config,
                        positions=xy_panel_tabs(config),
                        side=1,
                        width=xy_panel_tabs_width(config));

      PositionPanelTabs(config,
                        positions=xy_panel_tabs(config),
                        side=-1,
                        width=xy_panel_tabs_width(config));
    }

    PositionPanelFixings(config,
                         positions=xy_panel_screws(config),
                         side=1)
      PanelNutFixing_M3(thickness=0);

    PositionPanelFixings(config,
                         positions=xy_panel_screws(config),
                         side=-1)
      PanelNutFixing_M3(thickness=0);
  }
}

module XZPanel2D(config)
{
  y = internal_dims(config)[1] + (2 * material_thickness(config));
  difference()
  {
    union()
    {
      square([internal_dims(config)[0], internal_dims(config)[2]], center=true);

      PositionPanelTabs(config,
                        positions=xz_panel_tabs(config),
                        side=1,
                        width=xz_panel_tabs_width(config));

      PositionPanelTabs(config,
                        positions=xz_panel_tabs(config),
                        side=-1,
                        width=xz_panel_tabs_width(config));
    }

    PositionPanelFixings(config,
                         positions=xz_panel_screws(config),
                         side=1)
      PanelNutFixing_M3(thickness=0);

    PositionPanelFixings(config,
                         positions=xz_panel_screws(config),
                         side=-1)
      PanelNutFixing_M3(thickness=0);
  }
}

module YZPanel2D(config)
{
  x = internal_dims(config)[1] + (2 * material_thickness(config));
  y = internal_dims(config)[2] + (2 * material_thickness(config));

  difference()
  {
    minkowski()
    {
      square([x, y], center=true);
      circle(r=side_panel_padding(config));
    }

    YZPanelFixings(config);
  }
}

module Rack19InchPanel2D(config)
{
  x = internal_dims(config)[1] + (2 * material_thickness(config));
  y = internal_dims(config)[2] + (2 * material_thickness(config));

  difference()
  {
    RackPanel19Inch(u=rack_panel_u(config),
                    offset=rack_panel_offset(config),
                    hole_r=rack_panel_hole_r(config,
                    corner_r=rack_panel_corner_r(config)));

    YZPanelFixings(config);
  }
}

module YZPanelFixings(config)
{
  double_tolerance = 2 * material_tolerance(config);

  PositionSidePanelFixings(positions=xy_panel_screws(config),
                           width=material_thickness(config)+internal_dims(config)[2])
    circle(r=screw_hole_radius(config));

  PositionSidePanelFixings(positions=xz_panel_screws(config),
                           width=material_thickness(config)+internal_dims(config)[1],
                           along_y=1)
    circle(r=screw_hole_radius(config));

  PositionSidePanelFixings(positions=xy_panel_tabs(config),
                           width=material_thickness(config)+internal_dims(config)[2])
    square([xy_panel_tabs_width(config)+material_tolerance(config),
            material_thickness(config)+double_tolerance], center=true);

  PositionSidePanelFixings(positions=xz_panel_tabs(config),
                           width=material_thickness(config)+internal_dims(config)[1],
                           along_y=1)
    square([xz_panel_tabs_width(config)+material_tolerance(config),
            material_thickness(config)+double_tolerance], center=true);
}

module XYPanel3D(config)
{
  linear_extrude(height=material_thickness(config), center=true)
    XYPanel2D(config);
}

module XZPanel3D(config)
{
  linear_extrude(height=material_thickness(config), center=true)
    XZPanel2D(config);
}

module YZPanel3D(config)
{
  linear_extrude(height=material_thickness(config), center=true)
    YZPanel2D(config);
}

module Rack19InchPanel3D(config)
{
  linear_extrude(height=material_thickness(config), center=true)
    Rack19InchPanel2D(config);
}
