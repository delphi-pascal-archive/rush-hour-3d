unit Unit_Car;

interface

uses
  DGLopengl;

Procedure DrawBox(X,Y,Z: single);
Procedure Drawplayer;
Procedure DrawCar;
procedure DrawTruck;

implementation

Procedure DrawBox(X,Y,Z: single);
{ Creer une liste d'affichage representant une boite }
Var
  MinX, MinY, MinZ, MaxX, MaxY, MaxZ: Single;
begin
  MinX := - X / 2 ;
  MinY := - Y / 2 ;
  MinZ := - Z / 2 ;
  MaxX :=  X / 2 ;
  MaxY :=  Y / 2 ;
  MaxZ :=  Z / 2 ;

  glBegin(GL_QUADS);
  glNormal3f(0, 0, 1);
   glVertex3f( MinX, MinY, MaxZ);
   glVertex3f( MaxX, MinY, MaxZ);
   glVertex3f( MaxX, MaxY, MaxZ);
   glVertex3f( MinX, MaxY, MaxZ);
  glNormal3f(0, 0, -1);
   glVertex3f( MinX, MinY, MinZ);
   glVertex3f( MinX, MaxY, MinZ);
   glVertex3f( MaxX, MaxY, MinZ);
   glVertex3f( MaxX, MinY, MinZ);
  glNormal3f(0, 1, 0);
   glVertex3f( MinX, MaxY, MinZ);
   glVertex3f( MinX, MaxY, MaxZ);
   glVertex3f( MaxX, MaxY, MaxZ);
   glVertex3f( MaxX, MaxY, MinZ);
  glNormal3f(0, -1, 0);
   glVertex3f( MinX, MinY, MinZ);
   glVertex3f( MaxX, MinY, MinZ);
   glVertex3f( MaxX, MinY, MaxZ);
   glVertex3f( MinX, MinY, MaxZ);
  glNormal3f(1, 0, 0);
   glVertex3f( MaxX, MinY, MinZ);
   glVertex3f( MaxX, MaxY, MinZ);
   glVertex3f( MaxX, MaxY, MaxZ);
   glVertex3f( MaxX, MinY, MaxZ);
  glNormal3f(-1, 0, 0);
   glVertex3f( MinX, MinY, MinZ);
   glVertex3f( MinX, MinY, MaxZ);
   glVertex3f( MinX, MaxY, MaxZ);
   glVertex3f( MinX, MaxY, MinZ);
  glEnd;
end;

procedure DrawCar;
begin
glScalef(0.1,0.1,0.1);
glBegin(GL_TRIANGLES);
glNormal3f(0, 0.242535620927811, -0.970142483711243);
glVertex3f(-9, -3, -4);
glVertex3f(-8, 1, -3);
glVertex3f(7, 1, -3);

glNormal3f(0, 0.242535620927811, -0.970142483711243);
glVertex3f(-9, -3, -4);
glVertex3f(7, 1, -3);
glVertex3f(9, -3, -4);

glNormal3f(0, 0.242535620927811, 0.970142483711243);
glVertex3f(-9, -3, 4);
glVertex3f(9, -3, 4);
glVertex3f(7, 1, 3);

glNormal3f(0, 0.242535620927811, 0.970142483711243);
glVertex3f(-9, -3, 4);
glVertex3f(7, 1, 3);
glVertex3f(-8, 1, 3);

glNormal3f(0.894427180290222, 0.447213590145111, 0);
glVertex3f(9, -3, 4);
glVertex3f(9, -3, -4);
glVertex3f(7, 1, -3);

glNormal3f(0.894427180290222, 0.447213590145111, 0);
glVertex3f(9, -3, 4);
glVertex3f(7, 1, -3);
glVertex3f(7, 1, 3);

glNormal3f(-0.970142543315887, 0.242535635828972, 0);
glVertex3f(-9, -3, -4);
glVertex3f(-9, -3, 4);
glVertex3f(-8, 1, 3);

glNormal3f(-0.970142483711243, 0.242535620927811, 0);
glVertex3f(-9, -3, -4);
glVertex3f(-8, 1, 3);
glVertex3f(-8, 1, -3);

glNormal3f(0, 1, 0);
glVertex3f(-8, 1, 3);
glVertex3f(7, 1, 3);
glVertex3f(7, 1, -3);

glNormal3f(0, 1, 0);
glVertex3f(-8, 1, 3);
glVertex3f(7, 1, -3);
glVertex3f(-8, 1, -3);

glNormal3f(0, -1, 0);
glVertex3f(-9, -3, -4);
glVertex3f(9, -3, -4);
glVertex3f(9, -3, 4);

glNormal3f(0, -1, 0);
glVertex3f(-9, -3, -4);
glVertex3f(9, -3, 4);
glVertex3f(-9, -3, 4);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, -4);
glVertex3f(-8, -3, -4);
glVertex3f(-4, -3, -4);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, -4);
glVertex3f(-4, -3, -4);
glVertex3f(-5, -5, -4);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, -2);
glVertex3f(-5, -5, -2);
glVertex3f(-4, -3, -2);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, -2);
glVertex3f(-4, -3, -2);
glVertex3f(-8, -3, -2);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, -2);
glVertex3f(-5, -5, -4);
glVertex3f(-4, -3, -4);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, -2);
glVertex3f(-4, -3, -4);
glVertex3f(-4, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-7, -5, -2);
glVertex3f(-8, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-8, -3, -2);
glVertex3f(-8, -3, -4);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-5, -5, -4);
glVertex3f(-5, -5, -2);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-5, -5, -2);
glVertex3f(-7, -5, -2);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, -4);
glVertex3f(3, -3, -4);
glVertex3f(7, -3, -4);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, -4);
glVertex3f(7, -3, -4);
glVertex3f(6, -5, -4);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, -2);
glVertex3f(6, -5, -2);
glVertex3f(7, -3, -2);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, -2);
glVertex3f(7, -3, -2);
glVertex3f(3, -3, -2);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, -2);
glVertex3f(6, -5, -4);
glVertex3f(7, -3, -4);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, -2);
glVertex3f(7, -3, -4);
glVertex3f(7, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, -4);
glVertex3f(4, -5, -2);
glVertex3f(3, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, -4);
glVertex3f(3, -3, -2);
glVertex3f(3, -3, -4);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, -4);
glVertex3f(6, -5, -4);
glVertex3f(6, -5, -2);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, -4);
glVertex3f(6, -5, -2);
glVertex3f(4, -5, -2);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, 1);
glVertex3f(3, -3, 1);
glVertex3f(7, -3, 1);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, 1);
glVertex3f(7, -3, 1);
glVertex3f(6, -5, 1);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, 3);
glVertex3f(6, -5, 3);
glVertex3f(7, -3, 3);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, 3);
glVertex3f(7, -3, 3);
glVertex3f(3, -3, 3);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, 3);
glVertex3f(6, -5, 1);
glVertex3f(7, -3, 1);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, 3);
glVertex3f(7, -3, 1);
glVertex3f(7, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, 1);
glVertex3f(4, -5, 3);
glVertex3f(3, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, 1);
glVertex3f(3, -3, 3);
glVertex3f(3, -3, 1);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, 1);
glVertex3f(6, -5, 1);
glVertex3f(6, -5, 3);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, 1);
glVertex3f(6, -5, 3);
glVertex3f(4, -5, 3);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, 1);
glVertex3f(-8, -3, 1);
glVertex3f(-4, -3, 1);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, 1);
glVertex3f(-4, -3, 1);
glVertex3f(-5, -5, 1);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, 3);
glVertex3f(-5, -5, 3);
glVertex3f(-4, -3, 3);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, 3);
glVertex3f(-4, -3, 3);
glVertex3f(-8, -3, 3);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, 3);
glVertex3f(-5, -5, 1);
glVertex3f(-4, -3, 1);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, 3);
glVertex3f(-4, -3, 1);
glVertex3f(-4, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-7, -5, 3);
glVertex3f(-8, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-8, -3, 3);
glVertex3f(-8, -3, 1);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-5, -5, 1);
glVertex3f(-5, -5, 3);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-5, -5, 3);
glVertex3f(-7, -5, 3);

