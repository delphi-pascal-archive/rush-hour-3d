unit VCL_Mainform;

interface

uses
  DGLopengl,
  TextStream,
  Unit_Car,
  Math,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls;

type
// Pointer pour le picking (Selection)
  PSelection = ^TSelection; // TSelection holds information
  TSelection = record       // from the hit record
    Names : Integer;        // The number of names in this hit
    zNear : Integer;        // Near z value
    zFar : Integer;         // Far z value
    ID : Integer;           // ID of the item picked
  end;

// L'escentiel est ici
  TBox = Record
    Visible: Boolean;
    Enable: Boolean;
    Selected: Boolean;
    Color: TVector;
    Pos: TVector;
    Rot: Integer;
    Speed: TVector;
    Size: TVector;
    Graph: gluint;
  end;

// Notre camera
  TCamera = Record
    Pos: TVector;
    Rot: TVector;
    Viewport: TVector4i;
    Focus: Single;
    ZNear: Single;
    ZFar: Single;
    Aspect: Single;
  end;

// La fenetre
  TMainForm = class(TForm)
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    Load1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Quit1: TMenuItem;
    Panel1: TPanel;
    ListBox1: TListBox;
    CheckBox1: TCheckBox;
    ColorDialog1: TColorDialog;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Edit1: TMenuItem;
    On1: TMenuItem;
    Off1: TMenuItem;
    Infos1: TMenuItem;
    Credits1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Save1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure On1Click(Sender: TObject);
    procedure Off1Click(Sender: TObject);
    procedure Credits1Click(Sender: TObject);
  private
// DC et RC pour la gestion d'opengl
    fDC: HDC;
    fRC: HGLRC;
// pour memoriser les dépacements de la souris
    fMouse: TPoint;
    Function Collision: Boolean;
    Function Escape: Boolean;
    Procedure Draw;
    procedure ProcessHits( Hits : Integer; Data : PSelection );
  public
// La liste de tous les objets
    Shapes : array[ 0 .. 22] of TBox;
// Notre camera
    Camera: TCamera;
// L'index de l'objet selectionner
    Current: Integer;
// La liste d'affichage pour opengl
    CallList: gluint;
// Charger et sauvegarder les niveaux
    Procedure SaveLevel(FileName: String);
    Procedure LoadLevel(FileName: String);
  end;

var
  MainForm: TMainForm;

implementation

uses VCL_InfoForm;

{$R *.dfm}

Function SetVector(A,B,C: Single): TVector;
{ Creer un vecteur }
begin
  Result.X := A;
  Result.Y := B;
  Result.Z := C;
end;

procedure TMainForm.FormCreate(Sender: TObject);
Var index: integer;
begin
  DecimalSeparator := '.';
  Panel1.Visible := False;

// Initialiser Opengl;
  InitOpengl;
  fDC := GetDC(Handle);
  fRC := CreateRenderingContext(fDC, [opDoubleBuffered],16,0,0,0,0,0);
  ActivateRenderingContext(fDC, fRC);
  glEnable( GL_LIGHTING );
  glEnable( GL_LIGHT0 );
  glEnable( GL_COLOR_MATERIAL );
  glColorMaterial( GL_FRONT, GL_AMBIENT_AND_DIFFUSE );
  glHint( GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST );
  glShadeModel( GL_SMOOTH );
  glClearColor( 0, 0, 0, 0 );
  glEnable( GL_DEPTH_TEST );
  glClearDepth( 1 );
  glDepthFunc( GL_LESS );
  glEnable(GL_CULL_FACE);

