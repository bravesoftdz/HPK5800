unit UnitInicontrolPanel;

interface
  procedure IniControlPanelInfo();      //初始控制信息
    procedure IniWeigherBasicInfo();    //初始化称基本信息
    procedure IniWeigherPara();    //初始化称参数
    procedure IniStorage();             //初始化料仓
      procedure IniStorageBasic();        //初始化料仓基本信息
      procedure IniStoragePara();         //初始化料仓参数

  procedure IniAggregateConveyingSysForControlPanel();    //骨料输送系统
    procedure IniAggregateConveyingForControlPanel();    //骨料皮带输送方式控制中心初始化
      procedure IniAggregateLevelBelt();                     //平皮带初始化
      procedure IniAggregateMidHopper();     //初始化骨料中间斗
      procedure IniAggregateLiftBucket( BucketNum : Integer );    //初始化骨料提升斗

  procedure IniAggregateElevatorForControlPanel();         //骨料提升机输送方式控制中心初始化

    procedure IniStorageMaterialInfo();                      //料仓材料信息
  procedure IniRingForControlPanel();                                      //电铃
  
  procedure IniMixerForControlPanel();                       //初始化搅拌机
    procedure IniMixerBasicForControlPanel();    //初始化搅拌机基本信息
      //procedure IniLoadMixerImgsForControlPanel(X,Y : Integer; Left,Top : Integer);
    //procedure IniMixDschDoorForControlPanel();    //初始化搅拌机卸料门
    //procedure IniCheckBoxInfo(CheckCode : String; CheckBoxName: String; Check : Boolean);    //初始化CheckBox控件信息
  procedure IniMixerParaForControlPanel();                //初始化搅拌机参数

implementation

uses ADODB, Windows, UnitMain, UnitGlobeVar, UnitRWDb,
      SysUtils, Forms, Dialogs, math
    ;

procedure IniControlPanelInfo();
begin
    IniAggregateConveyingSysForControlPanel();    //骨料输送系统

    IniWeigherBasicInfo();    //初始化称基本信息
    IniWeigherPara();         //初始化化称参数

    IniStorage();                                 //料仓初始化

//    ReadAggreConvParaFromDbToBuf() ;              //从数据库中读取骨料输送参数
    IniRingForControlPanel();                     //电铃

    IniMixerForControlPanel();                    //搅拌机图片

    //初始化生产模式
    ProdMode := CtProdIsSingle ;    //单任务生产
    FrmMain.BtnProdContinue.Glyph := Nil;
    FrmMain.ImageList1.GetBitmap(0, FrmMain.BtnProdContinue.Glyph) ;

    FrmMain.sStatusBar1.Panels[0].Text := '与下位机通讯:  '

    //ReadMaterialFromDbToStorage();       //为料仓赋值材料
end;

procedure IniWeigherBasicInfo();    //初始化称基本信息
Var
    Qry : TADOquery;
    WeigherID ,
    InstrumentID : Integer ;
    FlagStr : String ;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Instrument where ID >= 1 and ID <= 16 order by ID';
    Qry.Open;
    if Qry.Eof then
    begin
        if (Application.messagebox(pchar('称仪表号设置读取失败，系统初始化失败'), '初始化失败', MB_OK) = idOK) then
        begin
            Application.Terminate ;
            exit;
        end;
    end
    else
    begin
        while not Qry.Eof do
        begin
            WeigherID := Qry.FieldByName('Address').AsInteger;
            if ( weigherID < 1 ) or ( WeigherID > 16 ) then
            begin
                if ( Application.MessageBox(pchar('无效的称地址，系统初始化失败！'), '初始化失败', MB_OK) = idOK ) then
                begin
                    Application.Terminate ;
                    exit;
                end;
            end;

            InstrumentID := Qry.FieldByName('InstrumentID').AsInteger ;
            if ( InstrumentID < 0 ) or ( InstrumentID > 16 ) then
            begin
                if ( Application.MessageBox(pchar('无效的仪表号，系统初始化失败！'), '初始化失败', MB_OK) = idOK ) then
                begin
                    Application.Terminate;
                    exit;
                end;
            end;

            WeigherInfo[WeigherID].InstrumentId := InstrumentID ;
            WeigherInfo[WeigherID].Name := Qry.FieldByName('Name').AsString ;

            FlagStr := Qry.FieldByName('Attribute').AsString ;
            //检查是否带关门限位
            if pos('c', FlagStr) > 0 then    
                WeigherInfo[WeigherID].CloseLmt := True
            else
                WeigherInfo[WeigherID].CloseLmt := False ;
            //检查是否带卸料振动器
            if pos('v', FlagStr) > 0 then
                WeigherInfo[WeigherID].DischVibrator := True
            else
                WeigherInfo[WeigherID].DischVibrator := False;
            //检查称是否上料、卸料泵阀控制
            if pos('d', FlagStr) > 0 then
                WeigherInfo[WeigherID].LdDsIsPumpAndValve := True
            else
                WeigherInfo[WeigherID].LdDsIsPumpAndValve :=  False;
            //检查称是否主副门控制
            if pos('f' , FlagStr) > 0 then
                WeigherInfo[WeigherID].LoadIsFine := True
            else
                WeigherInfo[WeigherID].LoadIsFine := False;
                
            if InstrumentID > 0 then
            begin
                {加载称图片}
                FrmMain.IniLoadWeigherImg(WeigherId,
                                   Qry.FieldByName('XPosition').AsInteger,
                                   Qry.FieldByName('YPosition').AsInteger,
                                   Qry.FieldByName('XSize').AsInteger,
                                   Qry.FieldByName('YSize').AsInteger
                                  );
                WeigherInfo[WeigherId].Enable := True;

                {称卸料阀图片}
                FrmMain.LoadWeigherDischValveImg(WeigherId,
                                   Qry.FieldByName('DischValveImgX').AsInteger,
                                   Qry.FieldByName('DischValveImgY').AsInteger,
                                  ) ;
                WeigherDischValveImgState[WeigherID] := CntWeigDischValveIsClose;          //称卸料阀图片状态 为 关闭 状态

                {称卸料振动器图片}
                if WeigherInfo[WeigherID].DischVibrator = True then
                begin
                    FrmMain.LoadWeigherDischVibratorImg(WeigherId,
                                   Qry.FieldByName('DischVibraImgX').AsInteger,
                                   Qry.FieldByName('DischVibraImgY').AsInteger,
                                  ) ;
                    WeigherDischVibraImgState[WeigherID] := CntVibraImgStaIsClose ;        //称卸料振动器图片状态 为 关闭 状态
                end
                else
                begin
                    WeigherDischVibraImgState[WeigherID] := CntVibraImgStaIsInvalid;       //称卸料振动器图片状态 为 无效 状态
                end;

                {称卸料阀关闭限位图片}
                if WeigherInfo[WeigherID].CloseLmt = True then
                begin
                    FrmMain.LoadWeigherDischValveCloseLmtImg(WeigherId,
                                   Qry.FieldByName('DischValveClosLmtImgX').AsInteger,
                                   Qry.FieldByName('DischValveClosLmtImgY').AsInteger,
                                  ) ;
                end;
                WeigherDischValveCloseLmtImgState[WeigherId] := CntWghrDschValveClsLmtImgIsInvalid ;
                
                {称值标签}
               FrmMain.LoadWeigherValueLabel(WeigherId ,
                                   Qry.FieldByName('ValueLabX').AsInteger,
                                   Qry.FieldByName('ValueLabY').AsInteger,
                                   Qry.FieldByName('ValueLabW').AsInteger,
                                   Qry.FieldByName('ValueLabH').AsInteger,
                                  );

               {称配料计数器标签}
               FrmMain.LoadWeigherLoadCounerLab(WeigherId,
                                   Qry.FieldByName('DischValveImgX').AsInteger -30,
                                   Qry.FieldByName('DischValveImgY').AsInteger -10,);    //称配料计数器 标签
               LbWgrLdCounterVisibleState[WeigherId] := CtLbWgrLdCounterVisibleIsFalse ;    //称配料计数器标签的 Visible 为 False
            end;

            Qry.Next ;
        end;
    end;

