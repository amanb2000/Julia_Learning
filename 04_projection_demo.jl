"""
Here I create two functions: one that projects a vector onto an affine set defined by:
    1. A list of vectors that spans the space.
    2. An offset vector.

Also a projection function that projects a vector onto an affine set defined by:
    1. A (list of) vector(s) prependicular to the subspace.
    2. An offset vector.

I aim to show that the second is identical to subtracting the projection of the vector 
onto the result obtained by the first. 
"""

function affine_project(S, y, x_0, show_steps=true)
    S_subspace = S .- x_0;
    y_subspace = y - x_0;

    if show_steps
        println("The value of the re-set subspace version of the affine space is: ", S_subspace);
        println("The value of the re-set subspace version of the vector y is: ", y_subspace);
    end

    y_S, α = subspace_project(S_subspace, y_subspace, show_steps);

    if show_steps
        println("The re-offset version of the projected vector is: ", y_S+x_0)

        println("\n=== End Affine Set Projection Subroutine ===\n")
    end

    return y_S+x_0, α

end

function subspace_project(S, y, show_steps=true)
    
    V = S*transpose(S)
    
    # V α = V y
    # α = inv(V) V y
    α = inv(V)*S*transpose(y)
    


    y_S = transpose(α)*S

    if show_steps
        print("\n=== Beginning Affine Projection Subroutine ===")
        println("The value of V = S⋅inv(S):")
        println("\t",V)

        println("inv(V):")
        println("\t",inv(V))

        println("α = inv(V)*S*y:")
        println("\t",α)

        println("Value of the projection y_S: ", y_S)

        println("Value of α: ", α, "\n")
        println("\n=== Ended Subspace Projection Subroutine ===\n")
    end

    y_S, α
end

function perpendicular_subspace_projection(S_perp, y, show_steps=true)
    y_S_perp, α = subspace_project(S_perp, y, show_steps)
    y_S = y - y_S_perp

    return y_S
end

function main()
    println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    println("Hello, world!")

    S = [1 0 0; 0 2 3]
    x_0 = [1 2 0]
    y = [1 2 5]

    y_S_perp = perpendicular_subspace_projection(S, y);

    print("y_S_perp: ", y_S_perp)
end

main();