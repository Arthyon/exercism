(module
  (memory (export "mem") 1)

  (func (export "compute") 
    (param $firstOffset i32) (param $firstLength i32) (param $secondOffset i32) (param $secondLength i32) (result i32)
    (local $distance i32)
    (local $loop_pointer i32)


    (if (i32.ne (local.get $firstLength) (local.get $secondLength)) 
      (then
      i32.const -1
      return
    ))

     (block $loop_break
      (loop $loop

        local.get $loop_pointer
        local.get $firstLength
        i32.ge_u
        br_if $loop_break

        (i32.load8_u (i32.add (local.get $loop_pointer) (local.get $firstOffset)))
        (i32.load8_u (i32.add (local.get $loop_pointer) (local.get $secondOffset)))
        i32.ne
        (if 
          (then
            (i32.add (local.get $distance) (i32.const 1))
            local.set $distance
        ))


        (i32.add (local.get $loop_pointer) (i32.const 1))
        local.set $loop_pointer


        br $loop
      )
    )


    local.get $distance
  )
)