glNormal3f(0, 0.196116134524345, -0.980580627918243);
glVertex3f(-5, 1, -3);
glVertex3f(-4, 6, -2);
glVertex3f(1, 6, -2);

glNormal3f(0, 0.196116134524345, -0.980580687522888);
glVertex3f(-5, 1, -3);
glVertex3f(1, 6, -2);
glVertex3f(3, 1, -3);

glNormal3f(0, 0.196116134524345, 0.980580687522888);
glVertex3f(-5, 1, 3);
glVertex3f(3, 1, 3);
glVertex3f(1, 6, 2);

glNormal3f(0, 0.196116134524345, 0.980580627918243);
glVertex3f(-5, 1, 3);
glVertex3f(1, 6, 2);
glVertex3f(-4, 6, 2);

glNormal3f(0.928476691246033, 0.371390670537949, 0);
glVertex3f(3, 1, 3);
glVertex3f(3, 1, -3);
glVertex3f(1, 6, -2);

glNormal3f(0.928476691246033, 0.371390670537949, 0);
glVertex3f(3, 1, 3);
glVertex3f(1, 6, -2);
glVertex3f(1, 6, 2);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(-5, 1, -3);
glVertex3f(-5, 1, 3);
glVertex3f(-4, 6, 2);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(-5, 1, -3);
glVertex3f(-4, 6, 2);
glVertex3f(-4, 6, -2);

glNormal3f(0, 1, 0);
glVertex3f(-4, 6, 2);
glVertex3f(1, 6, 2);
glVertex3f(1, 6, -2);

