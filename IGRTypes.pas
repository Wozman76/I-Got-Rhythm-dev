unit IGRTypes;

Interface

Const MAX = 100;

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







