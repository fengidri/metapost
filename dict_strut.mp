input struct


beginfig(1);
defaultpen := 10pt;
struct.db("dict *dict" ,"dict *expires", "dict *blocking\_keys ", "dict *io\_keys",
"dict *watched\_keys", "int id");

offset.e(db);
struct.dict("dictType *type", "void *privdata", "dictht ht[2]", "int rehashidx", "int iterators");

offset.e(dict);
struct.dictht("dictEntry **table", "int size", "int sizemask", "int used");

offset.se(dictht);
struct.entry("pointer", "", "", "", "", "", "pointer");

con(db.e0 , dict.nw0);
con(dict.e2 , dictht.nw0);
con(dictht.e0, entry.nw0);


%vardef test(suffix s)
%    s.s := 0;
%enddef;

vardef truct text items =
    show 89;
    _i = 0;
    for i := items:
        if _i = 0:
            test(i);
        fi;
    endfor;

enddef;


%truct db, "dict ", "sdfadf", "adfadf";

endfig;
    end


