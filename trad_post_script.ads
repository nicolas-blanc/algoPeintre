with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with type_projet;
use type_projet;

package trad_post_script is

--Procedure utilisant les structures de données crées précédemment pour créer un fichier PostScipt dessinant l'image.
--Les paramètres sont le nom du fichier à créer, le pointeur sur le tableau contenant l'ensemble des polygones, un pointeur sur le tabelau contenant
--tous les points, et enfin les minimums et maximums globaux pour chaque coordonées.
procedure genererPostScript(nom_fichier : in string; APoly: in type_projet.AccEns_Poly;EPoints : in Ens_points; minx,maxx,miny,maxy,minz,maxz: in float);

end trad_post_script;