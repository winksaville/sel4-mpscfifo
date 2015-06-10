# Multiple Producer Single Consumer FIFO for seL4

A First In First Out queue that supports multiple produces and a single consumer.
It's implemented using a wait-free algorithm and requires a compiler that supports
__atomic_exchange_n, __atomic_store_n and atomic_load_n, I'm using gcc 4.9.2.
