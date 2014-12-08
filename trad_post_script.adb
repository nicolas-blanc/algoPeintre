with tri_paquets;
with Ada.Real_Time; use Ada.Real_Time;
package body trad_post_script is 

--Procedure utilisant les structures de données crées précédemment pour créer un fichier PostScipt dessinant l'image.
--Les paramètres sont le nom du fichier à créer, le pointeur sur le tableau contenant l'ensemble des polygones, un pointeur sur le tabelau contenant
--tous les points, et enfin les minimums et maximums globaux pour chaque coordonées.
procedure genererPostScript(nom_fichier : in string; APoly: in type_projet.AccEns_Poly;EPoints : in Ens_points; minx,maxx,miny,maxy,minz,maxz: in float) is

p_list: AListePoly;
k:integer:=0;
transx:float:=0.0;
transy:float:=0.0;
ratio,ratiox,ratioy:float:=0.0;
centrex,centrey: float;

Apface : AccPointsFace;
fichierPost: file_type;

tempsD,tempsF:Ada.Real_Time.Time;
Duree:Ada.Real_Time.Time_Span;

begin

	tempsD := Ada.Real_Time.Clock;

	create(fichierPost,Out_File,nom_fichier);
	Put_Line(fichierPost,"%!PS");
	Put_Line(fichierPost,"0 setlinewidth");

--Calcul des ratios d'agrandisements, des translations etc pour afficher le desson le mieux possible.
	if minx < 0.0 then transx:=-minx; end if;
	if miny < 0.0 then transy:=-miny; end if;

	ratiox:= 595.0/((maxx) - (minx));
	ratioy:= 842.0/((maxy) - (miny));

	if ratiox > ratioy then ratio:=ratioy;
	else ratio:=ratiox; 
	end if;

	Put_Line("Transx = " & Float'Image(transx));
	Put_Line("Ratio = " & Float'Image(ratio));
	--if (maxx + transx) * ratio > 590.0 or (maxy + transy) * ratio > 840.0 then
	--ratio:=ratio/2.0;
	--end if;

	centrex :=(595.0 - ((maxx+transx)*ratio))/2.0;
	centrey :=(842.0 - ((maxy+transy)*ratio))/2.0;
	if centrex <= 0.0 then centrex := 0.0; end if;
	if centrey <= 0.0 then centrey := 0.0; end if;

	--On démarre le parcours des polygones.
	tri_paquets.demarrer(APoly,p_list,k);

	-- Test sur le fichier, si il est vide, la boucle n'est pas faite
	if k /= -1 and p_list /= null then 
	
		--On parcours tous les polygones.
		while not(tri_paquets.finDeSequence (APoly,k))loop
			--On recupère l'element courant afin de le traiter.
			Apface:=tri_paquets.elemCourant(p_list);
			for j in Apface'range loop
				--On met dans le fichier PostScript les différents points composant le polygone.
				if (j=0) then Put_Line(fichierPost,Float'Image((((EPoints(Apface.all(j)).x) + transx) * ratio) + centrex)
					& " "
					& Float'Image((((EPoints(Apface.all(j)).y)+transy) * ratio) + centrey) 
					& " moveto");
				else Put_Line(fichierPost,Float'Image((((EPoints(Apface.all(j)).x) + transx) * ratio) + centrex) 
					& " " & Float'Image((((EPoints(Apface.all(j)).y)+transy) * ratio)+ centrey)
					& " lineto");
				end if;
				if (j=Apface'last) then Put_Line(fichierPost,Float'Image((((EPoints(Apface.all(0)).x) + transx) * ratio) + centrex)
					& " " & Float'Image((((EPoints(Apface.all(0)).y)+transy) * ratio)+ centrey)
					& " lineto"); 
				end if;
			end loop;
				--On finit par ajouter les elements necessaires au bon affichage du polygone.
				Put_Line(fichierPost,"gsave");
				Put_Line(fichierPost,"1 setgray");
				Put_Line(fichierPost,"fill");
				Put_Line(fichierPost,"grestore");
				Put_Line(fichierPost,"stroke");
				--Enfin, on avance dans les polygones.
				tri_paquets.avancer(APoly,p_list,k);
		end loop;
	end if;

	Put_Line(fichierPost,"showpage");

	tempsF := Ada.Real_Time.Clock;

	Duree := tempsF - tempsD;

	Put_Line("La durée de la traduction est de : " & Integer'Image(Duree / Milliseconds(1)));

end genererPostScript;

end trad_post_script;