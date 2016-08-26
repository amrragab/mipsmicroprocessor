<<<<<<< HEAD
# MIPS Processor
* MIPS processor is a pipelined processor
* This project is a VHDL implementation for this processor
* It's academic Project of Computer Architecture 2 course

## Introduction
The processor in this project has a RISC-like instruction set architecture. Instructions are 1-byte or 2-bytes depending on the type of instructions. There are four 1-byte general purpose registers; R0, R1, R2, and R3. R3 also works as a stack pointer (SP); and hence; points to the top of the stack. The initial value of SP is 255. The memory address space is 256 bytes and is byte addressable. When an interrupt occurs, the address of the instruction next to the interrupted instruction is saved on top of the stack, and PC is loaded from address 1 of the memory. To return from an interrupt, an RTI instruction loads PC from the top of stack, and the flow of the program resumes from the instruction after the interrupted instruction.

##ISA Specifications

###A) Registers
* PC<7:0> ; 8-bit program counter
* R[0:3]<7:0> ; Four 8-bit general purpose registers
* SP<7:0>:=R[3]<7:0> ; 8-bit stack pointer
* CCR<3:0> ; condition code register
* Z<0>:=CCR<0> ; zero flag, change after arithmetic, logical, or shift operations
* N<0>:=CCR<1> ; negative flag, change after arithmetic, logical, or shift operations
* C<0>:=CCR<2> ; carry flag, change after arithmetic or shift operations.
* V<0>:=CCR<3> ; over flow, change after arithmetic or shift operations.
###B) Input-Output
* IN.PORT<7:0> ; 8-bit data input port
* OUT.PORT<7:0> ; 8-bit data output port
* INTR.IN<0> ; a single, non-maskable interrupt
* RESET.IN<0> ; reset signal
###C) Instruction Format
* i<7:0>:=M[PC]<7:0> ; 8-bit instruction word
* opcode<3:0>:=i<7:4> ; 4-bit opcode
* ra<1:0>:=i<3:2> ; 2-bit operand register and result register field
* rb<1:0>:=i<1:0> ; 2-bit operand register field
* brx<1:0>:=i<3:2> ; 2-bit branch index field
* ea<7:0>:=M[PC+1]<7:0> ; effective address
* imm<7:0>:=M[PC+1]<7:0> ; immediate operand

- Arithmetic operations are performed in two’s complement. Shift and logical operations are bit-wise. 
##There are 3 different instruction formats:
###1-	A-Format
Figure 1 depicts A-format instructions. These instructions are 1-byte. Op-code is the high order nibble and the low order nibble determines two registers.

![figure1] (https://github.com/amrragab/mipsprocessor/blob/master/Figures/figure1.JPG)


Table I shows op-code values for A-format instructions and explains their functionality. R[ra] and R[rb] indicate values of registers ra and rb, respectively.

![table1] (https://github.com/amrragab/mipsprocessor/blob/master/Figures/Table1.JPG)

###2- B-Format
B-format instructions are 1-byte and include instructions that break the sequential execution of programs. As figure 2 shows, b-format instructions have op-code, ra “also named brx”, and rb. The brx field determines the type of the branch instruction.

![figure2] (https://github.com/amrragab/mipsprocessor/blob/master/Figures/figure2.JPG)

Table II shows the details of B-format instructions. The processor has a dedicated pin for external interrupt. On the rising edge of the interrupt pin, the address of the next instruction is written into the stack and the SP is decremented (X[SP--] ← PC). PC is loaded from address 1 (PC ← M[1]), and processor jumps into interrupt service routine. Flags are also saved. At the end of the interrupt service routine, RTI instruction executes. RTI is similar to b-format instructions. It increments SP and load PC from the top of the stack. Flags are restored.

![table2] (https://github.com/amrragab/mipsprocessor/blob/master/Figures/table2.JPG)

###3- L-Format
L-format instructions are either one or two bytes and are used for load/store instructions. For two bytes instructions, the second byte holds the address of memory or an immediate value. Figure 3 shows L-format instructions.

![figure3] (https://github.com/amrragab/mipsprocessor/blob/master/Figures/figure3.JPG)

Table III shows the details of L-format instructions.

![table3] (https://github.com/amrragab/mipsprocessor/blob/master/Figures/table3.JPG)


##Design Assumptions:
- The pipeline consists of five stages (fetch, decode, execute, memory access & write back)
- The memory used is Harvard architecture memory, one separate memory for instructions and another one for data to avoid structural hazard between fetch and memory access stages.
- Unknown opcodes make the processor throw an exception and jump to ISR
- The registers values are written in the first half of the clock cycle and read in the second half to avoid structural hazard between decode and write back stages.
- Data hazards are handled by implementing forwarding
- There is a stall after any instructions reads a value from data memory and has data hazard with its next instruction
* ex: LDD R2,3
* DEC R2
- Predict untaken technique is used in B-Format instructions.
- Interrupt handling flushes only the instruction that exists in fetch stage and save its address to begin with after RTI. All the others instructions in the pipeline run as usual.
=======
# mipsmicroprocessor
>>>>>>> f551eb151e2dbcf6a8aa849d7ce173b0f764a6f1
