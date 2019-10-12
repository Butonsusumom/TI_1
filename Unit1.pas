unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Memo2: TMemo;
    Button3: TButton;
    Label1: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
     TAl=array [1..33] of Byte;
     TMAS=array [1..200] of Byte;

 var
  B:array [1..33] of Byte=(192,193,194,195,196,197,168,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223);
  SMALL:array [1..33] of Byte=(224,225,226,227,228,229,184,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255);
  Bch:array[1..33] of char = ('À','Á','Â','Ã','Ä','Å','¨','Æ','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ð','Ñ','Ò','Ó','Ô','Õ','Ö','×','Ø','Ù','Ú','Û','Ü','Ý','Þ','ß');
  Sch:array[1..33] of char = ('à','á','â','ã','ä','å','¸','æ','ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','ó','ô','õ','ö','÷','ø','ù','ú','û','ü','ý','þ','ÿ');
  function Checkstreng(Name:string):string;
var c:Char;
Fin:TextFile;
s:string;
    begin
      AssignFile(Fin,Name);
      Reset(Fin);
      s:='';
       while not EOF(Fin) do
         begin
         read(Fin,c);
           if c  in ['A'..'Z','a'..'z'] then
          begin
           if c in ['A'..'Z'] then
            c:=chr(ord(c)+32);
            s:=s+c;
          end;
         end;
         Checkstreng:=s;
         close(Fin);
    end;

    function Checkstrengde(Name:string; var sk:integer):string;
var c:Char;
Fin:TextFile;
s:string;
    begin
    sk:=0;
      AssignFile(Fin,Name);
      Reset(Fin);
      s:='';
       while not EOF(Fin) do
         begin
         read(Fin,c);
           if c  in ['A'..'Z','a'..'z',' '] then
          begin
           if c in ['A'..'Z'] then
            c:=chr(ord(c)+32);
            s:=s+c;
          end;
          if c=' ' then inc(sk);

         end;
         Checkstrengde:=s;
         close(Fin);
    end;

    function CheckKeystring(Name:string):string;
var
s:string;
i:Integer;
    begin
      s:='';
         begin
           for i:=1 to Length(Name) do
            begin
           if Name[i]  in ['A'..'Z','a'..'z'] then
          begin
           if Name[i] in ['A'..'Z'] then
            Name[i]:=chr(ord(Name[i])+32);
            s:=s+Name[i];
          end;
         end;
         end;
         CheckKeystring:=s;
    end;

      function Checkrus(Name:string;var p:integer):string;
  var
  F:TextFile;
  a:char;
  i,j:integer;
  s:string;
  //B:array [1..33] of Byte=(192,193,194,195,196,197,168,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223);
  //S:TAl=(224,225,226,227,228,229,184,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255);
begin
  j:=1;
  p:=1;
  s:='';
  Assign(F,Name);
  Reset(F);
  while not Eof(F) do
    begin
       Read(F,a);
       for i:=1 to 33 do
         begin
           if (a=Bch[i]) or (a=Sch[i])  then
           begin
           s:=s+Sch[i];
            //s:=s+chr(SMALL[i]);
            Inc(j);
           end;
         end;
        if a=' ' then
         begin
           s:=s+' ';
           inc(p);
         end;
    end;
    dec(j);
    dec(p);
    Checkrus:=s;
CloseFile(F);
end;
 function Checkkeyrus(Name:string):string;
  var
  F:textfile;
  a:char;
  i,j,d:integer;
  s:string;
  //B:array [1..33] of Byte=(192,193,194,195,196,197,168,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223);
  //S:TAl=(224,225,226,227,228,229,184,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255);
begin
  j:=1;
  s:='';
  for d := 1 to Length(Name) do

    begin
      a:=Name[d];
       for i:=1 to 33 do
         begin
           if (a=Bch[i]) or (a=Sch[i])  then
           begin
           s:=s+Sch[i];
            //=s+chr(SMALL[i]);
            Inc(j);
           end;
         end;
    end;
    dec(j);
    Checkkeyrus:=s;
end;




