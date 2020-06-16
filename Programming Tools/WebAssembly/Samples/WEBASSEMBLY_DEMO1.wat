(module
  (type $t0 (func (param i64) (result i64)))
  (func $f0 (type $t0) (param $p0 i64) (result i64)
    (if $I0 (result i64) ; $I0 is an unused label name
      (i64.eqz
        (local.get $p0)) ; the name $p0 is the same as 0 here
      (then
        (i64.const 1))
      (else
        (i64.mul
          (local.get $p0)
          (call $f0      ; the name $f0 is the same as 0 here
            (i64.sub
              (local.get $p0)
              (i64.const 1))))))))