// Creer les graphiques
  CallList := glGenLists(10);
  glNewList(CallList +0, GL_COMPILE); DrawBox(8.0,0.5,8.0); glEndList; // Plateau
  glNewList(CallList +1, GL_COMPILE); DrawBox(6.0,0.5,1.0); glEndList; // Mur Nord
  glNewList(CallList +2, GL_COMPILE); DrawBox(6.0,0.5,1.0); glEndList; // Mur Sud
  glNewList(CallList +3, GL_COMPILE); DrawBox(1.0,0.5,8.0); glEndList; // Mur Ouest
  glNewList(CallList +4, GL_COMPILE); DrawBox(1.0,0.5,4.0); glEndList; // Mur Nord Est
  glNewList(CallList +5, GL_COMPILE); DrawBox(1.0,0.5,3.0); glEndList; // Mur Sud Est
  glNewList(CallList +6, GL_COMPILE); DrawPlayer; glEndList; // Player
  glNewList(CallList +7, GL_COMPILE); DrawTRuck;  glEndList; // Truck
  glNewList(CallList +8, GL_COMPILE); DrawCar; glEndList; // Car

// Definir la camera
  Camera.Pos := SetVEctor(0,0,-20);
  Camera.Rot := SetVector(20,50,0);
  Camera.Focus := 45.0;
  Camera.ZNear := 0.1;
  Camera.ZFar := 200.0;

// Plateau
    Shapes[0].Visible := True;
    Shapes[0].Enable := False;
    Shapes[0].Color := SetVector(0.6,0.6,0.9);
    Shapes[0].Pos := SetVector(0.0,-0.25,0);
    Shapes[0].Graph := 0;
    Shapes[0].Size := SetVector(8.0, 0.5,8.0);
// Mur SUD
    Shapes[1].Visible := True;
    Shapes[1].Enable := False;
    Shapes[1].Color := SetVector(0.6,0.6,0.9);
    Shapes[1].Pos := SetVector(0,0.25,3.5);
    Shapes[1].Graph := 1;
    Shapes[1].Size := SetVector(6.0,0.5,1.0);
// Mur Nord
    Shapes[2].Visible := True;
    Shapes[2].Enable := False;
    Shapes[2].Color := SetVector(0.6,0.6,0.9);
    Shapes[2].Pos := SetVector(0,0.25,-3.5);
    Shapes[2].Graph := 2;
    Shapes[2].Size := SetVector(6.0,0.5,1.0);
// Mur Est
    Shapes[3].Visible := True;
    Shapes[3].Enable := False;
    Shapes[3].Color := SetVector(0.6,0.6,0.9);
    Shapes[3].Pos := SetVector(-3.5,0.25,0);
    Shapes[3].Graph := 3;
    Shapes[3].Size := SetVector(1.0,0.5,8.0);
// Mur Sud Est
    Shapes[4].Visible := True;
    Shapes[4].Enable := False;
    Shapes[4].Color := SetVector(0.6,0.6,0.9);
    Shapes[4].Pos := SetVector(3.5,0.25,2.0);
    Shapes[4].Graph := 4;
    Shapes[4].Size := SetVector(1.0,0.5,4.0);
// Mur Nord Est
    Shapes[5].Visible := True;
    Shapes[5].Enable := False;
    Shapes[5].Color := SetVector(0.6,0.6,0.9);
    Shapes[5].Pos := SetVector(3.5,0.25,-2.5);
    Shapes[5].Graph := 5;
    Shapes[5].Size := SetVector(1.0,0.5,3.0);
// Player
    Shapes[6].Visible := True;
    Shapes[6].Enable := True;
    Shapes[6].Selected := True;
    Shapes[6].Speed := SetVector(1,0,0);
    Shapes[6].Pos := SetVector(0,0.5,-0.5);
    Shapes[6].Color := SetVector(1,0,0);
    Shapes[6].Size := SetVector(1.8,1,0.8);
    Shapes[6].Graph := 6;
    Current := 6;
    CheckBox1.Checked := True;
    ListBox1.ItemIndex := 6;
