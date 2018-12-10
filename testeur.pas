program testeur;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses sdl, sdl_mixer_nosmpeg, crt, sysutils, keyboard,   {$ifdef Unix} unix {$endif}, IGRTypes, IGRInterface, IGRSon, IGRJeu, IGRScore;




////////////////////////////////////////////////////////////////////////////////////////////


var tab : TabMusic;
	niveau : Word;
	musique : String;
	sound: pMIX_MUSIC=NIL;
	score : Word;
	player : Joueur;
	tabScores : HighScores;
	again : Boolean;
	

BEGIN
	again := False;
	
	{$ifdef Unix}
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); ///enleve curseur
	{$endif}
	
	InitKeyBoard();
	
	//startScreen;
	
	repeat

		joueur(player);
		difficulte(niveau, player);
	
		choixMusique(niveau, musique);
		
		afficherHighscores(musique, player, tabScores);

		sleep(3000);
		
		clrscr;
		
		
		SDL_Init(SDL_INIT_AUDIO);
	
		
		initTab(musique,tab);
		afficherInterface;
		compteRebour();
		partie(sound, musique, tab, score);
		sleep(2000);
		clrscr;
		
		stockageScore(player, score, tabScores, musique);
		afficherHighscores(musique, player, tabScores);
		afficherScore(score);
		sleep(2000);
	
	



		nouvellePartie(again, player);
		MIX_FREEMUSIC(sound);
		Mix_CloseAudio();
		
	until not(again);


	DoneKeyboard();


END.


