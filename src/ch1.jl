function sqrt_iter(c, x)
    return (x + c / x) / 2
end

function eqn_solver(f, f_prime, x0, iters::Int)
    for _ in 1:iters
        x0 = x0 - f(x0) / f_prime(x0)
    end
    return x0
end

function numerical_integrator(f, a, b, n)
	h = (b - a) / n
	sum = 0.0
	for i in 0:n-1
		sum += f(a + i * h)
	end
	return sum * h
end