end;

procedure IniWeigherPara();    //初始化称参数
var
    i, k : Integer ;
begin
    {仪表参数}
    for i:= 1 to 16 do
    begin
        for k := 1 to CntWeigherParaCount do    //初始化仪表参数
        begin
            WeigherPara[i][k].Value := 0;
        end;
        ReadWeigherParaFromDb(i);              //从数据库中读取仪表参数,更新
    end;
end;

procedure IniStorage();
begin
    IniStorageBasic();    //料仓基本信息
    IniStoragePara();     //料仓参数
    IniStorageMaterialInfo();    //料仓材料信息
end;

procedure IniStorageBasic();
var
    Qry : TADOQuery;
    i : Integer;
    StorageId : Integer ;
    InstrumentId,
    LoadIndex : Integer;
    PictureSourseDir,
    LeftLoadImgDir,
    RightLoadImgDir : WideString ;
    LeftLoadImgType,
    RightLoadImgType : Integer;
    FlagStr : String;
begin
    for i:=1 to CntStorageCount do
    begin
        StorageInfo[i].Enable := False ;
    end;

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Storage where Useful = 1';
    Qry.Open;
    while not Qry.Eof do
    begin
        StorageId := Qry.FieldByName('ID').AsInteger ;

        StorageInfo[StorageId].Enable  := True;
        StorageInfo[StorageId].Name    := Qry.FieldByName('Name').AsString;
        StorageInfo[StorageId].Model   := Qry.FieldByName('Model').AsInteger;
        StorageInfo[StorageId].MaterId := Qry.FieldByName('Mater').AsInteger;

        InstrumentId := Qry.FieldByName('Instrument').AsInteger;
        LoadIndex := Qry.FieldByName('LoadNo').AsInteger;
        
        StorageInfo[StorageId].InstrumentId := InstrumentId ;
        StorageInfo[StorageId].LoadNo := LoadIndex;
        WeigherInfo[InstrumentId].StorageId[LoadIndex] := StorageId;

        FlagStr := Qry.FieldByName('Flag').AsString;

        if pos('a', FlagStr) > 0 then
            StorageInfo[StorageId].DschMode := CntStorageDoubleDsch    //双计量门
        else
            StorageInfo[StorageId].DschMode := CntStorageSignalDsch;
        if pos('b', FlagStr) > 0 then
            StorageInfo[StorageId].Vibrator := True                    //有振动器
        else
            StorageInfo[StorageId].Vibrator := False;
        if pos('c', FlagStr) > 0 then
            StorageInfo[StorageId].StockDsp := True                    //显示库存
        else
            StorageInfo[StorageId].StockDsp := False;

        case StorageInfo[StorageId].Model of
            CntAggregateStorage :    //骨料仓
            begin
                if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then    //双计量门
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageDschD.png' ;

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    LeftLoadImgType  := CntAggregateCoLoadImg ;    //骨料粗计量计量阀图片
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //料仓计量阀图片状态 为 关

                    RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    RightLoadImgType := CntAggregateFineImg ;    //骨料精计量阀图片
                    StorageFineLoadImgState[StorageId] :=  CntLoadImgStateIsClose ;    //料仓精计量阀图片状态 为 关
                end
                else
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageDschD.png';
                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    LeftLoadImgType  := CntAggregateLoadImg ;    //骨料计量阀图片
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //料仓计量图片状态 为 关

                    //RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\AggregateStorageLdClo.bmp' ;
                    //RightLoadImgType := CntAggregateFineImg ;    //骨料精计量阀图片
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsInvalid ;    //料仓计量图片 为 无效
                end;

                StorageInfo[StorageId].Moisture := RoundTo(Qry.FieldByName('Moisture').AsFloat, -2);

            end;

            CntPowderStorage :       //粉料仓
            begin
                if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowderStorageD.png';

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    LeftLoadImgType  := CntPowderCoLoadImg ;    //粉料仓粗计量阀图片
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //料仓计量图片 为 关

                    RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    RightLoadImgType := CntPowderFineImg ;    //粉料仓精计量阀图片
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsClose ;    //料仓精计量图片 为 关
                end
                else
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PoderStorageS.png';
                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    LeftLoadImgType  := CntPowderLoadImg ;    //粉料仓计量阀图片
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //料仓计量图片 为 关

                    //RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\PowStorLdClose.bmp' ;
                    //RightLoadImgType := CntPowderFineImg ;    //粉料仓精计量阀图片
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsInvalid ;    //料仓精计量图片 为 无效
                end;
            end;

            //CntLiquidStorage :       //液体仓
            CntWaterStorage   ,      //水仓
            CntAddtiveStorage :      //外剂仓
            begin
                if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiquidStorageD.png';

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    LeftLoadImgType  := CntLiqCoLoadImg ;        //液体仓计量阀图片 为 粗计量阀
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //计量阀图片 为 关

                    RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    RightLoadImgType := CntLiqFineImg ;       //液体仓精计量阀图片
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //精计量阀图片 为 关
                end
                else
                begin
                    PictureSourseDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiquidStorageS.png';

                    LeftLoadImgDir   := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    LeftLoadImgType  := CntLiqLoadImg ;        //液体仓计量阀图片 为 计量阀
                    StorageLoadImgState[StorageId] := CntLoadImgStateIsClose ;     //计量阀图片 为 关

                    //RightLoadImgDir  := ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\LiqStorLdClose.bmp' ;
                    //RightLoadImgType := CntLiqFineImg ;       //液体仓精计量阀图片
                    StorageFineLoadImgState[StorageId] := CntLoadImgStateIsInvalid ;    //精计量阀图片 为 关
                end;
            end;
        end;

        {创建料仓图片}
        FrmMain.LoadStorageImgFromFile(
          StorageId,
          PictureSourseDir,
          Qry.FieldByName('XPosition').AsInteger,
          Qry.FieldByName('YPosition').AsInteger,
          Qry.FieldByName('ZSize').AsInteger,
          Qry.FieldByName('YSize').AsInteger
          )  ;

        {创建料仓配料阀图片}
        FrmMain.LoadStorageDischImg(
          StorageId,    //料仓序号
          LeftLoadImgType,    //计量信号类型
          LeftLoadImgDir,
          Qry.FieldByName('LtLdX').AsInteger,
          Qry.FieldByName('LtLdY').AsInteger,
          0,
          0
          )  ;
        //SiloLoadVaveState[StorageId] := DigitalStateIsClose;    //料仓计量阀状态

        if StorageInfo[StorageId].DschMode = CntStorageDoubleDsch then    //精计量阀图片
        begin
            FrmMain.LoadStorageDischImg(
              StorageId,    //料仓序号
              RightLoadImgType,    //计量信号类型
              RightLoadImgDir,
              Qry.FieldByName('RtLdX').AsInteger,
              Qry.FieldByName('RtLdY').AsInteger,
              0,
              0
              )  ;
              //SiloFnLdVaveState[StorageId] := DigitalStateIsClose;    //料仓精计量阀状态
        end;

        if StorageInfo[StorageId].Vibrator then    //料仓计量振动器
        begin
            FrmMain.LoadStorageVibrator(
              StorageId,    //料仓序号
              ExtractFilePath(Application.ExeName) + '\Images\Equips\Storages\StorVibratorClose.png' ,
              Qry.FieldByName('LdVibraX').AsInteger,
              Qry.FieldByName('LdVibraY').AsInteger,
              0,
              0
              );
            StorageVibratorImgState[StorageId] := CntVibraImgStaIsClose ;
        end
        else
        begin
            StorageVibratorImgState[StorageId] := CntVibraImgStaIsInvalid ;
        end;
       
        if StorageInfo[StorageId].Model = CntAggregateStorage then    //骨料仓
        begin
            FrmMain.StorageMaterialMoistureLab(StorageId, 0, 0);    //原料含水率
        end;

        FrmMain.LoadStorageLoadTargerLab(StorageId);   //加载料仓配料目标值标签

        Qry.Next;
    end;

    Qry.Free;
