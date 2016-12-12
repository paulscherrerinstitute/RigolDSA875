Terminator = LF;
Timeout = 1000;

sendCmd{
	out "%s";
}

sTMode{
	out ":TRAC\$1:MODE %{BLAN|WRIT|MAXH|MINH|VIEW|VID|POW}";
	@init {	out ":TRAC\$1:MODE?;*OPC?"; in ";%{BLAN|WRIT|MAXH|MINH|VIEW|VID|POW};%*{0|1}";}
}

gTMode{
	out ":TRAC\$1:MODE?;*OPC?";
	in ";%{BLAN|WRIT|MAXH|MINH|VIEW|VID|POW};%*{0|1}";
}

sSpanPred{
	out ":SENS:FREQ:SPAN:\$1";
}

gFreq{
	out ":SENS:FREQ:\$1?";
	in "%d";
}

sFreq{
	out ":SENS:FREQ:\$1 %d";
	@init {out ":SENS:FREQ:\$1?"; in "%d";}
}

gBand{
	out ":SENS:BAND:\$1?";
	in "%u";
}

sBand{
	out ":SENS:BAND:\$1 %u";
	@init {out ":SENS:BAND:\$1?"; in "%u";}
}

gBandA{
	out ":SENS:BAND:\$1:AUTO?";
	in "%{0|1}";
}

sBandA{
	out ":SENS:BAND:\$1:AUTO %{0|1}";
}

gSwT{
	out ":SENS:SWE:TIME?";
	in "%f";
}

sSwT{
	out ":SENS:SWE:TIME %f";
	@init {out ":SENS:SWE:TIME?"; in "%f";}
}

gSwTA{
	out ":SENS:SWE:TIME:AUTO?";
	in "%{0|1}";
}

sSwTA{
	out ":SENS:SWE:TIME:AUTO %{0|1}";
}
sXTyp{
	out ":DISP:WIN:TRAC:X:SCAL:SPAC %{LIN|LOG}";
}

gXTyp{
	out ":DISP:WIN:TRAC:X:SCAL:SPAC?";
	in "%{LIN|LOG}";
}

gTData{
	separator="\_,\_";
	out ":TRAC:DATA? TRACE\$1";
	in "#%*d\_%e";
}

sMMode{
	out ":CALC:MARK\$1:MAX:\$2";
}

sMCont{
	out ":CALC:MARK\$1:CPE %{0|1}";
	@init {out ":CALC:MARK\$1:CPE?"; in "%{0|1}";}
}

gMPos{
	out ":CALC:MARK\$1:X?;:CALC:MARK\$1:Y?";
	in "%f;%(\$2)e"
}

sMEna{
	out ":CALC:MARK\$1:STAT %{0|1}";
	@init {out ":CALC:MARK\$1:STAT?"; in "%{0|1}";}
}

sMTrace{
	out ":CALC:MARK\$1:TRAC %{1|2|3|4}";
	@init{out ":CALC:MARK\$1:TRAC?;*OPC?"; in ";%{1|2|3|4};%*{0|1}";}
}

gMTrace{
	out ":CALC:MARK\$1:TRAC?;*OPC?";
	in ";%{1|2|3|4};%*{0|1}";
}


sM2Cent{
	out ":CALC:MARK\$1:PEAK:CF";
}


gMSts{
	out ":CALC:MARK\$1:STAT?;:CALC:MARK\$1:CPE?";
	in "%{0|1};%(\$2){0|1}";
}

gDevID{
	out "*IDN?";
	in "%#s";
}

gDevIP{
	out ":SYST:COMM:LAN:IP:ADD?";
	in "%#s";
}

reset{
	out "*RST";
}

gSTB{
	out "*STB?;*WAI";
	in "%d";
}

gErr{
	out ":SYST:ERR?";
	in "%#s";
}

clrErrQ{
	out "*CLS;*WAI"
}
