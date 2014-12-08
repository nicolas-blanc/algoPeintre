with type_projet;
use type_projet;
with Ada.Text_IO; 
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package tri_paquets is

--Procedure effectuant un tri par paquet.
procedure triPaquet (pF : in type_projet.pointsFace; p_poly : in type_projet.AccEns_Poly; minZ, min, max : in float; nbf : in integer); -- Effectue le tri_paquet sur un polygone

--Effectue une insertion triée dans une liste.
Procedure insertGrowing (l: in out AListePoly; elem: in ListePoly);

--Place sur le premier polygone du tableau de liste de polygone.
procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour : out integer);--Place sur le premier triangle

--Renvoi les infos sur l'element en cours
function elemCourant(Pp: in type_projet.AListePoly) return type_projet.AccPointsFace;--Renvoi les infos sur l'elem en cours

--Fait avancer de 1 polygone.
procedure avancer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour: in out integer);--Fait avancer de 1 element

--Vérifie si on a terminé le parcours du tableau de liste de polygones.
function finDeSequence (APoly: in AccEns_Poly; CaseCour: in integer) return boolean;--Vérifie si on est en fin de séquence


--EXCEPTION
--Exception levé si il y a une erreur sur le tri
INSERTION_ERROR : EXCEPTION;

end tri_paquets;
