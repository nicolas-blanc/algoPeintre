with Ada.Text_IO;
with type_projet;
with lectureoff;
use Ada.Text_IO;

procedure algopeintre is 
	fichierOFF : file_type;
	DBase : type_projet.DonBase;
	nom_fichier : string(1..8) := "text.txt";

	max, min : float := 0.0;

	p_EnsPoly : type_projet.AccEns_Poly	; -- pointeur sur tab polygone
begin
	lectureoff.init(fichierOFF,nom_fichier,DBase); -- Nom du fichier a passer en parametre

	declare
		EPoints : type_projet.Ens_points(0..DBase(0));
	begin
		lectureoff.initEnsPoints(DBase(0),fichierOFF,EPoints,max,min);

		lectureoff.initEnsPolygones(DBase(1),fichierOFF,p_EnsPoly,EPoints,min,max); -- p_EnsPoly -> pointeur sur tab de polygone
	end;

	lectureoff.close(fichierOFF);

end algopeintre;