end;

procedure IniStoragePara();
var
    Qry : TADOQuery;
    ParaCode : String;
    i : Integer;
    StorageId : Integer;
    PrarArrayIndex : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection;
    
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from StorageParam';
    Qry.Open;
    while not Qry.Eof do
    begin
        ParaCode := Qry.FieldByName('Code').AsString;
        for i:=1 to CntStorageParaCount do
        begin
            if ParaCode = CntStorageParaInfo[i].CodeInDb then break;
        end;
        if i > CntStorageParaCount then
        begin
            Showmessage(Qry.FieldByName('Name').AsString + ' 参数初始化出错');
            Continue;
        end;
        StorageId := Qry.FieldByName('StorageId').AsInteger;
        if (StorageId <1 ) or (StorageId > CntStorageCount ) then
        begin
            Showmessage('物料料仓号' + inttostr(StorageId));
            Continue;
        end;
        PrarArrayIndex :=CntStorageParaInfo[i].BufIndex ;
        StoragePara[StorageId][PrarArrayIndex].Value   := Qry.FieldByName('Value').AsInteger;
        StoragePara[StorageId][PrarArrayIndex].Decimal := Qry.FieldByName('Decimal').AsInteger ;
        StoragePara[StorageId][PrarArrayIndex].Flags   := Qry.FieldByName('Flags').AsString;
        Qry.Next;
    end;
    Qry.Free;
