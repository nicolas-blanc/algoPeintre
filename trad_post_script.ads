with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with type_projet;
use type_projet;

package trad_post_script is

procedure trad(APoly: in type_projet.AccEns_Poly; EPoints : in type_projet.Ens_points; minx,maxx,miny,maxy,minz,maxz: in float);
procedure afficherTab(APoly: in type_projet.AccEns_Poly);
procedure afficherPostScript(APoly: in type_projet.AccEns_Poly;EPoints : in Ens_points; minx,maxx,miny,maxy,minz,maxz: in float);

end trad_post_script;