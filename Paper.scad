A0 = [841, 1189];
A1 = [594, 841];
A2 = [420, 594];
A3 = [297, 420];
A4 = [210, 297];
A5 = [148, 210];
A6 = [105, 148];
A7 = [74, 105];
A8 = [52, 74];
A9 = [37, 52];
A10 = [26, 37];

module PaperSheet(sheet, h=0, center=false)
{
  if (h == 0)
    square(sheet, center=center);
  else
    cube([sheet[0], sheet[1], h], center=center);
}
