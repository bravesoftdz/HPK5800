unit UnitSetPassWord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, Buttons, sBitBtn, DB, ADODB;

type
  TFrmSetPassWord = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sMEtLoginNm: TsMaskEdit;
    sEtConfirmPasd: TsMaskEdit;
    sEtNewPasd: TsMaskEdit;
    sEtOldPasd: TsMaskEdit;
    sBitBtn1: TsBitBtn;
    sBtnCancle: TsBitBtn;
    ADOQuery1: TADOQuery;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sBtnCancleClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSetPassWord: TFrmSetPassWord;
var
  FrmEditMode : Integer;
Const
  FrmEdtMdIsSetPasdForPersonnelMange = 1;    //��Ա������������
  FrmEdtMdIsSetPasdForPerson         = 2;    //��Ա��������
implementation

uses UnitGlobeVar, UnitPersonnelMangement, UnitMain;

{$R *.dfm}

procedure TFrmSetPassWord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmSetPassWordCrt := False;
    Action := caFree;
end;

procedure TFrmSetPassWord.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection ;
end;

procedure TFrmSetPassWord.FormShow(Sender: TObject);
Var
   GrdRowInFrmPersonnelMangement : integer;
begin
    case FrmEditMode of
        FrmEdtMdIsSetPasdForPersonnelMange :    //��Ա������������
        begin
            GrdRowInFrmPersonnelMangement := FrmPersonnelMangement.grdPerson.Row ;
            sMEtLoginNm.Text := FrmPersonnelMangement.grdPerson.Cells[1, GrdRowInFrmPersonnelMangement] ;
            sMEtLoginNm.Enabled := False;
            sEtOldPasd.Text := FrmPersonnelMangement.grdPerson.Cells[5, GrdRowInFrmPersonnelMangement];
            sEtOldPasd.Enabled := False;
            sEtNewPasd.SetFocus;
        end;

        FrmEdtMdIsSetPasdForPerson         :    //��Ա��������
        begin
            sMEtLoginNm.Text := LoginNm ;
            sMEtLoginNm.Enabled := False;
            sEtOldPasd.SetFocus;
        end;
    end;
end;

procedure TFrmSetPassWord.sBtnCancleClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TFrmSetPassWord.sBitBtn1Click(Sender: TObject);
Var
   GrdRowInFrmPersonnelMangement : integer;
   OldPasd,
   NewPasd,
   ConFirmPasd : String;
begin
    case FrmEditMode of
        FrmEdtMdIsSetPasdForPersonnelMange :    //��Ա������������
        begin
            NewPasd     := Trim(sEtNewPasd.Text);
            ConFirmPasd := Trim(sEtConfirmPasd.Text);
            if NewPasd = ConFirmPasd then
            begin
                GrdRowInFrmPersonnelMangement := FrmPersonnelMangement.grdPerson.Row ;
                FrmPersonnelMangement.grdPerson.Cells[5, GrdRowInFrmPersonnelMangement] := NewPasd;

                if FrmPersonnelMangement.grdPerson.Cells[4, GrdRowInFrmPersonnelMangement] = '' then
                begin
                    FrmPersonnelMangement.grdPerson.Cells[4, GrdRowInFrmPersonnelMangement] := IntToStr(CntPersonIsModify) ;
                end;
                SaveToDbEnableInUtPersonelManege := True;
                
                Self.Close;
            end
            else
            begin
                Showmessage('������ �� ȷ������ ��һ��!');
            end;
        end;

        FrmEdtMdIsSetPasdForPerson         :    //��Ա��������
        begin
            OldPasd := Trim(sEtOldPasd.Text);
            ADOQuery1.Close;
            ADOQuery1.SQL.Text := 'select Passwords from Staff where LoginNm=' + '''' + LoginNm + '''';
            ADOQuery1.Open;
            if ADOQuery1.Eof then
            begin
                Showmessage('��Ч���û���');
            end
            else
            begin
                if ADOQuery1.FieldByName('Passwords').AsString <> OldPasd then
                begin
                    Showmessage('ԭ�������!');
                end
                else
                begin
                    NewPasd := Trim(sEtNewPasd.Text);
                    ConFirmPasd := Trim(sEtConfirmPasd.Text);
                    if NewPasd <> ConFirmPasd then
                    begin
                        Showmessage('������ �� ȷ������ ��һ��!');
                    end
                    else
                    begin
                        Try
                            FrmMain.ADOConnection.BeginTrans;
                            ADOQuery1.Close;
                            ADOQuery1.SQL.Clear;
                            ADOQuery1.SQL.Text := 'update Staff set Passwords=' + '''' + NewPasd + ''''
                                                + ' ' + 'where LoginNm=' + '''' + LoginNm + '''';
                            ADOQuery1.ExecSQL;
                            FrmMain.ADOConnection.CommitTrans;
                            Self.Close;
                        except
                            FrmMain.ADOConnection.RollbackTrans;
                            Showmessage('�޸�ʧ��!');
                        end;
                    end;
                end;
            end;
        end;
    end;

end;



end.
