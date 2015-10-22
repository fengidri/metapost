input struct

beginfig(0)
    struct.table("pointer", "pointer", "pointer", "pointer", "pointer", "pointer");

    direct := "s";
    struct.entrya("void *key", "value", "next");
    struct.entryb("void *key", "value", "next");
    struct.entryc("void *key", "value", "next");
    struct.entryd("void *key", "value", "next");
    struct.entrye("void *key", "value", "next");

    direct := "e";
    struct.volitema("void *key", "klen", "void *field", "flen", "offset", "size");
    struct.volitemb("void *key", "klen", "void *field", "flen", "offset", "size");
    struct.volitemc("void *key", "klen", "void *field", "flen", "offset", "size");
    struct.volitemd("void *key", "klen", "void *field", "flen", "offset", "size");
    struct.voliteme("void *key", "klen", "void *field", "flen", "offset", "size");
    struct.volitemf("void *key", "klen", "void *field", "flen", "offset", "size");
endfig
end
