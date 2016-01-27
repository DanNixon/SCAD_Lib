module DXFImport(file, thickness=1, addition_layers=[], subtraction_layers=[])
{
  linear_extrude(height=thickness, center=true)
  {
    difference()
    {
      union()
        for(l = addition_layers)
          import(file=file, layer=l);

      union()
        for(l = subtraction_layers)
          import(file=file, layer=l);
    }
  }
}
