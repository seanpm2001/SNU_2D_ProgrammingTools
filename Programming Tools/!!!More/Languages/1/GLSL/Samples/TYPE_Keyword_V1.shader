TYPE min(TYPE a, TYPE b) // returns a if a < b, b otherwise
TYPE min(TYPE a, float b) // returns a if a < b, b otherwise
TYPE max(TYPE a, TYPE b) // returns a if a > b, b otherwise
TYPE max(TYPE a, float b) // returns a if a > b, b otherwise
TYPE clamp(TYPE a, TYPE minVal, TYPE maxVal) 
   // = min(max(a, minVal), maxVal) 
TYPE clamp(TYPE a, float minVal, float maxVal) 
   // = min(max(a, minVal), maxVal) 
TYPE mix(TYPE a, TYPE b, TYPE wb) // = a * (TYPE(1.0) - wb) + b * wb
TYPE mix(TYPE a, TYPE b, float wb) // = a * TYPE(1.0 - wb) + b * TYPE(wb)
