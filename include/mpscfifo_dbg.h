/**
 * Debug routines for mpscfifo
 */

#ifndef _MPSCFIO_DBG_H_
#define _MPSCFIO_DBG_H_

/**
 * Debug code for mpscfifo
 */
#include "mpscfifo.h"

/**
 * Print a Msg_t
 */
void printMsg(Msg_t* pMsg);

/**
 * Print a MpscFifo_t
 */
void printMpscFifo(MpscFifo_t* pQ);

#endif
