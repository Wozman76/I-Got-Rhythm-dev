program testeur;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses sdl, sdl_mixer_nosmpeg, IGRTypes, crt, sysutils, DateUtils, keyboard, {$ifdef Unix} unix {$endif};

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
			tab[i].visible := False;
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


end;


{Procedure de mise en musique}
procedure son(var sound : pMIX_MUSIC);
begin
    if MIX_OpenAudio(AUDIO_FREQUENCY, AUDIO_FORMAT,AUDIO_CHANNELS, 
		AUDIO_CHUNKSIZE)<>0 then HALT;
	sound := MIX_LOADMUS('ressources/bensound-creativeminds.mp3');

    MIX_VolumeMusic(MIX_MAX_VOLUME);
    MIX_PlayMusic(sound, -1);
end;


////////////////////////////////////////////////////////////////////////////////////////////


var tab : TabMusic;
	deb : TDateTime;
	i,j , minVis, maxVis : Word;
	
	keyPressed : TKeyEvent;
	music: pMIX_MUSIC=NIL;
	

	

BEGIN

	//startScreen;
	
	SDL_Init(SDL_INIT_AUDIO);
	{$ifdef Unix}
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); ///enleve curseur
	{$endif}
	
	son(music);
	initTab('creativemind',tab);
	afficherInterface;

	deb := Now;

	j := 0;
	
	for i := 1 to MAX do
		begin
			case tab[i].key of 
				'c' : tab[i].posX := 30;
				'v' : tab[i].posX := 34;
				'b' : tab[i].posX := 38;
				'n' : tab[i].posX := 42;
				'?' : tab[i].posX := 46;
			end;
			
			tab[i].posY := 2;
			
		
		end;
		
		

		
/////////////////////////////////////	
minVis := 1;
son(music);
sleep(300);


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
		
		end;
	j := j + 1;
	delay(50);

	
	
until minVis = MAX;


	


	MIX_FREEMUSIC(music);
	Mix_CloseAudio();

END.


