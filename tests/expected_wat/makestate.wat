(module
  (type (;0;) (func (param i32 i32 i64) (result i64)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32 i32) (result i64)))
  (type (;3;) (func (param i32) (result i64)))
  (import "env" "trace_num" (func (;0;) (type 0)))
  (import "env" "_g" (func (;1;) (type 1)))
  (import "env" "state_set" (func (;2;) (type 2)))
  (import "env" "accept" (func (;3;) (type 0)))
  (func (;4;) (type 3) (param i32) (result i64)
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
  (func (;5;) (type 3) (param i32) (result i64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i32)
    global.get 0
    local.set 1
    i32.const 80
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set 0
    i32.const 0
    local.set 4
    i32.const 1037
    local.set 5
    i32.const 20
    local.set 6
    i32.const 63
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    local.get 3
    local.get 0
    i32.store offset=76
    i32.const 5
    local.set 10
    local.get 9
    local.get 10
    i32.add
    local.set 11
    i32.const 0
    local.set 12
    local.get 12
    i64.load offset=1029 align=1
    local.set 13
    local.get 11
    local.get 13
    i64.store align=1
    local.get 12
    i64.load offset=1024 align=1
    local.set 14
    local.get 9
    local.get 14
    i64.store align=1
    local.get 9
    i64.extend_i32_u
    local.set 15
    local.get 5
    local.get 6
    local.get 15
    call 0
    drop
    local.get 3
    local.get 4
    i32.store offset=12
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 33
        i32.const 20
        call 1
        drop
        i32.const 32
        local.set 16
        i32.const 20
        local.set 17
        i32.const 33
        local.set 18
        local.get 17
        local.get 18
        drop
        nop
        nop
        nop
        nop
        nop
        drop
        local.get 3
        i32.load offset=12
        local.set 19
        local.get 19
        local.set 20
        local.get 16
        local.set 21
        local.get 20
        local.get 21
        i32.lt_s
        local.set 22
        i32.const 1
        local.set 23
        local.get 22
        local.get 23
        i32.and
        local.set 24
        local.get 24
        i32.eqz
        br_if 1 (;@1;)
        i32.const 16
        local.set 25
        local.get 3
        local.get 25
        i32.add
        local.set 26
        local.get 26
        local.set 27
        local.get 3
        i32.load offset=12
        local.set 28
        local.get 3
        i32.load offset=12
        local.set 29
        local.get 27
        local.get 29
        i32.add
        local.set 30
        local.get 30
        local.get 28
        i32.store8
        local.get 3
        i32.load offset=12
        local.set 31
        i32.const 1
        local.set 32
        local.get 31
        local.get 32
        i32.add
        local.set 33
        local.get 3
        local.get 33
        i32.store offset=12
        br 0 (;@2;)
      end
    end
    i64.const 0
    local.set 34
    i32.const 1
    local.set 35
    i32.const 0
    local.set 36
    i32.const 1057
    local.set 37
    i32.const 18
    local.set 38
    i32.const 13
    local.set 39
    i32.const 32
    local.set 40
    i32.const 16
    local.set 41
    local.get 3
    local.get 41
    i32.add
    local.set 42
    local.get 42
    local.set 43
    i32.const 63
    local.set 44
    local.get 3
    local.get 44
    i32.add
    local.set 45
    local.get 45
    local.set 46
    local.get 46
    local.get 39
    local.get 43
    local.get 40
    call 2
    local.set 47
    local.get 3
    local.get 47
    i64.store
    local.get 3
    i64.load
    local.set 48
    local.get 37
    local.get 38
    local.get 48
    call 0
    drop
    local.get 36
    local.get 36
    local.get 34
    call 3
    drop
    local.get 35
    local.get 35
    call 1
    drop
    i32.const 80
    local.set 49
    local.get 3
    local.get 49
    i32.add
    local.set 50
    local.get 50
    global.set 0
    local.get 34
    return)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66624))
  (global (;1;) i32 (i32.const 1075))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66624))
  (global (;4;) i32 (i32.const 1024))
  (export "cbak" (func 4))
  (export "hook" (func 5))
  (data (;0;) (i32.const 1024) "hello world!\00location of test[]:\00state_set result:\00"))
