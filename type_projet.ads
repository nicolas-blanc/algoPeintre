package type_projet is

--Contient les coordonnées d'un point-------------------------------------------
type point is record 
	x: float;
	y: float;
	z: float;
end record;
--------------------------------------------------------------------------------

--Cotient tous les sommets d'un polygone.---------------------------------------
type pointsFace is array (integer range <>) of integer;
--------------------------------------------------------------------------------

--Contient tous les points déclarés dans le fichier-----------------------------
type Ens_points is array (integer range <>) of point;
--------------------------------------------------------------------------------

--Type pour les listes de polygones---------------------------------------------
type AccPointsFace is access pointsFace; --type pointeur

type ListePoly; --Déclaration incomplète

type AListePoly is access ListePoly; --type pointeur

type ListePoly is
record
	p_poly : AccPoinstFaces;
	minZ : float;
	Succ : AListePoly;
end record;
--------------------------------------------------------------------------------

--Pointeur sur Ens_Poly---------------------------------------------------------
type AccEns_Poly is access Ens_Poly;
--------------------------------------------------------------------------------

--Contient toutes les faces formant la figure.----------------------------------
type Ens_Poly is array (integer range<>) of ListePoly;
--------------------------------------------------------------------------------

--Contient les données de base, nombre de sommet, nombre de faces et nombre d'arretes
type DonBase is array (integer range 0..2) of integer; --Contient le nombre de sommet/face/arrete
--------------------------------------------------------------------------------

end type_projet;