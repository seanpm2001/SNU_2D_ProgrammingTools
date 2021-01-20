desired_things = [:unicorns, "butterflies", 1_000_000]
p typeof(desired_things.first) # typeof returns the compile time type, here (Int32 | String | Symbol)
p desired_things.first.class   # the class method returns the runtime type, here Symbol
