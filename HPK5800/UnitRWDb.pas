unit UnitRWDb;

interface

  procedure ReadMixerDischModeFromDb();           //从数据库中读取搅拌机卸料模式
  procedure ReadEquipmentFlagFromDb();           //从数据库中读取设备属性
  procedure ReadStorageFromDb();                 //从数据库中读取料仓数据
  procedure ReadWeigherParaFromDb(WeigherId : Integer);             //从数据库中读取称参数
  procedure ReadAggreConvParaFromDbToBuf() ;    //从数据库中读取骨料输送参数
  procedure RdAllMixerParaFromDb();             //从数据库中读取全部搅拌机参数
  procedure LoadMaterialInfoFromDbToStorage(StorageId : Integer);    //从数据库中读取材料信息到料仓
  procedure WtNewBasicInfoIntoDb(RecordCode : String; RecordName : String);    //保存基本信息到数据库
  Function  WtFlagIntoEquipTb(NewFlag : String; EquipID : Integer) : Integer;      //写标识属性到Equipment表中
  Function  RdFlagFromEquipTb(var Flag : String; EquipID: Integer) : Integer;    //从Equipment表中读取Flag值

implementation

uses ADODB, UnitMain, Forms, Windows, UnitGlobeVar, SysUtils, Dialogs;

procedure ReadMixerDischModeFromDb();           //从数据库中读取搅拌机卸料模式
var
    Qry : TADOQuery;
begin
//    Qry := TADOQuery.Create(Nil);
//    Qry.Connection := FrmMain.ADOConnection ;

//    Qry.Close ;
//    Qry.SQL.Text := 'select * from Mixer where MixerNo =1 and Attribute like ' + '''' + '%b%' + '''' ;
//    Qry.Open;    //检查搅拌机是否为液压卸料模式
//    if Qry.Eof then    //非液压卸料模式
//    begin
//        MixerDischMode := CntMixerDischOne ;
//    end
//    else             //液压卸料
//    begin
//        MixerDischMode := CntMixerDischTwo ;
//    end;
end;

procedure ReadEquipmentFlagFromDb();    //从数据库中读取设备属性
var
    Qry : TADOQuery ;
    EquipmentFlag : String ;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

     Qry.Close;
    Qry.SQL.Text := 'select Flag from Equipment where ID = 1';
    Qry.Open;

    if not Qry.Eof then
    begin
        EquipmentFlag := Qry.FieldByName('Flag').AsString ;
    end
    else
    begin
        EquipmentFlag := '';
    end;

    if EquipmentFlag = '' then
    begin
        if messagebox(getfocus, pchar('未能成功获取到设备信息记录'), '信息', MB_OK) = idOK then
        begin
            Application.Terminate ;
            exit ;
        end;
    end;

    {骨料提升方式}
    if pos('4', EquipmentFlag) > 0 then
    begin
        AggregateConveyorMode := CntAggregateConveyorBelt;    //4代表皮带输送 ;
    end
    else if pos('5', EquipmentFlag) > 0 then
    begin
        AggregateConveyorMode := CntAggregateConveyorElevator ;    //5代表提升机
    end
    else
    begin
        if messagebox(getfocus, pchar('无效的骨料输送方式记录'), '初始化信息', MB_OK) = idOK then
        begin
            Application.Terminate ;
            Exit ;
        end;
    end;

    {外剂称过水称}
    if pos('g', EquipmentFlag) > 0 then
        AdditiveDischIntoWater := True
    else
        AdditiveDischIntoWater := False;

    {发货单打印方式}
    if pos('fpt', EquipmentFlag) > 0 then
    begin
        FrmMain.CkFrstBatchPrtDevl.Checked := True;
        FrmMain.CkLastBatchPrtDevl.Checked := False;
    end
    else if  pos('lpt', EquipmentFlag) > 0 then
    begin
        FrmMain.CkFrstBatchPrtDevl.Checked := False;
        FrmMain.CkLastBatchPrtDevl.Checked := True;
    end
    else
    begin
        FrmMain.CkFrstBatchPrtDevl.Checked := False;
        FrmMain.CkLastBatchPrtDevl.Checked := False;
    end;


    Qry.Close;
    Qry.SQL.Text := 'select * from Equipment where ID = 1';
    Qry.Open;
    if not Qry.Eof then
    begin
        UserCompany := Qry.FieldByName('UserName').AsString;
    end;
