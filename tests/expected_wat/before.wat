(module
  (type (;0;) (func (param i32) (result i64)))
  (type (;1;) (func (param i32 i32 i32 i32 i32) (result i64)))
  (type (;2;) (func (param i32 i32 i64) (result i64)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func))
  (import "env" "trace" (func (;0;) (type 1)))
  (import "env" "accept" (func (;1;) (type 2)))
  (import "env" "_g" (func (;2;) (type 3)))
  (func (;3;) (type 4)
    nop)
  (func (;4;) (type 0) (param i32) (result i64)
    i64.const 0)
  (func (;5;) (type 0) (param i32) (result i64)
    i32.const 1042
    i32.const 19
    i32.const 1024
    i32.const 18
    i32.const 0
    call 0
    drop
    i32.const 0
    i32.const 0
    i64.const 0
    call 1
    drop
    i32.const 1
    i32.const 1
    call 2
    drop
    i64.const 0)
  (memory (;0;) 2)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1062))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66608))
  (global (;4;) i32 (i32.const 0))
  (global (;5;) i32 (i32.const 1))
  (export "hook" (func 5))
  (export "cbak" (func 4))
  (data (;0;) (i32.const 1024) "Accept.c: Called.\00\22Accept.c: Called.\22"))
