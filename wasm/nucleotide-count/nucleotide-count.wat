(module
  (import "console" "log_i32_s" (func $log (param i32)))
  (memory (export "mem") 1)

  (func (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
    (local $a i32)
    (local $c i32)
    (local $g i32)
    (local $t i32)
    (local $current_index i32)
    (local $current_value i32)
    (local $debug i32)
    ;;A=65
    ;;G=71
    ;;C=67
    ;;T=84
    (call $log (local.get $offset))
    (call $log (local.get $length))

    (block $loop_break
      (loop $loop

        local.get $current_index
        local.get $length
        i32.ge_u
        br_if $loop_break

        i32.const 1
        (i32.add (local.get $offset) (local.get $current_index))
        i32.load8_s

        local.set $current_value
        (call $log (local.get $current_value))

        (if (i32.eq (local.get $current_value) (i32.const 65)) 
        (then 
          (i32.add (local.get $a) (i32.const 1))
          local.set $a
        )
        (else
          (if (i32.eq (local.get $current_value) (i32.const 71)) 
          (then 
            (i32.add (local.get $g) (i32.const 1))
            local.set $g
          )
          (else
            (if (i32.eq (local.get $current_value) (i32.const 67)) 
            (then 
              (i32.add (local.get $c) (i32.const 1))
              local.set $c
            )
            (else
              (if (i32.eq (local.get $current_value) (i32.const 84)) 
              (then 
                (i32.add (local.get $t) (i32.const 1))
                local.set $t
              )
              (else
                (local.set $a (i32.const -1))
                (local.set $g (i32.const -1))
                (local.set $c (i32.const -1))
                (local.set $t (i32.const -1))
                br $loop_break

              ))
            )
            )
          ))
        ))





        (i32.add (local.get $current_index) (i32.const 1))
        local.set $current_index
        
        br $loop
      )
    )

    ;; local.get $current_index
    ;; local.set $a

    ;; local.get $length
    ;; local.set $t
    (return 
      (local.get $a)
      (local.get $c)
      (local.get $g)
      (local.get $t)
    )
  )
)
