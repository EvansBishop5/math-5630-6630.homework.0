
% Author: Your Name / your_email
% Author: Your Name / your_email Evans Bishop Leb0134@auburn.edu
% Date: 2024-09-01
% Assignment Name: hw00

@@ -17,7 +17,23 @@
            if m < 0
                error('m must be a non-negative integer')
            else 
                a_m = inf; % Write your code here
                a_m = inf; % Write your code here def compute_am(m):
    # Base cases
    if m == 0:
        return 0
    elif m == 1 or m == 2:
        return 1

    # Initialize the first three terms
    a0, a1, a2 = 0, 1, 1

    # Compute terms iteratively up to a_m
    for i in range(3, m+1):
        a_next = a2 + a1 + a0  # an+1 = an + an-1 + an-2
        # Shift the terms for the next iteration
        a0, a1, a2 = a1, a2, a_next

    return a2
            end

        end
@@ -31,14 +47,50 @@
                error('A must be a square matrix')
            else
                det_A = inf;% Write your code here, note when you call p2 function inside your function, you need to call it like this: hw00.p2(B), where B is a matrix.
          def determinant(A):
    # Base case for a 1x1 matrix
    if len(A) == 1:
        return A[0][0]

    # Base case for a 2x2 matrix
    if len(A) == 2:
        return A[0][0] * A[1][1] - A[0][1] * A[1][0]

    # Recursive case using Laplace expansion (cofactor expansion) along the first row
    det = 0
    n = len(A)
    for j in range(n):
        # Create the submatrix by removing the first row and the j-th column
        submatrix = np.delete(np.delete(A, 0, axis=0), j, axis=1)

        # Laplace expansion along the first row
        cofactor = (-1) ** j * A[0][j] * determinant(submatrix)

        # Add the cofactor to the determinant
        det += cofactor

    return det
            end

        end

        function p3()
            % This function should have a run time about 1 second.
            % :return: no returns

            % Write your code here
        end
            import time

def run_for_one_second():
    # Record the start time
    start_time = time.time()

    # Loop until approximately 1 second has passed
    while time.time() - start_time < 1:
        pass  # Do nothing, just wait

    # Record the actual elapsed time
    elapsed_time = time.time() - start_time
    print(f"Elapsed time: {elapsed_time:.6f} seconds")        end
    end
endhw00_worker = hw00();

hw_assert(hw00_worker.p1(0) == 0)
hw_assert(hw00_worker.p1(1) == 1)
hw_assert(hw00_worker.p1(2) == 1)
hw_assert(hw00_worker.p1(3) == 2)

hw_assert(hw00_worker.p2(1) == 1)
hw_assert(hw00_worker.p2(-1) == -1)
hw_assert(hw00_worker.p2([[1 0];[0 1]]) == 1)
hw_assert(hw00_worker.p2([[1 1];[1 1]]) == 0)

start_time = tic;
hw00_worker.p3();
elapsed = toc(start_time);

hw_assert(abs(elapsed - 1.0) < 0.5);

function hw_assert(X)
    if X; fprintf('\t PASS\n'); else; fprintf('\t FAIL\n'); end
end
