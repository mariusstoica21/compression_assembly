unit UPrincP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,ShellAPI,
  Vcl.Grids, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList,ImageButton,
  System.Actions, Vcl.ActnList;

type
  TFPrincP = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Label3: TLabel;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ImageList1: TImageList;
    ActionList1: TActionList;
    PressStart: TAction;
    PressReset: TAction;
    Memo4: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PressStartExecute(Sender: TObject);
    procedure PressResetExecute(Sender: TObject);
  private
    { Private declarations }
    Btn1 : TImageButton;
    BtnReset : TImageButton;
  public
    { Public declarations }
  end;

var
  FPrincP: TFPrincP;

implementation

{$R *.dfm}



procedure TFPrincP.Button1Click(Sender: TObject);
var encrdecr : integer;
    myText: TStringlist;
    allText: string;
    txt: TextFile;
    s: string;
    outPutList: TStringList;
    i : integer;
    MyString: String;
    Splitted: TArray<String>;
    row : integer;
    Path: string;
    A: array[0..300] of Char;
    temp: string;
begin
  encrdecr := 0;

  //Save the operation string to encrdecr.txt
  myText:= TStringlist.create;
  try
    myText.Add(encrdecr.ToString);
    myText.SaveToFile('Others/encrdecr.txt');
  finally
    myText.Free
  end;

  //Save the operation string to text.txt
  myText:= TStringlist.create;
  try
    myText.Add(Memo1.Lines.Text);
    myText.SaveToFile('Others/text.txt');
  finally
    myText.Free
  end;


  //Execute the assembly executable in order to read the string operation, parse
  //it, and execute it.
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  Path := Path + 'Others\compression1.exe';
  ShellExecute(Handle, 'open',PChar(Path),
  nil, nil, SW_SHOWNORMAL);
//  ShellExecute(Handle, 'open','compression2.exe',
//  nil, nil, SW_SHOWNORMAL);

  //Sleep for one second in order to wait for the opeation to be executed
  sleep(500);

  //The result of the operation is saved in output.txt file
  allText := '';
  AssignFile(Txt, 'Others/output.txt');
  Reset(txt);
  while not Eof(txt) do
  begin
    Readln(txt, s);
    allText := AllText + s;
  end;
  CloseFile(txt);

  //The RichEdit component displays the result
  Memo2.Lines.Text := alltext;



  //The result of the operation is saved in output.txt file
  allText := '';
  AssignFile(Txt, 'Others/dict.txt');
  Reset(txt);
  while not Eof(txt) do
  begin
    Readln(txt, s);
    allText := AllText + s;
  end;
  CloseFile(txt);


  Splitted := alltext.Split([' ']);


  allText := '';

  for i := 0 to length(Splitted) - 2 do
    Memo3.Lines.Add(Splitted[i] + ' ' + i.ToString);

  Button1.Enabled := False;

end;

procedure TFPrincP.Button2Click(Sender: TObject);
var txt: TextFile;
begin
  Memo1.Lines.Text := '';
  Memo2.Lines.Text := '';
  Memo3.Lines.Text := '';

  deletefile('Others/encrdecr.txt');
  deletefile('Others/text.txt');
  deletefile('Others/output.txt');
  deletefile('Others/dict.txt');

  Button1.Enabled := True;
end;

procedure TFPrincP.FormShow(Sender: TObject);
var txt: TextFile;
begin
  Btn1 := TImageButton.Create(self);
  Btn1.Images := ImageList1;
  Btn1.Index := 0;
  Btn1.HoverIndex := 0;
  Btn1.DownIndex := 0;
  Btn1.Width := ImageList1.Width;
  Btn1.Height := ImageList1.Height;
  Btn1.Parent := Panel1;
  Btn1.Top := 240;
  Btn1.Left := 237;
  Btn1.Action := PressStart;

  BtnReset := TImageButton.Create(self);
  BtnReset.Images := ImageList1;
  BtnReset.Index := 1;
  BtnReset.HoverIndex := 1;
  BtnReset.DownIndex := 1;
  BtnReset.Width := ImageList1.Width;
  BtnReset.Height := ImageList1.Height;
  BtnReset.Parent := Panel1;
  BtnReset.Top := 240;
  BtnReset.Left := 445;
  BtnReset.Action := PressReset;


