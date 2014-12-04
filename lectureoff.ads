with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;
with type_projet;
with tri_paquets;


package lectureoff is
--/!\ Modif Antoine 13/11. Toutes les fonctions.
procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: out type_projet.Ens_points; maxx,minx,maxy,miny,maxz,minz : in out float);
procedure initEnsPolygones (nbf: in integer; f: in file_type; p_poly: out type_projet.AccEns_Poly; EPoints: in type_projet.Ens_points; min, max : in float);
procedure init (monFichier: out file_type; nom : in string; DBase : out type_projet.DonBase);
procedure close (f : in out file_type);

end lectureoff;