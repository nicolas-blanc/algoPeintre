with Ada.Text_IO;
with type_projet; use type_projet;
with lectureoff;
with trad_post_script;
with Ada.Command_Line; use  Ada.Command_Line;
with Ada.Real_Time; use Ada.Real_Time;

use Ada.Text_IO;

procedure algopeintre is 

	fichierOFF : file_type;
	DBase : type_projet.DonBase;

	maxx, minx, maxy, miny, maxz, minz : float := 0.0;

	p_EnsPoly : type_projet.AccEns_Poly	; -- pointeur sur tab polygone

	vue : integer := 0;

	tempsD,tempsF:Ada.Real_Time.Time;
	Duree:Ada.Real_Time.Time_Span;

begin

	tempsD := Ada.Real_Time.Clock;

	--Verification des arguments pour l'execution.
	if Argument_Count < 2 or Argument_Count > 3 then
		raise ARGUMENTS_INCORRECT_ERROR;
	elsif Argument_Count = 3 then
		vue := Integer'Value(Argument(3));
		if vue < 1 or vue > 2 then
			Put_line("Erreur sur l'argument 3, vu du dessin par défaut");
			vue := 0;
		end if;
	end if;

	--On utilise les arguments pour initiliser les variables.
	declare
		nom_fichier_off : string(1..Argument(1)'length) := Argument(1);
		nom_fichier : string(1..Argument(2)'length) := Argument(2);
	begin
		--On initialise le nombre de points et de polygones pour les autres structures de données.
		lectureoff.init(fichierOFF,nom_fichier_off,DBase);

		declare
			EPoints : type_projet.Ens_points(0..DBase(0));
		begin
			--On récupère tous les points.
			lectureoff.initEnsPoints(vue,DBase(0),fichierOFF,EPoints,maxx,minx,maxy,miny,maxz,minz);

			--On récupère tous les polygones.
			lectureoff.initEnsPolygones(DBase(1),fichierOFF,p_EnsPoly,EPoints,minz,maxz); -- p_EnsPoly -> pointeur sur tab de polygone

			tempsF := Ada.Real_Time.Clock;
			Duree := tempsD - tempsF;
			Put_Line("Durée initialisation : " & Integer'Image(Duree / Milliseconds(1)));

			--On traaduit et génère un fichier PostScript.
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