end;

procedure IniStorageMaterialInfo();    //料仓材料信息
var
    i : Integer;
begin
    for i:=1 to CntStorageCount do
    begin
        if StorageInfo[i].Enable then
        begin
            LoadMaterialInfoFromDbToStorage(i);
            FrmMain.LoadStorageMaterilInfoLb(i);
        end;
    end;
end;

procedure IniAggregateConveyingSysForControlPanel();    //骨料输送系统
begin
    IniAggregateConveyingForControlPanel();    //骨料输送设备初始化

    ReadAggreConvParaFromDbToBuf();            //骨料输送参数
    
    //中间仓
    //if AggregateConveyorMode = CntAggregateConveyorBelt then    //斜皮带输送
    //begin
    //    IniAggregateBeltConveyingForControlPanel();    //骨料皮带输送方式
    //end
    //else
    //begin
    //    IniAggregateElevatorForControlPanel();         //骨料提升机输送方式控制中心初始化
    //end;
end;

procedure IniAggregateConveyingForControlPanel();
begin
    IniAggregateLevelBelt();    //初始化平皮带

    if AggregateConveyorMode = CntAggregateConveyorBelt then    //斜皮带输送
    begin
        IniAggregateMidHopper();     //初始化骨料中间斗
    end
    else
    begin
        if AggregateConveyorEquipInfo[5].Use then    //骨料左提升斗有效
        begin
            IniAggregateLiftBucket(1);    // BuketNum = 1，左提升斗
        end;
        if AggregateConveyorEquipInfo[6].Use then    //骨料右提升斗有效
        begin
            IniAggregateLiftBucket(2);    // BuketNum = 2，右提升斗
        end;
    end;

end;


