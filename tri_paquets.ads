with type_projet; use type_projet;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package tri_paquets is

--Procedure effectuant un tri par paquet.
--pF : tableau non contraint contenant tous les points d'un polygone
--p_poly : pointeur sur le tableau de listes contenant tous les polygones trié
--minZ : minimum des Z du polygone
--min, max : minimum et maximum des Z sur tous les points
--La procédure modifie le tableau pointé par p_poly, il insère dans le polygone, défini par pF et minZ, à la bonne place
procedure triPaquet (pF : in type_projet.pointsFace; p_poly : in type_projet.AccEns_Poly; minZ, min, max : in float; nbf : in integer);

--Place sur le premier polygone du tableau de liste de polygone.
--Apoly : pointeur sur un tableau de listes trié
--Pp : pointeur sur une liste de polygone
--CaseCour : indice actuel dans le tableau
--La procédure retourne l'indice, ainsi un pointeur sur l'élément qui doit être utilisé
--Si le tableau est vide, la procédure retourne -1 pour CaseCour et null pour Pp
procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour : out integer);

--Renvoi les infos sur l'element en cours
--Pp : pointeur sur liste de polygones
--Retourne les infos du polygone courant, un pointeur sur le tableau contenant tous les points du polygone
function elemCourant(Pp: in type_projet.AListePoly) return type_projet.AccPointsFace;

--Fait avancer de 1 polygone.
--APoly : pointeur sur un tableau de listes de polygones triés
--Pp : Pointeur sur une listes de polygones
--CaseCour : indice sur la case du tableau de l'élément courant
--Procédure retournant un pointeur sur le prochain élément dans le tableau, modifie l'indice en conséquence si la procédure avance d'une ou plusieurs cases
procedure avancer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour: in out integer);

--Vérifie si on a terminé le parcours du tableau de liste de polygones.
--APoly : pointeur sur un tableau de listes de polygones triés
--CaseCour : indice de la case de l'élément courant
--Retourne vrai si l'indice est après le dernier élément
function finDeSequence (APoly: in AccEns_Poly; CaseCour: in integer) return boolean;

--EXCEPTION
--Exception levé si il y a une erreur sur le tri
INSERTION_ERROR : EXCEPTION;

end tri_paquets;
