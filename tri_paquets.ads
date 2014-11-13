with type_projet;

package tri_paquets is

procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out AListePoly);--Place sur le premier triangle
procedure triPaquet (pF : in pointsFace; p_poly : in AccEns_Poly)

function elemCourant(Pp: in AListePoly) return ;--Renvoi les infos sur l'elem en cours
procedure avancer (Pp: in out AListePoly);--Fait avancer de 1 element
procedure finDeSequence ();--Vérifie si on est en fin de séquence
procedure insertionPoly (APoly: in out type_projet.AccEns_Poly; Pos: in integer; zMin: in float);

end tri_paquets;_
