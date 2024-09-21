using NumericalTraining: sqrt_iter, eqn_solver, numerical_integrator, horner_polynomial
using Test

@testset "Sqrt" begin
	x0 = 2.0
	c = 10
	for i in 1:10
		x0 = sqrt_iter(c, x0)	
	end
	@test x0^2 ≈ c
end

@testset "Eqn Solver" begin
    f = x -> x^3 - 2 * x - 5
	f_prime = x -> 3 * x^2 - 2
	sol = eqn_solver(f,f_prime, 2.0, 10)
	f(sol)
	@test f(sol) ≈ 0.0 atol=1e-6

	f = x-> x^3 - x
	f_prime = x -> 3 * x^2 - 0.5 # need to adjust for divergence
	sol = eqn_solver(f, f_prime, 1/√3 + 1, 10)
	@test sol ≈ 1.0 atol=1e-6

	sol = eqn_solver(f, f_prime, -1/√3 - 1, 10)
	@test sol ≈ -1.0 atol=1e-6

	sol = eqn_solver(f,f_prime, 0.0, 12)
	@test sol ≈ 0.0 atol=1e-6
end

@testset "Numerical Integrator" begin
	real_ans = exp(1/2) - exp(0)

	f = x -> exp(x)

	a,b = 0, 1/2

	step_size_1 = 1/4
    Ih = numerical_integrator(f, 0, 1 / 2, (b - a) / step_size_1)

	step_size_2 = 1/2
   	I2h = numerical_integrator(f, 0, 1 / 2, (b - a) / step_size_2)

	I = (4 * Ih - I2h) / 3

    @show abs(I - real_ans) / abs(Ih - real_ans)
end

@testset "Finite difference for derivative" begin
	# trivial
end

@testset "1.16" begin
	# huh
end

@testset "1.2.1 Horner's Rule" begin
	f = x -> x^4 + 2 * x^3 - 3 * x^2 +2
	x = 2
	ans = horner_polynomial(x, [2, 0, -3, 2, 1]) # this is not really optimal because of the SIMD on mordern computer https://github.com/ArrogantGao/Estrin.jl
	@test ans ≈ f(x)
end

