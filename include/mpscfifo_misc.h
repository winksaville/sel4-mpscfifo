/**
 * Miscelaneous header file
 */

#ifndef _MPSCFIO_MISC_H_
#define _MPSCFIO_MISC_H_

/**
 * Return TRUE is condition is false
 */
#define TEST(cond, text)                                                       \
  do {                                                                         \
    if (!(cond)) {                                                             \
      error |= true;                                                           \
      printf("Error %s:%d FN %s: %s. Condition '" #cond "' failed.\n",         \
             __FILE__, __LINE__, __func__, text);                              \
    }                                                                          \
  } while (false);

#define UNUSED(x) (void)(x)

#endif
