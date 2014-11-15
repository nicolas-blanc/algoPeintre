with type_projet;

package tri_paquets is

procedure triPaquet (pF : in type_projet.pointsFace; p_poly : in type_projet.AccEns_Poly; minZ, min, max : in float; nbf : in integer);
procedure insertionPoly (p_poly: in type_projet.AccEns_Poly; pF : in type_projet.pointsFace; minZ: in float; indice : in integer);
procedure insertionListPoly (list : in out type_projet.ListPoly; pF : in type_projet.pointsFace; minZ : in float);		

procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out AListePoly);--Place sur le premier triangle
function elemCourant(Pp: in AListePoly) return ;--Renvoi les infos sur l'elem en cours
procedure avancer (Pp: in out AListePoly);--Fait avancer de 1 element
procedure finDeSequence ();--Vérifie si on est en fin de séquence

end tri_paquets;_
