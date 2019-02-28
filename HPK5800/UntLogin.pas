unit UntLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Mask, RzEdit, RzCmboBx, ExtCtrls,
  RzPanel, DB, ADODB;

type
  TFrmLogin = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzCmbLoginNm: TRzComboBox;
    REtLoginPassword: TRzMaskEdit;
    RzBitBtn1: TRzBitBtn;
    RzBtnLogin: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBtnLoginClick(Sender: TObject);
    procedure RzCmbLoginNmChange(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

  LoginCounter : Integer;

implementation

uses UnitGlobeVar, UnitMain, UnitPersonnelMangement;

{$R *.dfm}

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
    ADOQuery1.Connection := FrmMain.ADOConnection;

    LoginCounter := 0;

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
    RzCmbLoginNm.Items.Clear;

    ADOQuery1.Close ;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select LoginNm from Staff where State=' + '''' + '1' + '''';
    ADOQuery1.Open;
    while not ADOQuery1.Eof do
    begin
        RzCmbLoginNm.Items.Add(ADOQuery1.FieldByName('LoginNm').AsString);
        ADOQuery1.Next ;
    end;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmLoginCrt := False ;
    Action := caFree;
end;

procedure TFrmLogin.RzBtnLoginClick(Sender: TObject);
var
    SelectLoginNm : String;
    InputPassword : String;
begin

    SelectLoginNm := Trim(RzCmbLoginNm.Text);
    if SelectLoginNm = '' then
    begin
        Showmessage('��ѡ���½�˺�');
        exit;
    end;

    InputPassword := Trim(REtLoginPassword.Text);

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'select Passwords,Permit from Staff where LoginNm =' + '''' + SelectLoginNm + '''' ;
    ADOQuery1.Open;
    if ADOQuery1.Eof then
    begin
        Showmessage('��ѡ���½�˺�');
        exit;
    end
    else
    begin
        LoginCounter := LoginCounter + 1;

        if ADOQuery1.FieldByName('Passwords').AsString = InputPassword then
        begin
            LoginNm := SelectLoginNm ;

            if LoginNm = 'Admin' then
            begin
                PersonnelPermit := '[Ae]' + '[Be]' + '[Ce]' + '[De]'
                                 + '[Ee]'
                                 + '[Fe]'
                                 + '[' + CntPermissonCode[CntPermIsProdTask     ] + 'e]'
                                 + '[' + CntPermissonCode[CntCommunicate        ] + 'e]'    //ͨѶ����
                                 + '[' + CntPermissonCode[CntSysConfig          ] + 'e]'    //�豸����
                                 + '[' + CntPermissonCode[CntSignalDefine       ] + 'e]'    //�źŶ���
                                 + '[' + CntPermissonCode[CntPermIsMaterialStock] + 'e]'    //ԭ�Ͽ��
                                 + '[' + CntPermissonCode[CntPermIsProdData     ] + 'e]'    //�������ݲ�ѯ
                                 + '[' + CntPermissonCode[CntPermIsWeigCalZero  ] + 'e]'    //��ֵ����
                                 + '[' + CntPermissonCode[CntPermIsWeigCalValue ] + 'e]'    //��ֵУ׼
                                 + '[' + CntPermissonCode[CntPermIsPara         ] + 'e]'    //��������

                                 ;

            end
            else
            begin
                PersonnelPermit := ADOQuery1.FieldByName('Permit').AsString ;
            end;
            
            Self.modalresult := mrok;
        end
        else
        begin
            if LoginCounter >= 3 then
            begin
                Showmessage('�����������볬��3�Σ�ϵͳ�Զ��˳�');
                Self.modalresult := mrCancel ;
            end
            else
            begin
                Showmessage('�˺����벻һ�£�����������');
            end;
        end;
    end;

end;

procedure TFrmLogin.RzCmbLoginNmChange(Sender: TObject);
begin
    LoginCounter := 0;
end;

procedure TFrmLogin.RzBitBtn1Click(Sender: TObject);
begin
    Self.modalresult := mrCancel ;
end;

end.
