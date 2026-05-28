/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP2
// Date      : Thu May 28 14:34:08 2026
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_spi_serializer_fsm_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_spi_serializer_fsm_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module spi_serializer_fsm ( clk, rst_n, start, cmd, flash_addr, tx_data, 
        spi_busy, rx_data, spi_cs_n, spi_clk, spi_mosi, spi_miso );
  input [7:0] cmd;
  input [31:0] flash_addr;
  input [31:0] tx_data;
  output [31:0] rx_data;
  input clk, rst_n, start, spi_miso;
  output spi_busy, spi_cs_n, spi_clk, spi_mosi;
  wire   N187, N188, N189, N190, N191, N192, N193, N194, N195, N196, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N206, N207, N208,
         N209, N210, N211, N212, N213, N214, N215, N216, N217, net369, net375,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99;
  wire   [2:0] state;
  wire   [5:0] bit_cnt;
  wire   [30:0] shift_tx;

  SNPS_CLOCK_GATE_HIGH_spi_serializer_fsm_0 clk_gate_bit_cnt_reg ( .CLK(clk), 
        .EN(n48), .ENCLK(net369), .TE(n88) );
  SNPS_CLOCK_GATE_HIGH_spi_serializer_fsm_1 clk_gate_shift_rx_reg ( .CLK(clk), 
        .EN(n87), .ENCLK(net375), .TE(n88) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_0_ ( .D(n49), .CK(net369), .RD(rst_n), 
        .Q(bit_cnt[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_2_ ( .D(n45), .CK(clk), .RD(rst_n), .Q(
        state[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_1_ ( .D(n46), .CK(clk), .RD(rst_n), .Q(
        state[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_0_ ( .D(n47), .CK(clk), .RD(rst_n), .Q(
        state[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_5_ ( .D(n86), .CK(net369), .RD(rst_n), 
        .Q(bit_cnt[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_2_ ( .D(n51), .CK(net369), .RD(rst_n), 
        .Q(bit_cnt[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_4_ ( .D(n85), .CK(net369), .RD(rst_n), 
        .Q(bit_cnt[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_3_ ( .D(n84), .CK(net369), .RD(rst_n), 
        .Q(bit_cnt[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_0_ ( .D(n60), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_1_ ( .D(n61), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_2_ ( .D(n62), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_3_ ( .D(n63), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_4_ ( .D(n64), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_5_ ( .D(n65), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_6_ ( .D(n66), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_7_ ( .D(n67), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_8_ ( .D(n68), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_9_ ( .D(n69), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_10_ ( .D(n70), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_11_ ( .D(n71), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_13_ ( .D(n73), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_14_ ( .D(n74), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_15_ ( .D(n75), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_16_ ( .D(n76), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_17_ ( .D(n77), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_18_ ( .D(n78), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_19_ ( .D(n79), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_20_ ( .D(n80), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_21_ ( .D(n81), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_22_ ( .D(n82), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_23_ ( .D(n83), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_24_ ( .D(n52), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_25_ ( .D(n53), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_26_ ( .D(n54), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_28_ ( .D(n56), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_29_ ( .D(n57), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_30_ ( .D(n58), .CK(net369), .RD(rst_n), 
        .Q(shift_tx[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_31_ ( .D(n59), .CK(net369), .RD(rst_n), 
        .Q(spi_mosi) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_0_ ( .D(spi_miso), .CK(net375), .RD(
        rst_n), .Q(rx_data[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_1_ ( .D(N187), .CK(net375), .RD(rst_n), 
        .Q(rx_data[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_2_ ( .D(N188), .CK(net375), .RD(rst_n), 
        .Q(rx_data[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_3_ ( .D(N189), .CK(net375), .RD(rst_n), 
        .Q(rx_data[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_4_ ( .D(N190), .CK(net375), .RD(rst_n), 
        .Q(rx_data[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_5_ ( .D(N191), .CK(net375), .RD(rst_n), 
        .Q(rx_data[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_6_ ( .D(N192), .CK(net375), .RD(rst_n), 
        .Q(rx_data[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_7_ ( .D(N193), .CK(net375), .RD(rst_n), 
        .Q(rx_data[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_8_ ( .D(N194), .CK(net375), .RD(rst_n), 
        .Q(rx_data[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_9_ ( .D(N195), .CK(net375), .RD(rst_n), 
        .Q(rx_data[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_11_ ( .D(N197), .CK(net375), .RD(rst_n), 
        .Q(rx_data[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_12_ ( .D(N198), .CK(net375), .RD(rst_n), 
        .Q(rx_data[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_13_ ( .D(N199), .CK(net375), .RD(rst_n), 
        .Q(rx_data[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_14_ ( .D(N200), .CK(net375), .RD(rst_n), 
        .Q(rx_data[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_15_ ( .D(N201), .CK(net375), .RD(rst_n), 
        .Q(rx_data[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_16_ ( .D(N202), .CK(net375), .RD(rst_n), 
        .Q(rx_data[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_17_ ( .D(N203), .CK(net375), .RD(rst_n), 
        .Q(rx_data[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_18_ ( .D(N204), .CK(net375), .RD(rst_n), 
        .Q(rx_data[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_19_ ( .D(N205), .CK(net375), .RD(rst_n), 
        .Q(rx_data[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_20_ ( .D(N206), .CK(net375), .RD(rst_n), 
        .Q(rx_data[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_21_ ( .D(N207), .CK(net375), .RD(rst_n), 
        .Q(rx_data[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_22_ ( .D(N208), .CK(net375), .RD(rst_n), 
        .Q(rx_data[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_23_ ( .D(N209), .CK(net375), .RD(rst_n), 
        .Q(rx_data[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_24_ ( .D(N210), .CK(net375), .RD(rst_n), 
        .Q(rx_data[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_26_ ( .D(N212), .CK(net375), .RD(rst_n), 
        .Q(rx_data[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_27_ ( .D(N213), .CK(net375), .RD(rst_n), 
        .Q(rx_data[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_28_ ( .D(N214), .CK(net375), .RD(rst_n), 
        .Q(rx_data[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_29_ ( .D(N215), .CK(net375), .RD(rst_n), 
        .Q(rx_data[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_30_ ( .D(N216), .CK(net375), .RD(rst_n), 
        .Q(rx_data[30]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 spi_cs_n_reg ( .D(n48), .CK(clk), .RD(rst_n), .Q(
        n99) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 bit_cnt_reg_1_ ( .D(n50), .CK(net369), .RD(rst_n), 
        .Q(bit_cnt[1]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_tx_reg_12_ ( .D(n72), .CK(net369), .RD(rst_n), .Q(shift_tx[12]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_tx_reg_27_ ( .D(n55), .CK(net369), .RD(rst_n), .Q(shift_tx[27]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_rx_reg_10_ ( .D(N196), .CK(net375), .RD(
        rst_n), .Q(rx_data[10]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_rx_reg_25_ ( .D(N211), .CK(net375), .RD(
        rst_n), .Q(rx_data[25]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_rx_reg_31_ ( .D(N217), .CK(net375), .RD(
        rst_n), .Q(rx_data[31]) );
  SAEDRVT14_TIE0_V1_2 U3 ( .X(n88) );
  SAEDRVT14_AO222_1 U4 ( .A1(n20), .A2(shift_tx[9]), .B1(flash_addr[10]), .B2(
        n94), .C1(n98), .C2(tx_data[10]), .X(n70) );
  SAEDRVT14_AO222_1 U5 ( .A1(n20), .A2(shift_tx[4]), .B1(flash_addr[5]), .B2(
        n94), .C1(n98), .C2(tx_data[5]), .X(n65) );
  SAEDRVT14_AO222_1 U6 ( .A1(n20), .A2(shift_tx[14]), .B1(flash_addr[15]), 
        .B2(n19), .C1(n36), .C2(tx_data[15]), .X(n75) );
  SAEDRVT14_AO222_1 U7 ( .A1(n20), .A2(shift_tx[13]), .B1(flash_addr[14]), 
        .B2(n19), .C1(n36), .C2(tx_data[14]), .X(n74) );
  SAEDRVT14_AO222_1 U8 ( .A1(n20), .A2(shift_tx[6]), .B1(flash_addr[7]), .B2(
        n94), .C1(n98), .C2(tx_data[7]), .X(n67) );
  SAEDRVT14_AO222_1 U9 ( .A1(n20), .A2(shift_tx[15]), .B1(flash_addr[16]), 
        .B2(n19), .C1(n36), .C2(tx_data[16]), .X(n76) );
  SAEDRVT14_AO222_1 U10 ( .A1(n20), .A2(shift_tx[8]), .B1(flash_addr[9]), .B2(
        n94), .C1(n98), .C2(tx_data[9]), .X(n69) );
  SAEDRVT14_AO222_1 U11 ( .A1(n20), .A2(shift_tx[17]), .B1(flash_addr[18]), 
        .B2(n19), .C1(n36), .C2(tx_data[18]), .X(n78) );
  SAEDRVT14_AO222_1 U12 ( .A1(n20), .A2(shift_tx[16]), .B1(flash_addr[17]), 
        .B2(n19), .C1(n36), .C2(tx_data[17]), .X(n77) );
  SAEDRVT14_AO222_1 U13 ( .A1(n20), .A2(shift_tx[18]), .B1(flash_addr[19]), 
        .B2(n19), .C1(n36), .C2(tx_data[19]), .X(n79) );
  SAEDRVT14_AO222_1 U14 ( .A1(n20), .A2(shift_tx[11]), .B1(flash_addr[12]), 
        .B2(n94), .C1(n36), .C2(tx_data[12]), .X(n72) );
  SAEDRVT14_AO222_1 U15 ( .A1(n20), .A2(shift_tx[7]), .B1(flash_addr[8]), .B2(
        n94), .C1(n98), .C2(tx_data[8]), .X(n68) );
  SAEDRVT14_AO222_1 U16 ( .A1(n20), .A2(shift_tx[10]), .B1(flash_addr[11]), 
        .B2(n94), .C1(n98), .C2(tx_data[11]), .X(n71) );
  SAEDRVT14_AO222_1 U17 ( .A1(n20), .A2(shift_tx[12]), .B1(flash_addr[13]), 
        .B2(n19), .C1(n36), .C2(tx_data[13]), .X(n73) );
  SAEDRVT14_AO222_1 U18 ( .A1(n20), .A2(shift_tx[5]), .B1(flash_addr[6]), .B2(
        n94), .C1(n98), .C2(tx_data[6]), .X(n66) );
  SAEDRVT14_AOI21_0P75 U19 ( .A1(shift_tx[24]), .A2(n96), .B(n91), .X(n92) );
  SAEDRVT14_AOI21_0P75 U20 ( .A1(shift_tx[25]), .A2(n96), .B(n89), .X(n90) );
  SAEDRVT14_AOI21_0P75 U21 ( .A1(shift_tx[26]), .A2(n96), .B(n43), .X(n44) );
  SAEDRVT14_AOI21_0P75 U22 ( .A1(shift_tx[30]), .A2(n96), .B(n34), .X(n35) );
  SAEDRVT14_AOI21_0P75 U23 ( .A1(shift_tx[28]), .A2(n96), .B(n39), .X(n40) );
  SAEDRVT14_AO222_1 U24 ( .A1(n96), .A2(shift_tx[22]), .B1(flash_addr[23]), 
        .B2(n19), .C1(n36), .C2(tx_data[23]), .X(n83) );
  SAEDRVT14_AOI21_0P75 U25 ( .A1(shift_tx[27]), .A2(n96), .B(n41), .X(n42) );
  SAEDRVT14_AO222_1 U26 ( .A1(n96), .A2(shift_tx[19]), .B1(flash_addr[20]), 
        .B2(n19), .C1(n36), .C2(tx_data[20]), .X(n80) );
  SAEDRVT14_AO222_1 U27 ( .A1(n96), .A2(shift_tx[20]), .B1(flash_addr[21]), 
        .B2(n19), .C1(n36), .C2(tx_data[21]), .X(n81) );
  SAEDRVT14_AOI21_0P75 U28 ( .A1(shift_tx[29]), .A2(n96), .B(n37), .X(n38) );
  SAEDRVT14_AO222_1 U29 ( .A1(n96), .A2(shift_tx[21]), .B1(flash_addr[22]), 
        .B2(n19), .C1(n36), .C2(tx_data[22]), .X(n82) );
  SAEDRVT14_OR2_MM_0P5 U30 ( .A1(n36), .A2(n28), .X(n47) );
  SAEDRVT14_AOI21_0P75 U31 ( .A1(shift_tx[23]), .A2(n96), .B(n95), .X(n97) );
  SAEDRVT14_BUF_U_0P5 U32 ( .A(n96), .X(n20) );
  SAEDRVT14_AO222_1 U33 ( .A1(n96), .A2(shift_tx[2]), .B1(flash_addr[3]), .B2(
        n94), .C1(n98), .C2(tx_data[3]), .X(n63) );
  SAEDRVT14_OAI21_0P5 U34 ( .A1(n29), .A2(n17), .B(n14), .X(n46) );
  SAEDRVT14_AO222_1 U35 ( .A1(n96), .A2(shift_tx[1]), .B1(flash_addr[2]), .B2(
        n94), .C1(n98), .C2(tx_data[2]), .X(n62) );
  SAEDRVT14_AO222_1 U36 ( .A1(n96), .A2(shift_tx[3]), .B1(flash_addr[4]), .B2(
        n19), .C1(n98), .C2(tx_data[4]), .X(n64) );
  SAEDRVT14_AO222_1 U37 ( .A1(n96), .A2(shift_tx[0]), .B1(flash_addr[1]), .B2(
        n94), .C1(n98), .C2(tx_data[1]), .X(n61) );
  SAEDRVT14_AO22_0P5 U38 ( .A1(n98), .A2(tx_data[0]), .B1(n19), .B2(
        flash_addr[0]), .X(n60) );
  SAEDRVT14_OAI21_0P5 U39 ( .A1(n29), .A2(n18), .B(n17), .X(n96) );
  SAEDRVT14_AO22_0P5 U40 ( .A1(n94), .A2(flash_addr[24]), .B1(n93), .B2(cmd[0]), .X(n95) );
  SAEDRVT14_AO22_0P5 U41 ( .A1(n94), .A2(flash_addr[26]), .B1(n93), .B2(cmd[2]), .X(n89) );
  SAEDRVT14_AO22_0P5 U42 ( .A1(n94), .A2(flash_addr[27]), .B1(n93), .B2(cmd[3]), .X(n43) );
  SAEDRVT14_BUF_U_0P5 U43 ( .A(n98), .X(n36) );
  SAEDRVT14_OAI22_0P5 U44 ( .A1(n29), .A2(n27), .B1(n26), .B2(spi_busy), .X(
        n28) );
  SAEDRVT14_AO22_0P5 U45 ( .A1(n94), .A2(flash_addr[28]), .B1(n93), .B2(cmd[4]), .X(n41) );
  SAEDRVT14_BUF_U_0P5 U46 ( .A(n94), .X(n19) );
  SAEDRVT14_AO22_0P5 U47 ( .A1(n94), .A2(flash_addr[29]), .B1(n93), .B2(cmd[5]), .X(n39) );
  SAEDRVT14_AO22_0P5 U48 ( .A1(n94), .A2(flash_addr[25]), .B1(n93), .B2(cmd[1]), .X(n91) );
  SAEDRVT14_AO22_0P5 U49 ( .A1(n94), .A2(flash_addr[30]), .B1(n93), .B2(cmd[6]), .X(n37) );
  SAEDRVT14_NR2_1 U50 ( .A1(n94), .A2(n13), .X(n14) );
  SAEDRVT14_OAI21_0P5 U51 ( .A1(state[2]), .A2(n9), .B(n18), .X(n48) );
  SAEDRVT14_AO22_0P5 U52 ( .A1(n94), .A2(flash_addr[31]), .B1(n93), .B2(cmd[7]), .X(n34) );
  SAEDRVT14_NR2_1 U53 ( .A1(n16), .A2(n17), .X(n45) );
  SAEDRVT14_INV_0P5 U54 ( .A(n16), .X(n29) );
  SAEDRVT14_NR2_1 U55 ( .A1(n16), .A2(n12), .X(n94) );
  SAEDRVT14_NR2_1 U56 ( .A1(n16), .A2(n15), .X(n98) );
  SAEDRVT14_OAI22_0P5 U57 ( .A1(state[1]), .A2(start), .B1(n10), .B2(n16), .X(
        n9) );
  SAEDRVT14_ND2_CDC_1 U58 ( .A1(n31), .A2(n23), .X(n16) );
  SAEDRVT14_INV_0P5 U59 ( .A(n31), .X(n30) );
  SAEDRVT14_NR2_1 U60 ( .A1(bit_cnt[4]), .A2(n32), .X(n31) );
  SAEDRVT14_AOI21_0P75 U61 ( .A1(bit_cnt[3]), .A2(n8), .B(n6), .X(n84) );
  SAEDRVT14_OAI21_0P5 U62 ( .A1(state[2]), .A2(n4), .B(spi_busy), .X(n51) );
  SAEDRVT14_AN2B_MM_1 U63 ( .B(rx_data[15]), .A(n25), .X(N202) );
  SAEDRVT14_OAI21_0P5 U64 ( .A1(bit_cnt[3]), .A2(n8), .B(n33), .X(n6) );
  SAEDRVT14_AN2B_MM_1 U65 ( .B(rx_data[7]), .A(n25), .X(N194) );
  SAEDRVT14_AN2B_MM_1 U66 ( .B(rx_data[13]), .A(n25), .X(N200) );
  SAEDRVT14_AN2B_MM_1 U67 ( .B(rx_data[27]), .A(n25), .X(N214) );
  SAEDRVT14_AN2B_MM_1 U68 ( .B(rx_data[3]), .A(n25), .X(N190) );
  SAEDRVT14_AN2B_MM_1 U69 ( .B(rx_data[23]), .A(n25), .X(N210) );
  SAEDRVT14_AN2B_MM_1 U70 ( .B(rx_data[2]), .A(n25), .X(N189) );
  SAEDRVT14_AN2B_MM_1 U71 ( .B(rx_data[24]), .A(n25), .X(N211) );
  SAEDRVT14_AN2B_MM_1 U72 ( .B(rx_data[1]), .A(n25), .X(N188) );
  SAEDRVT14_AN2B_MM_1 U73 ( .B(rx_data[14]), .A(n25), .X(N201) );
  SAEDRVT14_AOI21_0P75 U74 ( .A1(bit_cnt[2]), .A2(n3), .B(n8), .X(n4) );
  SAEDRVT14_AN2B_MM_1 U75 ( .B(rx_data[5]), .A(n25), .X(N192) );
  SAEDRVT14_AN2B_MM_1 U76 ( .B(rx_data[17]), .A(n25), .X(N204) );
  SAEDRVT14_AN2B_MM_1 U77 ( .B(rx_data[21]), .A(n25), .X(N208) );
  SAEDRVT14_AN2B_MM_1 U78 ( .B(rx_data[12]), .A(n25), .X(N199) );
  SAEDRVT14_AN2B_MM_1 U79 ( .B(rx_data[22]), .A(n25), .X(N209) );
  SAEDRVT14_AN2B_MM_1 U80 ( .B(rx_data[29]), .A(n25), .X(N216) );
  SAEDRVT14_AN2B_MM_1 U81 ( .B(rx_data[16]), .A(n25), .X(N203) );
  SAEDRVT14_AN2B_MM_1 U82 ( .B(rx_data[25]), .A(n25), .X(N212) );
  SAEDRVT14_AN2B_MM_1 U83 ( .B(rx_data[11]), .A(n25), .X(N198) );
  SAEDRVT14_ND2_CDC_1 U84 ( .A1(n8), .A2(n22), .X(n32) );
  SAEDRVT14_AN2B_MM_1 U85 ( .B(rx_data[0]), .A(n25), .X(N187) );
  SAEDRVT14_AN2B_MM_1 U86 ( .B(rx_data[6]), .A(n25), .X(N193) );
  SAEDRVT14_AN2B_MM_1 U87 ( .B(rx_data[20]), .A(n25), .X(N207) );
  SAEDRVT14_AN2B_MM_1 U88 ( .B(rx_data[30]), .A(n25), .X(N217) );
  SAEDRVT14_AN2B_MM_1 U89 ( .B(rx_data[10]), .A(n25), .X(N197) );
  SAEDRVT14_AN2B_MM_1 U90 ( .B(rx_data[18]), .A(n25), .X(N205) );
  SAEDRVT14_AN2B_MM_1 U91 ( .B(rx_data[19]), .A(n25), .X(N206) );
  SAEDRVT14_AN2B_MM_1 U92 ( .B(rx_data[26]), .A(n25), .X(N213) );
  SAEDRVT14_AN2B_MM_1 U93 ( .B(rx_data[8]), .A(n25), .X(N195) );
  SAEDRVT14_AN2B_MM_1 U94 ( .B(rx_data[4]), .A(n25), .X(N191) );
  SAEDRVT14_AN2B_MM_1 U95 ( .B(rx_data[9]), .A(n25), .X(N196) );
  SAEDRVT14_AN2B_MM_1 U96 ( .B(rx_data[28]), .A(n25), .X(N215) );
  SAEDRVT14_NR2_1 U97 ( .A1(bit_cnt[2]), .A2(n3), .X(n8) );
  SAEDRVT14_INV_0P5 U98 ( .A(n87), .X(n17) );
  SAEDRVT14_OA31_1 U99 ( .A1(n2), .A2(n5), .A3(n1), .B(n7), .X(n50) );
  SAEDRVT14_ND2_CDC_1 U100 ( .A1(n11), .A2(n10), .X(n12) );
  SAEDRVT14_AOI21_0P75 U101 ( .A1(n11), .A2(n10), .B(n13), .X(n18) );
  SAEDRVT14_AN4_0P5 U102 ( .A1(bit_cnt[4]), .A2(bit_cnt[2]), .A3(n24), .A4(n23), .X(n25) );
  SAEDRVT14_NR2_1 U103 ( .A1(n22), .A2(n21), .X(n24) );
  SAEDRVT14_OAI21_0P5 U104 ( .A1(bit_cnt[0]), .A2(state[2]), .B(spi_busy), .X(
        n49) );
  SAEDRVT14_INV_0P5 U105 ( .A(n21), .X(n1) );
  SAEDRVT14_NR2_1 U106 ( .A1(n10), .A2(n27), .X(n87) );
  SAEDRVT14_INV_0P5 U107 ( .A(n2), .X(n3) );
  SAEDRVT14_AN2_MM_0P5 U108 ( .A1(n33), .A2(clk), .X(spi_clk) );
  SAEDRVT14_INV_0P5 U109 ( .A(n15), .X(n13) );
  SAEDRVT14_INV_0P5 U110 ( .A(n27), .X(n11) );
  SAEDRVT14_INV_0P5 U111 ( .A(spi_busy), .X(n93) );
  SAEDRVT14_OR3_0P5 U112 ( .A1(state[2]), .A2(state[0]), .A3(n10), .X(n15) );
  SAEDRVT14_ND2_CDC_1 U113 ( .A1(n5), .A2(n7), .X(spi_busy) );
  SAEDRVT14_ND2_CDC_1 U114 ( .A1(bit_cnt[1]), .A2(bit_cnt[0]), .X(n21) );
  SAEDRVT14_INV_0P5 U115 ( .A(bit_cnt[3]), .X(n22) );
  SAEDRVT14_NR2_1 U116 ( .A1(state[2]), .A2(n5), .X(n33) );
  SAEDRVT14_NR2_1 U117 ( .A1(bit_cnt[1]), .A2(bit_cnt[0]), .X(n2) );
  SAEDRVT14_ND2_CDC_1 U118 ( .A1(state[0]), .A2(n7), .X(n27) );
  SAEDRVT14_INV_0P5 U119 ( .A(bit_cnt[5]), .X(n23) );
  SAEDRVT14_NR2_1 U120 ( .A1(state[0]), .A2(state[1]), .X(n5) );
  SAEDRVT14_INV_0P5 U121 ( .A(state[2]), .X(n7) );
  SAEDRVT14_INV_0P5 U122 ( .A(start), .X(n26) );
  SAEDRVT14_INV_0P5 U123 ( .A(state[1]), .X(n10) );
  SAEDRVT14_INV_0P5 U124 ( .A(n99), .X(spi_cs_n) );
  SAEDRVT14_AO32_U_0P5 U125 ( .A1(n96), .A2(bit_cnt[5]), .A3(n30), .B1(n96), 
        .B2(n29), .X(n86) );
  SAEDRVT14_AO32_U_0P5 U126 ( .A1(n33), .A2(bit_cnt[4]), .A3(n32), .B1(n33), 
        .B2(n31), .X(n85) );
  SAEDRVT14_AO21B_0P5 U127 ( .A1(n36), .A2(tx_data[31]), .B(n35), .X(n59) );
  SAEDRVT14_AO21B_0P5 U128 ( .A1(n98), .A2(tx_data[30]), .B(n38), .X(n58) );
  SAEDRVT14_AO21B_0P5 U129 ( .A1(n98), .A2(tx_data[29]), .B(n40), .X(n57) );
  SAEDRVT14_AO21B_0P5 U130 ( .A1(n98), .A2(tx_data[28]), .B(n42), .X(n56) );
  SAEDRVT14_AO21B_0P5 U131 ( .A1(n98), .A2(tx_data[27]), .B(n44), .X(n55) );
  SAEDRVT14_AO21B_0P5 U132 ( .A1(n98), .A2(tx_data[26]), .B(n90), .X(n54) );
  SAEDRVT14_AO21B_0P5 U133 ( .A1(n98), .A2(tx_data[25]), .B(n92), .X(n53) );
  SAEDRVT14_AO21B_0P5 U134 ( .A1(n98), .A2(tx_data[24]), .B(n97), .X(n52) );
endmodule


module SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module ahb_spi_legacy ( HCLK, HRESETn, HSEL, HADDR, HTRANS, HWRITE, HSIZE, 
        HBURST, HPROT, HMASTER, HMASTLOCK, HWDATA, HREADY, HRDATA, HREADYOUT, 
        HRESP, HSPLIT, spi_cs_n, spi_clk, spi_mosi, spi_miso );
  input [31:0] HADDR;
  input [1:0] HTRANS;
  input [2:0] HSIZE;
  input [2:0] HBURST;
  input [3:0] HPROT;
  input [3:0] HMASTER;
  input [31:0] HWDATA;
  output [31:0] HRDATA;
  output [1:0] HRESP;
  output [15:0] HSPLIT;
  input HCLK, HRESETn, HSEL, HWRITE, HMASTLOCK, HREADY, spi_miso;
  output HREADYOUT, spi_cs_n, spi_clk, spi_mosi;
  wire   write_en_reg, valid_trans_reg, N18, ctrl_reg_0_, N52, N53, N54,
         spi_busy, net336, net342, net347, net352, n23, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [7:0] addr_reg;
  wire   [7:0] cmd_reg;
  wire   [31:0] flash_addr_reg;
  wire   [31:0] tx_data_reg;
  wire   [31:0] rx_data_wire;
  assign HSPLIT[0] = HRESP[1];
  assign HSPLIT[1] = HRESP[1];
  assign HSPLIT[2] = HRESP[1];
  assign HSPLIT[3] = HRESP[1];
  assign HSPLIT[4] = HRESP[1];
  assign HSPLIT[5] = HRESP[1];
  assign HSPLIT[6] = HRESP[1];
  assign HSPLIT[7] = HRESP[1];
  assign HSPLIT[8] = HRESP[1];
  assign HSPLIT[9] = HRESP[1];
  assign HSPLIT[10] = HRESP[1];
  assign HSPLIT[11] = HRESP[1];
  assign HSPLIT[12] = HRESP[1];
  assign HSPLIT[13] = HRESP[1];
  assign HSPLIT[14] = HRESP[1];
  assign HSPLIT[15] = HRESP[1];
  assign HRESP[0] = HRESP[1];

  spi_serializer_fsm u_spi_fsm ( .clk(HCLK), .rst_n(HRESETn), .start(
        ctrl_reg_0_), .cmd(cmd_reg), .flash_addr(flash_addr_reg), .tx_data(
        tx_data_reg), .spi_busy(spi_busy), .rx_data(rx_data_wire), .spi_cs_n(
        spi_cs_n), .spi_clk(spi_clk), .spi_mosi(spi_mosi), .spi_miso(spi_miso)
         );
  SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_0 clk_gate_addr_reg_reg ( .CLK(HCLK), 
        .EN(N18), .ENCLK(net336), .TE(HRESP[1]) );
  SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_3 clk_gate_tx_data_reg_reg ( .CLK(HCLK), 
        .EN(N54), .ENCLK(net342), .TE(HRESP[1]) );
  SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_2 clk_gate_cmd_reg_reg ( .CLK(HCLK), 
        .EN(N52), .ENCLK(net347), .TE(HRESP[1]) );
  SNPS_CLOCK_GATE_HIGH_ahb_spi_legacy_1 clk_gate_flash_addr_reg_reg ( .CLK(
        HCLK), .EN(N53), .ENCLK(net352), .TE(HRESP[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 valid_trans_reg_reg ( .D(n25), .CK(HCLK), .RD(
        HRESETn), .Q(valid_trans_reg) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_7_ ( .D(HADDR[7]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_6_ ( .D(HADDR[6]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_5_ ( .D(HADDR[5]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_4_ ( .D(HADDR[4]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_3_ ( .D(HADDR[3]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_2_ ( .D(HADDR[2]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_1_ ( .D(HADDR[1]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_0_ ( .D(HADDR[0]), .CK(net336), .RD(
        HRESETn), .Q(addr_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 write_en_reg_reg ( .D(HWRITE), .CK(net336), .RD(
        HRESETn), .Q(write_en_reg) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_31_ ( .D(HWDATA[31]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_30_ ( .D(HWDATA[30]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_29_ ( .D(HWDATA[29]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_28_ ( .D(HWDATA[28]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_26_ ( .D(HWDATA[26]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_25_ ( .D(HWDATA[25]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_24_ ( .D(HWDATA[24]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_23_ ( .D(HWDATA[23]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_22_ ( .D(HWDATA[22]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_21_ ( .D(HWDATA[21]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_20_ ( .D(HWDATA[20]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_19_ ( .D(HWDATA[19]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_18_ ( .D(HWDATA[18]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_17_ ( .D(HWDATA[17]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_16_ ( .D(HWDATA[16]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_15_ ( .D(HWDATA[15]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_14_ ( .D(HWDATA[14]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_13_ ( .D(HWDATA[13]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_11_ ( .D(HWDATA[11]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_10_ ( .D(HWDATA[10]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_9_ ( .D(HWDATA[9]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_8_ ( .D(HWDATA[8]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_7_ ( .D(HWDATA[7]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_6_ ( .D(HWDATA[6]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_5_ ( .D(HWDATA[5]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_4_ ( .D(HWDATA[4]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_3_ ( .D(HWDATA[3]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_2_ ( .D(HWDATA[2]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_1_ ( .D(HWDATA[1]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_0_ ( .D(HWDATA[0]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ctrl_reg_reg_0_ ( .D(n23), .CK(HCLK), .RD(HRESETn), 
        .Q(ctrl_reg_0_) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_7_ ( .D(HWDATA[7]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_5_ ( .D(HWDATA[5]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_4_ ( .D(HWDATA[4]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_3_ ( .D(HWDATA[3]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_2_ ( .D(HWDATA[2]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_1_ ( .D(HWDATA[1]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_0_ ( .D(HWDATA[0]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_31_ ( .D(HWDATA[31]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_30_ ( .D(HWDATA[30]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_29_ ( .D(HWDATA[29]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_28_ ( .D(HWDATA[28]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_27_ ( .D(HWDATA[27]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_26_ ( .D(HWDATA[26]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_25_ ( .D(HWDATA[25]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_24_ ( .D(HWDATA[24]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_22_ ( .D(HWDATA[22]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_21_ ( .D(HWDATA[21]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_20_ ( .D(HWDATA[20]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_19_ ( .D(HWDATA[19]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_18_ ( .D(HWDATA[18]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_17_ ( .D(HWDATA[17]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_16_ ( .D(HWDATA[16]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_15_ ( .D(HWDATA[15]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_14_ ( .D(HWDATA[14]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_13_ ( .D(HWDATA[13]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_12_ ( .D(HWDATA[12]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_11_ ( .D(HWDATA[11]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_10_ ( .D(HWDATA[10]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_9_ ( .D(HWDATA[9]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_7_ ( .D(HWDATA[7]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_6_ ( .D(HWDATA[6]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_5_ ( .D(HWDATA[5]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_4_ ( .D(HWDATA[4]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_3_ ( .D(HWDATA[3]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_2_ ( .D(HWDATA[2]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_1_ ( .D(HWDATA[1]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_0_ ( .D(HWDATA[0]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[0]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 tx_data_reg_reg_27_ ( .D(HWDATA[27]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[27]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 tx_data_reg_reg_12_ ( .D(HWDATA[12]), .CK(net342), 
        .RD(HRESETn), .Q(tx_data_reg[12]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 cmd_reg_reg_6_ ( .D(HWDATA[6]), .CK(net347), .RD(
        HRESETn), .Q(cmd_reg[6]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 flash_addr_reg_reg_23_ ( .D(HWDATA[23]), .CK(
        net352), .RD(HRESETn), .Q(flash_addr_reg[23]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 flash_addr_reg_reg_8_ ( .D(HWDATA[8]), .CK(net352), 
        .RD(HRESETn), .Q(flash_addr_reg[8]) );
  SAEDRVT14_TIE0_V1_2 U65 ( .X(HRESP[1]) );
  SAEDRVT14_TIE1_4 U66 ( .X(HREADYOUT) );
  SAEDRVT14_AOI21_0P75 U67 ( .A1(n52), .A2(flash_addr_reg[0]), .B(n43), .X(n44) );
  SAEDRVT14_AOI21_0P75 U68 ( .A1(n50), .A2(rx_data_wire[1]), .B(n49), .X(n51)
         );
  SAEDRVT14_OAI22_0P5 U69 ( .A1(n42), .A2(n48), .B1(n46), .B2(n41), .X(n43) );
  SAEDRVT14_OAI22_0P5 U70 ( .A1(n48), .A2(n47), .B1(n46), .B2(n45), .X(n49) );
  SAEDRVT14_AO22_0P5 U71 ( .A1(n52), .A2(flash_addr_reg[16]), .B1(n50), .B2(
        rx_data_wire[16]), .X(HRDATA[16]) );
  SAEDRVT14_AO22_0P5 U72 ( .A1(n52), .A2(flash_addr_reg[12]), .B1(n50), .B2(
        rx_data_wire[12]), .X(HRDATA[12]) );
  SAEDRVT14_AO22_0P5 U73 ( .A1(n52), .A2(flash_addr_reg[15]), .B1(n50), .B2(
        rx_data_wire[15]), .X(HRDATA[15]) );
  SAEDRVT14_AO22_0P5 U74 ( .A1(n52), .A2(flash_addr_reg[13]), .B1(n50), .B2(
        rx_data_wire[13]), .X(HRDATA[13]) );
  SAEDRVT14_AO22_0P5 U75 ( .A1(n52), .A2(flash_addr_reg[22]), .B1(n50), .B2(
        rx_data_wire[22]), .X(HRDATA[22]) );
  SAEDRVT14_AO22_0P5 U76 ( .A1(n52), .A2(flash_addr_reg[17]), .B1(n50), .B2(
        rx_data_wire[17]), .X(HRDATA[17]) );
  SAEDRVT14_AO22_0P5 U77 ( .A1(n52), .A2(flash_addr_reg[29]), .B1(n50), .B2(
        rx_data_wire[29]), .X(HRDATA[29]) );
  SAEDRVT14_AO22_0P5 U78 ( .A1(n52), .A2(flash_addr_reg[11]), .B1(n50), .B2(
        rx_data_wire[11]), .X(HRDATA[11]) );
  SAEDRVT14_AO22_0P5 U79 ( .A1(n52), .A2(flash_addr_reg[30]), .B1(n50), .B2(
        rx_data_wire[30]), .X(HRDATA[30]) );
  SAEDRVT14_AO22_0P5 U80 ( .A1(n52), .A2(flash_addr_reg[28]), .B1(n50), .B2(
        rx_data_wire[28]), .X(HRDATA[28]) );
  SAEDRVT14_AO22_0P5 U81 ( .A1(n52), .A2(flash_addr_reg[31]), .B1(n50), .B2(
        rx_data_wire[31]), .X(HRDATA[31]) );
  SAEDRVT14_AO22_0P5 U82 ( .A1(n52), .A2(flash_addr_reg[14]), .B1(n50), .B2(
        rx_data_wire[14]), .X(HRDATA[14]) );
  SAEDRVT14_AO22_0P5 U83 ( .A1(n52), .A2(flash_addr_reg[25]), .B1(n50), .B2(
        rx_data_wire[25]), .X(HRDATA[25]) );
  SAEDRVT14_AO22_0P5 U84 ( .A1(n52), .A2(flash_addr_reg[27]), .B1(n50), .B2(
        rx_data_wire[27]), .X(HRDATA[27]) );
  SAEDRVT14_AO22_0P5 U85 ( .A1(n52), .A2(flash_addr_reg[18]), .B1(n50), .B2(
        rx_data_wire[18]), .X(HRDATA[18]) );
  SAEDRVT14_AO22_0P5 U86 ( .A1(n52), .A2(flash_addr_reg[10]), .B1(n50), .B2(
        rx_data_wire[10]), .X(HRDATA[10]) );
  SAEDRVT14_AO22_0P5 U87 ( .A1(n52), .A2(flash_addr_reg[20]), .B1(n50), .B2(
        rx_data_wire[20]), .X(HRDATA[20]) );
  SAEDRVT14_AO222_1 U88 ( .A1(n52), .A2(flash_addr_reg[3]), .B1(n50), .B2(
        rx_data_wire[3]), .C1(n40), .C2(cmd_reg[3]), .X(HRDATA[3]) );
  SAEDRVT14_AO222_1 U89 ( .A1(n52), .A2(flash_addr_reg[5]), .B1(n50), .B2(
        rx_data_wire[5]), .C1(n40), .C2(cmd_reg[5]), .X(HRDATA[5]) );
  SAEDRVT14_AO22_0P5 U90 ( .A1(n52), .A2(flash_addr_reg[24]), .B1(n50), .B2(
        rx_data_wire[24]), .X(HRDATA[24]) );
  SAEDRVT14_INV_0P5 U91 ( .A(n40), .X(n46) );
  SAEDRVT14_AO222_1 U92 ( .A1(n52), .A2(flash_addr_reg[4]), .B1(n50), .B2(
        rx_data_wire[4]), .C1(n40), .C2(cmd_reg[4]), .X(HRDATA[4]) );
  SAEDRVT14_AO22_0P5 U93 ( .A1(n52), .A2(flash_addr_reg[9]), .B1(n50), .B2(
        rx_data_wire[9]), .X(HRDATA[9]) );
  SAEDRVT14_AO222_1 U94 ( .A1(n52), .A2(flash_addr_reg[2]), .B1(n50), .B2(
        rx_data_wire[2]), .C1(n40), .C2(cmd_reg[2]), .X(HRDATA[2]) );
  SAEDRVT14_AO22_0P5 U95 ( .A1(n52), .A2(flash_addr_reg[26]), .B1(n50), .B2(
        rx_data_wire[26]), .X(HRDATA[26]) );
  SAEDRVT14_AO22_0P5 U96 ( .A1(n52), .A2(flash_addr_reg[8]), .B1(n50), .B2(
        rx_data_wire[8]), .X(HRDATA[8]) );
  SAEDRVT14_AO222_1 U97 ( .A1(n52), .A2(flash_addr_reg[6]), .B1(n50), .B2(
        rx_data_wire[6]), .C1(n40), .C2(cmd_reg[6]), .X(HRDATA[6]) );
  SAEDRVT14_AO22_0P5 U98 ( .A1(n52), .A2(flash_addr_reg[19]), .B1(n50), .B2(
        rx_data_wire[19]), .X(HRDATA[19]) );
  SAEDRVT14_AO222_1 U99 ( .A1(n52), .A2(flash_addr_reg[7]), .B1(n50), .B2(
        rx_data_wire[7]), .C1(n40), .C2(cmd_reg[7]), .X(HRDATA[7]) );
  SAEDRVT14_AO22_0P5 U100 ( .A1(n52), .A2(flash_addr_reg[21]), .B1(n50), .B2(
        rx_data_wire[21]), .X(HRDATA[21]) );
  SAEDRVT14_AO22_0P5 U101 ( .A1(n52), .A2(flash_addr_reg[23]), .B1(n50), .B2(
        rx_data_wire[23]), .X(HRDATA[23]) );
  SAEDRVT14_NR2_1 U102 ( .A1(n35), .A2(n33), .X(n50) );
  SAEDRVT14_NR2_1 U103 ( .A1(n35), .A2(n34), .X(n40) );
  SAEDRVT14_NR2_1 U104 ( .A1(n35), .A2(n32), .X(n52) );
  SAEDRVT14_AN3_0P5 U105 ( .A1(n39), .A2(n37), .A3(HWDATA[0]), .X(n23) );
  SAEDRVT14_NR2_1 U106 ( .A1(n32), .A2(n36), .X(N53) );
  SAEDRVT14_INV_0P5 U107 ( .A(n36), .X(n37) );
  SAEDRVT14_NR2_1 U108 ( .A1(n34), .A2(n36), .X(N52) );
  SAEDRVT14_INV_0P5 U109 ( .A(n38), .X(n35) );
  SAEDRVT14_NR2_1 U110 ( .A1(n33), .A2(n36), .X(N54) );
  SAEDRVT14_ND2_CDC_1 U111 ( .A1(n39), .A2(n38), .X(n48) );
  SAEDRVT14_NR2_1 U112 ( .A1(write_en_reg), .A2(n31), .X(n38) );
  SAEDRVT14_ND2B_U_0P5 U113 ( .A(n31), .B(write_en_reg), .X(n36) );
  SAEDRVT14_INV_0P5 U114 ( .A(spi_busy), .X(n47) );
  SAEDRVT14_ND2B_U_0P5 U115 ( .A(addr_reg[3]), .B(addr_reg[2]), .X(n34) );
  SAEDRVT14_INV_0P5 U116 ( .A(cmd_reg[0]), .X(n41) );
  SAEDRVT14_ND2_CDC_1 U117 ( .A1(addr_reg[2]), .A2(addr_reg[3]), .X(n33) );
  SAEDRVT14_INV_0P5 U118 ( .A(cmd_reg[1]), .X(n45) );
  SAEDRVT14_ND2B_U_0P5 U119 ( .A(addr_reg[2]), .B(addr_reg[3]), .X(n32) );
  SAEDRVT14_NR2_1 U120 ( .A1(addr_reg[2]), .A2(addr_reg[3]), .X(n39) );
  SAEDRVT14_AO21_U_0P5 U121 ( .A1(valid_trans_reg), .A2(n30), .B(N18), .X(n25)
         );
  SAEDRVT14_INV_0P5 U122 ( .A(ctrl_reg_0_), .X(n42) );
  SAEDRVT14_INV_0P5 U123 ( .A(HREADY), .X(n30) );
  SAEDRVT14_NR2_1 U124 ( .A1(addr_reg[4]), .A2(addr_reg[1]), .X(n29) );
  SAEDRVT14_OR3_0P5 U125 ( .A1(addr_reg[7]), .A2(addr_reg[5]), .A3(addr_reg[0]), .X(n27) );
  SAEDRVT14_ND2B_U_0P5 U126 ( .A(addr_reg[6]), .B(valid_trans_reg), .X(n26) );
  SAEDRVT14_NR2_1 U127 ( .A1(n27), .A2(n26), .X(n28) );
  SAEDRVT14_ND2_CDC_1 U128 ( .A1(n29), .A2(n28), .X(n31) );
  SAEDRVT14_AN3_0P5 U129 ( .A1(HREADY), .A2(HTRANS[1]), .A3(HSEL), .X(N18) );
  SAEDRVT14_AO21B_0P5 U130 ( .A1(n50), .A2(rx_data_wire[0]), .B(n44), .X(
        HRDATA[0]) );
  SAEDRVT14_AO21B_0P5 U131 ( .A1(n52), .A2(flash_addr_reg[1]), .B(n51), .X(
        HRDATA[1]) );
endmodule

