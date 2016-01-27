out_dir = ./dxf

all: main_panel side_panel side_brace

clean:
	rm -rf $(out_dir)

output_folder:
	mkdir -p $(out_dir)

main_panel: output_folder
	openscad main_panel.scad -o $(out_dir)/main_panel.dxf

side_panel: output_folder
	openscad side_panel.scad -o $(out_dir)/side_panel.dxf

side_brace: output_folder
	openscad side_brace.scad -o $(out_dir)/side_brace.dxf
