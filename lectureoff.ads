with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;
with type_projet;
with tri_paquets;


package lectureoff is

--Procedure initialisant le nombre de points et de polygnes que contient le fichier.
--Necessaire pour l'initialisation des autres srucutres de données.
--monFichier : variable contenant le flux du fichier, donner par la variable nom
--DBase : tableau de taille 3 qui contient le nombre de sommet, polygone et arretes
--La procédure retourne le fichier ouvert et DBase initialisé
procedure init (monFichier: out file_type; nom : in string; DBase : out type_projet.DonBase);

--Procédure permettant de fermer le fichier
--Le fichier f doit être ouvert
procedure close (f : in out file_type);

--Procedure remplissant le tableau de points en les lisant dans le fichier.
--Créer un point differement selon le type de vue choisie.
--vue : contient la vue que dans lequel va être placé le dessin, il est comprit entre 0 (vue par défaut) et 2
--nbs : contient le nombre de sommet du dessin
--f : variable permettant la lecture du fichier
--EPoints : tableau contenant l'ensemble des points du dessin
--max, min (x,y et z) : retourne les valeurs maximun et minimum de chaque axe, par rapport à tous les autres points
--Procédure retourne le tableau EPoints initialisé et les points min et max
procedure initEnsPoints (vue, nbs: in integer; f: in file_type; EPoints: out type_projet.Ens_points; maxx,minx,maxy,miny,maxz,minz : in out float);

--Procedure lisant l'ensemble des polygones.
--Remplit le tableau de liste de polygones.
--nbf : contient le nombre de polygones dans le dessin
--f : variable permettant la lecture du fichier
--p_poly : contient un pointeur vers le tableau de polygone trié
--Epoints : tableau qui contient en entrée tous les points du dessin
--min, max : contient le minimum et le maximum en Z de tous les points
--Procedure qui retourne le un pointeur sur un tableau de liste contenant des polygones trié par rapport à Z
procedure initEnsPolygones (nbf: in integer; f: in file_type; p_poly: out type_projet.AccEns_Poly; EPoints: in type_projet.Ens_points; min, max : in float);

-- EXCEPTIONS
--Exception levé si le nombre de lignes dans le fichier est incorrect par rapport à la déclaration
NBR_LIGNES_ERROR : EXCEPTION;

end lectureoff;