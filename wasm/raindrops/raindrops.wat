(module
  (memory (export "mem") 1)
  (data (i32.const 0) "Pling")
  (data (i32.const 5) "Plang")
  (data (i32.const 10) "Plong")

  (func (export "convert") (param $input i32) (result i32 i32)

    (local $offset i32)
    (local $length i32)

    (local.set $offset (i32.const 16))

    (i32.rem_u (local.get $input) (i32.const 3))
    (i32.eq (i32.const 0))
    (if 
      (then
        (memory.copy (local.get $offset) (i32.const 0) (i32.const 5))
        (i32.add (local.get $offset) (i32.const 5))
        local.set $offset
    ))
    (i32.rem_u (local.get $input) (i32.const 5))
    (i32.eq (i32.const 0))
    (if 
      (then
        (memory.copy (local.get $offset) (i32.const 5) (i32.const 5))
        (i32.add (local.get $offset) (i32.const 5))
        local.set $offset
    ))
    (i32.rem_u (local.get $input) (i32.const 7))
    (i32.eq (i32.const 0))
    (if 
      (then
        (memory.copy (local.get $offset) (i32.const 10) (i32.const 5))
        (i32.add (local.get $offset) (i32.const 5))
        local.set $offset
    ))


    (i32.sub (local.get $offset) (i32.const 16)) 
    local.tee $length
    i32.const 0
    i32.eq

    (if
      (then
        (call $intToString (local.get $input))
        return
    ) 
    )

    i32.const 16
    local.get $length

  )

  (func $intToString (param $input i32) (result i32 i32)
    (local $current_offset i32)
    (local $length i32)
    (local.set $current_offset (i32.const 50))

    (block $loop_break
      (loop $loop

        ;; If input is less than 10, break out of loop
        local.get $input
        i32.const 10
        i32.lt_u
        br_if $loop_break

        ;; Take modulo of 10, add 48 to get ascii value of number and store at the memory address pointed to by $current_offset
        local.get $current_offset
        (i32.rem_u (local.get $input) (i32.const 10))
        i32.const 48
        i32.add

        i32.store8

        ;; Subtract one from current_offset 
        ;; We start with the most significant digit, so the easiest way to get the characters in the right order is to work backwards
        (i32.sub (local.get $current_offset) (i32.const 1))
        local.set $current_offset

        ;; Add one to length
        (i32.add (local.get $length) (i32.const 1))
        local.set $length

        ;; Divide current $input value by 10 and store in local
        (i32.div_u (local.get $input) (i32.const 10))
        local.set $input

        br $loop
      )
    )

    ;; Do the remainder operation one more time to get the last digit
    local.get $current_offset
    (i32.rem_u (local.get $input) (i32.const 10))
    i32.const 48
    i32.add
    i32.store8

    (i32.add (local.get $length) (i32.const 1))
    local.set $length

    ;; Return the reverse offsets to get the string in correct order
    (return (local.get $current_offset) (local.get $length))

  )

)