// Trucks
  For index := 7 to 10 do
  begin
    Shapes[index].Graph := 7;
    Shapes[Index].Pos := SetVector(0,0.5,0);
    Shapes[index].Visible := False;
    Shapes[index].Enable := True;
    Shapes[index].Speed := SetVector(1,0,0);
    Shapes[index].Size := SetVector(2.8,1,0.8);
  end;
    Shapes[7].Color := SetVector(0,0,1);
    Shapes[8].Color := SetVector(0,1,1);
    Shapes[9].Color := SetVector(1,0,1);
    Shapes[10].Color := SetVector(1,1,0);
// Cars
  For index := 11 to 21 do
  begin
    Shapes[index].Graph := 8;
    Shapes[Index].Pos := SetVector(0,0.5,0);
    Shapes[index].Visible := False;
    Shapes[index].Enable := True;
    Shapes[index].Speed := SetVector(1,0,0);
    Shapes[index].Size := SetVector(1.8,1,0.8);
  end;
    Shapes[11].Color := SetVector(1,0.25,0.25);
    Shapes[12].Color := SetVector(1,0.5,0.5);
    Shapes[13].Color := SetVector(1,0.75,0.75);
    Shapes[14].Color := SetVector(0.25,1.0,0.25);
    Shapes[15].Color := SetVector(0.50,1.0,0.50);
    Shapes[16].Color := SetVector(0.75,1.0,0.75);
    Shapes[17].Color := SetVector(0.25,0.25,1.0);
    Shapes[18].Color := SetVector(0.50,0.50,1.0);
    Shapes[19].Color := SetVector(0.75,0.75,1.0);
    Shapes[20].Color := SetVector(1.0,0.50,1.0);
    Shapes[21].Color := SetVector(0.5,1.0,1.0);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
Var
  Index: integer;
begin
// Detruire les liste d'affichage
  glDeleteLists(CallList , 9);

// Finaliser opengl
  DeActivateRenderingContext();
  DestroyRenderingContext(fRC);
  ReleaseDC(Handle, fDC);
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
// Eviter division par zero
  if ClientHeight = 0 then ClientHeight := 1;

// Redimensionner le viewport de la camera
  With Camera do
  begin
    Viewport[0] := 0;
    Viewport[1] := 0;
    if Panel1.Visible
      then Viewport[2] := ClientWidth - Panel1.Width
      else Viewport[2] := ClientWidth;
    Viewport[3] := ClientHeight;
    Aspect := Viewport[2] / Viewport[3];
    glViewport(Viewport[0], Viewport[1], Viewport[2], Viewport[3]);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity;
    gluPerspective(Focus, Aspect, ZNear, ZFar);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity;
  end;
end;

procedure TMainForm.Draw;
Var
  Index: integer;
begin
// Placer la camera dans la scene
  With Camera do
  begin
    glTranslatef( Pos.X, Pos.Y, Pos.Z);
    glRotatef( Rot.X, 1, 0, 0 );
    glRotatef( Rot.Y, 0, 1, 0 );
    glRotatef( Rot.Z, 0, 0, 1 );
  end;

// Dessiner les blocs
  For Index := 0 to 21 do
  With Shapes[index] do
  begin
    if Visible then
    begin
      if Enable then glLoadName( Index );
      if Selected
        then glColor3f( Color.X, Color.Y, Color.Z )
        else glColor3f( Color.X/2, Color.Y/2, Color.Z/2 );
      glPushMatrix;
      glTranslatef( Pos.X, Pos.Y, Pos.Z);
      glRotatef(Rot,0,1,0);
      glCallList(CallList+ Graph);
      glPopMatrix;
    end;
  end;
end;

procedure TMainForm.ProcessHits( Hits : Integer; Data : PSelection );
var
  I : Integer;
  ID : Integer;
  zNear : Integer;
begin
// Selection d'un bloc (picking)
  if ( Hits = 0 ) then Exit;
  ID := Data.ID;
  zNear := Data.zNear;

  for I := 0 to Hits - 2 do
  begin
    Inc( Data );
    if ( Data.zNear < zNear ) then
    begin
      ID := Data.ID;
      zNear := Data.zNear;
    end;
  end;

