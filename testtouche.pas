program testtouche;
uses Keyboard, Crt, IGRTypes, DateUtils, sysutils;



procedure verifscore (tab : TabMusic);
var mot_tape, mot_transforme : TKeyEvent;
	chaine : String;
	score, i, tempsaverif : word;
	touchaverif : char;
	
	deb : TDateTime;
begin
score := 0;
touchaverif := (' ');
InitKeyBoard();

	deb := Now;

	Repeat
		if GetKeyEvent <> 0 then;
		begin
			mot_tape := GetKeyEvent();
			mot_transforme := TranslateKeyEvent(mot_tape);
			chaine := GetKeyEventChar(mot_transforme);
			writeln ('score1 := ', score);
			
					for i := 1 to 10 do
						begin
							touchaverif := (tab[i].key);
							//writeln ('tab[i] = ', tab[i].key);
							writeln ('touchaverif = ', touchaverif);
							tempsaverif := (tab[i].temps);
							writeln ('tempsaverif := ', tempsaverif);
							writeln (MilliSecondsBetween(Now, Deb));
							If touchaverif = chaine Then
								If (tempsaverif < MilliSecondsBetween(Now, Deb)+10) or (tempsaverif > MilliSecondsBetween(Now, Deb)-10) Then
									score := score + 1;
						end;
		end;
DoneKeyBoard();
writeln ('score2 := ', score);
		
	Until (MilliSecondsBetween(Now, Deb) = 1000000);
	
end;

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
		end;
		
		
end;




var tab : TabMusic;

begin
initTab('song1',tab);;
verifscore (tab);
 end.