end;

procedure ReadStorageFromDb();
var
    Qry : TADOQuery ;
    i : Integer ;
begin
    for i := 0 to 16 do
    begin
        WeigherInfo[i].StorageNumber := 0;
    end;

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close ;
    Qry.SQL.Text := 'select count(*) as StorageCount , Instrument from Storage group by Instrument ';
    Qry.Open;
    while not Qry.Eof do
    begin
        WeigherInfo[Qry.FieldByName('Instrument').AsInteger].StorageNumber := Qry.FieldByName('StorageCount').AsInteger  ;
        Qry.Next ;
    end;
end;

procedure ReadWeigherParaFromDb(WeigherId : Integer);             //从数据库中读取称参数
var
    Qry : TADOQuery ;
    ParaCode : String;
    ParaArrayIndex : Integer;
    i : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Text := 'select * from InstrumentPara where InstrumentId =' + inttostr(WeigherId) ;
    Qry.Open;

    while not Qry.Eof do
    begin
        ParaCode := Qry.FieldByName('Code').AsString ;

        for i:=1 to CntWeigherParaCount -1 do
        begin
            if ParaCode = CntWeigherParaInfo[i].CodeInDb then break ;
        end;

        if i > CntWeigherParaCount then
        begin
            if messagebox(getfocus, pchar('未能获取到与' + ParaCode + '匹配的称参数'), '信息', MB_OK) = idOK then
            begin
                ;
            end;
        end;

        ParaArrayIndex := CntWeigherParaInfo[i].BufIndex;
        if ParaArrayIndex > CntWeigherParaCount then
        begin
            if messagebox(getfocus, pchar('无效的称参数序号' + ParaCode), '信息', MB_OK) = idOK then
            begin
                ;
            end;
        end;

        WeigherPara[WeigherId][ParaArrayIndex].Value   := Qry.FieldByName('ParaValue').AsInteger ;
        WeigherPara[WeigherId][ParaArrayIndex].Decimal := Qry.FieldByName('Decimal').AsInteger;
        WeigherPara[WeigherId][ParaArrayIndex].Flags   := Qry.FieldByName('Flag').AsString;
        
        Qry.Next;
    end;

    Qry.Free;
end;

procedure ReadAggreConvParaFromDbToBuf() ;    //从数据库中读取骨料输送参数
var
    Qry : TADOQuery;
    ParaIndex : Integer;
    ParaCode : String;
begin
    for ParaIndex:=ParaIndex to CntAggregateConvParaCount do
    begin
        AggregateConvPara[1][ParaIndex].Name := '';
        AggregateConvPara[1][ParaIndex].Value := 0;
        AggregateConvPara[1][ParaIndex].Decimal := 0;
    end;

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close ;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from AggreConvdPara';
    Qry.Open;
    while not Qry.Eof do
    begin
        ParaCode := Qry.FieldByName('Code').AsString;
        for ParaIndex:=1 to CntAggregateConvParaCount do
        begin
            if CntAggreConvParaInfo[ParaIndex].CodeInDb = ParaCode then break;
        end;
        if ParaIndex > CntAggregateConvParaCount then
        begin
            Showmessage('无效的' + ParaCode) ;
            break;
        end;
        AggregateConvPara[1][ParaIndex].Name := Qry.FieldByName('Name').AsString ;
        AggregateConvPara[1][ParaIndex].Value := Qry.FieldByName('Value').AsInteger;
        AggregateConvPara[1][ParaIndex].ParaUnit := Qry.FieldByName('Unit').AsString;
        AggregateConvPara[1][ParaIndex].Decimal := Qry.FieldbyName('Decimal').AsInteger;
        AggregateConvPara[1][ParaIndex].Flags := Qry.FieldbyName('Flags').AsString;
        Qry.Next;
    end;

    Qry.Free;
end;

