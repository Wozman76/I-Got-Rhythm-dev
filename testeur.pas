program testeur;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses sdl, sdl_mixer_nosmpeg, crt, sysutils, DateUtils, keyboard, {$ifdef Unix} unix {$endif}, IGRTypes, IGRInterface, IGRSon, IGRJeu, IGRScore;




////////////////////////////////////////////////////////////////////////////////////////////


var tab : TabMusic;
	niveau : Word;
	musique : String;
	sound: pMIX_MUSIC=NIL;
	score : Word;
	player : Joueur;
	tabScores : HighScores;
	

BEGIN

	score := 0;
	{$ifdef Unix}
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); ///enleve curseur
	{$endif}
	
	
	
	startScreen;
	joueur(player);
	difficulte(niveau, player);

	choixMusique(niveau, musique);
	
	
	
	SDL_Init(SDL_INIT_AUDIO);

	
	initTab(musique,tab);
	afficherInterface;
	partie(sound, musique, tab, score);
	
	clrscr;
	stockageScore(player, score, tabScores, musique);
	afficherHighscores(musique, player, tabScores);
	afficherScore(score);
	


	MIX_FREEMUSIC(sound);
	Mix_CloseAudio();

END.


