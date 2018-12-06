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
	temps, posX, posY : Word;
	couleur : Couleur;
	visible : Boolean;
end;

Type TabMusic = Array[1..MAX] of Touche;



implementation


end.
