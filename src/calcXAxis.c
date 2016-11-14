#include <registryFunction.h>
#include <aSubRecord.h>
#include <dbCommon.h>
#include <recSup.h>
#include <epicsTypes.h>
#include <stdio.h>
#include <math.h>

long calcXAxis(struct aSubRecord *prec){
	/*
	inp A: NORD value of y array
	inp B: start freq in Hz (udouble)
	inp C: stop freq in Hz (udouble)
	inp D: type of input scale: linear (0) or logarithmic (1) 
	*/

	epicsFloat64 step_size, freq_start, freq_stop, freq_curr, exponent, y_axis_size;
	epicsEnum16 x_type;

	y_axis_size = ((epicsFloat64*)prec->a)[0];
	freq_start = ((epicsFloat64*)prec->b)[0];
	freq_stop = ((epicsFloat64*)prec->c)[0];
	x_type = ((epicsFloat64*)prec->d)[0];

	epicsFloat64* x_axis = (epicsFloat64*)prec->vala;
	
	int i;
	if(x_type==1){ // log10
		step_size = log10(freq_stop - freq_start)/(y_axis_size-1);
		if(freq_start==0){
			exponent=0; // start with freq 1 Hz
		}
		else{
			exponent = log10(freq_start);
		}
		for(i=0; i<y_axis_size; ++i){
			x_axis[i] = pow(10, exponent);
			exponent += step_size;
		}
	}
	else{ // linear
		step_size = (freq_stop - freq_start)/(y_axis_size-1);
		freq_curr = freq_start;
		for(i=0; i<y_axis_size; ++i){
			x_axis[i] = freq_curr;
			freq_curr += step_size;
		}
	}


	prec->neva = y_axis_size;

	return(0);
	// update output
}

epicsRegisterFunction(calcXAxis);