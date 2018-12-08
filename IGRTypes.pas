unit IGRTypes;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


Interface

Const MAX = 200;

Type Couleur = (orange, vert, rouge);

Type Touche = record
	key : Char;
	posX, posY : Word;
	temps : Longword;
	appui, visible : Boolean;

end;


Type Joueur = record
	nom : String;
	score : Word;
end;



Type TabMusic = Array[1..MAX] of Touche;
Type HighScores = array[1..10] of Joueur;


implementation


end.
