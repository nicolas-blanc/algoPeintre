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

procedure triPaquet (pF : in type_projet.pointsFace; p_poly : in type_projet.AccEns_Poly; minZ, min, max : in float; nbf : in integer);

--Place sur le premier polygone du tableau de liste de polygone.
procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour : out integer);

--Renvoi les infos sur l'element en cours
function elemCourant(Pp: in type_projet.AListePoly) return type_projet.AccPointsFace;

--Fait avancer de 1 polygone.
procedure avancer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour: in out integer);

--Vérifie si on a terminé le parcours du tableau de liste de polygones.
function finDeSequence (APoly: in AccEns_Poly; CaseCour: in integer) return boolean;

--EXCEPTION
--Exception levé si il y a une erreur sur le tri
INSERTION_ERROR : EXCEPTION;

end tri_paquets;
