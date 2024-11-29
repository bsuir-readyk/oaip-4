const
  INF = 1000000007;
type
  TIntegerArr = array of int64;

procedure FillRand(var arr: TIntegerArr);
var i: Integer;
begin
  Randomize;
  Write('Полученный массив: ');
  i := 1;
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
  i := 1;
  while i < length(arr) do
  begin
    Write(i, ': ');
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

  SetLength(arr, n + 1);
  SetLength(dArr, n + 1);
  SetLength(resArr, n + 1);
  SetLength(pArr, n + 1);
  SetLength(prevArr, n + 1);

  FillRand(arr);
  // FillManual(arr);

  i := 2;
  while i <= n do
  begin
    dArr[i] := INF;
    pArr[i] := -1;
    Inc(i);
  end;

  dArr[1] := arr[1];
  pArr[1] := 1;
  prevArr[1] := -1;

  i := 2;
  while i <= n do
  begin
    j := 1;
    while (j <= n) and (arr[i] > dArr[j]) do
      j := j + 1;

    if (j = 1) or (arr[i] > dArr[j - 1]) then
    begin
      dArr[j] := arr[i];
      pArr[j] := i;
      if j > 1 then
        prevArr[i] := pArr[j - 1]
      else
        prevArr[i] := -1;
    end;
    Inc(i);
  end;

  resLength := 0;
  lastIndex := 0;
  i := n;
  while i >= 1 do
  begin
    if (dArr[i] <> INF) then
    begin
      resLength := i;
      lastIndex := pArr[i];
      i := 1;
    end;
    Dec(i);
  end;

  WriteLn('Число вычёркиваний: ', n - resLength);
  Write('Полученная последовательность: ');

  pos := 1;
  i := lastIndex;
  while i <> -1 do
  begin
     resArr[pos] := arr[i];
    pos := pos + 1;
    i := prevArr[i];
  end;

  i := pos - 1;
  while i >= 1 do
  begin
    Write(resArr[i], ' ');
    Dec(i);
  end;

end.


