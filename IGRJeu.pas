unit IGRJeu;



Interface

uses sdl, sdl_mixer_nosmpeg, crt, sysutils, DateUtils, keyboard, IGRTypes, IGRInterface, IGRSon;

procedure initTab(music : String; var tab : TabMusic);
procedure partie(var sound : pMIX_MUSIC; musique : String; tab : TabMusic);
procedure verifTouche(tab : TabMusic; i : Word; deb : TDateTime; var score, compteur, b : Word);

Implementation

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
			tab[i].visible := False;

		
			case tab[i].key of 
				'c' : tab[i].posX := 30;
				'v' : tab[i].posX := 34;
				'b' : tab[i].posX := 38;
				'n' : tab[i].posX := 42;
				'?' : tab[i].posX := 46;
			end;
			
			tab[i].posY := 2;
			
		end;
end;
		
procedure partie(var sound : pMIX_MUSIC; musique : String; tab : TabMusic);
var i, minVis, maxVis : Word;
	deb : TDateTime;
	score, compteur, b : Word;

begin
minVis := 1;
score := 0;
compteur := 0;
b := 0;
son(sound, musique);
//sleep(200);
deb := Now;


while not(tab[minVis].visible) do
	begin
	if (MilliSecondsBetween(Now, Deb) > tab[minVis].temps - (18*50)) then
		begin
			tab[minVis].visible := True;
			maxVis := 1;
		end;
	end;


repeat

	
		


	if (tab[minVis].visible = False) and ((maxVis - minVis) > 0) then
			begin
			minVis := minVis + 1;
			end;



	if (MilliSecondsBetween(Now, Deb) > tab[maxVis + 1].temps - (18*50)) then
		begin
			maxVis := maxVis + 1;
			tab[maxVis].visible := True;
		end;


			GotoXY(1,1);
			write(MilliSecondsBetween(Now, Deb));
			GotoXY(1,2);
			write(score);
			GotoXY(1,3);
			write(compteur);
			GotoXY(1,4);
			write(b);


	
		
	for i := minVis to maxVis do
		begin

			if (MilliSecondsBetween(Now, Deb) > tab[i].temps) then
				begin
					tab[i].visible := False;
					GotoXY(tab[i].posX, tab[i].posY);
					write('-');
				end
				
			else 
				begin
				
				
					GotoXY(tab[i].posX, tab[i].posY - 1);
					write(' ');
					GotoXY(tab[i].posX, tab[i].posY);
					write('=');
				
				
					 if tab[i].posY + 1 <= 18 then
						tab[i].posY := tab[i].posY + 1;
			

				end;
			verifTouche(tab, i, deb, score, compteur, b);
		
		end;
	delay(50);

	
	
until (minVis = MAX);
	
		
		
end;




procedure verifTouche(tab : TabMusic; i : Word; deb : TDateTime; var score, compteur, b : Word);
var motTape : TKeyEvent;
	touche : Char;

begin
If PollKeyEvent <> 0 then		
	begin
		motTape := GetKeyEvent;
		
		touche := GetKeyEventChar(TranslateKeyEvent(motTape));
	
		if (touche = 'c') or (touche = 'v') or (touche = 'b') or (touche = 'n') or (touche = ',') then
			begin
				if touche = ',' then touche := '?';
				if  (MilliSecondsBetween(deb, Now) < tab[i].temps + 500) and (MilliSecondsBetween(deb, Now) > tab[i].temps - 100) and (touche = tab[i].key) then
					begin
						score := score + 1 * b;
						compteur := compteur + 1;
						case compteur of 
							2 : b := 2;
							4 : b := 3;
							6 : b := 4;
						end;
	
					end	
				else 
					begin
						compteur := 0;
						b := 1;
					end;
			end;
	
	end;
end;



END.
