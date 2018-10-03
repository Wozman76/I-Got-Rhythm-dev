program testeur;

uses IGRTypes, crt, sysutils, DateUtils;








procedure initTab(music : String; var tab : TabMusic);
var i : Integer;
	fichier : file of Touche;
begin

	i := 0;
	assign(fichier, music + '.song');
	reset(fichier);
	
	while not eof(fichier) do
		begin
			i := i + 1;
			read(fichier, tab[i]);
		end;
		
		
end;





////////////////////////////////////////////////////////////////////////////////////////////


var tab : TabMusic;
	deb : TDateTime;
	i : Word;

	

BEGIN
	
	initTab('song1',tab);


	deb := Now;
	



	GotoXY(1,20);
	write('--------------------------------------------');

	tab[1].posY := 2;

	
	
	writeln(tab[1].temps);
	///tab[1].temps := 5000;
	
	while True do
	for i := 1 to 10 do
	begin

	if ((MilliSecondsBetween(Now, deb) - 300) < tab[i].temps) and (tab[i].temps < (MilliSecondsBetween(Now, deb) + 300)) then
		begin
		TextColor(Green);
		GotoXY(tab[i].posX,1);
		write(tab[i].key);
		end
	else 
		begin
		TextColor(White);
		GotoXY(tab[i].posX,1);
		write(tab[i].key);	
		end;
	end;
	
	
	{while MilliSecondsBetween(Now, deb) < 5000 do;
	
	
	while tab[1].posY <= 20 do
	begin
		GotoXY(tab[1].posX, tab[1].posY - 1);
		write(' ');
		GotoXY(tab[1].posX, tab[1].posY);
		write(tab[1].key);

		
		tab[1].posY := tab[1].posY + 1;
		sleep(100);
		
	end;}




END.
