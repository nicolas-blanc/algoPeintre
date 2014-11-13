with type_projet;

package tri_paquets is

procedure demarrer (EPoly: in type_projet.Ens_Poly; Pp: in out AListePoly);--Place sur le premier triangle
function elemCourant(Pp: in AListePoly) return ;--Renvoi les infos sur l'elem en cours

end tri_paquets;