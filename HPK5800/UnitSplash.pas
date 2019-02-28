unit UnitSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, RzPrgres;

type
  TFrmSplash = class(TForm)
    LbSplash: TLabel;
    Timer1: TTimer;
    LbIniInfo: TLabel;
    RzProgressBar1: TRzProgressBar;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

  SplashState : integer;

implementation

uses UnitGlobeVar, UnitMain;

{$R *.dfm}

procedure TFrmSplash.Timer1Timer(Sender: TObject);
begin
    case SplashState of
        0 :
        begin
            SplashState := 1;
            LbSplash.Caption := 'TSC2016��ʼ���У������ĵȴ�';
        end;
        1:
        begin
            SplashState := 2;
            LbSplash.Caption := 'TSC2016��ʼ���У������ĵȴ�.';
        end;
        2 :
        begin
            SplashState := 3;
            LbSplash.Caption := 'TSC2016��ʼ���У������ĵȴ�..';
        end;
        else
        begin
        SplashState := 0;
            LbSplash.Caption := 'TSC2016��ʼ���У������ĵȴ�...';
        end;
    end;
    
end;



    
procedure TFrmSplash.FormCreate(Sender: TObject);
begin
    SplashState := 0;
    LbSplash.Caption := 'TSC2016��ʼ���У������ĵȴ�';
end;

procedure TFrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree ;
end;

end.
