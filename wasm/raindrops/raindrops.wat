(module
  (memory (export "mem") 1)
  ;; (data (i32.const 0) "Pling")
  (data (i32.const 5) "Plang")
  ;; (data (i32.const 10) "Plong")

  (func (export "convert") (param $input i32) (result i32 i32)
    ;; local.get $input
    i32.const 2
    i32.const 65
    ;; local.get $input
    i32.store8
    ;; offset, length
    (return (i32.const 0) (i32.const 24))
  )
)
