### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 2715e3d0-0603-11eb-05fd-b3be93c8bae4
# Import box

begin
	using Images
	using Colors
end

# ╔═╡ f4d60c28-061c-11eb-0b07-fdb64a2884e8
md"""
# Eigenfaces from Scratch!

In this notebook, I aim to create a comprehensive interactive eigenfaces demo as I learn the Julia programming language. I mainly aim to:

1. Generate a group of images representing the **principal components** of the faces.
2. Create a function that approximates an input picture using $k$ principal components.

"""

# ╔═╡ 536fccca-0603-11eb-38fb-75ef76a3ab9c
# Function for getting an nxm matrix from an image path.

function get_bw_img_arry(path)
    image = imresize(load(path), (400, 320))

    chan = channelview(image)[1,:,:]
	println(typeof(chan))
    return chan
end

# ╔═╡ 62723154-0603-11eb-043d-dff990fa704a
# Setting up some basic variables for where the images are and what they're called.

begin
	base_path = "images/nottingham/";
	file = open(string(base_path,"filenames.txt"));
	image_names = readlines(file);
end

# ╔═╡ 3b569f4c-061c-11eb-1e8d-3dcae84f951c
begin
	img1=get_bw_img_arry(string(base_path, image_names[1]))
	zeos = zeros(100, 400, 320)
	
	zeos[1,:,:]=img1
end

# ╔═╡ 9ce4809e-061c-11eb-396c-3dc1e2e06af8
Gray.(zeos[1,:,:])

# ╔═╡ 66e12f2e-0603-11eb-17af-3d677a3f926d
# Getting the set of faces and calculating the average face.

begin
	images = zeros(length(image_names), 400, 320);
	average_face = zeros(400, 320)
	
	for i = 1:length(image_names)
	    global images[i,:,:] = get_bw_img_arry(string(base_path,image_names[i]))
		global average_face += images[i,:,:]/length(image_names)
	end
	
end

# ╔═╡ 98aa1f34-0603-11eb-1719-5f3088b357d5
begin
	Gray.((average_face/3)/sum(average_face/3)) # Outputting the average face.
end

# ╔═╡ f7f1b3e6-0606-11eb-3794-edc9b827604f
begin
	removed_average = images[1] .- average_face
	removed_average /= maximum(removed_average)
end

# ╔═╡ 24f0c396-0607-11eb-3397-db765a09b85c
images[44]

# ╔═╡ Cell order:
# ╟─f4d60c28-061c-11eb-0b07-fdb64a2884e8
# ╠═2715e3d0-0603-11eb-05fd-b3be93c8bae4
# ╠═536fccca-0603-11eb-38fb-75ef76a3ab9c
# ╠═62723154-0603-11eb-043d-dff990fa704a
# ╠═3b569f4c-061c-11eb-1e8d-3dcae84f951c
# ╠═9ce4809e-061c-11eb-396c-3dc1e2e06af8
# ╠═66e12f2e-0603-11eb-17af-3d677a3f926d
# ╠═98aa1f34-0603-11eb-1719-5f3088b357d5
# ╠═f7f1b3e6-0606-11eb-3794-edc9b827604f
# ╠═24f0c396-0607-11eb-3397-db765a09b85c
