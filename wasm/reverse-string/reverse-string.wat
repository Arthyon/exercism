(module
  (memory (export "mem") 1)
 
  (func (export "reverseString") (param $offset i32) (param $length i32) (result i32 i32)
    (local $new_offset i32)
    (local $ptr i32)
    (local.set $new_offset (i32.const 320))

    (block $loop_break
      (loop $loop

        (i32.eq (local.get $ptr) (local.get $length))
        br_if $loop_break


        (i32.add (local.get $new_offset) (local.get $ptr))

        (i32.add (local.get $offset) (local.get $length))
        i32.const 1
        i32.sub
        local.get $ptr
        i32.sub


        i32.load8_s

        i32.store8



        (i32.add (local.get $ptr) (i32.const 1))
        local.set $ptr

        br $loop
      )
    )
    (return (local.get $new_offset) (local.get $length))

    
  )
)
