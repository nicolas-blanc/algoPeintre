package lectureoff is

procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: out Ens_points; max, min : in out float);
procedure initEnsFaces (nbf: in integer; f: in file_type; EFaces: in Ens_Faces );
procedure init (monFichier: out file_type; nom : in string; DBase : out DonBase);
procedure close (nom_fichier : in string);

end lectureoff;