// S'assurer qu'un seul bloc peut etre selectionne
  if ID>=0 then
  begin
    Shapes[ ID ].Selected := True;
    if (Shapes[ID].Selected) and (ID<> Current) then
    begin
      Shapes[Current].Selected := False;
      Current := ID;
      ListBox1.ItemIndex := Current;
    end;
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
// Afficher la scene
  glClear( GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );
  glLoadIdentity;
  Draw;
  SwapBuffers(fDC);
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Hits : Integer;
  Data : array[ 0..2 ] of TSelection;
begin
// Selection du bloc
  glSelectBuffer( SizeOf( Data ), @Data );
  glRenderMode( GL_SELECT );
  glInitNames;
  glPushName( Longword( -1 ) );

// Placer la camera en mode selection
  With Camera Do
  begin
    glMatrixMode( GL_PROJECTION );
    glPushMatrix;
    glLoadIdentity;
    gluPickMatrix( X, Viewport[3] - Y, 2.0, 2.0, Viewport );
    gluPerspective(Focus, Aspect, ZNear, ZFar);
  end;
  glMatrixMode( GL_MODELVIEW );
  glLoadIdentity;
// Afficher la scene
  Draw;
// Find de la selection
  glMatrixMode( GL_PROJECTION );
  glPopMatrix;
  glMatrixMode( GL_MODELVIEW );
  Hits := glRenderMode( GL_RENDER );
// Rechercher le bloc selectionner
  ProcessHits( Hits, @Data );
end;

procedure TMainForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
Var
  CosX,SinX: Single;
  Vx,Vy: Single;
  Dx,Dy: Single;
  old: TVector;
begin
// Pivoter la camera
  if (ssMiddle in Shift) then
  begin
    if X < fMouse.X then Camera.Rot.Y := Camera.Rot.Y - 2;
    if X > fMouse.X then Camera.Rot.Y := Camera.Rot.Y + 2;
    if Y < fMouse.Y then Camera.Rot.X := Camera.Rot.X - 2;
    if Y > fMouse.Y then Camera.Rot.X := Camera.Rot.X + 2;
    if Camera.Rot.X <0 then Camera.Rot.X := 0;
    if Camera.Rot.X >90 then Camera.Rot.X := 90;
  end;

// Deplacer le bloc selectionner
  if (ssLeft in Shift) then
  begin
    old := Shapes[current].Pos;
    Dx := cos( degtorad(Camera.rot.Y))*0.1;
    DY := sin( degtorad(Camera.rot.Y))*0.1;
    if (X < fMouse.X) then
    begin
    Shapes[current].pos.X := Shapes[current].pos.X - (Dx * Shapes[current].Speed.X);
    Shapes[current].pos.Z := Shapes[current].pos.Z - (Dy * Shapes[current].Speed.Z);
    end;
    if (X > fMouse.X) then
    begin
    Shapes[current].pos.X := Shapes[current].pos.X + (Dx * Shapes[current].Speed.X);
    Shapes[current].pos.Z := Shapes[current].pos.Z + (Dy * Shapes[current].Speed.Z);
    end;
    if (Y < fMouse.Y) then
    begin
    Shapes[current].pos.X := Shapes[current].pos.X + (Dy * Shapes[current].Speed.X);
    Shapes[current].pos.Z := Shapes[current].pos.Z - (Dx * Shapes[current].Speed.Z);
    end;
    if (Y > fMouse.Y) then
    begin
    Shapes[current].pos.X := Shapes[current].pos.X - (Dy * Shapes[current].Speed.X);
    Shapes[current].pos.Z := Shapes[current].pos.Z + (Dx * Shapes[current].Speed.Z);
    end;
    if Collision then Shapes[current].Pos := old;
    if Escape then ShowMessage('Vous avez gagne');
  end;
  fMouse.X := X;
  fMouse.Y := Y;
