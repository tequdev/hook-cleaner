(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i64) (result i64)))
  (type (;2;) (func (param i64) (result i64)))
  (type (;3;) (func (param i32) (result i64)))
  (import "env" "_g" (func (;0;) (type 0)))
  (import "env" "accept" (func (;1;) (type 1)))
  (func (;2;) (type 2) (param i64) (result i64)
    (local i64)
    i64.const 10
    local.set 1
    loop  ;; label = @1
      i32.const 2
      i32.const 11
      call 0
      drop
      local.get 1
      i64.const 1
      i64.sub
      local.tee 1
      i64.eqz
      i32.eqz
      br_if 0 (;@1;)
    end
    local.get 0
    i64.const 11
    i64.mul
    i64.const 45
    i64.add)
  (func (;3;) (type 3) (param i32) (result i64)
    i32.const 1
    i32.const 1
    call 0
    drop
    i32.const 0
    i32.const 0
    i64.const 5
    call 2
    call 1)
  (memory (;0;) 2)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66560))
  (global (;4;) i32 (i32.const 0))
  (global (;5;) i32 (i32.const 1))
  (export "hook" (func 3)))
