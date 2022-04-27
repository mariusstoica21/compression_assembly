unit UPrincP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,ShellAPI,
  Vcl.Grids, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList,ImageButton,
  System.Actions, Vcl.ActnList, Vcl.Buttons;

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



procedure TFPrincP.FormShow(Sender: TObject);
var txt: TextFile;
begin
  //Image reference 1
  //edit.png
  //<a href="https://www.flaticon.com/free-icons/edit" title="edit icons">
  //Edit icons created by Kiranshastry - Flaticon</a>

  //Image reference 2
  //lock.png
  //<a href="https://www.flaticon.com/free-icons/lock" title="lock icons">
  //Lock icons created by Those Icons - Flaticon</a>

  //Image reference 3
  //book.png
  //<a href="https://www.flaticon.com/free-icons/dictionary" title="dictionary icons">
  //Dictionary icons created by srip - Flaticon</a>

  //Image reference 4
  //big-dictionary.png
  //<a href="https://www.flaticon.com/free-icons/dictionary" title="dictionary icons">
  //Dictionary icons created by Freepik - Flaticon</a>

  //Image reference 5
  //book_stack_of_three.png
  //<a href="https://www.flaticon.com/free-icons/book" title="book icons">
  //Book icons created by Freepik - Flaticon</a>

  //Image reference 6
  //play_button_arrowhead.png
  //<a href="https://www.flaticon.com/free-icons/play" title="play icons">
  //Play icons created by Freepik - Flaticon</a>

  //Image reference 7
  //rotate-left-circular-arrow-interface-symbol.png
  //<a href="https://www.flaticon.com/free-icons/reset" title="reset icons">
  //Reset icons created by Freepik - Flaticon</a>



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
begin
  encrdecr := 0;

  //Save the operation string to encrdecr.txt
  myText:= TStringlist.create;
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  Path := Path + 'Others\encrdecr.txt';
  try
    myText.Add(encrdecr.ToString);
    myText.SaveToFile(PChar(Path));
  finally
    myText.Free
  end;



  //Save the operation string to text.txt
  myText:= TStringlist.create;
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  Path := Path + 'Others\text.txt';
  try
    myText.Add(Memo1.Lines.Text);
    myText.SaveToFile(PChar(Path));
  finally
    myText.Free
  end;

  //Execute the assembly executable in order to read the string operation, parse
  //it, and execute it.


  Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  Path := Path + 'Others\compression.exe';

  ShellExecute(Handle,nil,'compression_asm.exe' ,nil, nil, SW_SHOWNORMAL);


  //Sleep for half a second in order to wait for the opeation to be executed
  sleep(500);


  //The result of the operation is saved in output.txt file
  Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  allText := '';
  Path := Path + 'Others\output.txt';
  AssignFile(Txt, PChar(Path));
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
