with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with type_projet; use type_projet;

package trad_post_script is

--Procedure utilisant les structures de données crées précédemment pour créer un fichier PostScipt dessinant l'image.
--nom_fichier : contient le nom du fichier Post Script qui sera générer
--APoly : contient le pointeur vers le tableau de liste contenant tous les polygones triés
--min, max : contient les minimuns et maximums sur chaque axe de tous les points du dessin
procedure genererPostScript(nom_fichier : in string; APoly: in type_projet.AccEns_Poly;EPoints : in Ens_points; minx,maxx,miny,maxy,minz,maxz: in float);

end trad_post_script;