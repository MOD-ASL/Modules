#include "mex.h"
#include "crc_helper.h"
/* Gateway function */

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    unsigned short int crc;
    mwSize index, num_elements;
    unsigned char *pr;
    unsigned char *out_arr;
    unsigned short int *crc_out;
    mxArray *converted_prhs0;
    
/* Check input arguments */
    
	if( nrhs != 1 ) {
        mexErrMsgTxt("AppendCRC has exclusively one input.");
	}
	if( nlhs != 1 ) {
        mexErrMsgTxt("AppendCRC has exclusively one output.");
	}
	if( !mxIsUint8(prhs[0]) ) {
        // Convert to uint8
        mexCallMATLAB(1,&converted_prhs0,1, &prhs[0], "uint8");
        pr = (unsigned char *)mxGetData(converted_prhs0);
        num_elements = mxGetNumberOfElements(converted_prhs0);
	}
    else
    {
        pr = (unsigned char *)mxGetData(prhs[0]);
        num_elements = mxGetNumberOfElements(prhs[0]);
    }
    
    
    crc = MakeCrc(pr, num_elements);
	
//     message = uint8(message);
    
//     crc = uint16(65535); %hex2dec('ffff');
// 
//     for i = 1:length(message)
//         x = bitxor(bitshift(crc,-8),uint16(message(i)));
//         x = bitxor(x,bitshift(x,-4));
//         crc = bitxor(bitxor(bitxor(bitshift(crc,8),bitshift(x,12)),bitshift(x,5)),x);
//     end
// 
//     crc = [bitand(crc,255); bitshift(crc,-8)];
// 
//     amsg = [message; crc];
    plhs[0] = mxCreateNumericMatrix(num_elements + 2, 1, mxUINT8_CLASS, mxREAL);
    out_arr = (unsigned char *)mxGetPr(plhs[0]);
    for (index = 0; index < num_elements; index++)
    {
        out_arr[index] = pr[index];
    }
    out_arr[num_elements] = crc & 0xFF;
    out_arr[num_elements + 1] = crc >> 8;
    
    plhs[1] = mxCreateNumericMatrix(1, 1, mxUINT16_CLASS, mxREAL);
    crc_out = (unsigned short int *)mxGetData(plhs[1]);
    crc_out[0] = crc;
}
