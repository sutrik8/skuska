unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo2: TMemo;
    Pridaj: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure PridajClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   { private declarations }
  public
   { public declarations }
  end;
 type
   zaznam=record
     cislo:string;
     slovo:string;
   end;
  const
    N=6;
var
  Form1: TForm1;
    i,j,p,b,e,a:integer;
    subor:textfile;
    znak:char;
    t,k,path:string;
    vsetko: array [1..100] of zaznam;
    vsetko2: array [1..100] of zaznam;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
  begin
    path:='\\comenius\public\market\tima\';
    memo1.clear;
    memo2.Clear;
    b:=0;
    i:=0;
    a:=0;
     assignfile(subor,path+'TOVAR.txt');
     reset(subor);
     read(subor,e);
     readln(subor);
      while not eof (subor) do
      begin
      inc(i);
       read(subor,znak);                                   //nacitanie kodu
         repeat
          vsetko[i].cislo:=vsetko[i].cislo+znak;
          read(subor,znak);
         until znak=';';
          repeat                                //nacitanie tovaru
          read(subor,znak);
          vsetko[i].slovo:=vsetko[i].slovo+znak;
         until eoln(subor);
         readln(subor);
          memo1.append(vsetko[i].cislo+';'+vsetko[i].slovo);
      end;

      i:=0;
      reset(subor);
      readln(subor);
      while not eof (subor) do
      begin
       inc(i);
       read(subor,znak);                                   //nacitanie kodu
         repeat
          vsetko2[i].cislo:=vsetko2[i].cislo+znak;
          read(subor,znak);
         until znak=';';
          repeat                                //nacitanie tovaru
          read(subor,znak);
          vsetko2[i].slovo:=vsetko2[i].slovo+znak;
         until eoln(subor);
         readln(subor);
      end;
      closefile(subor);

      label1.Caption:='Názov:';
      label2.Caption:='Kód:';
      label4.Caption:='Kód:';
      label5.Caption:='Nájdený produkt:';
      label6.caption:='Tovar v databáze:';

      edit1.text:='';
      edit2.text:='';
      edit4.text:='';
end;

procedure TForm1.PridajClick(Sender: TObject);
var tovar,kod:string;
    F:TStringList;
begin
   znak:=';';
   if edit1.text='' then
      showmessage('Prosim zadajte kod a nazov produktu');
 {  else  begin
    for
   if edit1.text=
    emd;     }
   tovar:=edit1.text;
   kod:=edit2.text;
   assignfile(subor,path+'TOVAR.txt');
   append(subor);
   //writeln(subor);
   readln(subor);
   write(subor,kod);
   write(subor,znak);
   write(subor,tovar);
   closefile(subor);
   vsetko[i+1].cislo:=kod;
   vsetko[i+1].slovo:=tovar;
   memo1.append(kod+';'+tovar);

   inc(e);
   F:=TStringList.Create;
   try
      F.LoadFromFile(path+'TOVAR.txt');
      F.Strings[0]:=inttostr(e) ;
      F.SaveToFile(path+'TOVAR.txt');
   finally
   F.Free
   end;


end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 memo2.clear;
 i:=1;
 j:=1;
 t:=edit4.text;
 k:=edit4.text;

       if edit4.text='' then
          showmessage('Prosim zadajte kod produktu')
        else begin
      for a:= 1 to e do
      begin
             if vsetko[a].cislo=edit4.text then begin
                 memo2.append(vsetko[a].cislo+';'+vsetko[a].slovo);
                 exit;
              end;
             end;
        showmessage('Tovar neexistuje');
        end;

end;

procedure TForm1.Label4Click(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
var najmensie,j,pozicia,f,a:integer;
    zoradene :array [1..20] of integer;
begin



 a:=0;
 for a:=1 to e do         //nulovanie pola
  zoradene[a]:=0;

  pozicia:=0;
  i:=0;
  j:=0;
  f:=999999;
   memo1.clear;
  for j:= 1 to e do
  begin
  najmensie:=999999;
  for i:= 1 to e do
  begin
       If strtoint(vsetko2[i].cislo)<najmensie then
       begin
            najmensie:=strtoint(vsetko[i].cislo);
            pozicia:=i;
       end;
  end;
      zoradene[j]:= najmensie;
      vsetko2[pozicia].cislo:=inttostr(f);
   memo1.append(inttostr(zoradene[j])+';'+vsetko2[pozicia].slovo);
  end;
end;

end.

