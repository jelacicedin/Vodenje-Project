/* Include files */

#include "InterpolationIkinePD_cgxe.h"
#include "m_v5VTtcRQevfNVdrzA5wKAG.h"

unsigned int cgxe_InterpolationIkinePD_method_dispatcher(SimStruct* S, int_T
  method, void* data)
{
  if (ssGetChecksum0(S) == 3499480771 &&
      ssGetChecksum1(S) == 799562028 &&
      ssGetChecksum2(S) == 3934094921 &&
      ssGetChecksum3(S) == 2594661729) {
    method_dispatcher_v5VTtcRQevfNVdrzA5wKAG(S, method, data);
    return 1;
  }

  return 0;
}