{function Checkkeyrus(Name:string;var j:integer):TMAS;
  var
  F:file of Byte;
  a:byte;
  i,g:integer;
  //B:array [1..33] of Byte=(192,193,194,195,196,197,168,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223);
  //S:TAl=(224,225,226,227,228,229,184,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255);
begin
  j:=1;
  for g := 1 to Length(Name) do

    begin
      a:=ord(Name[g]);
       for i:=1 to 33 do
         begin
           if (a=B[i]) or (a=SMALL[i])  then
           begin
            Checkkeyrus[j]:=SMALL[i];
            Inc(j);
           end;
         end;
    end;
    dec(j);
CloseFile(F);
end;}


      {  function CheckKeystringrus(Name:string):string;
var

s:string;
i:Integer;
    begin
      s:='';
         begin
           for i:=1 to Length(Name) do
            begin
           if Name[i]  in ['?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?'] then
          begin
           if Name[i] in ['?'..'?'] then
            Name[i]:=chr(ord(Name[i])+32);
            s:=s+Name[i];
          end;
         end;
         end;
         CheckKeystringrus:=s;
    end;      }

   function CheckKeynumber(Name:string):string;
var

s:string;
i:Integer;
    begin
      s:='';
         begin
           for i:=1 to Length(Name) do
            begin
           if Name[i]  in ['1','2','3','4','5','6','7','8','9','0'] then
          begin
            s:=s+Name[i];
          end;
         end;
         end;
         CheckKeynumber:=s;
    end;

    function Checkstrrus(Name:string):string;
var c:Char;
Fin:TextFile;
s:string;
    begin
      AssignFile(Fin,Name);
      Reset(Fin);
      s:='';
       while not EOF(Fin) do
         begin
         read(Fin,c);
           if c  in ['À'..'ß','à'..'ÿ'] then
          begin
           if c in ['À'..'ß'] then
            c:=chr(ord(c)+32);
            s:=s+c;
          end;
         end;
         Checkstrrus:=s;
         close(Fin);
    end;




procedure Railcipher(s:string;key:integer;Nameex:string);
var
 i,j:Integer;
 Fex:textfile;
   function Count(n,p:integer):integer;
 begin
   count:=Abs(n-1-p mod (2*(n-1)));
 end;

 begin
 AssignFile(Fex,Nameex);
  Rewrite(Fex);
  //  if length(s)<=k then write(s)
 // else
  for i:=key-1 downto 0 do
    begin
       for j:=1 to length(s)do
       begin
          if Count(key,j-1)= i then
             write(Fex,s[j]);
       end;
       write(Fex,' ');
    end;

    close(FEx);
 end;

  procedure RailDecipher(s:string;k:integer;Nameex:string);
 var n,c,i,j,p:Integer;
 t:string;
 Fex:textfile;
 begin
 AssignFile(Fex,Nameex);
  Rewrite(Fex);
   t:=s;
   i:=1;
   n:=k-1;
   while  i<=Length(s) do
    begin

       if s[i]<>' ' then
        begin
          c:=0;
          j:=i;
          while (s[i]<>' ') and (i<=Length(s)) do
           begin
             if (i-j) mod 2 =0 then
             begin
               p:=c+(-n+k-1);
              if n+k-1=-n+k-1 then  c:=c+2*(k-1);
               end
                else
             begin
             if (i-j) mod 2 <>0 then
             if 2*(k-1)=n+k-1 then
             begin
               c:=c+2*(k-1);
                p:=c+(-n+k-1);
             end
             else
               p:=c+(n+k-1);
              c:=c+2*(k-1);

             end;
              t[p+1]:=s[i];
              Inc(i)
           end
        end
          else
          begin
           Dec(n);
           inc(i);
          end;
    end;
    for i:=1 to Length(s)-k do
      write(Fex,t[i]);
   close(FEx);
 end;


procedure Columncipher(text,key,Nameex:string);
var i,j,k,N,M,temp,d,l,q,col: integer;
    t: string;
    buf:char;
    A:array of array of Char;
    Fex:textfile;
    sec:integer;