glNormal3f(0, 1, 0);
glVertex3f(-4, 6, 2);
glVertex3f(1, 6, -2);
glVertex3f(-4, 6, -2);

glEnd;
end;

{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

procedure DrawTRuck;
begin
glScalef(0.1,0.1,0.1);

glBegin(GL_TRIANGLES);
glNormal3f(0, 0, -1);
glVertex3f(-12.5, -3.5, -4);
glVertex3f(-12.5, 0.5, -4);
glVertex3f(12.5, 0.5, -4);

glNormal3f(0, 0, -1);
glVertex3f(-12.5, -3.5, -4);
glVertex3f(12.5, 0.5, -4);
glVertex3f(12.5, -3.5, -4);

glNormal3f(0, 0, 1);
glVertex3f(-12.5, -3.5, 4);
glVertex3f(12.5, -3.5, 4);
glVertex3f(12.5, 0.5, 4);

glNormal3f(0, 0, 1);
glVertex3f(-12.5, -3.5, 4);
glVertex3f(12.5, 0.5, 4);
glVertex3f(-12.5, 0.5, 4);

glNormal3f(1, 0, 0);
glVertex3f(12.5, -3.5, 4);
glVertex3f(12.5, -3.5, -4);
glVertex3f(12.5, 0.5, -4);

glNormal3f(1, 0, 0);
glVertex3f(12.5, -3.5, 4);
glVertex3f(12.5, 0.5, -4);
glVertex3f(12.5, 0.5, 4);

glNormal3f(-1, 0, 0);
glVertex3f(-12.5, -3.5, -4);
glVertex3f(-12.5, -3.5, 4);
glVertex3f(-12.5, 0.5, 4);

glNormal3f(-1, 0, 0);
glVertex3f(-12.5, -3.5, -4);
glVertex3f(-12.5, 0.5, 4);
glVertex3f(-12.5, 0.5, -4);

glNormal3f(0, 1, 0);
glVertex3f(-12.5, 0.5, 4);
glVertex3f(12.5, 0.5, 4);
glVertex3f(12.5, 0.5, -4);

glNormal3f(0, 1, 0);
glVertex3f(-12.5, 0.5, 4);
glVertex3f(12.5, 0.5, -4);
glVertex3f(-12.5, 0.5, -4);

glNormal3f(0, -1, 0);
glVertex3f(-12.5, -3.5, -4);
glVertex3f(12.5, -3.5, -4);
glVertex3f(12.5, -3.5, 4);

glNormal3f(0, -1, 0);
glVertex3f(-12.5, -3.5, -4);
glVertex3f(12.5, -3.5, 4);
glVertex3f(-12.5, -3.5, 4);

glNormal3f(0, 0, -1);
glVertex3f(-9.5, -5.5, -4);
glVertex3f(-10.5, -3.5, -4);
glVertex3f(-6.5, -3.5, -4);

glNormal3f(0, 0, -1);
glVertex3f(-9.5, -5.5, -4);
glVertex3f(-6.5, -3.5, -4);
glVertex3f(-7.5, -5.5, -4);

glNormal3f(0, 0, 1);
glVertex3f(-9.5, -5.5, -2);
glVertex3f(-7.5, -5.5, -2);
glVertex3f(-6.5, -3.5, -2);

glNormal3f(0, 0, 1);
glVertex3f(-9.5, -5.5, -2);
glVertex3f(-6.5, -3.5, -2);
glVertex3f(-10.5, -3.5, -2);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7.5, -5.5, -2);
glVertex3f(-7.5, -5.5, -4);
glVertex3f(-6.5, -3.5, -4);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7.5, -5.5, -2);
glVertex3f(-6.5, -3.5, -4);
glVertex3f(-6.5, -3.5, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-9.5, -5.5, -4);
glVertex3f(-9.5, -5.5, -2);
glVertex3f(-10.5, -3.5, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-9.5, -5.5, -4);
glVertex3f(-10.5, -3.5, -2);
glVertex3f(-10.5, -3.5, -4);

glNormal3f(0, -1, 0);
glVertex3f(-9.5, -5.5, -4);
glVertex3f(-7.5, -5.5, -4);
glVertex3f(-7.5, -5.5, -2);

glNormal3f(0, -1, 0);
glVertex3f(-9.5, -5.5, -4);
glVertex3f(-7.5, -5.5, -2);
glVertex3f(-9.5, -5.5, -2);

glNormal3f(0, 0, -1);
glVertex3f(7.5, -5.5, -4);
glVertex3f(6.5, -3.5, -4);
glVertex3f(10.5, -3.5, -4);

glNormal3f(0, 0, -1);
glVertex3f(7.5, -5.5, -4);
glVertex3f(10.5, -3.5, -4);
glVertex3f(9.5, -5.5, -4);

