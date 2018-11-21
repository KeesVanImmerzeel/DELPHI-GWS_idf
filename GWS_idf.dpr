program GWS_idf;

uses
  Vcl.Forms,
  System.AnsiStrings,
  uError,
  FMX.Dialogs,
  uTSingleESRIgrid,
  AVGRIDIO,
  Vcl.Dialogs,
  uGWS_idf in 'uGWS_idf.pas' {MainForm};

var
  iResult, i, j, CellDepth: Integer;
  Mv, x, y, Head: Single;

const
  MaxCellDepth = 1;

{$R *.res}

Procedure ShowArgumentsAndTerminate;
begin
  ShowMessage('GWS_idf AhnESRIgrid HeadsIDF GwsIDF');
  Application.Terminate;
end;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  if not(ParamCount() = 3) then
    ShowArgumentsAndTerminate;

  MainForm.SingleESRImvGrid := TSingleESRIgrid.InitialiseFromESRIGridFile
    (ParamStr(1), iResult, MainForm);
  if iResult <> cNoError then
    ShowArgumentsAndTerminate;
  MainForm.HeadsIDF := TSingleESRIgrid.InitialiseFromIDFfile(ParamStr(2),
    iResult, MainForm);
  if iResult <> cNoError then
    ShowArgumentsAndTerminate;

  with MainForm.SingleESRImvGrid do
  begin
    for i := 1 to NRows do
    begin
      for j := 1 to NCols do
      begin
        Mv := GetValue(i, j);

        if (Mv <> MissingSingle) then
        begin
          GetCellCentre(i, j, x, y);
          MainForm.HeadsIDF.GetValueNearXY(x, y, MaxCellDepth, CellDepth, Head);
          if (Head <> MissingSingle) then
            SetValue(i, j, Mv - Head); // of MainForm.SingleESRImvGrid
        end; { -if }
      end; { -for j }
    end; { -for i }
    ExportToIDFfile(ParamStr(3));
  end;
  ShowMessageFmt('GWS written to file [%s].', [ExpandFileName(ParamStr(3))]);

  // Application.Run;
end.