procedure RdAllMixerParaFromDb();             //从数据库中读取全部搅拌机参数
var
    Qry : TADOQuery;
    ParaCode : String ;
    i : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close ;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from MixerPara order by ID';
    Qry.Open;
    while not Qry.Eof do
    begin
        ParaCode := Qry.FieldByName('Code').AsString ;
        for i:=1 to CntMixerParaCount do
        begin
            if CntMixerParaInfo[i].CedeInDb = ParaCode then Break ;
        end;
        if i > CntMixerParaCount then
        begin
            Showmessage('无效的搅拌机参数: ' + ParaCode);
            Continue ;
        end;
        MixerPara[ CntMixerParaInfo[i].IndexInParaArray ].Name    := Qry.FieldByName('Name').AsString ;
        MixerPara[ CntMixerParaInfo[i].IndexInParaArray ].Value   := Qry.FieldByName('Value').AsInteger ;
        MixerPara[ CntMixerParaInfo[i].IndexInParaArray ].Decimal := Qry.FieldByName('Decimal').AsInteger ;
        MixerPara[ CntMixerParaInfo[i].IndexInParaArray ].Unt     := Qry.FieldByName('Unite').ASString;
        MixerPara[ CntMixerParaInfo[i].IndexInParaArray ].Flags   := Qry.FieldByName('Flag').AsString;
        Qry.Next ;
    end;

    Qry.Free;
end;

procedure LoadMaterialInfoFromDbToStorage(StorageId : Integer);
var
    Qry : TADOQuery;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Material where ID=:MaterID';
    Qry.Parameters.ParamByName('MaterID').Value := StorageInfo[StorageId].MaterId;
    Qry.Open;
    if not Qry.Eof then
    begin
        StorageInfo[StorageId].MaterName := Qry.FieldByName('MaterName').AsString;
        StorageInfo[StorageId].MaterSpec := Qry.FieldByName('MaterSpecs').AsString;
    end
    else
    begin
        Showmessage(inttostr(StorageId) +'#料仓材料信息失败!')
    end;
end;

procedure WtNewBasicInfoIntoDb(RecordCode : String; RecordName : String);    //保存基本信息到数据库
var
    Qry : TADOQuery;
    RdExists : Boolean;
begin
    if RecordName = '' then Exit;
    
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from BasiInfo where Code=' + '''' + RecordCode + '''' + ' and ' + 'RdValues=' + '''' + RecordName + '''';
    Qry.Open;
    if not Qry.Eof then
        RdExists := True
    else
        RdExists := False;
    if not RdExists then
    begin
        try
            FrmMain.ADOConnection.BeginTrans;
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Text := 'insert into BasiInfo (Code, RdValues) values (:Code, :RdValues)';
            Qry.Parameters.ParamByName('Code').Value   := RecordCode;
            Qry.Parameters.ParamByName('RdValues').Value := RecordName;
            Qry.ExecSQL;
            FrmMain.ADOConnection.CommitTrans;
        except
            FrmMain.ADOConnection.RollbackTrans;
        end;
    end;
end;

Function WtFlagIntoEquipTb(NewFlag : String; EquipID : Integer) : Integer;            //写标识属性到Equipment表中
//返回值：0 成功  1 失败
var
    Qry : TADOQuery;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;

    try
        FrmMain.ADOConnection.BeginTrans;
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Text := 'update Equipment set Flag=' + '''' + NewFlag + '''' + ' ' +'where ID=' + inttostr(EquipID);
        Qry.ExecSQL;
        FrmMain.ADOConnection.CommitTrans;
        Result := 0;
    except
        FrmMain.ADOConnection.RollbackTrans;
        Result := 1;
    end;
end;

Function  RdFlagFromEquipTb(var Flag : String; EquipID: Integer) : Integer;    //从Equipment表中读取Flag值
//返回值：0 成功  1 失败
var
    Qry      : TADOQuery;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select Flag from Equipment where ID=' + inttostr(EquipID);
    Qry.Open;
    if not Qry.Eof then
    begin
        Flag := Qry.FieldByName('Flag').AsString;
        Result := 0;
    end
    else
    begin
        Result := 1;
    end;
end;

end.
