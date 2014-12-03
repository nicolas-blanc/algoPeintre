with Ada.Text_IO;
with type_projet;
use type_projet;
with lectureoff;
with trad_post_script;

use Ada.Text_IO;

procedure algopeintre is 
	fichierOFF : file_type;
	DBase : type_projet.DonBase;
	nom_fichier : string(1..8) := "cube.off";

	maxx, minx, maxy, miny, maxz, minz : float := 0.0;

	p_EnsPoly : type_projet.AccEns_Poly	; -- pointeur sur tab polygone
begin
	lectureoff.init(fichierOFF,nom_fichier,DBase); -- Nom du fichier a passer en parametre

	declare
		EPoints : type_projet.Ens_points(0..DBase(0));
	begin
		lectureoff.initEnsPoints(DBase(0),fichierOFF,EPoints,maxx,minx,maxy,miny,maxz,minz);

		lectureoff.initEnsPolygones(DBase(1),fichierOFF,p_EnsPoly,EPoints,minz,maxz); -- p_EnsPoly -> pointeur sur tab de polygone

		trad_post_script.afficherTab(p_EnsPoly);
		
		--trad_post_script.trad(p_EnsPoly,Epoints,minx,maxx,miny,maxy,minz,maxz);
		trad_post_script.afficherPostScript(p_EnsPoly,EPoints,minx,maxx,miny,maxy,minz,maxz);
		
	end;

	lectureoff.close(fichierOFF);

end algopeintre;