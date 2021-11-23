Number.metaClass {
  sqrt = { Math.sqrt(delegate) }
}

assert 9.sqrt() == 3
assert 4.sqrt() == 2
