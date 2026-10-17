(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i64) (result i64)))
  (type (;2;) (func (result i64)))
  (type (;3;) (func (param i32) (result i64)))
  (import "env" "_g" (func (;0;) (type 0)))
  (import "env" "accept" (func (;1;) (type 1)))
  (func (;2;) (type 2) (result i64)
    (local i64)
    i64.const 100
    local.set 0
    loop  ;; label = @1
      i32.const 2
      i32.const 101
      call 0
      drop
      local.get 0
      i64.const -1
      i64.add
      local.tee 0
      i64.eqz
      i32.eqz
      br_if 0 (;@1;)
    end
    i64.const 4950)
  (func (;3;) (type 3) (param i32) (result i64)
    i32.const 1
    i32.const 1
    call 0
    drop
    i32.const 0
    i32.const 0
    call 2
    call 2
    i64.add
    call 2
    i64.add
    call 1)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66560))
  (global (;4;) i32 (i32.const 1024))
  (export "hook" (func 3)))
