with type_projet;

package tri_paquets is

procedure triPaquet (pF : in pointsFace; p_poly : in AccEns_Poly)

procedure demarrer (EPoly: in type_projet.Ens_Poly; Pp: in out AListePoly);--Place sur le premier triangle
function elemCourant(Pp: in AListePoly) return ;--Renvoi les infos sur l'elem en cours

end tri_paquets;_