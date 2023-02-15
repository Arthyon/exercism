(module
  (func (export "steps") (param $number i32) (result i32)
    (local $steps i32)
    (local $current i32)
    local.get $number
    i32.const 0
    i32.le_s
    (if
      (then (return (i32.const  -1)))
    )
    local.get $number
    local.set $current
    
    (block $loop_break
      (loop $loop

        local.get $current
        i32.const 1
        i32.eq
        br_if $loop_break

        local.get $current
        i32.const 2
        i32.rem_u
        i32.const 0
        i32.eq
        (if
          (then
            local.get $current
            i32.const 2
            i32.div_u
            local.set $current
            
          )
          (else 
            local.get $current
            i32.const 3
            i32.mul
            i32.const 1
            i32.add
            local.set $current
          )
        )



        local.get $steps
        i32.const 1
        i32.add
        local.set $steps

        br $loop
      )
    )

    (return (local.get $steps))
  )
)