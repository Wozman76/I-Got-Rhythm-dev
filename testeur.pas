program testeur;

uses sdl, sdl_mixer, IGRTypes, crt, sysutils, DateUtils, keyboard, {$ifdef Unix} unix {$endif};

CONST 	AUDIO_FREQUENCY:INTEGER=22050;
		AUDIO_FORMAT:WORD=AUDIO_S16;
		AUDIO_CHANNELS:INTEGER=2;
		AUDIO_CHUNKSIZE:INTEGER=4096;






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



procedure afficherInterface();
var i : Word;
begin
	for i := 1 to 17 do
		begin
			GotoXY(28,i);
			write('|   |   |   |   |   |');
	
		end;
		

	
	
	GotoXY(1,18);
	write('--------------------------------------------------------------------------------');

	GotoXY(28, 19);
	write('| C | V | B | N | ? |');
	GotoXY(28,21);
	write('| S   P   A   C   E |');
end;


{Procedure de mise en musique}
procedure son(var sound : pMIX_MUSIC);
begin
    if MIX_OpenAudio(AUDIO_FREQUENCY, AUDIO_FORMAT,AUDIO_CHANNELS, 
		AUDIO_CHUNKSIZE)<>0 then HALT;
	sound := MIX_LOADMUS('ressources/Irish_tavern_music.wav');

    MIX_VolumeMusic(MIX_MAX_VOLUME);
    MIX_PlayMusic(sound, -1);
end;


////////////////////////////////////////////////////////////////////////////////////////////


var tab : TabMusic;
	deb : TDateTime;
	i : Word;
	
	keyPressed : TKeyEvent;
	music: pMIX_MUSIC=NIL;

	

BEGIN
	SDL_Init(SDL_INIT_AUDIO);
	{$ifdef Unix}
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); ///enleve curseur
	{$endif}
	
	son(music);
	initTab('song1',tab);
	afficherInterface;

	deb := Now;
	
	
















	
	{while True do
	begin
		keyPressed := GetKeyEvent;
		writeln(GetKeyEventCode(keyPressed));
	end;}

	
	

	{tab[1].posY := 2;

	
	
	writeln(tab[1].temps);
	///tab[1].temps := 5000;
	
	while True do
	for i := 1 to 10 do
	begin


	if ((tab[i].temps - 300) > MilliSecondsBetween(Now, deb)) and ((tab[i].temps - 500) < MilliSecondsBetween(Now, deb)) then
		begin
		TextColor(Yellow);
		GotoXY(tab[i].posX,1);
		write(tab[i].key);
		end
	else if (tab[i].temps - 300 < MilliSecondsBetween(Now, deb)) and ((tab[i].temps + 300) > MilliSecondsBetween(Now, deb) + 300) then
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
	end;}
	
	tab[1].posX := 30;
	tab[1].posY := 2;
	delay(1500);
	while MilliSecondsBetween(Now, deb) < 1500 do
	delay(15);
	
	
	while tab[1].posY <= 18 do
	begin
		GotoXY(tab[1].posX, tab[1].posY - 1);
		write(' ');
		GotoXY(tab[1].posX, tab[1].posY);
		write('=');

		
		tab[1].posY := tab[1].posY + 1;
		sleep(100);
		
	end;


	MIX_FREEMUSIC(music);
	Mix_CloseAudio();

END.