glNormal3f(0, 0, 1);
glVertex3f(7.5, -5.5, -2);
glVertex3f(9.5, -5.5, -2);
glVertex3f(10.5, -3.5, -2);

glNormal3f(0, 0, 1);
glVertex3f(7.5, -5.5, -2);
glVertex3f(10.5, -3.5, -2);
glVertex3f(6.5, -3.5, -2);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(9.5, -5.5, -2);
glVertex3f(9.5, -5.5, -4);
glVertex3f(10.5, -3.5, -4);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(9.5, -5.5, -2);
glVertex3f(10.5, -3.5, -4);
glVertex3f(10.5, -3.5, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(7.5, -5.5, -4);
glVertex3f(7.5, -5.5, -2);
glVertex3f(6.5, -3.5, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(7.5, -5.5, -4);
glVertex3f(6.5, -3.5, -2);
glVertex3f(6.5, -3.5, -4);

glNormal3f(0, -1, 0);
glVertex3f(7.5, -5.5, -4);
glVertex3f(9.5, -5.5, -4);
glVertex3f(9.5, -5.5, -2);

glNormal3f(0, -1, 0);
glVertex3f(7.5, -5.5, -4);
glVertex3f(9.5, -5.5, -2);
glVertex3f(7.5, -5.5, -2);

glNormal3f(0, 0, -1);
glVertex3f(7.5, -5.5, 1);
glVertex3f(6.5, -3.5, 1);
glVertex3f(10.5, -3.5, 1);

glNormal3f(0, 0, -1);
glVertex3f(7.5, -5.5, 1);
glVertex3f(10.5, -3.5, 1);
glVertex3f(9.5, -5.5, 1);

glNormal3f(0, 0, 1);
glVertex3f(7.5, -5.5, 3);
glVertex3f(9.5, -5.5, 3);
glVertex3f(10.5, -3.5, 3);

glNormal3f(0, 0, 1);
glVertex3f(7.5, -5.5, 3);
glVertex3f(10.5, -3.5, 3);
glVertex3f(6.5, -3.5, 3);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(9.5, -5.5, 3);
glVertex3f(9.5, -5.5, 1);
glVertex3f(10.5, -3.5, 1);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(9.5, -5.5, 3);
glVertex3f(10.5, -3.5, 1);
glVertex3f(10.5, -3.5, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(7.5, -5.5, 1);
glVertex3f(7.5, -5.5, 3);
glVertex3f(6.5, -3.5, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(7.5, -5.5, 1);
glVertex3f(6.5, -3.5, 3);
glVertex3f(6.5, -3.5, 1);

glNormal3f(0, -1, 0);
glVertex3f(7.5, -5.5, 1);
glVertex3f(9.5, -5.5, 1);
glVertex3f(9.5, -5.5, 3);

glNormal3f(0, -1, 0);
glVertex3f(7.5, -5.5, 1);
glVertex3f(9.5, -5.5, 3);
glVertex3f(7.5, -5.5, 3);

glNormal3f(0, 0, -1);
glVertex3f(-9.5, -5.5, 1);
glVertex3f(-10.5, -3.5, 1);
glVertex3f(-6.5, -3.5, 1);

glNormal3f(0, 0, -1);
glVertex3f(-9.5, -5.5, 1);
glVertex3f(-6.5, -3.5, 1);
glVertex3f(-7.5, -5.5, 1);

glNormal3f(0, 0, 1);
glVertex3f(-9.5, -5.5, 3);
glVertex3f(-7.5, -5.5, 3);
glVertex3f(-6.5, -3.5, 3);

glNormal3f(0, 0, 1);
glVertex3f(-9.5, -5.5, 3);
glVertex3f(-6.5, -3.5, 3);
glVertex3f(-10.5, -3.5, 3);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7.5, -5.5, 3);
glVertex3f(-7.5, -5.5, 1);
glVertex3f(-6.5, -3.5, 1);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7.5, -5.5, 3);
glVertex3f(-6.5, -3.5, 1);
glVertex3f(-6.5, -3.5, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-9.5, -5.5, 1);
glVertex3f(-9.5, -5.5, 3);
glVertex3f(-10.5, -3.5, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-9.5, -5.5, 1);
glVertex3f(-10.5, -3.5, 3);
glVertex3f(-10.5, -3.5, 1);

glNormal3f(0, -1, 0);
glVertex3f(-9.5, -5.5, 1);
glVertex3f(-7.5, -5.5, 1);
glVertex3f(-7.5, -5.5, 3);

glNormal3f(0, -1, 0);
glVertex3f(-9.5, -5.5, 1);
glVertex3f(-7.5, -5.5, 3);
glVertex3f(-9.5, -5.5, 3);

glNormal3f(0, 0.196116134524345, -0.980580627918243);
glVertex3f(3.5, 0.5, -4);
glVertex3f(4.5, 5.5, -3);
glVertex3f(9.5, 5.5, -3);

glNormal3f(0, 0.196116134524345, -0.980580687522888);
glVertex3f(3.5, 0.5, -4);
glVertex3f(9.5, 5.5, -3);
glVertex3f(11.5, 0.5, -4);

glNormal3f(0, 0.196116134524345, 0.980580687522888);
glVertex3f(3.5, 0.5, 4);
glVertex3f(11.5, 0.5, 4);
glVertex3f(9.5, 5.5, 3);

glNormal3f(0, 0.196116134524345, 0.980580627918243);
glVertex3f(3.5, 0.5, 4);
glVertex3f(9.5, 5.5, 3);
glVertex3f(4.5, 5.5, 3);

glNormal3f(0.928476691246033, 0.371390670537949, 0);
glVertex3f(11.5, 0.5, 4);
glVertex3f(11.5, 0.5, -4);
glVertex3f(9.5, 5.5, -3);

glNormal3f(0.928476691246033, 0.371390670537949, 0);
glVertex3f(11.5, 0.5, 4);
glVertex3f(9.5, 5.5, -3);
glVertex3f(9.5, 5.5, 3);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(3.5, 0.5, -4);
glVertex3f(3.5, 0.5, 4);
glVertex3f(4.5, 5.5, 3);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(3.5, 0.5, -4);
glVertex3f(4.5, 5.5, 3);
glVertex3f(4.5, 5.5, -3);

glNormal3f(0, 1, 0);
glVertex3f(4.5, 5.5, 3);
glVertex3f(9.5, 5.5, 3);
glVertex3f(9.5, 5.5, -3);

glNormal3f(0, 1, 0);
glVertex3f(4.5, 5.5, 3);
glVertex3f(9.5, 5.5, -3);
glVertex3f(4.5, 5.5, -3);

glNormal3f(0, 0.196116119623184, -0.980580627918243);
glVertex3f(-12.5, 0.5, -4);
glVertex3f(-11.5, 5.5, -3);
glVertex3f(2.5, 5.5, -3);

glNormal3f(0, 0.196116134524345, -0.980580687522888);
glVertex3f(-12.5, 0.5, -4);
glVertex3f(2.5, 5.5, -3);
glVertex3f(3.5, 0.5, -4);

glNormal3f(0, 0.196116134524345, 0.980580687522888);
glVertex3f(-12.5, 0.5, 4);
glVertex3f(3.5, 0.5, 4);
glVertex3f(2.5, 5.5, 3);

glNormal3f(0, 0.196116119623184, 0.980580627918243);
glVertex3f(-12.5, 0.5, 4);
glVertex3f(2.5, 5.5, 3);
glVertex3f(-11.5, 5.5, 3);

glNormal3f(0.980580687522888, 0.196116134524345, 0);
glVertex3f(3.5, 0.5, 4);
glVertex3f(3.5, 0.5, -4);
glVertex3f(2.5, 5.5, -3);

glNormal3f(0.980580687522888, 0.196116134524345, 0);
glVertex3f(3.5, 0.5, 4);
glVertex3f(2.5, 5.5, -3);
glVertex3f(2.5, 5.5, 3);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(-12.5, 0.5, -4);
glVertex3f(-12.5, 0.5, 4);
glVertex3f(-11.5, 5.5, 3);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(-12.5, 0.5, -4);
glVertex3f(-11.5, 5.5, 3);
glVertex3f(-11.5, 5.5, -3);

glNormal3f(0, 1, 0);
glVertex3f(-11.5, 5.5, 3);
glVertex3f(2.5, 5.5, 3);
glVertex3f(2.5, 5.5, -3);

glNormal3f(0, 1, 0);
glVertex3f(-11.5, 5.5, 3);
glVertex3f(2.5, 5.5, -3);
glVertex3f(-11.5, 5.5, -3);

glNormal3f(0, 0, -1);
glVertex3f(-3.5, -5.5, -4);
glVertex3f(-4.5, -3.5, -4);
glVertex3f(-0.5, -3.5, -4);

glNormal3f(0, 0, -1);
glVertex3f(-3.5, -5.5, -4);
glVertex3f(-0.5, -3.5, -4);
glVertex3f(-1.5, -5.5, -4);

glNormal3f(0, 0, 1);
glVertex3f(-3.5, -5.5, -2);
glVertex3f(-1.5, -5.5, -2);
glVertex3f(-0.5, -3.5, -2);

glNormal3f(0, 0, 1);
glVertex3f(-3.5, -5.5, -2);
glVertex3f(-0.5, -3.5, -2);
glVertex3f(-4.5, -3.5, -2);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-1.5, -5.5, -2);
glVertex3f(-1.5, -5.5, -4);
glVertex3f(-0.5, -3.5, -4);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-1.5, -5.5, -2);
glVertex3f(-0.5, -3.5, -4);
glVertex3f(-0.5, -3.5, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-3.5, -5.5, -4);
glVertex3f(-3.5, -5.5, -2);
glVertex3f(-4.5, -3.5, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-3.5, -5.5, -4);
glVertex3f(-4.5, -3.5, -2);
glVertex3f(-4.5, -3.5, -4);