end;

procedure TMainForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
// Zoom Arriere
  Camera.Pos.Z := Camera.Pos.Z + 1.0;
end;

procedure TMainForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
// Zoom Avant
  Camera.Pos.Z := Camera.Pos.Z - 1.0;
end;

Function TMainForm.Collision : Boolean;
Var
  index: integer;
  MinA, MinB, MaxA, MaxB: TVector;
begin
// Gestion des collisions entre blocs
  if Current = -1 then exit;
  Result := False;

  MinA.X := Shapes[Current].Pos.X - (Shapes[Current].Size.X / 2);
  MinA.Y := Shapes[Current].Pos.Y - (Shapes[Current].Size.Y / 2);
  MinA.Z := Shapes[Current].Pos.Z - (Shapes[Current].Size.Z / 2);
  MaxA.X := Shapes[Current].Pos.X + (Shapes[Current].Size.X / 2);
  MaxA.Y := Shapes[Current].Pos.Y + (Shapes[Current].Size.Y / 2);
  MaxA.Z := Shapes[Current].Pos.Z + (Shapes[Current].Size.Z / 2);

  For index := 0 to 21 do
  begin
    if (Index <> Current) and Shapes[index].Visible then
    begin
      MinB.X := Shapes[Index].Pos.X - (Shapes[Index].Size.X / 2);
      MinB.Y := Shapes[Index].Pos.Y - (Shapes[Index].Size.Y / 2);
      MinB.Z := Shapes[Index].Pos.Z - (Shapes[Index].Size.Z / 2);
      MaxB.X := Shapes[Index].Pos.X + (Shapes[Index].Size.X / 2);
      MaxB.Y := Shapes[Index].Pos.Y + (Shapes[Index].Size.Y / 2);
      MaxB.Z := Shapes[Index].Pos.Z + (Shapes[Index].Size.Z / 2);

      if  ((MinA.X < MaxB.X) and (MAxA.X > MinB.X))
      and ((MinA.Y < MaxB.Y) and (MAxA.Y > MinB.Y))
      and ((MinA.Z < MaxB.Z) and (MAxA.Z > MinB.Z))
      then result := True
      else result := False;

      if Result= true then exit;
    end;
  end;
end;

Function TMainForm.Escape : Boolean;
Var
  index: integer;
  MinA, MinB, MaxA, MaxB: TVector;
begin
// Gestion fin du jeu bloc 6 hors limite
  Result := False;
  if Current <> 6 then exit;

  MinA.X := Shapes[6].Pos.X - (Shapes[6].Size.X / 2);
  MinA.Y := Shapes[6].Pos.Y - (Shapes[6].Size.Y / 2);
  MinA.Z := Shapes[6].Pos.Z - (Shapes[6].Size.Z / 2);
  MaxA.X := Shapes[6].Pos.X + (Shapes[6].Size.X / 2);
  MaxA.Y := Shapes[6].Pos.Y + (Shapes[6].Size.Y / 2);
  MaxA.Z := Shapes[6].Pos.Z + (Shapes[6].Size.Z / 2);

  MinB.X := -5;
  MinB.Y := -5;
  MinB.Z := -5;
  MaxB.X := 5;
  MaxB.Y := 5;
  MaxB.Z := 5;

  if  ((MinA.X < MaxB.X) and (MAxA.X > MinB.X))
  and ((MinA.Y < MaxB.Y) and (MAxA.Y > MinB.Y))
  and ((MinA.Z < MaxB.Z) and (MAxA.Z > MinB.Z))
  then result := False
  else result := true;
end;

Procedure TMainForm.SaveLevel(FileName: String);
Var
  fFile: TTextStream;
  index: integer;
  Count: integer;
begin
// Sauvegarder le niveau
  fFile := TTextStream.Create;
  try
