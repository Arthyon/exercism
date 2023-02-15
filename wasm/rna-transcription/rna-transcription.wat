(module
  (memory (export "mem") 1)

  (func (export "toRna") (param $offset i32) (param $length i32) (result i32 i32)
     (local $current_index i32)
     (local $current_addr i32)
     (local $current_value i32)

     (block $loop_break
      (loop $loop

        local.get $current_index
        local.get $length
        i32.ge_u
        br_if $loop_break

       
        i32.const 1
        (i32.add (local.get $offset) (local.get $current_index))
        local.tee $current_addr

        i32.load8_s
        local.set $current_value

        (if (i32.eq (local.get $current_value) (i32.const 65)) 
        (then 
          local.get $current_addr
          i32.const 85
          i32.store8
        ))

        (if (i32.eq (local.get $current_value) (i32.const 71)) 
        (then 
          local.get $current_addr
          i32.const 67
          i32.store8
        ))

        (if (i32.eq (local.get $current_value) (i32.const 67)) 
        (then 
          local.get $current_addr
          i32.const 71
          i32.store8
        ))

        (if (i32.eq (local.get $current_value) (i32.const 84)) 
        (then 
          local.get $current_addr
          i32.const 65
          i32.store8
        ))

        (i32.add (local.get $current_index) (i32.const 1))
        local.set $current_index

        br $loop
      )
    )
    (return (local.get $offset) (local.get $length))
  )
)
