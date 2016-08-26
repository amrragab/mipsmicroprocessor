vsim -gui work.cpu

add wave -position end  sim:/cpu/clk
add wave -position end  sim:/cpu/rst
add wave -position end  sim:/cpu/INT_IN
add wave -position end  sim:/cpu/IN_PORT
add wave -position end  sim:/cpu/OUT_PORT
add wave -position end  sim:/cpu/IF_IDin
add wave -position end  sim:/cpu/IF_ID
add wave -position end  sim:/cpu/ID_EXin
add wave -position end  sim:/cpu/ID_EX
add wave -position end  sim:/cpu/EX_MEMin
add wave -position end  sim:/cpu/EX_MEM
add wave -position end  sim:/cpu/MEM_WBin
add wave -position end  sim:/cpu/MEM_WB
add wave -position end  sim:/cpu/PC
add wave -position end  sim:/cpu/PCin
add wave -position end  sim:/cpu/IR
add wave -position end  sim:/cpu/offset
add wave -position end  sim:/cpu/flags_in
add wave -position end  sim:/cpu/flags
add wave -position end  sim:/cpu/reg_R
add wave -position end  sim:/cpu/reg_W
add wave -position end  sim:/cpu/SP_EN
add wave -position end  sim:/cpu/Rs1
add wave -position end  sim:/cpu/Rs2
add wave -position end  sim:/cpu/Rd
add wave -position end  sim:/cpu/S1
add wave -position end  sim:/cpu/S2
add wave -position end  sim:/cpu/SP_IN
add wave -position end  sim:/cpu/NOP
add wave -position end  sim:/cpu/stall
add wave -position end  sim:/cpu/offset_en
add wave -position end  sim:/cpu/acc_mode
add wave -position end  sim:/cpu/alu_op
add wave -position end  sim:/cpu/MEM_valid
add wave -position end  sim:/cpu/WB_valid
add wave -position end  sim:/cpu/MEM_data
add wave -position end  sim:/cpu/WB_data
add wave -position end  sim:/cpu/MEM_Rd
add wave -position end  sim:/cpu/WB_Rd
add wave -position 16  sim:/cpu/Registers_file/R0
add wave -position 17  sim:/cpu/Registers_file/R1
add wave -position 18  sim:/cpu/Registers_file/R2
add wave -position 19  sim:/cpu/Registers_file/R3
add wave -position 20  sim:/cpu/Registers_file/R3_in
force -freeze sim:/cpu/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/cpu/rst 1 0
force -freeze sim:/cpu/INT_IN 0 0
force -freeze sim:/cpu/IN_PORT 00101101 0
mem load -i ../mem/AFormat-WithPushPop.mem /cpu/inst_mem/ram
run
force -freeze sim:/cpu/rst 0 0
run
run
run
force -freeze sim:/cpu/IN_PORT 8'd5 0
run
run
run
run
run
run
run
run
run
run
run
