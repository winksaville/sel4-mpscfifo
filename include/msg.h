/**
 * Message and queue header file
 */

#ifndef _MSG_H_
#define _MSG_H_

#include <stdint.h>

typedef struct _msg_t {
  struct _msg_t *pNext;  // Next message
  void *pRspq;           // Response queue, null if none
  void *pExtra;          // Extra information, null if none
  int32_t cmd;           // Command to perform
} Msg_t;

#endif
