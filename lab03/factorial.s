.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # here in my code
    # a0 contains n
    # We'll use:
    # t0 for i (which iz loop variable)
    # t1 for result

    li t0, 2         # t0 = 2 (means i = 2)
    li t1, 1         # t1 = 1 (means result = 1)

loop:
    bgt t0, a0, done # if i > n, exit loop bcz condition of loop was i<=n and when i>n , it should be ended 
    mul t1, t1, t0   # means result=result*i which is same as result *= i that we needed for now !!
    addi t0, t0, 1   # means i=i+1 which is i++
    j loop

done:
    mv a0, t1        # return result in a0
    jr ra            # return to caller

