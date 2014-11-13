with type_projet;
with Ada.Text_IO;

package lectureoff is
--/!\ Modif Antoine 13/11. Toutes les fonctions.
procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: out Ens_points; max, min : in out float);
procedure initEnsFaces (nbf: in integer; f: in file_type; EFaces: in type_projet.Ens_Faces ); -- a modif
procedure init (monFichier: out file_type; nom : in string; DBase : out type_projet.DonBase);
procedure close (nom_fichier : in string);

end lectureoff;