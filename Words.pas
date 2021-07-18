PROGRAM Words;

TYPE
    WordNodePtr = ^WordNode;
    WordNode = RECORD
        next: WordNodePtr;
        word: STRING;
        n: INTEGER; //frequency of word
    END;
    WordListPtr = WordNodePtr;


PROCEDURE InitList(VAR l: WordListPtr);
BEGIN
    l := NIL;
END;


PROCEDURE DisposeList(VAR l: WordListPtr);
VAR
    n, nextN: WordNodePtr;
BEGIN
    n := l;
    WHILE n <> NIL DO BEGIN
        nextN := n^.next;
        Dispose(n);
        n := nextN;
    END;
END;


PROCEDURE Addvalue(VAR l: WordListPtr; value: STRING);
VAR
    n, newN: WordNodePtr;
BEGIN
    New(newN);
    newN^.word := value;
    newN^.next := NIL;
    newN^.n := 1;

    IF l = NIL THEN
        l := newN
    ELSE BEGIN
        n := l;
        WHILE n^. next <> NIL DO
            n := n^.next;
        n^.next := newN;
    END;

        n := l;
    WHILE n^.next <> NIL DO BEGIN
        IF n^.word = value THEN
        newN^.n := newN^.n + 1;
        n := n^.next
    END;
END;


PROCEDURE DisplayList(l: WordListPtr);
VAR
    n: WordNodePtr;
BEGIN
    n := l;
    WHILE n <> NIL DO BEGIN
        WriteLn(n^.word, ' ','  n=', n^.n);
        n := n^.next;
    END;
END;



VAR
    l: WordListPtr;

BEGIN
    InitList(l);

    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    



    DisplayList(l);

    DisposeList(l);
END. 