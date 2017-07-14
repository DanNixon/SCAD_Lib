module ServoHorn(w, h, tw, td, hd=2, hn=3, hs=3, cr=2)
{
  cd = cr * 2;

  difference()
  {
    union()
    {
      translate([cr, cr])
      {
        hull()
        {
          circle(r=cr);

          translate([w - cd, 0])
            circle(r=cr);

          translate([0, h - cd])
            circle(r=cr);
        }
      }

      translate([w / 2, -td / 2])
        square([tw, td], center=true);
    }

    translate([cr, h - cr])
      for(i=[0 : hn - 1])
        translate([0, -(hs * i)])
          circle(d=hd);
  }
}
