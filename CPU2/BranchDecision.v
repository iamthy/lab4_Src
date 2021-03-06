`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Branch Decision
// Tool Versions: Vivado 2017.4.1
// Description: Decide whether to branch
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    //  判断是否branch
// 输入
    // reg1               寄存器1
    // reg2               寄存器2
    // br_type            branch类型
// 输出
    // br                 是否branch
    // is_br              是否是br类指令
// 实验要求
    // 补全模块

`include "Parameters.v"   
module BranchDecision(
    input wire [31:0] reg1, reg2,
    input wire [2:0] br_type,
    output reg br,
    output wire is_br
    );
    always @(br_type,reg1,reg2)
    begin
        case (br_type)
            `NOBRANCH : br <= 1'b0;
            `BEQ : br <= ($signed(reg1) == $signed(reg2));
            `BNE : br <= ($signed(reg1) != $signed(reg2));
            `BLT : br <= ($signed(reg1) < $signed(reg2));
            `BLTU : br <= (reg1 < reg2);
            `BGE : br <= ($signed(reg1) >= $signed(reg2));
            `BGEU : br <= (reg1 >= reg2);
            default: br <= 0;
        endcase
    end
    assign is_br = (br_type != `NOBRANCH);
    // TODO: Complete this module

endmodule
