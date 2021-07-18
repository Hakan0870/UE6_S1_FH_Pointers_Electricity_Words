PROGRAM Electricity;

CONST
    weekdays = 7;
TYPE
    days = 1..7;
    WeekdayValues = ARRAY[1..weekdays] OF REAL;
    MeasuredValueNodePtr = ^MeasuredValueNode;
    MeasuredValueNode = RECORD
        next: MeasuredValueNodePtr;
        value: REAL;
        day: days;
    END;
    MeasuredValueListPtr = MeasuredValueNodePtr;



PROCEDURE AveragePerWeekday(mv: MeasuredValueListPtr; VAR avg: WeekdayValues);
VAR
    n: INTEGER;
    l: MeasuredValueNodePtr;
    sum, average:  REAL;
    count: INTEGER;
BEGIN
    FOR n := 1 TO weekdays DO BEGIN
        sum := 0;
        average := 0;
        count := 0;
        l := mv;
        WHILE l^.next <> NIL DO BEGIN
            IF l^.day = n THEN BEGIN
                sum := sum + l^.value;
                count := count + 1
            END;
            l := l^.next;
        END;
        IF count <> 0 THEN BEGIN	
            average := sum / count;
            avg[n] := average
        END
        ELSE BEGIN
		    average := 0;
            avg[n] := average
        END;
    END;
END;



PROCEDURE InitList(VAR mv: MeasuredValueListPtr);
BEGIN
    mv := NIL;
END;



PROCEDURE DisposeList(VAR mv: MeasuredValueListPtr);
VAR
    n, nextN: MeasuredValueNodePtr;
BEGIN
    n := mv;
    WHILE n <> NIL DO BEGIN
        nextN := n^.next;
        Dispose(n);
        n := nextN;
    END;
END;



PROCEDURE Addvalue(VAR mv: MeasuredValueListPtr; value: REAL; d: days);
VAR
    n, newN: MeasuredValueNodePtr;
BEGIN
    New(newN);
    newN^.value := value;
    newN^.next := NIL;
    newN^.day := d;

    IF mv = NIL THEN
        mv := newN
    ELSE BEGIN
        n := mv;
        WHILE n^.next <> NIL DO
            n := n^.next;
        n^.next := newN;
    END;
END;



PROCEDURE DisplayList(avg: WeekdayValues);
VAR
    n: INTEGER;
BEGIN
    FOR n := 1 TO weekdays DO
        WriteLn('Weekday: ', n, '   Average: ', avg[n]:5:2, ' kWh');
END;





VAR
    mv: MeasuredValueListPtr;
    avg: WeekdayValues;
BEGIN
    InitList(mv);

    //Addvalue(mv, 9, 1);
    //Addvalue(mv, 8, 2);
    //Addvalue(mv, 10, 3);
    Addvalue(mv, 7, 4);
    Addvalue(mv, 11, 5);
    Addvalue(mv, 10, 6);
    Addvalue(mv, 13, 7);
    //Addvalue(mv, 0, 1);
    //Addvalue(mv, 8, 2);
    //Addvalue(mv, 9, 3);
    Addvalue(mv, 6, 4);
    Addvalue(mv, 11, 5);
    Addvalue(mv, 13, 6);
    Addvalue(mv, 11, 7);
    //Addvalue(mv, 13, 1);
    //Addvalue(mv, 8, 2);
    //Addvalue(mv, 9, 3);
    Addvalue(mv, 6, 4);
    Addvalue(mv, 11, 5);
    Addvalue(mv, 13, 6);
    Addvalue(mv, 11, 7);

    AveragePerWeekday(mv, avg);

    DisplayList(avg);

    DisposeList(mv);
    

END.
