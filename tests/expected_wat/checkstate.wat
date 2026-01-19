(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32) (result i64)))
  (type (;2;) (func (param i32 i32 i64) (result i64)))
  (type (;3;) (func))
  (type (;4;) (func (param i32) (result i64)))
  (import "env" "_g" (func (;0;) (type 0)))
  (import "env" "state" (func (;1;) (type 1)))
  (import "env" "trace_num" (func (;2;) (type 2)))
  (import "env" "rollback" (func (;3;) (type 2)))
  (import "env" "accept" (func (;4;) (type 2)))
  (func (;5;) (type 3))
  (func (;6;) (type 4) (param i32) (result i64)
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
  (func (;7;) (type 4) (param i32) (result i64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i32 i32 i32 i32 i32 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get 0
    local.set 1
    i32.const 224
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set 0
    i32.const 0
    local.set 4
    i32.const 207
    local.set 5
    local.get 3
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.set 7
    local.get 3
    local.get 0
    i32.store offset=220
    i32.const 5
    local.set 8
    local.get 7
    local.get 8
    i32.add
    local.set 9
    i32.const 0
    local.set 10
    local.get 10
    i64.load offset=1029 align=1
    local.set 11
    local.get 9
    local.get 11
    i64.store align=1
    local.get 10
    i64.load offset=1024 align=1
    local.set 12
    local.get 7
    local.get 12
    i64.store align=1
    local.get 3
    local.get 4
    i32.store offset=156
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 33
        i32.const 22
        call 0
        drop
        i32.const 32
        local.set 13
        i32.const 22
        local.set 14
        i32.const 33
        local.set 15
        local.get 14
        local.get 15
        drop
        nop
        nop
        nop
        nop
        nop
        drop
        local.get 3
        i32.load offset=156
        local.set 16
        local.get 16
        local.set 17
        local.get 13
        local.set 18
        local.get 17
        local.get 18
        i32.lt_s
        local.set 19
        i32.const 1
        local.set 20
        local.get 19
        local.get 20
        i32.and
        local.set 21
        local.get 21
        i32.eqz
        br_if 1 (;@1;)
        i32.const 160
        local.set 22
        local.get 3
        local.get 22
        i32.add
        local.set 23
        local.get 23
        local.set 24
        local.get 3
        i32.load offset=156
        local.set 25
        local.get 3
        i32.load offset=156
        local.set 26
        local.get 24
        local.get 26
        i32.add
        local.set 27
        local.get 27
        local.get 25
        i32.store8
        local.get 3
        i32.load offset=156
        local.set 28
        i32.const 1
        local.set 29
        local.get 28
        local.get 29
        i32.add
        local.set 30
        local.get 3
        local.get 30
        i32.store offset=156
        br 0 (;@2;)
      end
    end
    i64.const 0
    local.set 31
    i32.const 128
    local.set 32
    i32.const 32
    local.set 33
    i32.const 160
    local.set 34
    local.get 3
    local.get 34
    i32.add
    local.set 35
    local.get 35
    local.set 36
    i32.const 16
    local.set 37
    local.get 3
    local.get 37
    i32.add
    local.set 38
    local.get 38
    local.set 39
    local.get 39
    local.get 32
    local.get 36
    local.get 33
    call 1
    local.set 40
    local.get 3
    local.get 40
    i64.store offset=8
    local.get 3
    i64.load offset=8
    local.set 41
    local.get 41
    local.set 42
    local.get 31
    local.set 43
    local.get 42
    local.get 43
    i64.le_s
    local.set 44
    i32.const 1
    local.set 45
    local.get 44
    local.get 45
    i32.and
    local.set 46
    block  ;; label = @1
      local.get 46
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1037
      local.set 47
      i32.const 18
      local.set 48
      i64.const 2
      local.set 49
      local.get 3
      i64.load offset=8
      local.set 50
      local.get 47
      local.get 48
      local.get 50
      call 2
      drop
      local.get 47
      local.get 48
      local.get 49
      call 3
      drop
    end
    i32.const 0
    local.set 51
    local.get 3
    local.get 51
    i32.store offset=4
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 33
        i32.const 15
        call 0
        drop
        i32.const 13
        local.set 52
        i32.const 33
        local.set 53
        i32.const 15
        local.set 54
        local.get 53
        local.get 54
        drop
        nop
        nop
        nop
        nop
        nop
        drop
        local.get 3
        i32.load offset=4
        local.set 55
        local.get 55
        local.set 56
        local.get 52
        local.set 57
        local.get 56
        local.get 57
        i32.lt_u
        local.set 58
        i32.const 1
        local.set 59
        local.get 58
        local.get 59
        i32.and
        local.set 60
        local.get 60
        i32.eqz
        br_if 1 (;@1;)
        i32.const 16
        local.set 61
        local.get 3
        local.get 61
        i32.add
        local.set 62
        local.get 62
        local.set 63
        i32.const 207
        local.set 64
        local.get 3
        local.get 64
        i32.add
        local.set 65
        local.get 65
        local.set 66
        local.get 3
        i32.load offset=4
        local.set 67
        local.get 66
        local.get 67
        i32.add
        local.set 68
        local.get 68
        i32.load8_u
        local.set 69
        i32.const 255
        local.set 70
        local.get 69
        local.get 70
        i32.and
        local.set 71
        local.get 3
        i32.load offset=4
        local.set 72
        local.get 63
        local.get 72
        i32.add
        local.set 73
        local.get 73
        i32.load8_u
        local.set 74
        i32.const 255
        local.set 75
        local.get 74
        local.get 75
        i32.and
        local.set 76
        local.get 71
        local.set 77
        local.get 76
        local.set 78
        local.get 77
        local.get 78
        i32.ne
        local.set 79
        i32.const 1
        local.set 80
        local.get 79
        local.get 80
        i32.and
        local.set 81
        block  ;; label = @3
          local.get 81
          i32.eqz
          br_if 0 (;@3;)
          i32.const 1055
          local.set 82
          i32.const 40
          local.set 83
          i64.const 1
          local.set 84
          local.get 82
          local.get 83
          local.get 84
          call 3
          drop
        end
        local.get 3
        i32.load offset=4
        local.set 85
        i32.const 1
        local.set 86
        local.get 85
        local.get 86
        i32.add
        local.set 87
        local.get 3
        local.get 87
        i32.store offset=4
        br 0 (;@2;)
      end
    end
    i64.const 0
    local.set 88
    i32.const 1
    local.set 89
    i32.const 1095
    local.set 90
    i32.const 34
    local.set 91
    local.get 90
    local.get 91
    local.get 88
    call 4
    drop
    local.get 89
    local.get 89
    call 0
    drop
    i32.const 224
    local.set 92
    local.get 3
    local.get 92
    i32.add
    local.set 93
    local.get 93
    global.set 0
    local.get 88
    return)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66672))
  (global (;1;) i32 (i32.const 1129))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66672))
  (global (;4;) i32 (i32.const 1024))
  (export "hook" (func 7))
  (export "cbak" (func 6))
  (data (;0;) (i32.const 1024) "hello world!\00state call failed\00hook state did not match expected value\00hook state matched expected value\00"))