glNormal3f(0, -1, 0);
glVertex3f(-3.5, -5.5, -4);
glVertex3f(-1.5, -5.5, -4);
glVertex3f(-1.5, -5.5, -2);

glNormal3f(0, -1, 0);
glVertex3f(-3.5, -5.5, -4);
glVertex3f(-1.5, -5.5, -2);
glVertex3f(-3.5, -5.5, -2);

glNormal3f(0, 0, -1);
glVertex3f(-3.5, -5.5, 1);
glVertex3f(-4.5, -3.5, 1);
glVertex3f(-0.5, -3.5, 1);

glNormal3f(0, 0, -1);
glVertex3f(-3.5, -5.5, 1);
glVertex3f(-0.5, -3.5, 1);
glVertex3f(-1.5, -5.5, 1);

glNormal3f(0, 0, 1);
glVertex3f(-3.5, -5.5, 3);
glVertex3f(-1.5, -5.5, 3);
glVertex3f(-0.5, -3.5, 3);

glNormal3f(0, 0, 1);
glVertex3f(-3.5, -5.5, 3);
glVertex3f(-0.5, -3.5, 3);
glVertex3f(-4.5, -3.5, 3);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-1.5, -5.5, 3);
glVertex3f(-1.5, -5.5, 1);
glVertex3f(-0.5, -3.5, 1);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-1.5, -5.5, 3);
glVertex3f(-0.5, -3.5, 1);
glVertex3f(-0.5, -3.5, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-3.5, -5.5, 1);
glVertex3f(-3.5, -5.5, 3);
glVertex3f(-4.5, -3.5, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-3.5, -5.5, 1);
glVertex3f(-4.5, -3.5, 3);
glVertex3f(-4.5, -3.5, 1);

