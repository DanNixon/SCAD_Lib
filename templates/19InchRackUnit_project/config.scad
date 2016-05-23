internal = [200, 425, 30];
material_thickness = 3;
outer_padding = 5;

screw_radius = 1.75;
xy_screws = [-200, -75, 75, 200];
xz_screws = [0];

xy_tab_width = 50;
xy_tabs = [-150, 0, 150];
xz_tab_width = 5;
xz_tabs = [-10, 10];

rack_panel = [1, 3, 5, 12.7]; // [units, hole radius, corner radius, offset]

box_config = [
    internal,
    [material_thickness, 0.1],
    outer_padding,
    [screw_radius, xy_screws, xz_screws],
    [[xy_tab_width, xy_tabs], [xz_tab_width, xz_tabs]],
    rack_panel
  ];
