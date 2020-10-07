"""
Faces from: http://pics.psych.stir.ac.uk/2D_face_sets.htm
    Folder location: images/

This initial test script performs some computations with the images and shows
the mean face image (after some re-sizing).
"""

using Images
using Colors

print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nStarting program iteration...\n")

function get_bw_img_arry(path)
    image = imresize(load(path), (100, 80))

    chan = channelview(image)[1,:,:]

    return chan
end

# Getting set up to read in the images...
base_path = "images/nottingham/";
file = open(string(base_path,"filenames.txt"));
image_names = readlines(file);

# Reading in the first image
images = [get_bw_img_arry(string(base_path,image_names[33]))];

average_face = zeros(100, 80)

for name in image_names
    global images = [images [get_bw_img_arry(string(base_path,name))]]
    global average_face += images[end]/length(image_names)
end

# average_face = (length(image_names)+1)


Gray.(average_face)