glNormal3f(0, -1, 0);
glVertex3f(-3.5, -5.5, 1);
glVertex3f(-1.5, -5.5, 1);
glVertex3f(-1.5, -5.5, 3);

glNormal3f(0, -1, 0);
glVertex3f(-3.5, -5.5, 1);
glVertex3f(-1.5, -5.5, 3);
glVertex3f(-3.5, -5.5, 3);

glEnd;


end;

{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

Procedure Drawplayer;
begin
glScalef(0.1,0.1,0.1);
glBegin(GL_TRIANGLES);
glNormal3f(0, 0.242535620927811, -0.970142483711243);
glVertex3f(-9, -3, -4);
glVertex3f(-8, 1, -3);
glVertex3f(7, 1, -3);

glNormal3f(0, 0.242535620927811, -0.970142483711243);
glVertex3f(-9, -3, -4);
glVertex3f(7, 1, -3);
glVertex3f(9, -3, -4);

glNormal3f(0, 0.242535620927811, 0.970142483711243);
glVertex3f(-9, -3, 4);
glVertex3f(9, -3, 4);
glVertex3f(7, 1, 3);

glNormal3f(0, 0.242535620927811, 0.970142483711243);
glVertex3f(-9, -3, 4);
glVertex3f(7, 1, 3);
glVertex3f(-8, 1, 3);

glNormal3f(0.894427180290222, 0.447213590145111, 0);
glVertex3f(9, -3, 4);
glVertex3f(9, -3, -4);
glVertex3f(7, 1, -3);

glNormal3f(0.894427180290222, 0.447213590145111, 0);
glVertex3f(9, -3, 4);
glVertex3f(7, 1, -3);
glVertex3f(7, 1, 3);

glNormal3f(-0.970142543315887, 0.242535635828972, 0);
glVertex3f(-9, -3, -4);
glVertex3f(-9, -3, 4);
glVertex3f(-8, 1, 3);

glNormal3f(-0.970142483711243, 0.242535620927811, 0);
glVertex3f(-9, -3, -4);
glVertex3f(-8, 1, 3);
glVertex3f(-8, 1, -3);

glNormal3f(0, 1, 0);
glVertex3f(-8, 1, 3);
glVertex3f(7, 1, 3);
glVertex3f(7, 1, -3);

glNormal3f(0, 1, 0);
glVertex3f(-8, 1, 3);
glVertex3f(7, 1, -3);
glVertex3f(-8, 1, -3);

glNormal3f(0, -1, 0);
glVertex3f(-9, -3, -4);
glVertex3f(9, -3, -4);
glVertex3f(9, -3, 4);

glNormal3f(0, -1, 0);
glVertex3f(-9, -3, -4);
glVertex3f(9, -3, 4);
glVertex3f(-9, -3, 4);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, -4);
glVertex3f(-8, -3, -4);
glVertex3f(-4, -3, -4);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, -4);
glVertex3f(-4, -3, -4);
glVertex3f(-5, -5, -4);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, -2);
glVertex3f(-5, -5, -2);
glVertex3f(-4, -3, -2);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, -2);
glVertex3f(-4, -3, -2);
glVertex3f(-8, -3, -2);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, -2);
glVertex3f(-5, -5, -4);
glVertex3f(-4, -3, -4);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, -2);
glVertex3f(-4, -3, -4);
glVertex3f(-4, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-7, -5, -2);
glVertex3f(-8, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-8, -3, -2);
glVertex3f(-8, -3, -4);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-5, -5, -4);
glVertex3f(-5, -5, -2);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, -4);
glVertex3f(-5, -5, -2);
glVertex3f(-7, -5, -2);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, -4);
glVertex3f(3, -3, -4);
glVertex3f(7, -3, -4);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, -4);
glVertex3f(7, -3, -4);
glVertex3f(6, -5, -4);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, -2);
glVertex3f(6, -5, -2);
glVertex3f(7, -3, -2);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, -2);
glVertex3f(7, -3, -2);
glVertex3f(3, -3, -2);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, -2);
glVertex3f(6, -5, -4);
glVertex3f(7, -3, -4);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, -2);
glVertex3f(7, -3, -4);
glVertex3f(7, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, -4);
glVertex3f(4, -5, -2);
glVertex3f(3, -3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, -4);
glVertex3f(3, -3, -2);
glVertex3f(3, -3, -4);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, -4);
glVertex3f(6, -5, -4);
glVertex3f(6, -5, -2);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, -4);
glVertex3f(6, -5, -2);
glVertex3f(4, -5, -2);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, 1);
glVertex3f(3, -3, 1);
glVertex3f(7, -3, 1);

