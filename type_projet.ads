package type_projet is

--Contient les coordonnées d'un point-------------------------------------------
type point is record 
	x: float;
	y: float;
	z: float;
end record;
--------------------------------------------------------------------------------

--Contient tous les sommets d'un polygone---------------------------------------
type pointsFace is array (integer range <>) of integer;
--------------------------------------------------------------------------------

--Contient tous les points déclarés dans le fichier-----------------------------
type Ens_points is array (integer range <>) of point;
--------------------------------------------------------------------------------

--Type pour les listes de polygones---------------------------------------------
--Pointe sur un tableau de sommet non contraint
type AccPointsFace is access pointsFace; --type pointeur

--Type structure permettant d'écrire la liste de polygone
--p_poly : pointeur sur un tableau contenant tous les sommets du polygone
--minZ : contient le minimum de Z de tous les sommets
type ListePoly; --Déclaration incomplète

--Pointeur
type AListePoly is access ListePoly; --type pointeur

type ListePoly is
record
	p_poly : AccPointsFace;
	minZ : float;
	Succ : AListePoly;
end record;
--------------------------------------------------------------------------------

--Contient toutes les faces formant la figure-----------------------------------
type Ens_Poly is array (integer range <>) of AListePoly;
--------------------------------------------------------------------------------

--Pointeur sur Ens_Poly---------------------------------------------------------
type AccEns_Poly is access Ens_Poly;
--------------------------------------------------------------------------------

--Contient les données de base, nombre de sommet, nombre de faces et nombre d'arretes
type DonBase is array (integer range 0..2) of integer;
--------------------------------------------------------------------------------

end type_projet;