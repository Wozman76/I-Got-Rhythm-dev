program convertisseur;

uses sysutils, crt;

Const MAX = 200;


Type Touche = record
	key : Char;
	posX, posY : Word;
	temps : Word;
	visible : Boolean;

end;




Type TabMusic = Array[1..MAX] of Touche;




var fichier : File of Touche;
	fichier2 : Text;
	tab : TabMusic;
	i : Word;
	
BEGIN

assign(fichier, 'creativeminds.song');


reset(fichier);
i := 0;
while not(eof(fichier)) do
	begin
	i := i + 1 ;
	read(fichier, tab[i]);
	writeln(tab[i].temps);
	end;
	
close(fichier);


assign(fichier2, 'creativeminds.txt');
rewrite(fichier2);
for i := 1 to MAX do
begin
	if tab[i].temps <> 0 then
	begin
	write(fichier2, tab[i].key);
	write(fichier2, tab[i].temps);
	end;
end;
close(fichier2);









END.
