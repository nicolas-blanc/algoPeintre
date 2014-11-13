with type_projet;
with lectureoff;

procedure algoPeintre() is 
	fichierOFF : file_type;
	DBase : type_projet.DonBase;
	nom_fichier : string;

	max, min : integer := 0;

	p_EnsPoly : type_projet.p_EnsPolygone; -- pointeur sur tab polygone
begin
	lectureoff.init(fichierOFF,nom_fichier,DBase) -- Nom du fichier a passer en parametre

	declare
		EPoints : Ens_points(0..DBase(0));
	begin
		lectureoff.initEnsPoints(DBase(0),fichierOFF,EPoints,max,min);

		lectureoff.initEnsPolygones(DBase(1),fichierOFF,p_EnsPoly); -- p_EnsPoly -> pointeur sur tab de polygone
	end;

	lectureoff.close(nom_fichier);

end algoPeintre;