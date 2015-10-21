input TEX;

outputformat := "png";
filenametemplate "figs-%c.png";

defaultscale:= 3;
defaultfont:="cmr9";
defaultdx:=10;
defaultdy:=10;
interim ahlength := 20;
interim ahangle := 30;

pair STRUCTpoint, STRUCTHEIGHT, STRUCTWIDTH;
STRUCTHEIGHT := (0, 0);
STRUCTWIDTH := (0, 0);
STRUCTpoint := (0, 0);
string LAST_;
LAST_ = "db";


vardef offset@#(suffix last) =
    pair space;
    string s;
    yspace := 60;
    xspace := 60;
    s := str @#;
    if s = "s"  : space := (0,       -yspace); fi;
    if s = "e"  : space := (xspace,  0);       fi;
    if s = "n"  : space := (0,       yspace);  fi;
    if s = "w"  : space := (-xspace, 0);       fi;
    if s = "sw" : space := (-xspace, -yspace); fi;
    if s = "se" : space := (xspace,  -yspace); fi;
    if s = "ne" : space := (xspace,  yspace);  fi;
    if s = "nw" : space := (-xspace, yspace);  fi;

    STRUCTpoint := last@# + space;
enddef;

vardef con(expr s, e) =
    pickup pencircle scaled 3;
    drawarrow s ... e withcolor green;
enddef;

vardef struct@#(text ms) =
    picture @#pics[], _tmp;
    pair _width, _height, @#width;
    _i := 0;
    _width := (0, 0);
    _height := (0, -defaultdy) + STRUCTpoint;
    for i := ms:
        _tmp := TEX(i) scaled defaultscale shifted _height;
        @#pics[_i] := _tmp;
        _i := _i + 1;
        if _width <   urcorner _tmp - ulcorner _tmp:
            _width := urcorner _tmp - ulcorner _tmp;
        fi;
        _height := _height + llcorner _tmp - ulcorner _tmp + (0, -2 * defaultdy);
    endfor;

    _width := _width + (2 * defaultdx, 0);

    pair @#nw[], @#ne[], @#se[], @#sw[], @#n[], @#e[], @#s[], @#w[];
    pair @#nw, @#ne, @#se, @#sw, @#n, @#e, @#s, @#w;
    for _ii:= 0 upto _i -1:
        _tmp := @#pics[_ii];
        draw _tmp;
        @#nw[_ii] := ulcorner _tmp + (-defaultdy, defaultdy);
        @#ne[_ii] := ulcorner _tmp + _width + (0, defaultdy);
        @#se[_ii] := llcorner _tmp + _width + (0, -defaultdy);
        @#sw[_ii] := llcorner _tmp + (-defaultdy, -defaultdy);
        @#n[_ii] := 0.5(@#nw[_ii] + @#ne[_ii]);
        @#s[_ii] := 0.5(@#sw[_ii] + @#se[_ii]);
        @#e[_ii] := 0.5(@#ne[_ii] + @#se[_ii]);
        @#w[_ii] := 0.5(@#sw[_ii] + @#nw[_ii]);
        draw @#se[_ii] -- @#sw[_ii];
    endfor;
    draw @#sw[_i - 1] -- @#nw[0] -- @#ne[0] -- @#se[_i - 1 ];
    @#width := _width;
    @#e := @#e0;
    @#w := @#w0;
    @#n := @#n0;
    @#s := @#n0;
    @#se := @#se[_i - 1];
    @#sw := @#sw[_i - 1];
    @#ne := @#ne0;
    @#nw := @#nw0;

    STRUCTHEIGHT := @#sw[_i - 1] - @#nw[0];
    STRUCTWIDTH  := @#se[0] - @#sw[0];
enddef;

%vardef struct@#(text ms) =
%    boxjoin(a.sw=b.nw; a.se=b.ne);
%    picture @#[];
%    picture tmp;
%    pair _width;
%    _width := (0, 0);
%    ii = 0;
%
%    for i := ms:
%        tmp := TEX(i) scaled defaultscale;
%        boxit.@#[ii](tmp);
%        @#[ii].ne - @#[ii].nw = (l * 6 * defaultscale, 0);
%        ii := ii + 1;
%        if _width <  urcorner tmp - ulcorner tmp:
%            _width := urcorner tmp - ulcorner tmp;
%        fi;
%    endfor;
%    @#[0].ne - @#[0].nw = _width + (20, 0);
%    for _iii := 0 upto ii - 1:
%        drawboxed(@#[_iii]);
%    endfor;
%enddef;
%
