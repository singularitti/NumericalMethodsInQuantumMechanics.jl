"""
# module ShootingMethod



# Examples

```jldoctest
julia>
```
"""
module ShootingMethod

using Roots: find_zero, AbstractUnivariateZeroMethod

using NumericalMethodsInQuantumMechanics.EigenvalueProblems.Conditions
using NumericalMethodsInQuantumMechanics.EigenvalueProblems.NumerovMethod

export setup_problem, shoot

function setup_problem(bc::BoundaryCondition, r, g, s)
    function (guess)
        # last means ``y(t1)``, `ic` contains a guess, `bc[2]` is ``y1``.
        # `last(integrate(ic_guess, r, g, s)) - bc[2]` means ``y(t1; yd0) - y1``.
        return last(integrate(InitialCondition(bc[1], guess), r, g, s)) - bc[2]
    end
end  # function setup_problem

function shoot(f::Function, method::AbstractUnivariateZeroMethod, r)::Real
    # `x` of the root finding is `yd0`.
    return find_zero(f, (minimum(r), maximum(r)), method)
end  # function shoot

end