begin
  AssignFile(Fex,Nameex);
  Rewrite(Fex);
  M:=length(key);
  N:=1;
  temp:=M;
  while temp<length(text) do
  begin
    temp:=temp+M;
    inc(N);
  end;
  SetLength(A,N,M);

  {for j:= 0 to M-1 do
    A[0,j]:=key[j+1];  }

  k:=1;
  for i:= 0 to N-1 do
    for j:= 0 to M-1 do
    begin
      if k<=Length(text) then
      begin
      A[i,j]:=text[k];
      inc(k);
      end;
    end;

    t:=key;
    for i:=1 to Length(t)-1 do
    begin
      for j:=i to Length(t) do
        begin
            if t[i]>t[j] then
             begin
               buf:=t[i];
               t[i]:=t[j];
               t[j]:=buf;
             end;
        end;
    end;
  l:=0;
  sec:=1;
  for i:=1 to Length(t) do
    begin
    if i>1 then
    begin
     if t[i-1]=t[i] then
      begin
        inc(sec);
      end
      else sec:=1;
    end
    else sec:=1;
    col:=1;
      for j:=1 to Length(key) do
        begin
          
           if t[i]=key[j] then
         begin
           if col=sec then
          begin
             begin
               for d:=0 to N-1 do
               begin
                  if l<=Length(text)+1 then
                  begin
                  if A[d,j-1] in ['a'..'z'] then
                  begin
                  write(Fex,A[d,j-1]);
                  inc(l);
                  end;
                  end;
                  end;
                  if i<>Length(t)  then
                  write(Fex,' ');
                  end;
                  inc(col);
           end else 
           inc(col);
         end
           
        end;
    end;
        close(Fex);
end;

 procedure Columndecipher(text,Key,NameEx:string);
 var
  Fex:textfile;
  i,j,k,N,M,temp,d,l,sec,col: integer;
    str,t: string;
    buf:char;
    A:array of array of char;
    flag:boolean;
  q: Integer;
 begin
   AssignFile(Fex,Nameex);
   Rewrite(Fex);
   M:=length(key);
     N:=1;
     temp:=M;
      while temp<length(text)-length(key)+1 do
       begin
        temp:=temp+M;
        inc(N);
       end;
    SetLength(A,N,M);
   k:=1;

     i:=0;
     j:=0;
     while (j<=M-1) do
     begin
       i:=0;
       while (j<=M-1) do
     begin
       i:=0;
      while (i<=N-1) and (Text[k]<>' ')  do
      begin
        if (Text[k]<>' ') and (k<=length(text)) then
           begin
             A[i,j]:=text[k];
             inc(i);
           end;
           Inc(k);
           if k= length(text)+1 then Break;
           end;
           Inc(k);
           inc(j);
           if k= length(text)+1 then Break;
           end;

     t:=key;
    for i:=1 to Length(t)-1 do
    begin
      for j:=i to Length(t) do
        begin
            if t[i]>t[j] then
             begin
               buf:=t[i];
               t[i]:=t[j];
               t[j]:=buf;
             end;
        end;
    end;
     l:=0;
     sec:=0;
   for d:=0 to N-1 do
  for i:=1 to Length(t) do
    begin
    sec:=0;
     for q := i  downto 1 do
      begin
        if key[i]=key[q] then
          inc(sec);
      end;
      col:=1;
      flag:=false;
      for j:=1 to Length(key) do
        begin
        if flag=false then
         begin
          { if j>1 then
           begin
            if t[j-1]=t[j] then
              begin
               inc(sec);
              end
           else sec:=1;
          end
           else sec:=1; }
            
           if t[j]=key[i] then
           begin
            if col=sec then
             begin
                  if l<=Length(text) then
                  begin
                  write(Fex,A[d,j-1]);
                 //  inc(col);
                   flag:=true;
                  inc(l);
                  end;
                 inc(col);
                  
             end
             else inc(col);
           end;
           end; 
        end
      end;
    close(Fex);
  end;
 end;


