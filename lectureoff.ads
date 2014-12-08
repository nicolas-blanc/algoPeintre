with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;
with type_projet;
with tri_paquets;


package lectureoff is

--Procedure initialisant le nombre de points et de polygnes que contient le fichier.
--Necessaire pour l'initialisation des autres srucutres de données.
procedure init (monFichier: out file_type; nom : in string; DBase : out type_projet.DonBase);

--Procedure remplissant le tableau de points en les lisant dans le fichier.
--Créer un point differement selon le type de vue choisie.
procedure initEnsPoints (vue : in integer; nbs: in integer; f: in file_type; EPoints: out type_projet.Ens_points; maxx,minx,maxy,miny,maxz,minz : in out float);

--Procedure lisant l'ensemble des polygones.
--Remplit le tableau de liste de polygones.
procedure initEnsPolygones (nbf: in integer; f: in file_type; p_poly: out type_projet.AccEns_Poly; EPoints: in type_projet.Ens_points; min, max : in float);

--Ferme le fichier passé en paramètre.
procedure close (f : in out file_type);

end lectureoff;