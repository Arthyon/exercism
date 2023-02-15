(module
  (func $getRadius (param $x f32) (param $y f32) (result f32)
    local.get $x
    local.get $x
    f32.mul
    local.get $y
    local.get $y
    f32.mul

    f32.add
    f32.sqrt
  )

  (func $score (param $x f32) (param $y f32) (result i32)
    (local $r f32)
    local.get $x
    local.get $y
    call $getRadius

    local.tee $r 
    f32.const 10
    f32.gt
    (if (then  (return (i32.const 0) )))

    local.get $r
    f32.const 5
    f32.gt
    (if (then (return (i32.const 1))))

    local.get $r
    f32.const 1
    f32.gt
    (if (then (return (i32.const 5))))

    i32.const 10
  )

  (export "score" (func $score))
)
