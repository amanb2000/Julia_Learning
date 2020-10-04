### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 11d48324-05ee-11eb-29cb-512719920cdd
md"""
# Hello, World!
This is how we write in markdown, I guess.

As it turns out, I tried starting with the final lecture in the first week of the course instead of the first lecture. So that was a mistake. 


"""

# ╔═╡ f3d2c452-05e4-11eb-05c8-47accd0114f3
println("Hello, world!");

# ╔═╡ 3fdb6408-05e5-11eb-33a8-b1012c20c82d
pi_ish = 3.1415

# ╔═╡ 5a89632c-05e5-11eb-0bab-a75611297f91
println(pi_ish);

# ╔═╡ a86bf648-05ee-11eb-1fa7-afec16f3b481
md"""
# Vectors and Matrices


"""

# ╔═╡ afca0f40-05ee-11eb-3491-491015d89f96
begin
	v_1 = [1 2 3 4];
end

# ╔═╡ 6a735b16-05f0-11eb-3aed-a336c3c8b889
v_1[1] # Array indexing starts at 1.

# ╔═╡ 82550798-05f0-11eb-0062-9185de14f8a4
mat = [1 2 3
	   4 2 1]  # just like math

# ╔═╡ 8b2f8a16-05f0-11eb-104c-c3b46db706d7
mat2 = [1 2 3;4 2 11]

# ╔═╡ 953db4fe-05f0-11eb-178c-6f35da194788
mat2[:, 2:3] # Indexing works like in MATLAB

# ╔═╡ c1c28bbc-05f0-11eb-3db2-e97fabe8634c
md"""
## Random Matrices
"""

# ╔═╡ d1a4a326-05f0-11eb-10c4-59da455509c3
rand1 = rand(1:9, 3, 2) # 3x2 matrix with random numbers distributed between 1 and 9 (inclusive)
# The first argument is simply a collection of objects -- in this case, `1:9` returns [1, 2, ..., 9]. You could have any set of objects there.

# ╔═╡ ebeadee4-05f0-11eb-0a9f-7de637bbc773
rand1*mat2 # Matrix multiplication just kinda works, I guess

# ╔═╡ f9d68c76-05f0-11eb-1b6e-e126348f5d5c
mat.*mat2 # element-wise matrix multiplication

# ╔═╡ 059d6e60-05f1-11eb-201f-63a429ce8805
# taking the transpose:
transpose(mat)*mat2

# ╔═╡ 6f6cfa86-05f1-11eb-3865-6fe879bac34d
md"""
## Loops and List Comprehensions
"""

# ╔═╡ 93b4afc4-05f1-11eb-2a2b-0d1d6b4bf132
begin

b = [1, 2, 3, 4]
	
for i = 1:size(b,1)
	b[i] += i
end
	
b

end

# ╔═╡ 118c04ea-05f2-11eb-293b-49896e4a8878
D = [i*j+1 for i=1:5, j=2:5]

# ╔═╡ 343a4e0e-05f2-11eb-1b1c-ed503e1cdf64
E = ones(4, 4)

# ╔═╡ Cell order:
# ╟─11d48324-05ee-11eb-29cb-512719920cdd
# ╠═f3d2c452-05e4-11eb-05c8-47accd0114f3
# ╠═3fdb6408-05e5-11eb-33a8-b1012c20c82d
# ╠═5a89632c-05e5-11eb-0bab-a75611297f91
# ╟─a86bf648-05ee-11eb-1fa7-afec16f3b481
# ╠═afca0f40-05ee-11eb-3491-491015d89f96
# ╠═6a735b16-05f0-11eb-3aed-a336c3c8b889
# ╠═82550798-05f0-11eb-0062-9185de14f8a4
# ╠═8b2f8a16-05f0-11eb-104c-c3b46db706d7
# ╠═953db4fe-05f0-11eb-178c-6f35da194788
# ╟─c1c28bbc-05f0-11eb-3db2-e97fabe8634c
# ╠═d1a4a326-05f0-11eb-10c4-59da455509c3
# ╠═ebeadee4-05f0-11eb-0a9f-7de637bbc773
# ╠═f9d68c76-05f0-11eb-1b6e-e126348f5d5c
# ╠═059d6e60-05f1-11eb-201f-63a429ce8805
# ╟─6f6cfa86-05f1-11eb-3865-6fe879bac34d
# ╠═93b4afc4-05f1-11eb-2a2b-0d1d6b4bf132
# ╠═118c04ea-05f2-11eb-293b-49896e4a8878
# ╠═343a4e0e-05f2-11eb-1b1c-ed503e1cdf64