// Tenir compte que des vehicules 7 a 21
    Count := 0;
    For index := 7 to 21 do
    begin
      if Shapes[index].Visible then inc(Count);
    end;
    fFile.AddInteger('*COUNT' ,Count);
// sauvegarder index, position, rotation
    For index := 0 to 21 do
    with Shapes[index] do
    if Visible and enable then
    begin
      fFile.Add('');
      fFile.AddInteger('  *INDEX', Index);
      fFile.AddVector ('  *POSITION', Pos);
      fFile.AddInteger('  *ROTATION', Rot);
    end;
// Sauvegarder les donnees
    fFile.SaveToFile(FileName);
  finally
    fFile.Free;
  end;
end;

Procedure TMainForm.LoadLevel(FileName: String);
Var
  fFile: TTextStream;
  Count,index: integer;
  REf: integer;
begin
// Charger le niveau
  fFile := TTextStream.Create;
  try
    fFile.LoadFromFile(FileName);
// Placer les vehicules dans position initiale (pas visible, pas selectionner)
    For index := 7 to 21 do
    begin
      Shapes[index].Visible := False;
      Shapes[index].Selected := False;
    end;
// Placer le joueur en position selectionner
    Shapes[6].Selected := True;
// Recuperer le nombre de vehicules actifs
    Count := fFile.GetInteger('*COUNT');
    For index := 0 to Count do
    begin
// index du vehicule
      Ref := fFile.GetInteger('*INDEX');
      Shapes[Ref].Visible := True;
// position
      Shapes[Ref].Pos := fFile.GetVector('*POSITION');
// rotation
      Shapes[Ref].Rot := fFile.GetInteger('*ROTATION');
// Devinir vecteur vitesse
      if Shapes[Ref].Rot = 0
        then Shapes[Ref].Speed := SetVector(1,0,0)
        else Shapes[Ref].Speed := SetVector(0,0,1);
// Suivant l'index vehicule et rotation definir la zone de collision
      Case Ref of
        0: Shapes[Ref].Size := SetVector(8.0,0.5,8.0);  // Plateau
        1: Shapes[Ref].Size := SetVector(6.0,0.5,1.0);  // Mur Nord
        2: Shapes[Ref].Size := SetVector(6.0,0.5,1.0);  // Mur Sud
        3: Shapes[Ref].Size := SetVector(1.0,0.5,8.0);  // Mur Ouest
        4: Shapes[Ref].Size := SetVector(1.0,0.5,4.0);  // Mur Nord Est
        5: Shapes[Ref].Size := SetVector(1.0,0.5,3.0);  // Mur Sud Est
        6: if Shapes[Ref].Rot = 0
            then Shapes[Ref].Size := SetVector(1.8,1.0,0.8)
            else Shapes[Ref].Size := SetVector(0.8,1.0,1.8);  // Player
        7..10: if Shapes[Ref].Rot = 0
            then Shapes[Ref].Size := SetVector(2.8,1.0,0.8)
            else Shapes[Ref].Size := SetVector(0.8,1.0,2.8);  // Truck
        11..21: if Shapes[Ref].Rot = 0
            then Shapes[Ref].Size := SetVector(1.8,1.0,0.8)
            else Shapes[Ref].Size := SetVector(0.8,1.0,1.8);  // Car
      end;
    end;
  finally
    fFile.Free;
  end;
end;

procedure TMainForm.Save1Click(Sender: TObject);
begin
// Clicker sur sauvegarder
  with SaveDialog1 do
  begin
    InitialDir := ExtractFilePath(Application.ExeName)+'Levels/';
    DefaultExt := '.TXT';
    Filter := 'Text File (*.TXT)|*.TXT';
  end;
  if not SaveDialog1.Execute then exit;
  SaveLevel(SaveDialog1.FileName);
end;

