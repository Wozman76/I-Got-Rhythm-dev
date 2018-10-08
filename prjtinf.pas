uses keyboard;


{choix de la difficultée}
procedure difficulte(var niveau : Integer);
begin
	writeln ('quel difficulté voulez-vous? choissisez 1, 2 ou 3');
	readln (niveau);
	writeln ('vous avez choisie le niveau ', niveau);
end;

{choix de la musique en fonction de la difficultée}
procedure choixMusique(niveau : Integer ; var musique : String);
var ficMusniv : Text;
	mus : String;
	i : Word;
begin
	i := 0;
	case niveau of 
		1 : assign(ficMusniv, 'listeFacile.txt');
		2 : assign(ficMusniv, 'listeMedium.txt');
		3 : assign(ficMusniv, 'listeDifficile.txt');
	end;

	reset(ficMusniv);
	while not (eof(ficMusniv)) do
		begin
			i := i + 1;
			readln(ficMusniv, mus); 
			writeln('- ',i, ' ' + mus);
		end;
	close(ficMusniv);
		
	writeln ('quel musique voulez-vous?');
	readln (musique);
	
	writeln ('vous avez choisie la musique ', musique);
end;

{nom utilisateur}
procedure nomUser (var nom : String);
begin
	writeln ('quel est votre nom?');
	readln (nom);
end;

{si 10 * bonne touvhe b=2 si 15 bonne touches b=3 si 20 bonnes touches b=4}
{function bonus () : Integer;
var b, compteur: Integer;
begin
	compteur := 0;
	if keyboard then
		compteur := compteur + 1
		else compteur := 0;
	case compteur of 
		10 : b := 2;
		15 : b :=3;
		20 : b := 4;
	
	bonus := b
end;}


var niveau : integer;
	musique : String;
begin

	difficulte(niveau);
	choixMusique(niveau, musique);
	writeln(musique);

end.
