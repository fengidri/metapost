


vardef test@#(expr s) =
    @#m = s;
enddef;


def t(suffix l) =
    show l.m;
    show scantokens("l" & "m");
enddef;

test.ff(3);

show scantokens ("ff." &"m");
%t("ff");
end

