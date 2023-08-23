/***************************** Include Files *********************************/

#include "xil_testmem.h"
#include "xstatus.h"
#include "xparameters.h"
#include "xil_cache.h"
#include <stdio.h>


/* Definitions for peripheral MIG_7SERIES_0 */
#define DDR_BASEADDR XPAR_MIG_7SERIES_0_BASEADDR
#define DDR_HIGHADDR XPAR_MIG_7SERIES_0_HIGHADDR


int main()
{

    XStatus status;

	#ifdef __arm__
    // For ARM, BSP enables caches by default. Disable them here.
    // See reason above for disabling D Cache
    	Xil_DCacheDisable();
	#endif


	status = Xil_TestMem16((u16*)XPAR_MIG_7SERIES_0_BASEADDR, 2048, 0xAA55, XIL_TESTMEM_ALLMEMTESTS);
    printf("          16-bit test: "); printf(status == XST_SUCCESS? "PASSED!":"FAILED!"); printf("\n\r");

    int color = (status == XST_SUCCESS? 1 : 0);
//    colorLED(color);


	return 0;


}
