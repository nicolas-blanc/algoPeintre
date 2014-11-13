with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with type_projet;
use type_projet;

package body lectureoff is

procedure init (monFichier: out file_type; nom : in string; DBase : out DonBase) is
	s1:string(0..2);
begin
	open(monFichier,In_File,nom);
	Get(monFichier,s1);
	if s1 = "OFF" then
		Get(monFichier,DBase(0));
		Get(monFichier,DBase(1));
		Get(monFichier,DBase(2));
	end if;
end init;

procedure close (nom_fichier : in string) is
begin
	Ada.Text_IO.close(nom_fichier);
end close

procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: out Ens_points; max, min : in out float) is
	p:point;
begin -- Modif Nico 13/11
	Get(f,p.x);
	Get(f,p.y);
	Get(f,p.z);
	EPoints(i):=p;

	max := p.z;
	min := p.z;

	for i in 1..nbs loop
		Get(f,p.x);
		Get(f,p.y);
		Get(f,p.z);
		EPoints(i):=p;
		if p.z < min then
			min := p.z;
		elsif p.z > max then
			max := p.z;
		end if;
	end loop;
end initEnsPoints;

procedure initEnsFaces (nbf: in integer; f: in file_type; p: out p_EnsPolygone ) is
	p : p_EnsPolygone := new Ens_Poly(0..nbf);
	t : integer;
begin
	for i in 0..nbf loop
		Get(f,t);
		declare
			faceTemp : type_projet.pointsFace(0..(t-1));
		begin
			for j in 0..(t-1) loop
				tri_paquets.tri_paquet(p,faceTemp);
			end loop;
	end loop;
end initEnsFaces;

procedure triPaquet (p : in pointsFace; )

end lectureoff;