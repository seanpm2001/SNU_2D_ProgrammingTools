; magic number
; type for (func (param i64) (result i64))
; function section
; code section start
(func (param i64) (result i64)
  local.get 0
  i64.eqz
  if (result i64)
      i64.const 1
  else
      local.get 0
      local.get 0
      i64.const 1
      i64.sub
      call 0
      i64.mul
  end)
; module end, size fixups
