program IGTmenu;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses crt, sysutils, keyboard;

var x,y : Word;

BEGIN





x := 36;
y := 8;

GotoXY(x, y + 1);
writeln('    ____');
GotoXY(x, y + 2);
writeln('   /  _/');
GotoXY(x, y + 3);
writeln('   / /  ');
GotoXY(x, y + 4);
writeln(' _/ /   ');
GotoXY(x, y + 5);
writeln('/___/   ');

sleep(700);
clrscr;
sleep(500);

x := 30;
y := 8;
GotoXY(x, y + 1);
writeln('   ______      __ ');
GotoXY(x, y + 2);
writeln('  / ________  / /_');
GotoXY(x, y + 3);
writeln(' / / __/ __ \/ __/');
GotoXY(x, y + 4);
writeln('/ /_/ / /_/ / /_  ');
GotoXY(x, y + 5);
writeln('\____/\____/\__/  ');

sleep(700);
clrscr;
sleep(500);

x := 18;
y := 8;

GotoXY(x, y + 1);
writeln('    ____  __          __  __            ');
GotoXY(x, y + 2);
writeln('   / __ \/ /_  __  __/ /_/ /_  ____ ___ ');
GotoXY(x, y + 3);
writeln('  / /_/ / __ \/ / / / __/ __ \/ __ `__ \');
GotoXY(x, y + 4);
writeln(' / _, _/ / / / /_/ / /_/ / / / / / / / /');
GotoXY(x, y + 5);
writeln('/_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ ');
GotoXY(x, y + 6);
writeln('            /____/                      ');



sleep(700);
clrscr;
sleep(500);


x := 8;
y := 8;

GotoXY(x, y + 1);
writeln('    ____   ______      __     ____  __          __  __            ');
GotoXY(x, y + 2);
writeln('   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ ');
GotoXY(x, y + 3);
writeln('   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \');
GotoXY(x, y + 4);
writeln(' _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /');
GotoXY(x, y + 5);
writeln('/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ ');
GotoXY(x, y + 6);
writeln('                                      /____/                      ');

sleep(2000);

writeln;
writeln('Appuyez sur [ESPACE] pour continuer...');

while GetKeyEventChar(TranslateKeyEvent(GetKeyEvent())) <> ' ' do
	sleep(10);



END.