procedure TMainForm.Load1Click(Sender: TObject);
begin
// Clicker sur charger
  with OpenDialog1 do
  begin
    InitialDir := ExtractFilePath(Application.ExeName)+'Levels/';
    DefaultExt := '.TXT';
    Filter := 'Text File (*.TXT)|*.TXT';
  end;
  if not OpenDialog1.Execute then exit;
  LoadLevel(OpenDialog1.FileName);
  Caption := 'Rush Hour 3D - '+ extractFileName(OpenDialog1.FileName);
end;

procedure TMainForm.Quit1Click(Sender: TObject);
begin
// Clicker sur quitter
  Application.Terminate;
end;

{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{---- Mode editeur ------------------------------------------------------------}
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

procedure TMainForm.ListBox1Click(Sender: TObject);
begin
// Selectionner un element dans la liste
  Current := ListBox1.ItemIndex;
  CheckBox1.Checked := Shapes[Current].Visible;
  if Shapes[Current].Rot = 0
    then CheckBox2.Checked := False
    else CheckBox2.Checked := True;

  TrackBar1.Position := round( Shapes[Current].Pos.X / 0.5);
  TrackBar2.Position := round( Shapes[Current].Pos.Z / 0.5);
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
// render element visible ou non
begin
  if Current = -1 then exit;
  Shapes[Current].Visible := CheckBox1.Checked;
end;

procedure TMainForm.CheckBox2Click(Sender: TObject);
begin
// Faire pivoter un elements
  if Current = -1 then exit;
  if CheckBox2.Checked then Shapes[Current].Rot:= 90 else Shapes[Current].Rot:= 0;

  if Shapes[Current].Rot = 0
    then Shapes[Current].Speed := SetVector(1,0,0)
    else Shapes[Current].Speed := SetVector(0,0,1);
  Case Current of
    0: Shapes[Current].Size := SetVector(8.0,0.5,8.0);  // Plateau
    1: Shapes[Current].Size := SetVector(6.0,0.5,1.0);  // Mur Nord
    2: Shapes[Current].Size := SetVector(6.0,0.5,1.0);  // Mur Sud
    3: Shapes[Current].Size := SetVector(1.0,0.5,8.0);  // Mur Ouest
    4: Shapes[Current].Size := SetVector(1.0,0.5,4.0);  // Mur Nord Est
    5: Shapes[Current].Size := SetVector(1.0,0.5,3.0);  // Mur Sud Est
    6: if Shapes[Current].Rot = 0
      then Shapes[Current].Size := SetVector(1.8,1.0,0.8)
      else Shapes[Current].Size := SetVector(0.8,1.0,1.8);  // Player
    7..10: if Shapes[Current].Rot = 0
      then Shapes[Current].Size := SetVector(2.8,1.0,0.8)
      else Shapes[Current].Size := SetVector(0.8,1.0,2.8);  // Truck
    11..21: if Shapes[Current].Rot = 0
      then Shapes[Current].Size := SetVector(1.8,1.0,0.8)
      else Shapes[Current].Size := SetVector(0.8,1.0,1.8);  // Car
    end;
end;

procedure TMainForm.TrackBar1Change(Sender: TObject);
begin
// deplacer suivant X
  if Current <=0 then exit;
  Shapes[Current].Pos.X := TrackBar1.Position * 0.5;
end;

procedure TMainForm.TrackBar2Change(Sender: TObject);
begin
// Deplacer suivant Z
  if Current <=0 then exit;
  Shapes[Current].Pos.Z := TrackBar2.Position * 0.5;   
end;

procedure TMainForm.On1Click(Sender: TObject);
begin
// Monter l'editeur
  Panel1.Visible := True;
  OnResize(self);
end;

procedure TMainForm.Off1Click(Sender: TObject);
begin
// Cacher l'editeur
  Panel1.Visible := False;
  OnResize(self);
end;

procedure TMainForm.Credits1Click(Sender: TObject);
begin
// Afficher les credits
  infoForm.InitCredit;
  InfoForm.ShowModal;
end;

end.
