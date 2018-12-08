program convertisseur2;
uses IGRTypes, sysutils;




var fichier : File of Touche;
	fichier2 : Text;
	i : Word;
	tab : TabMusic;


BEGIN
assign(fichier, 'rock.song2');
assign(fichier2, 'rock.txt');

reset(fichier2);
for i := 1 to MAX do
begin

	readln(fichier2, tab[i].key);
	readln(fichier2, tab[i].temps);
end;
close(fichier2);

rewrite(fichier);
for i := 1 to MAX do
	begin
	write(fichier, tab[i]);
	end;
close(fichier);


END.
