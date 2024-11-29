const
  INF = 1000000007;
type
  TIntegerArr = array of int64;

procedure FillRand(var arr: TIntegerArr);
var i: Integer;
begin
  Randomize;
  Write('Полученный массив: ');
  i := 0;
  while i < length(arr) do
  begin
    arr[i] := random(100);
    Write(arr[i], ' ');
    Inc(i);
  end;
  Writeln;
end;

procedure FillManual(var arr: TIntegerArr);
var i: Integer;
begin
  Writeln('Введите элементы');
  i := 0;
  while i < length(arr) do
  begin
    Write(i + 1, ': ');
    Read(arr[i]);
    Inc(i);
  end;
end;

var
  arr, dArr, resArr: TIntegerArr;
  pArr, prevArr: TIntegerArr;
  n, i, j, resLength, lastIndex, pos: Integer;
begin
  n := 0;
  while n < 1 do
  begin
    Write('Введите число элементов массива: ');
    ReadLn(n);
  end;

  SetLength(arr, n);
  SetLength(dArr, n);
  SetLength(resArr, n);
  SetLength(pArr, n);
  SetLength(prevArr, n);

  FillRand(arr);
  // FillManual(arr);

  i := 1;
  while i < n do
  begin
    dArr[i] := INF;
    pArr[i] := -1;
    Inc(i);
  end;

  dArr[0] := arr[0];
  pArr[0] := 0;
  prevArr[0] := -1;

  i := 1;
  while i < n do
  begin
    j := 0;
    while (j < n) and (arr[i] > dArr[j]) do
    begin
      Inc(j);
    end;

    if (j = 0) or (arr[i] > dArr[j - 1]) then
    begin
      dArr[j] := arr[i];
      pArr[j] := i;
      if j > 0 then
        prevArr[i] := pArr[j - 1]
      else
        prevArr[i] := -1;
    end;
    Inc(i);
  end;

  resLength := 0;
  lastIndex := 0;
  i := n - 1;
  while i >= 0 do
  begin
    if (dArr[i] <> INF) then
    begin
      resLength := i + 1;
      lastIndex := pArr[i];
      i := 0;
    end;
    Dec(i);
  end;

  WriteLn('Число вычёркиваний: ', n - resLength);
  Write('Полученная последовательность: ');

  pos := 0;
  i := lastIndex;
  while i <> -1 do
  begin
    resArr[pos] := arr[i];
    pos := pos + 1;
    i := prevArr[i];
  end;

  i := pos - 1;
  while i >= 0 do
  begin
    Write(resArr[i], ' ');
    Dec(i);
  end;

end.

