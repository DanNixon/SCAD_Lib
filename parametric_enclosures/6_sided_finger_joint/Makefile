out_dir = ./dxf

all: machine_parts all_panels

machine_parts: front_back left_right top_bottom

clean:
	rm -rf $(out_dir)

output_folder:
	mkdir -p $(out_dir)

front_back: output_folder
	openscad front_back.scad -o $(out_dir)/front_back.dxf

left_right: output_folder
	openscad left_right.scad -o $(out_dir)/left_right.dxf

top_bottom: output_folder
	openscad top_bottom.scad -o $(out_dir)/top_bottom.dxf

all_panels: output_folder
	openscad all_panels.scad -o $(out_dir)/all_panels.dxf
