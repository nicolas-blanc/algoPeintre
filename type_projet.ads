package type_projet is

type point is record 
	x: float;
	y: float;
	z: float;
end record;

type p_EnsPolygone is access Ens_Faces;

--Cotient tous les sommets d'un polygone.
type pointsFace is array (integer range <>) of integer;

--Contient tous les points déclarés dans le fichier
type Ens_points is array (integer range <>) of point;

--Contient toutes les faces formant la figure.
type Ens_Faces is array (integer range<>) of pointsFace;

--Contient les données de base, nombre de sommet, nombre de faces et nombre d'arretes
type DonBase is array (integer range 0..2) of integer; --Contient le nombre de sommet/face/arrete

end type_projet;