end;

procedure TFPrincP.PressResetExecute(Sender: TObject);
var txt : TextFile;
begin
  Memo1.Lines.Text := '';
  Memo2.Lines.Text := '';
  Memo3.Lines.Text := '';

  deletefile('Others/encrdecr.txt');
  deletefile('Others/text.txt');
  deletefile('Others/output.txt');
  deletefile('Others/dict.txt');



  Btn1.Visible := True;
end;

procedure TFPrincP.PressStartExecute(Sender: TObject);
var encrdecr : integer;
    myText: TStringlist;
    allText: string;
    txt: TextFile;
    s: string;
    outPutList: TStringList;
    i : integer;
    MyString: String;
    Splitted: TArray<String>;
    row : integer;
    Path : string;
    Path1 : string;
    Path2 : string;
    Path3 : string;
    spath : string;
    temp: string;
    A: array[0..300] of Char;
begin
  encrdecr := 0;

  //Save the operation string to encrdecr.txt
  myText:= TStringlist.create;
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  Path := Path + 'Others\encrdecr.txt';
  Memo4.Lines.Text := Path;
  try
    myText.Add(encrdecr.ToString);
    myText.SaveToFile(PChar(Path));
  finally
    myText.Free
  end;



  //Save the operation string to text.txt
  myText:= TStringlist.create;
  Path1 := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  Path1 := Path1 + 'Others\text.txt';
  Memo4.Lines.Text := Path;
  try
    myText.Add(Memo1.Lines.Text);
    myText.SaveToFile(PChar(Path1));
  finally
    myText.Free
  end;

  //Execute the assembly executable in order to read the string operation, parse
  //it, and execute it.

//  Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
//  Path := Path + 'Others\calculator.exe';
//  ShellExecute(Handle, 'open',PChar(Path),
//  nil, nil, SW_SHOWNORMAL);
  temp := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  temp := temp + 'Others\compression1.exe';
  StrPCopy(A, temp);

  //Path2 := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  //Path2 := Path2 + 'Others\compression1.exe';
  Memo4.Lines.Text := Path2;
  //ShowMessage('1');

  ShellExecute(Handle,nil,A ,nil, nil, SW_SHOWNORMAL);
  //ShellExecute(Handle,nil,PChar(Path2) ,nil, nil, SW_SHOWNORMAL);


//  ShellExecute(Handle, 'open','compression2.exe',
//  nil, nil, SW_SHOWNORMAL);

  //Sleep for one second in order to wait for the opeation to be executed
  sleep(500);


  //The result of the operation is saved in output.txt file
  Path3 := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  allText := '';
  Path3 := Path3 + 'Others\output.txt';
  AssignFile(Txt, PChar(Path3));
  Reset(txt);
  while not Eof(txt) do
  begin
    Readln(txt, s);
    allText := AllText + s;
  end;
  CloseFile(txt);

  //The RichEdit component displays the result
  Memo2.Lines.Text := alltext;


  //The result of the operation is saved in output.txt file
  allText := '';
  AssignFile(Txt, 'Others\dict.txt');
  Reset(txt);
  while not Eof(txt) do
  begin
    Readln(txt, s);
    allText := AllText + s;
  end;
  CloseFile(txt);


  Splitted := alltext.Split([' ']);


  allText := '';

  for i := 0 to length(Splitted) - 2 do
    Memo3.Lines.Add(Splitted[i] + ' ' + i.ToString);

  Btn1.Visible := False;

end;

end.
