with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with type_projet;

package body lectureoff is

procedure lectureFichierOFF (DBase : in type_projet.DonBase; f : in file_type) is
	EPoints:type_projet.Ens_points(0..DBase(0));
	EFaces: type_projet.Ens_Faces(0..DBase(1));
begin
	initEnsPoints(DBase(0),f,EPoints);
	initEnsFaces(DBase(1),f,EFaces);
end lectureFichierOFF;

--/!\ Modif Antoine 13/11
procedure init (monFichier: out file_type; nom : in string; DBase : out type_projet.DonBase) is--à transformer en fonction
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

--/!\ Modif Antoine 13/11
procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: out type_projet.Ens_points ) is
	p:type_projet.point;
begin
		for i in 0..nbs loop
			Get(f,p.x);
			Get(f,p.y);
			Get(f,p.z);
			EPoints(i):=p;	
	end loop;
end initEnsPoints;

--Rajouter modif du min et du max.
--/!\ Modif Antoine 13/11
procedure initEnsFaces (nbf: in integer; f: in file_type; EFaces: out type_projet.Ens_Faces ) is
t:integer;
begin
		for i in 0..nbf loop
		Get(f,t);
		declare
			faceTemp: type_projet.pointsFace(0..t-1);
			begin
				for j in 0..(t-1) loop
					Get(f,faceTemp(j));
				end loop;
				--EFaces(i):=faceTemp;--A modifier pour utiliser le tri paquet
			end;
	end loop;
end initEnsFaces;

end lectureoff;