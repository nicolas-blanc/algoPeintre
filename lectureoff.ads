with type_projet;
with Ada.Text_IO;

package lectureoff is
--/!\ Modif Antoine 13/11. Toutes les fonctions.
procedure lectureFichierOFF (DBase : in type_projet.DonBase; f : in Ada.Text_IO.file_type);
procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: in type_projet.Ens_points );
procedure initEnsFaces (nbf: in integer; f: in file_type; EFaces: in type_projet.Ens_Faces );
procedure init (monFichier: out file_type; nom : in string; DBase : out type_projet.DonBase);--à transformer en fonction


end lectureoff;