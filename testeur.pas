program testeur;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses sdl, sdl_mixer_nosmpeg, crt, sysutils, DateUtils, keyboard, {$ifdef Unix} unix {$endif}, IGRTypes, IGRInterface, IGRSon, IGRJeu;




////////////////////////////////////////////////////////////////////////////////////////////


var tab : TabMusic;
	niveau : Integer;
	musique, user : String;
	sound: pMIX_MUSIC=NIL;
	

	

BEGIN
	{$ifdef Unix}
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); ///enleve curseur
	{$endif}
	
	
	
	startScreen;
	nomUser(user);
	difficulte(niveau, user);
	choixMusique(niveau,musique);
	
	
	
	
	SDL_Init(SDL_INIT_AUDIO);

	
	initTab(musique,tab);
	afficherInterface;
	partie(sound, musique, tab);
	


	MIX_FREEMUSIC(sound);
	Mix_CloseAudio();

END.


