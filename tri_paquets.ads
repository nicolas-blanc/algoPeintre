with type_projet;
use type_projet;
with Ada.Text_IO; 
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package tri_paquets is

procedure triPaquet (pF : in type_projet.pointsFace; p_poly : in type_projet.AccEns_Poly; minZ, min, max : in float; nbf : in integer); -- Effectue le tri_paquet sur un polygone
procedure insertionTabPoly (p_poly: in type_projet.AccEns_Poly; pF : in type_projet.pointsFace; minZ: in float; indice : in integer); -- Place le polygone ' l'indice dans le tableau
procedure insertionListPoly (list : in out type_projet.AListePoly; pF : in type_projet.pointsFace; minZ : in float); -- insere l'élément dans la liste par ordre croissant sur le minZ
--function insereTete (list : in type_projet.AListePoly; pF : in type_projet.pointsFace; minZ : in float) return type_projet.AListePoly; -- Insere l'élément dans le début de laliste donné en paramère
procedure insereTete (list: in out AListePoly; elem: in ListePoly);

procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour : out integer);--Place sur le premier triangle
function elemCourant(Pp: in type_projet.AListePoly) return type_projet.AccPointsFace;--Renvoi les infos sur l'elem en cours
procedure avancer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour: in out integer);--Fait avancer de 1 element
function finDeSequence (APoly: in AccEns_Poly; CaseCour: in integer) return boolean;--Vérifie si on est en fin de séquence

end tri_paquets;
