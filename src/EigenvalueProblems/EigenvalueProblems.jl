"""
# module EigenvalueProblems



# Examples

```jldoctest
julia>
```
"""
module EigenvalueProblems

using Compat: @NamedTuple

export InitialCondition, BoundaryCondition

const InitialCondition = @NamedTuple{y0, y′0}
InitialCondition(y0, y′0) = InitialCondition((y0, y′0))

const BoundaryCondition = @NamedTuple{y0, y1}
BoundaryCondition(y0, y1) = BoundaryCondition((y0, y1))

include("NumerovMethod.jl")
include("ShootingMethod.jl")

end
