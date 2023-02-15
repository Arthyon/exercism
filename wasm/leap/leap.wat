(module
  (func $isNotDivisible (param $year i32) (param $divisor i32) (result i32)
    local.get $year
    local.get $divisor

    i32.rem_u
    i32.const 0
    i32.ne 
  )

  ;; Returns 1 if leap year, 0 otherwise
  (func (export "isLeap") (param $year i32) (result i32)

    local.get $year
    i32.const 4
    call $isNotDivisible
    (if (then (return (i32.const 0))))

    local.get $year
    i32.const 100
    call $isNotDivisible
    (if (then (return (i32.const 1))))

    local.get $year
    i32.const 400
    call $isNotDivisible
    (if 
      (then 
        (return (i32.const 0))
      )
    )
    i32.const 1
    
  )  
)