procedure IniAggregateLevelBelt();    //平皮带初始化
var
    Qry : TADOQuery ;
    SourseImgDir : String ;
    //Xposition,
    //YPosition,
    //Height,
    //Width  : Integer;
    SourcePath : String;
    EquipFlags : String;
    EquipId    : Integer;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from AggreConveyorEquip where ID >=1 and ID <= 6 and Ena=1';
    Qry.Open;
    while not Qry.Eof do
    begin
        EquipId := Qry.FieldByName('ID').AsInteger ;

        EquipFlags := Qry.FieldByName('Flags').AsString ;

        //创建左平皮带
        if pos('1', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\HorStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtLevelBelt;     //左平皮带
            FrmMain.LoadAggregateConveyorEquip(    //创建左平皮带
                EquipId,
                SourcePath,
                Qry.FieldByName('XPosition').AsInteger,
                Qry.FieldByName('YPosition').AsInteger,
                Qry.FieldByName('XSize'    ).AsInteger,
                Qry.FieldByName('YSize'    ).AsInteger
            );

            if pos('d', EquipFlags) <> 0 then    //左平皮带点动运行
            begin
                FrmMain.LoadAggrDschBeltRunBtn(    //装载骨料运行启停按钮
                    EquipId,
                    ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\RunInvalid.png' ,
                    Qry.FieldByName('BtnPosition').AsInteger div 1920,
                    Qry.FieldByName('BtnPosition').AsInteger mod 1920,
                    Qry.FieldByName('BtnPosition').AsInteger div 1920,
                    Qry.FieldByName('BtnPosition').AsInteger mod 1920,
                  );
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsInValid;    //骨料输送设备按钮状态 为 无效
            end
            else
            begin
                AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsNone ;    //骨料输送设备按钮状态 为 不存在
            end;
            AggregateConveyorEquipInfo[EquipId].Use := True;
            AggregateConveyorEquipInfo[EquipId].RunLmtCheck := False;          //非限位检查，就是动作检查
            AggrConvEquipFlashSta[EquipId] := CntBeltFlashStaIsEmptyStop ;     //皮带动画状态 空停止
        end

        //创建右平皮带
        else if pos('2', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\InverHorStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsRtLevelBelt ;    //右平皮带

        end

        //创建左斜皮带
        else if pos('3', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\VerStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtInclinedBelt;  //左斜皮带

            FrmMain.LoadAggregateConveyorEquip(    //创建左平皮带
                EquipId,
                SourcePath,
                Qry.FieldByName('XPosition').AsInteger,
                Qry.FieldByName('YPosition').AsInteger,
                Qry.FieldByName('XSize'    ).AsInteger,
                Qry.FieldByName('YSize'    ).AsInteger
            );

            AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsNone ;    //骨料输送设备按钮状态 为 不存在

            AggregateConveyorEquipInfo[EquipId].Use := True;
            AggregateConveyorEquipInfo[EquipId].RunLmtCheck := True;          //运行限位检查
            AggrConvEquipFlashSta[EquipId] := CntBeltFlashStaIsEmptyStop ;     //皮带动画状态 空停止

            //创建左斜皮带输送骨料，持续时间计时器标签。保证所有骨料进中间斗
            FrmMain.LoadAggrConvHolpTmrLab(
                1,
                Qry.FieldByName('XPosition').AsInteger + 60,
                Qry.FieldByName('YPosition').AsInteger + 10
            );    //加载斜皮带输送骨料持续时间,左斜皮带计时标签，对应1号
        end

        //创建右斜皮带
        else if pos('4', EquipFlags) > 0 then
        begin
            
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\InverVerStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsRtInclinedBelt;  //右斜皮带
        end

        //创建左提升斗
        else if pos('5', EquipFlags) > 0 then
        begin
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\LftBukt0.png';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtLiftBucket ;

            FrmMain.LoadAggregateConveyorEquip
              (    //创建左提升梯
                EquipId,
                SourcePath,
                Qry.FieldByName('XPosition').AsInteger,
                Qry.FieldByName('YPosition').AsInteger,
                Qry.FieldByName('XSize'    ).AsInteger,
                Qry.FieldByName('YSize'    ).AsInteger
              );

            //创建提升斗下限位
            FrmMain.LoadLiftBucketLmtImg
              (
                1 ,    //左提升斗编号是1
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\WeigDischValveLmtInValid.png',
                Qry.FieldByName('BtmLmtP').AsInteger div 1920 ,
                Qry.FieldByName('BtmLmtP').AsInteger mod 1920 ,
                0 ,
                0 ,
                1
              );
            ImgLiftBuktBtmLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad;    //骨料提升斗下限位 = 无效状态

            //创建提升斗上限位
            FrmMain.LoadLiftBucketLmtImg
              (
                1 ,    //左提升斗编号是1
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\WeigDischValveLmtInValid.png',
                Qry.FieldByName('TopLmtP').AsInteger div 1920 ,
                Qry.FieldByName('TopLmtP').AsInteger mod 1920 ,
                0 ,
                0 ,
                2   //2 上限位
              );
            ImgLiftBuktTopLmtDspSta[1] := CntImgLiftBuktLmtDspStaIsInvad;    //骨料提升斗上限位 = 无效状态

            //创建提升斗上升按钮
            FrmMain.LoadLiftBucketBtnImg
              (
                1 ,    //1代表左提升斗
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\GoUpBtnInvalid.png',  //创建骨料提升斗按钮
                Qry.FieldByName('BtnPosition').AsInteger div 1920 ,
                Qry.FieldByName('BtnPosition').AsInteger mod 1920 ,
                0,
                0 ,
                1     //1代表上升按钮
              );
              ImgLiftBuktGoUpBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;    //左 提升斗上升按钮 状态 = 无效状态

            //创建提升斗下降按钮
            FrmMain.LoadLiftBucketBtnImg
              (
                1 ,    //1代表左提升斗
                ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\GoDnBtnInvalid.png',  //创建骨料提升斗按钮
                Qry.FieldByName('Btn2Po').AsInteger div 1920 ,
                Qry.FieldByName('Btn2Po').AsInteger mod 1920 ,
                0,
                0 ,
                2     //2代表上升按钮
              );
            ImgLiftBuktGoDnBtnDspSta[1] := CntImgLiftBuktBtnDspStaIsInvad;    //左 提升斗下降按钮 状态 = 无效状态

            AggregateConveyorEquipInfo[EquipId].Use := True;                  //左提升斗使用

        end

        //创建右提升斗;
        else if pos('6', EquipFlags) > 0 then
        begin
            
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\InverStrap0.bmp';
            //AggregateConveyorEquipInfo[EquipId].EquipType :=
        end

        //左右卸料平皮带
        else if pos('7', EquipFlags) > 0 then
        begin
            
            SourcePath := ExtractFilePath(Application.ExeName) + '\Images\Equips\Straps\ShortHorStrp0.bmp';
            AggregateConveyorEquipInfo[EquipId].EquipType := CntAggConveyEquipIsLtShtLevelBelt;    //左右平皮带
        end

        else
        begin
            Showmessage('无效的输送设备');
        end;

//        if pos('d', EquipFlags) >0 then    //点动启动
//            AggregateConveyorEquipInfo[EquipId].ContinueRun := False
//        else
//            AggregateConveyorEquipInfo[EquipId].ContinueRun := True;
//
//        FrmMain.LoadAggregateConveyorEquip(
//            EquipId,
//            SourcePath,
//            Qry.FieldByName('XPosition').AsInteger,
//            Qry.FieldByName('YPosition').AsInteger,
//            Qry.FieldByName('XSize'    ).AsInteger,
//            Qry.FieldByName('YSize'    ).AsInteger
//          );

//        if not AggregateConveyorEquipInfo[EquipId].ContinueRun then
//        begin
//            FrmMain.LoadAggrDschBrltRunBtn(    //装载骨料运行启停按钮
//                EquipId,
//                BtnState,
//                Qry.FieldByName('BtnPosition').AsInteger div 1920,
//                Qry.FieldByName('BtnPosition').AsInteger mod 1920,
//                Qry.FieldByName('BtnPosition').AsInteger div 1920,
//                Qry.FieldByName('BtnPosition').AsInteger mod 1920,
//              );
//            AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsInValid;    //骨料输送设备按钮状态 为 无效
//        end
//        else
//        begin
//            AggrConvEquipBtnState[EquipId] := CtAggrConvEquipBtnIsNone ;    //骨料输送设备按钮状态 为 不存在
//        end;

//        AggregateConveyorEquipInfo[EquipId].Use := True;
//        AggregateConveyorEquipInfo[EquipId].RunLmtCheck := False;    //非限位检查，就是动作检查
//        AggrConvEquipFlashSta[EquipId] := CntBeltFlashStaIsEmptyStop ;     //皮带动画状态 空停止

        Qry.Next ;
    end;
end;

procedure IniAggregateMidHopper();    //初始化骨料中间斗
var
    Qry : TADOQuery ;
    SourseImgDir : String;
    MidBinId : Integer;
begin

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from AggregateMid where ID =1';
    Qry.Open;
    if Qry.Eof then
    begin
        Showmessage('无效骨料中间仓信息');
    end
    else
    begin
        AggregateMidBinInfo[1].Use := True;
        AggregateMidBinInfo[1].Name := Qry.FieldByName('EquipName').AsString ;
        AggregateMidBinInfo[1].LoadInstrumentId := Qry.FieldByName('InstrumentId').AsInteger;
        AggregateMidBinInfo[1].Falgs := Qry.FieldByName('Flags').AsString;

        SourseImgDir := ExtractFilePath(Application.ExeName) + '\Images\Equips\MidBin\AggreMidBin.png';
        MidBinId := Qry.FieldByName('EquipId').AsInteger;
        FrmMain.LoadAggregateBinImgFromFile(MidBinId,
          SourseImgDir ,
          Qry.FieldByName('Left').AsInteger,
          Qry.FieldByName('Top').AsInteger,
          Qry.FieldByName('Width').AsInteger,
          Qry.FieldByName('Height').AsInteger
        );

        FrmMain.LoadAggrMidStorDschValveImg(MidBinId,              //装载骨料中间仓卸料阀
          ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\DschValveClose.png',
          Qry.FieldByName('DschValveX').AsInteger,
          Qry.FieldByName('DschValveY').AsInteger
        );
        AggrMidHopperDschValveImgState[1] := CntMdHopDshValImgIsInvalie ;    //中间斗卸料阀状态 为 无效

        if pos('o', AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].OpenLmtValid := True;
            FrmMain.LoadAggrMidStorOpenLmtImg(MidBinId,                         //装载中间仓开门限位
              ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png',
              Qry.FieldByName('OpenLmtX').AsInteger,
              Qry.FieldByName('OpenLmtY').AsInteger
            );
        end;

        if pos('c', AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].CloseLmtValid := True;
            FrmMain.LoadAggrMidStorCloseLmtImg(MidBinId,                        //装载中间仓关门限位
              ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\MidBinDschValveLmtInValid.png',
              Qry.FieldByName('CloseLmtX').AsInteger,
              Qry.FieldByName('CloseLmtY').AsInteger
            );
        end;

        if pos('v', AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].VibraValid := True;
            FrmMain.LoadAggrMidStorVibraImg(MidBinId,                           //装载中间仓振动器
              ExtractFilePath(Application.ExeName) + 'Images\Equips\MidBin\MidBinVibratorInvalid.png',
              Qry.FieldByName('VibraX').AsInteger,
              Qry.FieldByName('VibraY').AsInteger
            );
            AggrMidHopperDschVibraImgState[1] := CntMdHopDshVibraImgIsInvalie;    //中间斗卸料 振动器图片 无效状态
        end
        else
        begin
            AggregateMidBinInfo[MidBinId].VibraValid := False;
            AggrMidHopperDschVibraImgState[1] := CntMdHopDshVibraImgIsNone    ;    //中间斗卸料 振动器图片 不存在
        end;

        if pos('w',  AggregateMidBinInfo[MidBinId].Falgs) > 0 then
        begin
            AggregateMidBinInfo[MidBinId].IsWeigher := True;
        end
        else
        begin
            AggregateMidBinInfo[MidBinId].IsWeigher := False;
        end;

        FrmMain.LoadAggrMidBinDschTmrLab(
            MidBinId,
            Qry.FieldByName('Left').AsInteger + (Qry.FieldByName('Width').AsInteger div 2) + 20,
            Qry.FieldByName('Top').AsInteger + Qry.FieldByName('Height').AsInteger + 5
        );    //加载中间仓卸料计时器标签

        //中间仓生产盘数计数器标签
        FrmMain.LoadMidBinLoadCounterLab(
            MidBinId,
            Qry.FieldByName('Left').AsInteger + 10,
            Qry.FieldByName('Top').AsInteger + Qry.FieldByName('Height').AsInteger + 5
        );    //加载中间仓装载盘次

        //骨料中间仓满料标识图片
        FrmMain.LoadAggregateBinFullImgFromFile(MidBinId ,
         ExtractFilePath(Application.ExeName) + 'Images\Equips\Instruments\Full.png',
         0,
         0,
         0,
         0 );
    end;

    Qry.Free;
end;

//BucketNum=1，左提升斗；BucketNum=2，右提升斗
procedure IniAggregateLiftBucket( BucketNum : Integer );
var
    Qry : TADOQuery ;
    //SourseImgDir : String;
    //MidBinId : Integer;
begin

    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from LiftBucketInfo where Id=' + IntToStr(BucketNum);
    Qry.Open;
    if Not Qry.Eof then
    begin
        LiftBucketAttr[BucketNum].Name     := Qry.FieldByName('EquipNm').AsString;
        LiftBucketAttr[BucketNum].XMoveMax := Qry.FieldByName('MoveMx').AsInteger div 1920;
        LiftBucketAttr[BucketNum].YMoveMax := Qry.FieldByName('MoveMx').AsInteger mod 1920;
        LiftBucketAttr[BucketNum].XBottom  := Qry.FieldByName('BottomPos').AsInteger div 1920;
        LiftBucketAttr[BucketNum].YBottom  := Qry.FieldByName('BottomPos').AsInteger mod 1920;
        LiftBucketAttr[BucketNum].XTop     := Qry.FieldByName('TopPos').AsInteger div 1920;
        LiftBucketAttr[BucketNum].YTop     := Qry.FieldByName('TopPos').AsInteger mod 1920;
        LiftBucketAttr[BucketNum].GoUpLong := Qry.FieldByName('GoUnLong').AsInteger * 1000;
        LiftBucketAttr[BucketNum].GoDnLong := Qry.FieldByName('GoDnLong').AsInteger * 1000;
        LiftBucketAttr[BucketNum].GoUpTmr  := 0;
        LiftBucketAttr[BucketNum].GodnTmr  := 0;
    end;

    //创建提升斗斗
    FrmMain.LoadAggrLiftBucketImg
      (
          1,    //左提升斗
          AppPath + 'Images\Equips\Straps\BucketEpty.png',    //加载提升斗图片
          LiftBucketAttr[BucketNum].XBottom,
          LiftBucketAttr[BucketNum].YBottom
      );

    //加载提升斗预提升标签
    FrmMain.CreatLiftBucketPreRiseLab
      (
          1,
          Qry.FieldByName('PreRiseLabPos').AsInteger div 1920,
          Qry.FieldByName('PreRiseLabPos').AsInteger mod 1920,
          0,
          0
      );

    //加载提升斗预提升计时器
    FrmMain.CreatLiftBucketPreRiseTmrLab
      (
          1,
          Qry.FieldByName('PreRiseTmrPos').AsInteger div 1920,
          Qry.FieldByName('PreRiseTmrPos').AsInteger mod 1920,
          0,
          0
      );

    //加载提升斗卸料标签
    FrmMain.CreatLiftBucketDschLab
      (
          1,
          Qry.FieldByName('DschLabPos').AsInteger div 1920,
          Qry.FieldByName('DschLabPos').AsInteger mod 1920,
          0,
          0
      );

    //加载提升斗卸料计时器
    FrmMain.CreatLiftBucketDschTmrLab
      (
          1,
          Qry.FieldByName('DschTmrPos').AsInteger div 1920,
          Qry.FieldByName('DschTmrPos').AsInteger mod 1920,
          0,
          0
      );

    //加载提升斗生产计数标签
    FrmMain.CreatLiftBucketProCountNmLab
      (
          1,
          Qry.FieldByName('ProCountLabPos').AsInteger div 1920,
          Qry.FieldByName('ProCountLabPos').AsInteger mod 1920,
          0,
          0
      );

    //加载提升斗生产计数器
    FrmMain.CreatLiftBucketProCounterLab
      (
          1,
          Qry.FieldByName('ProCounterPos').AsInteger div 1920,
          Qry.FieldByName('ProCounterPos').AsInteger mod 1920,
          0,
          0
      );
end;

procedure IniAggregateElevatorForControlPanel();         //骨料提升机输送方式控制中心初始化
begin

end;

procedure IniRingForControlPanel();                                      //电铃
var
    Qry : TADOQuery;
    CheckId : Integer ;
begin
    Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close ;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Checker where Equip =' + '''' + 'RingAuto' + '''';
    Qry.Open;
    if not Qry.Eof then
    begin
        if Qry.FieldByName('Checked').AsString = '1' then
        begin
            AutoRing := True;
            FrmMain.cxBtnRing.Glyph := Nil;
            FrmMain.ImageList1.GetBitmap(1, FrmMain.cxBtnRing.Glyph);
        end
        else
        begin
            AutoRing := False;
            FrmMain.cxBtnRing.Glyph := Nil;
            FrmMain.ImageList1.GetBitmap(0, FrmMain.cxBtnRing.Glyph);
        end;
    end;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Component where ComponentsNm=' + '''' + 'Bell' + '''';
    Qry.Open;
    if not Qry.Eof then
    begin
        //监控画面创建电铃图片
        FrmMain.CreatBellImg( Qry.FieldByName('Left').AsInteger ,
                              Qry.FieldByName('Top' ).AsInteger ,
                              0,
                              0
                            );
    end;

    Qry.Free;
end;

//初始化搅拌机 控制中心
procedure IniMixerForControlPanel();
begin

    IniMixerBasicForControlPanel();    //初始化搅拌机基本信息

    IniMixerParaForControlPanel();                //初始化搅拌机参数

//    IniMixerBasicForControlPanel();     //初始化搅拌机基本信息


//    IniMixDschDoorForControlPanel();    //初始化搅拌机卸料门

//    FrmMain.UpdataBitBtnGlyph('cxBtnAggreDschDsa', Not MixerInfo.AggreDschEn);        //禁止骨卸
//    FrmMain.UpdataBitBtnGlyph('cxBtnMixerLoadDsa', Not MixerInfo.LoadIntoEn);      //禁止投料
//    FrmMain.UpdataBitBtnGlyph('cxBtnMixerDschDsa', Not MixerInfo.DschEn);               //禁止卸料
end;

procedure IniMixerBasicForControlPanel();    //初始化搅拌机基本信息
Var
    Qry : TADOQuery;
    MixerId : Integer;
begin
        Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close ;
    Qry.SQL.Clear ;
    Qry.SQL.Text := 'select * from Mixer' ;
    Qry.Open;
    if Qry.Eof then
    begin
        Showmessage('无效的搅拌机信息');
    end
    else
    begin
        MixerInfo.MaxCap := RoundTo(Qry.FieldByName('Cap').AsFloat, -3);
        MixerInfo.Flags := Qry.FieldByName('Attribute').AsString;
        if pos('a', MixerInfo.Flags) > 0 then               //首盘禁卸？
            MixerInfo.FstDschEn := False
        else
            MixerInfo.FstDschEn := True;

        if pos('b', MixerInfo.Flags) > 0 then
        begin
           MixerInfo.DschMode := CntMixerDischTwo;    //液压卸料方式
           FrmMain.cxBtnMixerDischClose.Visible := True;
        end
        else if pos('c', MixerInfo.Flags) > 0 then
        begin
            MixerInfo.DschMode := CntMixerDischOne;
            FrmMain.cxBtnMixerDischClose.Visible := False;
        end
        else
            Showmessage('无效的搅拌机卸料方式信息');

        if pos('d', MixerInfo.Flags) > 0 then                //禁止骨卸
            MixerInfo.AggreDschEn := False
        else
            MixerInfo.AggreDschEn := True;

        if pos('e', MixerInfo.Flags) > 0 then                //禁止投料
            MixerInfo.LoadIntoEn := False
        else
            MixerInfo.LoadIntoEn := True ;

        if pos('f', MixerInfo.Flags) > 0 then                //禁止卸料
            MixerInfo.DschEn := False
        else
            MixerInfo.DschEn := True;

        if pos('g', MixerInfo.Flags) > 0 then                //粉料未配完，禁止搅拌机卸料
            MixerInfo.MixerDschLinkToPowderLoad := True
        else
            MixerInfo.MixerDschLinkToPowderLoad := False;

        MixerId := Qry.FieldByName('MixerNo').AsInteger;
        //创建搅拌机图片
        frmMain.CreateMixerImg(MixerId,
          ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender1.png',
          Qry.FieldByName('XPosition').AsInteger,
          Qry.FieldByName('YPosition').AsInteger,
          0,
          0);
        MixerFalshState[1] := CtMxrFlashStIsEmptyStop;    //搅拌机动画状态 为 空停 

        //创建搅拌机卸料门图片
        frmMain.CreateMixerDschDoor(MixerId,
          ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Close.png',
          Qry.FieldByName('DschDoorX').AsInteger,
          Qry.FieldByName('DschDoorY').AsInteger,
          0,
          0);
        MixerDschValveImgState[MixerId] := CtMxrDschValStIsClose ;    //搅拌机卸料门图片 状态 为 关

        //搅拌机卸料计时器标签
        FrmMain.LoadMixerDschTmrLab(
            MixerId,
            Qry.FieldByName('DschDoorX').AsInteger + 80,
            Qry.FieldByName('DschDoorY').AsInteger
        );       //加载搅拌机卸料计时器标签

        //搅拌机生产计数器标签
        FrmMain.LoadMixerProdCounterLab(
            MixerId,
            Qry.FieldByName('DschDoorX').AsInteger - 60,
            Qry.FieldByName('DschDoorY').AsInteger
        );   //加载搅拌机生产计数器标签

        //开关门按钮
        FrmMain.cxBtnMixerDischOPen.Left := Qry.FieldByName('DoorOpenBtnX').AsInteger;
        FrmMain.cxBtnMixerDischOPen.Top := Qry.FieldByName('DoorOpenBtnY').AsInteger;
        BtnMxrDschValveOpState[1] := CtBtnMxrDschValveOpStIsInvalid;            //搅拌机卸料门 开门按钮状态 为 无效
        FrmMain.cxBtnMixerDischClose.Left := Qry.FieldByName('DoorCloseBtnX').AsInteger;
        FrmMain.cxBtnMixerDischClose.Top := Qry.FieldByName('DoorCloseBtnY').AsInteger;

        //加减盘数按钮 状态
        BtnIncProdSetCountState := BtnProdSetCountStIsDisable ;   //增加 生产盘数 按钮状态 为 无效
        BtnDecProdSetCountState := BtnProdSetCountStIsDisable ;   //减少 生产盘数 按钮状态 位 无效
        //禁止按钮系列
        BtnAggrDisaDschState    := CntBtnCheckStateIsFalse;    //禁止骨卸 按钮状态 无勾选
        BtnMixerDisaLoadInState := CntBtnCheckStateIsFalse;    //禁止投料 按钮状态 无勾选
        BtnMixerDisaDschState   := CntBtnCheckStateIsFalse;    //禁止卸砼 按钮状态 无勾选
        //自动响铃 按钮
        BtnRingState := CntBtnCheckStateIsFalse;    //自动响铃 按钮状态 无勾选
        //生产暂停按钮
        BtnProdPauseEnableState := CtBtnProdPauseEnStIsFalse ;    //生产暂停按钮 Enable值 False
        BtnProdPauseCaptionState := CtBtnProdPauseCpIsPause  ;    //生产暂停按钮 Caption 暂停生产 状态
        //启动生产按钮
        BtnProdStartCaptionState := CtBtnProdStatCpIsStart ;    //启动生产按钮 Caption 为 启动生产
    end;
end;                                                                                    

//procedure IniLoadMixerImgsForControlPanel(X,Y : Integer; Left,Top : Integer);
//begin
    {frmMain.CreateMixerImg( 1,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender1.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 2,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender2.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 3,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender3.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 4,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender4.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 5,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender5.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    frmMain.CreateMixerImg( 6,
                            ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders\Blender6.png',
                            X,
                            Y,
                            Left,
                            Top
                          );
    }
//end;
//------------------------------------------------------------------------------                       

//------------------------------------------------------------------------------
//procedure IniMixDschDoorForControlPanel();    //初始化搅拌机卸料门
//var
//    Qry : TADOQuery ;
//begin
    {Qry := TADOQuery.Create(Nil);
    Qry.Connection := FrmMain.ADOConnection ;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := 'select * from Mixer where MixerNo =1 and Equip =' + '''' + 'DschDoor' + '''';
    Qry.Open;
    if Qry.Eof then
    begin
        Showmessage('无效的搅拌机卸料门信息');
    end
    else
    begin
        FrmMain.CreateMixerDschDoor(
          ExtractFilePath(Application.ExeName) + '\Images\Equips\Blenders',    //创建搅拌机卸料门图片
          Qry.FieldByName('XPosition').AsInteger,
          Qry.FieldByName('YPosition').AsInteger,
          Qry.FieldByName('XSize').AsInteger,
          Qry.FieldByName('YSize').AsInteger);
    end;

    Qry.Free ;
    }
//end;

//------------------------初始化CheckBox信息------------------------------------
//procedure IniCheckBoxInfo(CheckCode : String; CheckBoxName : String; Check : Boolean);
//var
//    Qry : TADOQuery ;
//begin
//    Qry := TADOQuery.Create(Nil);
//    Qry.Connection := FrmMain.ADOConnection ;

//    Qry.Close;
//    Qry.SQL.Clear;
//    Qry.SQL.Text := 'select * from Checker where Equip =' + '''' + CheckCode + '''';
//    Qry.Open;
//    if Qry.Eof then
//    begin
//        Showmessage('无效的CheckBox信息：' + CheckBoxName);
//    end
//    else
//    begin
//        FrmMain.IniCheckerForControlPanel(
//          CheckBoxName,
//          Qry.FieldByName('Left').AsInteger,
//          Qry.FieldByName('Top').AsInteger,
//          0,
//          0,
//          Check);
//    end;
//end;
//------------------------------------------------------------------------------

//-----------------------初始化搅拌机参数---------------------------------------
procedure IniMixerParaForControlPanel();                //初始化搅拌机参数
var
    i : Integer ;
begin
    for i:= 1 to CntMixerParaCount do
    begin
        MixerPara[i].Value := 0;
    end;
    RdAllMixerParaFromDb();
end;
//------------------------------------------------------------------------------
end.
