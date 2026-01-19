(module
  (type (;0;) (func (param i32) (result i64)))
  (type (;1;) (func (param i32 i32 i64) (result i64)))
  (type (;2;) (func (param i32 i32) (result i64)))
  (type (;3;) (func (param i32 i32 i32 i32) (result i64)))
  (type (;4;) (func (param i32 i32 i32 i32 i32) (result i64)))
  (type (;5;) (func (param i32 i32 i32) (result i64)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (type (;7;) (func (result i64)))
  (type (;8;) (func))
  (import "env" "trace" (func (;0;) (type 4)))
  (import "env" "etxn_reserve" (func (;1;) (type 0)))
  (import "env" "hook_account" (func (;2;) (type 2)))
  (import "env" "otxn_field" (func (;3;) (type 5)))
  (import "env" "trace_num" (func (;4;) (type 1)))
  (import "env" "rollback" (func (;5;) (type 1)))
  (import "env" "_g" (func (;6;) (type 6)))
  (import "env" "accept" (func (;7;) (type 1)))
  (import "env" "util_accid" (func (;8;) (type 3)))
  (import "env" "etxn_fee_base" (func (;9;) (type 0)))
  (import "env" "ledger_seq" (func (;10;) (type 7)))
  (import "env" "etxn_details" (func (;11;) (type 2)))
  (import "env" "emit" (func (;12;) (type 3)))
  (func (;13;) (type 8)
    nop)
  (func (;14;) (type 0) (param i32) (result i64)
    i32.const 1526
    i32.const 26
    i32.const 1335
    i32.const 25
    i32.const 0
    call 0
    drop
    i64.const 0)
  (func (;15;) (type 0) (param i32) (result i64)
    (local i32 i32 i64 i64 i64 f64)
    global.get 0
    i32.const 448
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1508
    i32.const 17
    i32.const 1284
    i32.const 16
    i32.const 0
    call 0
    drop
    i32.const 1
    call 1
    drop
    local.get 0
    i32.const 416
    i32.add
    i32.const 20
    call 2
    drop
    i32.const 1252
    i32.const 17
    local.get 0
    i32.const 384
    i32.add
    i32.const 20
    i32.const 524289
    call 3
    local.tee 3
    i64.const 32
    i64.shl
    i64.const 32
    i64.shr_s
    call 4
    drop
    local.get 3
    i32.wrap_i64
    i32.const 19
    i32.le_s
    if  ;; label = @1
      i32.const 1553
      i32.const 35
      i64.const 1
      call 5
      drop
    end
    i32.const 1
    local.set 2
    loop (result i64)  ;; label = @1
      i32.const 2359297
      i32.const 21
      call 6
      drop
      local.get 2
      i32.const 0
      local.get 1
      i32.const 20
      i32.lt_u
      select
      if (result i64)  ;; label = @2
        local.get 0
        i32.const 416
        i32.add
        local.get 1
        i32.add
        i32.load8_u
        local.get 0
        i32.const 384
        i32.add
        local.get 1
        i32.add
        i32.load8_u
        i32.eq
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        br 1 (;@1;)
      else
        local.get 2
        i32.eqz
        if  ;; label = @3
          i32.const 1051
          i32.const 29
          i64.const 2
          call 7
          drop
        end
        i32.const 1270
        i32.const 13
        block (result i64)  ;; label = @3
          local.get 0
          i32.const 336
          i32.add
          i32.const 48
          i32.const 393217
          call 3
          i64.const 8
          i64.ne
          if  ;; label = @4
            i32.const 1360
            i32.const 78
            i32.const 1108
            i32.const 77
            i32.const 0
            call 0
            drop
            i64.const 1000
            br 1 (;@3;)
          end
          i32.const 1439
          i32.const 68
          i32.const 1185
          i32.const 67
          i32.const 0
          call 0
          drop
          i32.const 1040
          i32.const 10
          local.get 0
          i32.load8_s offset=336
          local.tee 1
          i32.const 0
          i32.lt_s
          if (result i64)  ;; label = @4
            i64.const -2
          else
            local.get 0
            i64.load8_u offset=343
            local.get 0
            i64.load8_u offset=337
            i64.const 48
            i64.shl
            local.get 1
            i64.extend_i32_u
            i64.const 17
            i64.and
            i64.const 56
            i64.shl
            i64.or
            local.get 0
            i64.load8_u offset=338
            i64.const 40
            i64.shl
            i64.or
            local.get 0
            i64.load8_u offset=339
            i64.const 32
            i64.shl
            i64.or
            local.get 0
            i64.load8_u offset=340
            i64.const 24
            i64.shl
            i64.or
            local.get 0
            i64.load8_u offset=341
            i64.const 16
            i64.shl
            i64.or
            local.get 0
            i64.load8_u offset=342
            i64.const 8
            i64.shl
            i64.or
            i64.add
          end
          local.tee 3
          call 4
          drop
          local.get 3
          i64.const 100000
          i64.gt_s
          local.set 1
          block (result i64)  ;; label = @4
            local.get 3
            f64.convert_i64_s
            f64.const 0x1.47ae14p-7 (;=0.01;)
            f64.mul
            local.tee 6
            f64.abs
            f64.const 0x1p+63 (;=9.22337e+18;)
            f64.lt
            if  ;; label = @5
              local.get 6
              i64.trunc_f64_s
              br 1 (;@4;)
            end
            i64.const -9223372036854775808
          end
          i64.const 1000
          local.get 1
          select
        end
        local.tee 3
        call 4
        drop
        i32.const 1036
        i32.const 3
        local.get 0
        i32.const 304
        i32.add
        i32.const 20
        i32.const 1300
        i32.const 35
        call 8
        call 4
        drop
        i32.const 270
        call 9
        local.set 4
        call 10
        local.set 5
        local.get 0
        i32.const 20
        call 2
        drop
        local.get 0
        i32.const 8563
        i32.store16 offset=85 align=1
        local.get 0
        local.get 4
        i64.store8 offset=84
        local.get 0
        local.get 4
        i64.const 8
        i64.shr_u
        i64.store8 offset=83
        local.get 0
        local.get 4
        i64.const 16
        i64.shr_u
        i64.store8 offset=82
        local.get 0
        local.get 4
        i64.const 24
        i64.shr_u
        i64.store8 offset=81
        local.get 0
        local.get 4
        i64.const 32
        i64.shr_u
        i64.store8 offset=80
        local.get 0
        local.get 4
        i64.const 40
        i64.shr_u
        i64.store8 offset=79
        local.get 0
        local.get 4
        i64.const 48
        i64.shr_u
        i64.store8 offset=78
        local.get 0
        local.get 4
        i64.const 56
        i64.shr_u
        i32.wrap_i64
        i32.const 63
        i32.and
        i32.const 64
        i32.or
        i32.store8 offset=77
        local.get 0
        i32.const 104
        i32.store8 offset=76
        local.get 0
        local.get 3
        i64.store8 offset=75
        local.get 0
        local.get 3
        i64.const 8
        i64.shr_u
        i64.store8 offset=74
        local.get 0
        local.get 3
        i64.const 16
        i64.shr_u
        i64.store8 offset=73
        local.get 0
        local.get 3
        i64.const 24
        i64.shr_u
        i64.store8 offset=72
        local.get 0
        local.get 3
        i64.const 32
        i64.shr_u
        i64.store8 offset=71
        local.get 0
        local.get 3
        i64.const 40
        i64.shr_u
        i64.store8 offset=70
        local.get 0
        local.get 3
        i64.const 48
        i64.shr_u
        i64.store8 offset=69
        local.get 0
        local.get 3
        i64.const 56
        i64.shr_u
        i32.wrap_i64
        i32.const 63
        i32.and
        i32.const 64
        i32.or
        i32.store8 offset=68
        local.get 0
        i32.const 97
        i32.store8 offset=67
        local.get 0
        i32.const 6944
        i32.store16 offset=61 align=1
        local.get 0
        i32.const 6688
        i32.store16 offset=55 align=1
        local.get 0
        i32.const 0
        i32.store offset=51 align=1
        local.get 0
        i32.const 46
        i32.store8 offset=50
        local.get 0
        i32.const 0
        i32.store offset=46 align=2
        local.get 0
        i32.const 36
        i32.store8 offset=45
        local.get 0
        i32.const 0
        i32.store offset=41 align=1
        local.get 0
        i32.const 35
        i32.store8 offset=40
        local.get 0
        i64.const 550326239250
        i64.store offset=32
        local.get 0
        local.get 5
        i32.wrap_i64
        local.tee 2
        i32.const 5
        i32.add
        local.tee 1
        i32.store8 offset=66
        local.get 0
        local.get 1
        i32.const 8
        i32.shr_u
        i32.store8 offset=65
        local.get 0
        local.get 1
        i32.const 16
        i32.shr_u
        i32.store8 offset=64
        local.get 0
        local.get 1
        i32.const 24
        i32.shr_u
        i32.store8 offset=63
        local.get 0
        local.get 2
        i32.const 1
        i32.add
        local.tee 1
        i32.store8 offset=60
        local.get 0
        local.get 1
        i32.const 8
        i32.shr_u
        i32.store8 offset=59
        local.get 0
        local.get 1
        i32.const 16
        i32.shr_u
        i32.store8 offset=58
        local.get 0
        local.get 1
        i32.const 24
        i32.shr_u
        i32.store8 offset=57
        local.get 0
        i32.const 110
        i32.add
        i64.const 0
        i64.store align=1
        local.get 0
        i32.const 103
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i32.const 95
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i64.const 0
        i64.store offset=87
        local.get 0
        i32.const 5249
        i32.store16 offset=120
        local.get 0
        i32.const 5251
        i32.store16 offset=142
        local.get 0
        local.get 0
        i64.load
        i64.store offset=122
        local.get 0
        local.get 0
        i64.load offset=8
        i64.store offset=130
        local.get 0
        local.get 0
        i32.load offset=16
        i32.store offset=138
        local.get 0
        local.get 0
        i64.load offset=304
        i64.store offset=144
        local.get 0
        local.get 0
        i64.load offset=312
        i64.store offset=152
        local.get 0
        local.get 0
        i32.load offset=320
        i32.store offset=160
        local.get 0
        i32.const 164
        i32.add
        i32.const 138
        call 11
        drop
        i32.const 1024
        i32.const 11
        local.get 0
        i32.const 32
        local.get 0
        i32.const 32
        i32.add
        i32.const 270
        call 12
        call 4
        drop
        i32.const 1080
        i32.const 28
        i64.const 0
        call 7
        drop
        local.get 0
        i32.const 448
        i32.add
        global.set 0
        i64.const 0
      end
    end)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 67136))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1588))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 67136))
  (global (;5;) i32 (i32.const 0))
  (global (;6;) i32 (i32.const 1))
  (export "hook" (func 15))
  (export "cbak" (func 14))
  (data (;0;) (i32.const 1024) "emit_result\00ret\00otxn_drops\00Carbon: Incoming transaction\00Carbon: Emitted transaction\00Carbon: Non-xrp transaction detected, sending default 1000 drops to rfCarbon\00Carbon: XRP transaction detected, computing 1% to send to rfCarbon\00account_field_len\00drops_to_send\00Carbon: started\00rfCarbonVNTuXckX6x2qTMFmFSnm6dEWGX\00Carbon: callback called.\00\22Carbon: Non-xrp transaction detected, sending default 1000 drops to rfCarbon\22\00\22Carbon: XRP transaction detected, computing 1% to send to rfCarbon\22\00\22Carbon: started\22\00\22Carbon: callback called.\22\00Carbon: sfAccount field missing!!!"))
