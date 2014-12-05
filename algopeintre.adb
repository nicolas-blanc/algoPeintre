with Ada.Text_IO;
with type_projet; use type_projet;
with lectureoff;
with trad_post_script;
with Ada.Command_Line; use  Ada.Command_Line;

use Ada.Text_IO;

procedure algopeintre is 
	fichierOFF : file_type;
	DBase : type_projet.DonBase;

	maxx, minx, maxy, miny, maxz, minz : float := 0.0;

	p_EnsPoly : type_projet.AccEns_Poly	; -- pointeur sur tab polygone

	vue : integer := 0;
begin
	if Argument_Count < 2 or Argument_Count > 3 then
		raise ARGUMENTS_INCORRECT_ERROR;
	elsif Argument_Count = 3 then
		vue := Integer'Value(Argument(3));
		if vue < 1 or vue > 2 then
			Put_line("Erreur sur l'argument 3, vu du dessin par défaut");
			vue := 0;
		end if;
	end if;

	declare
		nom_fichier_off : string(1..Argument(1)'length) := Argument(1);
		nom_fichier : string(1..Argument(2)'length) := Argument(2);
	begin
		lectureoff.init(fichierOFF,nom_fichier_off,DBase); -- Nom du fichier a passer en parametre

		declare
			EPoints : type_projet.Ens_points(0..DBase(0));
		begin
			lectureoff.initEnsPoints(vue,DBase(0),fichierOFF,EPoints,maxx,minx,maxy,miny,maxz,minz);

			lectureoff.initEnsPolygones(DBase(1),fichierOFF,p_EnsPoly,EPoints,minz,maxz); -- p_EnsPoly -> pointeur sur tab de polygone

			-- trad_post_script.afficherTab(p_EnsPoly);

			-- trad_post_script.trad(p_EnsPoly,Epoints,minx,maxx,miny,maxy,minz,maxz);*

			trad_post_script.afficherPostScript(nom_fichier,p_EnsPoly,EPoints,minx,maxx,miny,maxy,minz,maxz);
			
		end;

		Put_line("Fin de l'execution du programme");
		Put_line("Vous pouvez maintenant ouvrir le fichier : " & nom_fichier);
	end;

	lectureoff.close(fichierOFF);


exception
	when NBR_LIGNES_ERROR => Put_line("Fin du programme avec une erreur NBR_LIGNES_ERROR");
	when INSERTION_ERROR => Put_line("Fin du programme avec une erreur INSERTION_ERROR");
	when ERROR => Put_line("Fin du programme avec une erreur ERROR");
	when ARGUMENTS_INCORRECT_ERROR => Put_line("Le nombre d'arguments minimum pour le projet est incorrect");
			Put_line("1er argument (Obligatoire) : fichier.off devant être traduit en postscript");
			Put_line("2e argument (Obligatoire) : Nom du fichier postscript qui va être créé");
			Put_line("3e argument (facultatif) : permet de modifier la vue du dessin, valeur possible 1 ou 2, rien pour la vue par défaut");
end algopeintre;