{procedure VIZcipher(s,key,Nameex:string);
  var
len:Integer;//count correct symbols
i,j,sym,alp:integer;
C:string;
x,y,z,w,k:integer;
Fex:textfile;
begin
AssignFile(Fex,Nameex);
  Rewrite(Fex);
  Len:=0;
   w:=ord('a');
   alp:=26+W;
    for i:=1 to Length(s) do
     begin
       if s[i]=' ' then write(Fex,s[i])
       else
       begin
        sym:=i mod Length(key);
        if sym=0 then sym:=Length(key);
        y:=ord(s[i]);
        z:=ord(key[sym]);
        x:=abs(y+z-w);
        if x mod alp <ord('a') then c:=chr((x mod alp)+w)
        else
        c:=chr((x mod alp));
        write(Fex,c);
        end;
     end;
     close(Fex);
end;


procedure VIZdecipher(S,Key,NameEx:string);
 var
len:Integer;//count correct symbols
i,j,sym,alp:integer;
C:string;
x,y,z,w,k:integer;
Fex:textfile;
begin
     AssignFile(Fex,Nameex);
  Rewrite(Fex);
   Len:=0;
   w:=ord('a');
   alp:=26+W;
    for i:=1 to Length(s) do
     begin
       if s[i]=' ' then write(s[i])
       else
       begin
        sym:=i mod Length(key);
        if sym=0 then sym:=Length(key);
        y:=ord(s[i]);
        z:=ord(key[sym]);
        x:=abs(y+alp-w-(z-w));
        if x mod alp <ord('a') then c:=chr((x mod alp)+w)
        else
        c:=chr((x mod alp));
        write(Fex,c);
        inc(len)
        end;
     end;

     Close(Fex);
end;        }

procedure VIZcipher(s,key:string;Nameex:string);
var
  Fex:textfile;
  Len,w,alp,i,sym,d,y,z,x:integer;
  c:char;
  col:integer;
begin
  Assign(Fex,Nameex);
 Rewrite(Fex);
  Len:=0;
  col:=0;
   //w:=224;
   //alp:=26+W;
   alp:=33;
    for i:=1 to Length(s) do
     begin
       if s[i]=' ' then
       begin
       write(Fex,s[i]);
       inc(col);
       end
       else
       begin
        sym:=(i-col) mod Length(key);
        if sym=0 then sym:=Length(key);
        for d := 1 to 33 do
          begin
            if s[i]=Sch[d] then
            y:=d;
            if key[sym]=Sch[d] then
            z:=d;
          end;
        x:=abs(y+z-1);
        c:=Sch[x mod alp];
       Write(Fex,c);
        inc(len)
        end;
     end;
     Close(Fex);
end;

procedure VIZdecipher(s,key:string;Nameex:string);

var
  Fex:textfile;
  Len,w,alp,i,sym,d,y,z,x:integer;
  c:char;
  col:integer;
begin
   AssignFile(Fex,Nameex);
   Rewrite(Fex);
   Len:=0;
   col:=0;
  // w:=224;
  // alp:=26+W;
  alp:=33;
    for i:=1 to Length(s) do
     begin
       if s[i]=' ' then
       begin
        Write(Fex,s[i]);
        Inc(col);
        end
       else
       begin
         sym:=(i-col) mod Length(key);
        if sym=0 then sym:=Length(key);
        for d := 1 to 33 do
          begin
            if s[i]=Sch[d] then
            y:=d;
            if key[sym]=Sch[d] then
            z:=d;
          end;
        //y:=ord(s[i]);
       // z:=ord(key[sym]);
        x:=abs(y+alp+1-(z));
        c:=Sch[x mod alp];
        Write(Fex,c);
        inc(len)
        end;
     end;
     CloseFile(Fex);
end;


procedure TForm1.Button1Click(Sender: TObject);
var f:file;
size,col,i,sk,ps:Integer;
str:string;
Key:string;
ke:string;
Flags: TReplaceFlags;
Nameex:string;
D,G:TMAS;

begin

