#include "textflag.h"

/*
main.output:
 1093040:       48 83 ec 20     subq    $32, %rsp
 1093044:       48 89 6c 24 18  movq    %rbp, 24(%rsp)
 1093049:       48 8d 6c 24 18  leaq    24(%rsp), %rbp
 109304e:       48 8b 54 24 28  movq    40(%rsp), %rdx
 1093053:       48 89 14 24     movq    %rdx, (%rsp)
 1093057:       48 8b 4c 24 30  movq    48(%rsp), %rcx
 109305c:       48 89 4c 24 08  movq    %rcx, 8(%rsp)
 1093061:       e8 7a fe ff ff  callq   -390 <main.add>
 1093066:       48 8b 44 24 10  movq    16(%rsp), %rax
 109306b:       48 89 44 24 38  movq    %rax, 56(%rsp)
 1093070:       48 8b 6c 24 18  movq    24(%rsp), %rbp
 1093075:       48 83 c4 20     addq    $32, %rsp
 1093079:       c3      retq
 */


// func output(a,b int) int
TEXT ·output(SB), NOSPLIT, $24-24
    MOVQ a+0(FP), DX // arg a
    MOVQ DX, 0(SP) // arg x
    MOVQ b+8(FP), CX // arg b
    MOVQ CX, 8(SP) // arg y
    CALL ·add(SB) // 在调用 add 之前，已经把参数都通过物理寄存器 SP 搬到了函数的栈顶
    MOVQ 16(SP), AX // add 函数会把返回值放在这个位置
    MOVQ AX, ret+16(FP) // return result
    RET
