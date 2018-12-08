program convertisseur;

uses IGRTypes, sysutils, crt;

var fichier : File of Touche;
	fichier2 : Text;
	tab : TabMusic;
	i : Word;
	
BEGIN

assign(fichier, 'rock.song');


reset(fichier);

for i := 1 to MAX do
	begin
	read(fichier, tab[i]);
	writeln(tab[i].key);
	end;
	
close(fichier);


assign(fichier2, 'rock.txt');
rewrite(fichier2);
for i := 1 to MAX do
begin
	if tab[i].temps <> 0 then
	begin
	writeln(fichier2, tab[i].key);
	writeln(fichier2, tab[i].temps);
	end;
end;
close(fichier2);









END.