glNormal3f(0, 0, -1);
glVertex3f(4, -5, 1);
glVertex3f(7, -3, 1);
glVertex3f(6, -5, 1);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, 3);
glVertex3f(6, -5, 3);
glVertex3f(7, -3, 3);

glNormal3f(0, 0, 1);
glVertex3f(4, -5, 3);
glVertex3f(7, -3, 3);
glVertex3f(3, -3, 3);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, 3);
glVertex3f(6, -5, 1);
glVertex3f(7, -3, 1);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(6, -5, 3);
glVertex3f(7, -3, 1);
glVertex3f(7, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, 1);
glVertex3f(4, -5, 3);
glVertex3f(3, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(4, -5, 1);
glVertex3f(3, -3, 3);
glVertex3f(3, -3, 1);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, 1);
glVertex3f(6, -5, 1);
glVertex3f(6, -5, 3);

glNormal3f(0, -1, 0);
glVertex3f(4, -5, 1);
glVertex3f(6, -5, 3);
glVertex3f(4, -5, 3);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, 1);
glVertex3f(-8, -3, 1);
glVertex3f(-4, -3, 1);

glNormal3f(0, 0, -1);
glVertex3f(-7, -5, 1);
glVertex3f(-4, -3, 1);
glVertex3f(-5, -5, 1);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, 3);
glVertex3f(-5, -5, 3);
glVertex3f(-4, -3, 3);

glNormal3f(0, 0, 1);
glVertex3f(-7, -5, 3);
glVertex3f(-4, -3, 3);
glVertex3f(-8, -3, 3);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, 3);
glVertex3f(-5, -5, 1);
glVertex3f(-4, -3, 1);

glNormal3f(0.894427180290222, -0.447213590145111, 0);
glVertex3f(-5, -5, 3);
glVertex3f(-4, -3, 1);
glVertex3f(-4, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-7, -5, 3);
glVertex3f(-8, -3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-8, -3, 3);
glVertex3f(-8, -3, 1);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-5, -5, 1);
glVertex3f(-5, -5, 3);

glNormal3f(0, -1, 0);
glVertex3f(-7, -5, 1);
glVertex3f(-5, -5, 3);
glVertex3f(-7, -5, 3);

glNormal3f(0, 0.196116134524345, -0.980580627918243);
glVertex3f(-5, 1, -3);
glVertex3f(-4, 6, -2);
glVertex3f(1, 6, -2);

glNormal3f(0, 0.196116134524345, -0.980580687522888);
glVertex3f(-5, 1, -3);
glVertex3f(1, 6, -2);
glVertex3f(3, 1, -3);

glNormal3f(0, 0.196116134524345, 0.980580687522888);
glVertex3f(-5, 1, 3);
glVertex3f(3, 1, 3);
glVertex3f(1, 6, 2);

glNormal3f(0, 0.196116134524345, 0.980580627918243);
glVertex3f(-5, 1, 3);
glVertex3f(1, 6, 2);
glVertex3f(-4, 6, 2);

glNormal3f(0.928476691246033, 0.371390670537949, 0);
glVertex3f(3, 1, 3);
glVertex3f(3, 1, -3);
glVertex3f(1, 6, -2);