if FileExists(Memo1.Text) then
  begin


   if RadioButton1.isChecked then
       begin
       Nameex:= StringReplace( Memo1.Text, '.txt', '(railccipher).txt', Flags);
         Str:=Checkstreng(Memo1.Text);
         //showmessage(str);
         if str='' then showmessage('You enter no symbols satisfy the conditions')
        else begin
         Ke:=CheckKeynumber(Memo2.Text);
         if ke='' then showmessage('You enter no symbols satisfy the conditions')
         else begin
         Railcipher(Str,strtoint(Ke),NameEx);
         end;
         end;
       end;
   if RadioButton2.isChecked then
       begin
       Nameex:= StringReplace( Memo1.Text, '.txt', '(columncipher).txt', Flags);
         Str:=Checkstreng(Memo1.Text);
         if str='' then showmessage('You enter no symbols satisfy the conditions')
         else begin
         Key:=CheckKeystring(Memo2.Text);
         if key='' then showmessage('You enter no symbols satisfy the conditions')
         else begin
         Columncipher(Str,Key,NameEx);
         end;
         end;
       end;
   if RadioButton3.isChecked then
      begin
      Nameex:= StringReplace( Memo1.Text, '.txt', '(vizenercipher).txt', Flags);
      Str:=Checkrus(Memo1.Text,sk);
         // showmessage(str);
         if length(str)-sk=0 then showmessage('You enter no symbols satisfy the conditions')
         else
         begin
         Key:=CheckKeyrus(Memo2.Text);
         //showmessage(key);
         if key='' then showmessage('You enter no symbols satisfy the conditions')
         else begin
         VIZcipher(Str,Key,NameEx);
         end;
         end;
      end;
   //if (RadioButton1.isChecked=false) and (RadioButton2.isChecked=false) and (RadioButton3.isChecked=false) then
   //     ShowMessage('You haven''t select any technique.')
        end ;
  //else ShowMessage('Such file does not exists.');

end;


 procedure TForm1.Button2Click(Sender: TObject);
var f:file;
size,col,i,sk,ps:Integer;
str:string;
Key:string;
ke:string;
Flags: TReplaceFlags;
Nameex:string;
D,G:TMAS;

begin

if FileExists(Memo1.Text) then
  begin


   if RadioButton1.isChecked then
       begin
       Nameex:= StringReplace( Memo1.Text, '.txt', '(raildecipher).txt', Flags);
         Str:=Checkstrengde(Memo1.Text,sk);
         if length(str)-sk=0 then showmessage('You enter no symbols satisfy the conditions')
         else begin
         Ke:=CheckKeynumber(Memo2.Text);
         if ke='' then showmessage('You enter no symbols satisfy the conditions')
         else begin
         Raildecipher(Str,strtoint(Ke),NameEx);
         end;
         end;
       end;
   if RadioButton2.isChecked then
       begin
       Nameex:= StringReplace( Memo1.Text, '.txt', '(columndecipher).txt', Flags);
         Str:=Checkstrengde(Memo1.Text,sk);
         if length(str)-sk=0 then showmessage('You enter no symbols satisfy the conditions')
         else begin
         Key:=CheckKeystring(Memo2.Text);
         if key='' then showmessage('You enter no symbols satisfy the conditions')
         else begin
         Columndecipher(Str,Key,NameEx);
       end;
         end;
       end;
   if RadioButton3.isChecked then
      begin

      Nameex:= StringReplace( Memo1.Text, '.txt', '(vizenerdecipher).txt', Flags);
      Str:=Checkrus(Memo1.Text,sk);
         // showmessage(inttostr(size));
         if length(str)-sk=0 then showmessage('You enter no symbols satisfy the conditions')
         else
         begin
         Key:=CheckKeyrus(Memo2.Text);
         if key='' then showmessage('You enter no symbols satisfy the conditions')
         else begin
         VIZdecipher(Str,Key,NameEx);
         end;
         end;
      end;
  end;
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
   begin
  memo1.Text:='';
//  try
    if OpenDialog1.Execute then
    begin
      Memo1.Text:=OpenDialog1.FileName;
      //dlgOpen.Free;
    end;
  //  except MessageDlg('error', mtError, [mbOK], 0);
  end;
end;







end.
