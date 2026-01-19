(module
  (type (;0;) (func (param i32 i32 i64) (result i64)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32) (result i64)))
  (import "env" "accept" (func (;0;) (type 0)))
  (import "env" "_g" (func (;1;) (type 1)))
  (func (;2;) (type 2))
  (func (;3;) (type 3) (param i32) (result i64)
    (local i32 i32 i32 i64)
    global.get 0
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    i64.const 0
    local.set 4
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 4
    return)
  (func (;4;) (type 3) (param i32) (result i64)
    (local i32 i32 i32 i64 i32 i32 i32 i32)
    global.get 0
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set 0
    i64.const 0
    local.set 4
    i32.const 1
    local.set 5
    i32.const 0
    local.set 6
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 6
    local.get 6
    local.get 4
    call 0
    drop
    local.get 5
    local.get 5
    call 1
    drop
    i32.const 16
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set 0
    local.get 4
    return)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66560))
  (global (;4;) i32 (i32.const 1024))
  (export "hook" (func 4))
  (export "cbak" (func 3)))