glNormal3f(0.928476691246033, 0.371390670537949, 0);
glVertex3f(3, 1, 3);
glVertex3f(1, 6, -2);
glVertex3f(1, 6, 2);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(-5, 1, -3);
glVertex3f(-5, 1, 3);
glVertex3f(-4, 6, 2);

glNormal3f(-0.980580687522888, 0.196116134524345, 0);
glVertex3f(-5, 1, -3);
glVertex3f(-4, 6, 2);
glVertex3f(-4, 6, -2);

glNormal3f(0, 1, 0);
glVertex3f(-4, 6, 2);
glVertex3f(1, 6, 2);
glVertex3f(1, 6, -2);

glNormal3f(0, 1, 0);
glVertex3f(-4, 6, 2);
glVertex3f(1, 6, -2);
glVertex3f(-4, 6, -2);

glNormal3f(0, 0, -1);
glVertex3f(-8, 1, -3);
glVertex3f(-9, 3, -3);
glVertex3f(-7, 3, -3);

glNormal3f(0, 0, -1);
glVertex3f(-8, 1, -3);
glVertex3f(-7, 3, -3);
glVertex3f(-5, 1, -3);

glNormal3f(0, 0, 1);
glVertex3f(-8, 1, -2);
glVertex3f(-5, 1, -2);
glVertex3f(-7, 3, -2);

glNormal3f(0, 0, 1);
glVertex3f(-8, 1, -2);
glVertex3f(-7, 3, -2);
glVertex3f(-9, 3, -2);

glNormal3f(0.70710676908493, 0.70710676908493, 0);
glVertex3f(-5, 1, -2);
glVertex3f(-5, 1, -3);
glVertex3f(-7, 3, -3);

glNormal3f(0.70710676908493, 0.70710676908493, 0);
glVertex3f(-5, 1, -2);
glVertex3f(-7, 3, -3);
glVertex3f(-7, 3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-8, 1, -3);
glVertex3f(-8, 1, -2);
glVertex3f(-9, 3, -2);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-8, 1, -3);
glVertex3f(-9, 3, -2);
glVertex3f(-9, 3, -3);

glNormal3f(0, 1, 0);
glVertex3f(-9, 3, -2);
glVertex3f(-7, 3, -2);
glVertex3f(-7, 3, -3);

glNormal3f(0, 1, 0);
glVertex3f(-9, 3, -2);
glVertex3f(-7, 3, -3);
glVertex3f(-9, 3, -3);

glNormal3f(0, -1, 0);
glVertex3f(-8, 1, -3);
glVertex3f(-5, 1, -3);
glVertex3f(-5, 1, -2);

glNormal3f(0, -1, 0);
glVertex3f(-8, 1, -3);
glVertex3f(-5, 1, -2);
glVertex3f(-8, 1, -2);

glNormal3f(0, 0, -1);
glVertex3f(-8, 1, 2);
glVertex3f(-9, 3, 2);
glVertex3f(-7, 3, 2);

glNormal3f(0, 0, -1);
glVertex3f(-8, 1, 2);
glVertex3f(-7, 3, 2);
glVertex3f(-5, 1, 2);

glNormal3f(0, 0, 1);
glVertex3f(-8, 1, 3);
glVertex3f(-5, 1, 3);
glVertex3f(-7, 3, 3);

glNormal3f(0, 0, 1);
glVertex3f(-8, 1, 3);
glVertex3f(-7, 3, 3);
glVertex3f(-9, 3, 3);

glNormal3f(0.70710676908493, 0.70710676908493, 0);
glVertex3f(-5, 1, 3);
glVertex3f(-5, 1, 2);
glVertex3f(-7, 3, 2);

glNormal3f(0.70710676908493, 0.70710676908493, 0);
glVertex3f(-5, 1, 3);
glVertex3f(-7, 3, 2);
glVertex3f(-7, 3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-8, 1, 2);
glVertex3f(-8, 1, 3);
glVertex3f(-9, 3, 3);

glNormal3f(-0.894427180290222, -0.447213590145111, 0);
glVertex3f(-8, 1, 2);
glVertex3f(-9, 3, 3);
glVertex3f(-9, 3, 2);

glNormal3f(0, 1, 0);
glVertex3f(-9, 3, 3);
glVertex3f(-7, 3, 3);
glVertex3f(-7, 3, 2);

glNormal3f(0, 1, 0);
glVertex3f(-9, 3, 3);
glVertex3f(-7, 3, 2);
glVertex3f(-9, 3, 2);

glNormal3f(0, -1, 0);
glVertex3f(-8, 1, 2);
glVertex3f(-5, 1, 2);
glVertex3f(-5, 1, 3);

glNormal3f(0, -1, 0);
glVertex3f(-8, 1, 2);
glVertex3f(-5, 1, 3);
glVertex3f(-8, 1, 3);

glEnd;

end;

end.
