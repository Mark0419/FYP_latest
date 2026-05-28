/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP2
// Date      : Thu May 28 15:04:16 2026
/////////////////////////////////////////////////////////////


module spi_serializer_fsm ( clk, rst_n, start, cmd, flash_addr, tx_data, 
        spi_busy, rx_data, spi_cs_n, spi_clk, spi_mosi, spi_miso );
  input [7:0] cmd;
  input [31:0] flash_addr;
  input [31:0] tx_data;
  output [31:0] rx_data;
  input clk, rst_n, start, spi_miso;
  output spi_busy, spi_cs_n, spi_clk, spi_mosi;
  wire   n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n201, n236, n237, n238, n239, n240, n241, n242, n243,
         n244;
  wire   [2:0] state;
  wire   [4:0] bit_cnt;
  wire   [30:0] shift_tx;

  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_0_ ( .D(n198), .CK(clk), .RD(rst_n), .Q(
        bit_cnt[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_2_ ( .D(n233), .CK(clk), .RD(rst_n), .Q(
        state[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_1_ ( .D(n234), .CK(clk), .RD(rst_n), .Q(
        state[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_0_ ( .D(n235), .CK(clk), .RD(rst_n), .Q(
        state[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_1_ ( .D(n197), .CK(clk), .RD(rst_n), .Q(
        bit_cnt[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_2_ ( .D(n196), .CK(clk), .RD(rst_n), .Q(
        bit_cnt[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 bit_cnt_reg_3_ ( .D(n199), .CK(clk), .RD(rst_n), .Q(
        bit_cnt[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_0_ ( .D(n232), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_1_ ( .D(n231), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_2_ ( .D(n230), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_3_ ( .D(n229), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_4_ ( .D(n228), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_5_ ( .D(n227), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_6_ ( .D(n226), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_7_ ( .D(n225), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_8_ ( .D(n224), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_9_ ( .D(n223), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_10_ ( .D(n222), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_11_ ( .D(n221), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_12_ ( .D(n220), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_14_ ( .D(n218), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_15_ ( .D(n217), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_16_ ( .D(n216), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_17_ ( .D(n215), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_18_ ( .D(n214), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_19_ ( .D(n213), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_20_ ( .D(n212), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_21_ ( .D(n211), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_22_ ( .D(n210), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_23_ ( .D(n209), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_24_ ( .D(n208), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_25_ ( .D(n207), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_26_ ( .D(n206), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_27_ ( .D(n205), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_29_ ( .D(n203), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_30_ ( .D(n202), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_tx_reg_31_ ( .D(n195), .CK(clk), .RD(rst_n), 
        .Q(spi_mosi) );
  SAEDRVT14_FDPSBQ_0P5 spi_cs_n_reg ( .D(n244), .CK(clk), .SD(rst_n), .Q(
        spi_cs_n) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_0_ ( .D(n194), .CK(clk), .RD(rst_n), 
        .Q(rx_data[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_1_ ( .D(n193), .CK(clk), .RD(rst_n), 
        .Q(rx_data[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_2_ ( .D(n192), .CK(clk), .RD(rst_n), 
        .Q(rx_data[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_3_ ( .D(n191), .CK(clk), .RD(rst_n), 
        .Q(rx_data[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_4_ ( .D(n190), .CK(clk), .RD(rst_n), 
        .Q(rx_data[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_5_ ( .D(n189), .CK(clk), .RD(rst_n), 
        .Q(rx_data[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_6_ ( .D(n188), .CK(clk), .RD(rst_n), 
        .Q(rx_data[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_7_ ( .D(n187), .CK(clk), .RD(rst_n), 
        .Q(rx_data[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_8_ ( .D(n186), .CK(clk), .RD(rst_n), 
        .Q(rx_data[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_9_ ( .D(n185), .CK(clk), .RD(rst_n), 
        .Q(rx_data[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_11_ ( .D(n183), .CK(clk), .RD(rst_n), 
        .Q(rx_data[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_12_ ( .D(n182), .CK(clk), .RD(rst_n), 
        .Q(rx_data[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_13_ ( .D(n181), .CK(clk), .RD(rst_n), 
        .Q(rx_data[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_14_ ( .D(n180), .CK(clk), .RD(rst_n), 
        .Q(rx_data[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_15_ ( .D(n179), .CK(clk), .RD(rst_n), 
        .Q(rx_data[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_16_ ( .D(n178), .CK(clk), .RD(rst_n), 
        .Q(rx_data[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_17_ ( .D(n177), .CK(clk), .RD(rst_n), 
        .Q(rx_data[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_18_ ( .D(n176), .CK(clk), .RD(rst_n), 
        .Q(rx_data[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_19_ ( .D(n175), .CK(clk), .RD(rst_n), 
        .Q(rx_data[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_20_ ( .D(n174), .CK(clk), .RD(rst_n), 
        .Q(rx_data[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_21_ ( .D(n173), .CK(clk), .RD(rst_n), 
        .Q(rx_data[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_22_ ( .D(n172), .CK(clk), .RD(rst_n), 
        .Q(rx_data[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_23_ ( .D(n171), .CK(clk), .RD(rst_n), 
        .Q(rx_data[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_24_ ( .D(n170), .CK(clk), .RD(rst_n), 
        .Q(rx_data[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_26_ ( .D(n168), .CK(clk), .RD(rst_n), 
        .Q(rx_data[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_27_ ( .D(n167), .CK(clk), .RD(rst_n), 
        .Q(rx_data[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_28_ ( .D(n166), .CK(clk), .RD(rst_n), 
        .Q(rx_data[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_29_ ( .D(n165), .CK(clk), .RD(rst_n), 
        .Q(rx_data[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 shift_rx_reg_30_ ( .D(n164), .CK(clk), .RD(rst_n), 
        .Q(rx_data[30]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 bit_cnt_reg_4_ ( .D(n200), .CK(clk), .RD(rst_n), 
        .Q(bit_cnt[4]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_tx_reg_13_ ( .D(n219), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[13]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_tx_reg_28_ ( .D(n204), .CK(clk), .RD(rst_n), 
        .Q(shift_tx[28]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_rx_reg_10_ ( .D(n184), .CK(clk), .RD(rst_n), 
        .Q(rx_data[10]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_rx_reg_25_ ( .D(n169), .CK(clk), .RD(rst_n), 
        .Q(rx_data[25]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 shift_rx_reg_31_ ( .D(n163), .CK(clk), .RD(rst_n), 
        .Q(rx_data[31]) );
  SAEDRVT14_OAI21_0P5 U3 ( .A1(state[1]), .A2(state[0]), .B(clk), .X(n3) );
  SAEDRVT14_AOI21_0P75 U4 ( .A1(n201), .A2(tx_data[2]), .B(n70), .X(n71) );
  SAEDRVT14_AOI21_0P75 U5 ( .A1(n156), .A2(tx_data[23]), .B(n136), .X(n137) );
  SAEDRVT14_AOI21_0P75 U6 ( .A1(n156), .A2(tx_data[22]), .B(n131), .X(n132) );
  SAEDRVT14_AOI21_0P75 U7 ( .A1(n201), .A2(tx_data[9]), .B(n91), .X(n92) );
  SAEDRVT14_AOI21_0P75 U8 ( .A1(n201), .A2(tx_data[4]), .B(n76), .X(n77) );
  SAEDRVT14_AOI21_0P75 U9 ( .A1(n201), .A2(tx_data[7]), .B(n85), .X(n86) );
  SAEDRVT14_AOI21_0P75 U10 ( .A1(n201), .A2(tx_data[1]), .B(n67), .X(n68) );
  SAEDRVT14_AOI21_0P75 U11 ( .A1(n201), .A2(tx_data[11]), .B(n97), .X(n98) );
  SAEDRVT14_AOI21_0P75 U12 ( .A1(n201), .A2(tx_data[5]), .B(n79), .X(n80) );
  SAEDRVT14_AOI21_0P75 U13 ( .A1(n156), .A2(tx_data[21]), .B(n128), .X(n129)
         );
  SAEDRVT14_AOI21_0P75 U14 ( .A1(n201), .A2(tx_data[3]), .B(n73), .X(n74) );
  SAEDRVT14_AOI21_0P75 U15 ( .A1(n201), .A2(tx_data[8]), .B(n88), .X(n89) );
  SAEDRVT14_AOI21_0P75 U16 ( .A1(n201), .A2(tx_data[6]), .B(n82), .X(n83) );
  SAEDRVT14_AOI21_0P75 U17 ( .A1(n201), .A2(tx_data[10]), .B(n94), .X(n95) );
  SAEDRVT14_AOI21_0P75 U18 ( .A1(n156), .A2(tx_data[13]), .B(n103), .X(n104)
         );
  SAEDRVT14_AOI21_0P75 U19 ( .A1(n156), .A2(tx_data[15]), .B(n109), .X(n110)
         );
  SAEDRVT14_AOI21_0P75 U20 ( .A1(n156), .A2(tx_data[16]), .B(n112), .X(n113)
         );
  SAEDRVT14_AOI21_0P75 U21 ( .A1(n156), .A2(tx_data[14]), .B(n106), .X(n107)
         );
  SAEDRVT14_AOI21_0P75 U22 ( .A1(n156), .A2(tx_data[20]), .B(n124), .X(n125)
         );
  SAEDRVT14_AOI21_0P75 U23 ( .A1(n156), .A2(tx_data[19]), .B(n121), .X(n122)
         );
  SAEDRVT14_AOI21_0P75 U24 ( .A1(n156), .A2(tx_data[12]), .B(n100), .X(n101)
         );
  SAEDRVT14_AOI21_0P75 U25 ( .A1(n156), .A2(tx_data[18]), .B(n118), .X(n119)
         );
  SAEDRVT14_AOI21_0P75 U26 ( .A1(n156), .A2(tx_data[17]), .B(n115), .X(n116)
         );
  SAEDRVT14_OAI22_0P5 U27 ( .A1(n127), .A2(n114), .B1(n134), .B2(n111), .X(
        n112) );
  SAEDRVT14_OAI22_0P5 U28 ( .A1(n127), .A2(n84), .B1(n134), .B2(n81), .X(n82)
         );
  SAEDRVT14_OAI22_0P5 U29 ( .A1(n127), .A2(n87), .B1(n134), .B2(n84), .X(n85)
         );
  SAEDRVT14_OAI21_0P5 U30 ( .A1(n244), .A2(n25), .B(n24), .X(n196) );
  SAEDRVT14_OAI22_0P5 U31 ( .A1(n127), .A2(n75), .B1(n134), .B2(n72), .X(n73)
         );
  SAEDRVT14_OAI22_0P5 U32 ( .A1(n127), .A2(n126), .B1(n134), .B2(n123), .X(
        n124) );
  SAEDRVT14_OAI22_0P5 U33 ( .A1(n127), .A2(n111), .B1(n134), .B2(n108), .X(
        n109) );
  SAEDRVT14_OAI22_0P5 U34 ( .A1(n127), .A2(n102), .B1(n134), .B2(n99), .X(n100) );
  SAEDRVT14_OAI22_0P5 U35 ( .A1(n127), .A2(n120), .B1(n134), .B2(n117), .X(
        n118) );
  SAEDRVT14_OAI22_0P5 U36 ( .A1(n127), .A2(n99), .B1(n134), .B2(n96), .X(n97)
         );
  SAEDRVT14_OAI22_0P5 U37 ( .A1(n127), .A2(n96), .B1(n134), .B2(n93), .X(n94)
         );
  SAEDRVT14_OAI22_0P5 U38 ( .A1(n127), .A2(n117), .B1(n134), .B2(n114), .X(
        n115) );
  SAEDRVT14_OAI22_0P5 U39 ( .A1(n237), .A2(n133), .B1(n134), .B2(n130), .X(
        n131) );
  SAEDRVT14_OAI22_0P5 U40 ( .A1(n127), .A2(n72), .B1(n134), .B2(n69), .X(n70)
         );
  SAEDRVT14_OAI22_0P5 U41 ( .A1(n127), .A2(n81), .B1(n134), .B2(n78), .X(n79)
         );
  SAEDRVT14_OAI22_0P5 U42 ( .A1(n237), .A2(n69), .B1(n134), .B2(n66), .X(n67)
         );
  SAEDRVT14_OAI22_0P5 U43 ( .A1(n127), .A2(n78), .B1(n134), .B2(n75), .X(n76)
         );
  SAEDRVT14_OAI22_0P5 U44 ( .A1(n127), .A2(n93), .B1(n134), .B2(n90), .X(n91)
         );
  SAEDRVT14_OAI22_0P5 U45 ( .A1(n127), .A2(n90), .B1(n134), .B2(n87), .X(n88)
         );
  SAEDRVT14_OAI22_0P5 U46 ( .A1(n127), .A2(n108), .B1(n134), .B2(n105), .X(
        n106) );
  SAEDRVT14_OAI22_0P5 U47 ( .A1(n127), .A2(n105), .B1(n134), .B2(n102), .X(
        n103) );
  SAEDRVT14_OAI22_0P5 U48 ( .A1(n127), .A2(n123), .B1(n134), .B2(n120), .X(
        n121) );
  SAEDRVT14_OAI22_0P5 U49 ( .A1(n127), .A2(n130), .B1(n134), .B2(n126), .X(
        n128) );
  SAEDRVT14_OAI22_0P5 U50 ( .A1(n237), .A2(n135), .B1(n134), .B2(n133), .X(
        n136) );
  SAEDRVT14_AOI21_0P75 U51 ( .A1(n240), .A2(shift_tx[30]), .B(n239), .X(n241)
         );
  SAEDRVT14_AOI21_0P75 U52 ( .A1(n240), .A2(shift_tx[29]), .B(n157), .X(n158)
         );
  SAEDRVT14_OAI21_0P5 U53 ( .A1(bit_cnt[1]), .A2(n22), .B(n21), .X(n197) );
  SAEDRVT14_AOI21_0P75 U54 ( .A1(n240), .A2(shift_tx[23]), .B(n138), .X(n139)
         );
  SAEDRVT14_INV_0P5 U55 ( .A(n240), .X(n134) );
  SAEDRVT14_AOI21_0P75 U56 ( .A1(n240), .A2(shift_tx[28]), .B(n153), .X(n154)
         );
  SAEDRVT14_AOI21_0P75 U57 ( .A1(n240), .A2(shift_tx[25]), .B(n144), .X(n145)
         );
  SAEDRVT14_AOI21_0P75 U58 ( .A1(bit_cnt[2]), .A2(n23), .B(n160), .X(n24) );
  SAEDRVT14_AOI21_0P75 U59 ( .A1(n240), .A2(shift_tx[27]), .B(n150), .X(n151)
         );
  SAEDRVT14_AOI21_0P75 U60 ( .A1(n240), .A2(shift_tx[26]), .B(n147), .X(n148)
         );
  SAEDRVT14_AOI21_0P75 U61 ( .A1(shift_tx[24]), .A2(n240), .B(n141), .X(n142)
         );
  SAEDRVT14_AOI21_0P75 U62 ( .A1(bit_cnt[1]), .A2(n22), .B(n160), .X(n21) );
  SAEDRVT14_OR2_MM_0P5 U63 ( .A1(bit_cnt[1]), .A2(n22), .X(n23) );
  SAEDRVT14_OAI22_0P5 U64 ( .A1(n10), .A2(n9), .B1(n8), .B2(n19), .X(n199) );
  SAEDRVT14_OAI22_0P5 U65 ( .A1(n20), .A2(n19), .B1(n18), .B2(n237), .X(n200)
         );
  SAEDRVT14_AOI21_0P75 U66 ( .A1(n7), .A2(n25), .B(n244), .X(n10) );
  SAEDRVT14_NR2_1 U67 ( .A1(n161), .A2(n160), .X(n162) );
  SAEDRVT14_INV_0P5 U68 ( .A(n7), .X(n19) );
  SAEDRVT14_ND2_CDC_1 U69 ( .A1(n237), .A2(n243), .X(n2) );
  SAEDRVT14_INV_0P5 U70 ( .A(n161), .X(n22) );
  SAEDRVT14_AOI21_0P75 U71 ( .A1(n6), .A2(n15), .B(n244), .X(n7) );
  SAEDRVT14_INV_0P5 U72 ( .A(n244), .X(n237) );
  SAEDRVT14_NR2_1 U73 ( .A1(n244), .A2(spi_busy), .X(n160) );
  SAEDRVT14_NR2_1 U74 ( .A1(bit_cnt[0]), .A2(n244), .X(n161) );
  SAEDRVT14_INV_0P5 U75 ( .A(n244), .X(n127) );
  SAEDRVT14_AO222_1 U76 ( .A1(n244), .A2(shift_tx[0]), .B1(n156), .B2(
        tx_data[0]), .C1(flash_addr[0]), .C2(n236), .X(n232) );
  SAEDRVT14_AOI22_0P5 U77 ( .A1(n236), .A2(flash_addr[29]), .B1(n156), .B2(
        tx_data[29]), .X(n155) );
  SAEDRVT14_AOI22_0P5 U78 ( .A1(n236), .A2(flash_addr[30]), .B1(n156), .B2(
        tx_data[30]), .X(n159) );
  SAEDRVT14_OAI22_0P5 U79 ( .A1(n243), .A2(n30), .B1(n38), .B2(n60), .X(n173)
         );
  SAEDRVT14_OAI22_0P5 U80 ( .A1(n243), .A2(n39), .B1(n40), .B2(n60), .X(n175)
         );
  SAEDRVT14_OAI22_0P5 U81 ( .A1(n56), .A2(n49), .B1(n37), .B2(n60), .X(n185)
         );
  SAEDRVT14_AOI22_0P5 U82 ( .A1(n236), .A2(flash_addr[28]), .B1(n201), .B2(
        tx_data[28]), .X(n152) );
  SAEDRVT14_AOI22_0P5 U83 ( .A1(n236), .A2(flash_addr[31]), .B1(n201), .B2(
        tx_data[31]), .X(n242) );
  SAEDRVT14_OAI22_0P5 U84 ( .A1(n243), .A2(n62), .B1(n61), .B2(n60), .X(n164)
         );
  SAEDRVT14_OAI22_0P5 U85 ( .A1(n56), .A2(n37), .B1(n52), .B2(n60), .X(n186)
         );
  SAEDRVT14_AOI22_0P5 U86 ( .A1(n236), .A2(flash_addr[27]), .B1(n201), .B2(
        tx_data[27]), .X(n149) );
  SAEDRVT14_OAI22_0P5 U87 ( .A1(n56), .A2(n50), .B1(n49), .B2(n60), .X(n184)
         );
  SAEDRVT14_OAI22_0P5 U88 ( .A1(n243), .A2(n40), .B1(n41), .B2(n60), .X(n176)
         );
  SAEDRVT14_OAI22_0P5 U89 ( .A1(n243), .A2(n38), .B1(n39), .B2(n60), .X(n174)
         );
  SAEDRVT14_OAI22_0P5 U90 ( .A1(n243), .A2(n42), .B1(n44), .B2(n60), .X(n178)
         );
  SAEDRVT14_OA21_1 U91 ( .A1(n16), .A2(n6), .B(n5), .X(n244) );
  SAEDRVT14_OAI22_0P5 U92 ( .A1(n243), .A2(n41), .B1(n42), .B2(n60), .X(n177)
         );
  SAEDRVT14_OAI22_0P5 U93 ( .A1(n56), .A2(n52), .B1(n53), .B2(n60), .X(n187)
         );
  SAEDRVT14_OAI22_0P5 U94 ( .A1(n243), .A2(n29), .B1(n62), .B2(n60), .X(n163)
         );
  SAEDRVT14_OAI22_0P5 U95 ( .A1(n56), .A2(n48), .B1(n50), .B2(n60), .X(n183)
         );
  SAEDRVT14_OAI22_0P5 U96 ( .A1(n243), .A2(n35), .B1(n30), .B2(n60), .X(n172)
         );
  SAEDRVT14_OAI22_0P5 U97 ( .A1(n243), .A2(n61), .B1(n57), .B2(n60), .X(n165)
         );
  SAEDRVT14_BUF_U_0P5 U98 ( .A(n201), .X(n156) );
  SAEDRVT14_OAI22_0P5 U99 ( .A1(n243), .A2(n32), .B1(n33), .B2(n60), .X(n168)
         );
  SAEDRVT14_OAI22_0P5 U100 ( .A1(n56), .A2(n53), .B1(n55), .B2(n60), .X(n188)
         );
  SAEDRVT14_OAI22_0P5 U101 ( .A1(n56), .A2(n43), .B1(n46), .B2(n60), .X(n180)
         );
  SAEDRVT14_AOI22_0P5 U102 ( .A1(n236), .A2(flash_addr[24]), .B1(n201), .B2(
        tx_data[24]), .X(n140) );
  SAEDRVT14_OAI22_0P5 U103 ( .A1(n243), .A2(n36), .B1(n35), .B2(n60), .X(n171)
         );
  SAEDRVT14_OAI22_0P5 U104 ( .A1(n243), .A2(n57), .B1(n31), .B2(n60), .X(n166)
         );
  SAEDRVT14_OAI21_0P5 U105 ( .A1(n16), .A2(n26), .B(n4), .X(n234) );
  SAEDRVT14_AOI22_0P5 U106 ( .A1(n236), .A2(flash_addr[26]), .B1(n201), .B2(
        tx_data[26]), .X(n146) );
  SAEDRVT14_OAI22_0P5 U107 ( .A1(n243), .A2(n34), .B1(n36), .B2(n60), .X(n170)
         );
  SAEDRVT14_OAI22_0P5 U108 ( .A1(n243), .A2(n33), .B1(n34), .B2(n60), .X(n169)
         );
  SAEDRVT14_AOI22_0P5 U109 ( .A1(n236), .A2(flash_addr[25]), .B1(n201), .B2(
        tx_data[25]), .X(n143) );
  SAEDRVT14_OAI22_0P5 U110 ( .A1(n243), .A2(n58), .B1(n45), .B2(n60), .X(n193)
         );
  SAEDRVT14_OAI22_0P5 U111 ( .A1(n56), .A2(n54), .B1(n51), .B2(n60), .X(n190)
         );
  SAEDRVT14_OAI22_0P5 U112 ( .A1(n243), .A2(n44), .B1(n43), .B2(n60), .X(n179)
         );
  SAEDRVT14_OAI22_0P5 U113 ( .A1(n13), .A2(start), .B1(n238), .B2(n201), .X(
        n14) );
  SAEDRVT14_OAI22_0P5 U114 ( .A1(n243), .A2(n31), .B1(n32), .B2(n60), .X(n167)
         );
  SAEDRVT14_OAI22_0P5 U115 ( .A1(n56), .A2(n55), .B1(n54), .B2(n60), .X(n189)
         );
  SAEDRVT14_OAI22_0P5 U116 ( .A1(n56), .A2(n47), .B1(n48), .B2(n60), .X(n182)
         );
  SAEDRVT14_OAI22_0P5 U117 ( .A1(n243), .A2(n59), .B1(n58), .B2(n60), .X(n192)
         );
  SAEDRVT14_OAI22_0P5 U118 ( .A1(n56), .A2(n51), .B1(n59), .B2(n60), .X(n191)
         );
  SAEDRVT14_OAI22_0P5 U119 ( .A1(n56), .A2(n46), .B1(n47), .B2(n60), .X(n181)
         );
  SAEDRVT14_ND2_CDC_1 U120 ( .A1(n28), .A2(n243), .X(n60) );
  SAEDRVT14_NR2_1 U121 ( .A1(n65), .A2(n63), .X(n236) );
  SAEDRVT14_NR2_1 U122 ( .A1(n65), .A2(n12), .X(n201) );
  SAEDRVT14_ND2_CDC_1 U123 ( .A1(n65), .A2(n64), .X(n1) );
  SAEDRVT14_MUX2_U_0P5 U124 ( .D0(rx_data[0]), .D1(spi_miso), .S(n243), .X(
        n194) );
  SAEDRVT14_NR2_1 U125 ( .A1(n65), .A2(n26), .X(n233) );
  SAEDRVT14_OAI21_0P5 U126 ( .A1(n16), .A2(state[1]), .B(n64), .X(n4) );
  SAEDRVT14_AOI21_0P75 U127 ( .A1(n11), .A2(start), .B(n64), .X(n5) );
  SAEDRVT14_INV_0P5 U128 ( .A(n16), .X(n65) );
  SAEDRVT14_ND2_CDC_1 U129 ( .A1(n12), .A2(n63), .X(n64) );
  SAEDRVT14_INV_0P5 U130 ( .A(n26), .X(n243) );
  SAEDRVT14_EO2_V1_0P75 U131 ( .A1(n18), .A2(n17), .X(n20) );
  SAEDRVT14_INV_0P5 U132 ( .A(n13), .X(n12) );
  SAEDRVT14_INV_0P5 U133 ( .A(spi_busy), .X(n238) );
  SAEDRVT14_INV_0P5 U134 ( .A(n17), .X(n8) );
  SAEDRVT14_INV_0P5 U135 ( .A(n56), .X(n26) );
  SAEDRVT14_AN2_MM_0P5 U136 ( .A1(n17), .A2(n18), .X(n16) );
  SAEDRVT14_ND2_CDC_1 U137 ( .A1(n11), .A2(n15), .X(spi_busy) );
  SAEDRVT14_ND2_CDC_1 U138 ( .A1(state[0]), .A2(n11), .X(n63) );
  SAEDRVT14_ND2_CDC_1 U139 ( .A1(bit_cnt[4]), .A2(n27), .X(n28) );
  SAEDRVT14_NR2_1 U140 ( .A1(n6), .A2(n15), .X(n56) );
  SAEDRVT14_NR2_1 U141 ( .A1(state[2]), .A2(n3), .X(spi_clk) );
  SAEDRVT14_NR2_1 U142 ( .A1(bit_cnt[3]), .A2(n25), .X(n17) );
  SAEDRVT14_NR2_1 U143 ( .A1(n6), .A2(state[0]), .X(n13) );
  SAEDRVT14_INV_0P5 U144 ( .A(rx_data[28]), .X(n57) );
  SAEDRVT14_INV_0P5 U145 ( .A(rx_data[29]), .X(n61) );
  SAEDRVT14_INV_0P5 U146 ( .A(rx_data[30]), .X(n62) );
  SAEDRVT14_INV_0P5 U147 ( .A(rx_data[27]), .X(n31) );
  SAEDRVT14_INV_0P5 U148 ( .A(rx_data[24]), .X(n34) );
  SAEDRVT14_INV_0P5 U149 ( .A(shift_tx[23]), .X(n135) );
  SAEDRVT14_INV_0P5 U150 ( .A(rx_data[21]), .X(n30) );
  SAEDRVT14_INV_0P5 U151 ( .A(rx_data[26]), .X(n32) );
  SAEDRVT14_INV_0P5 U152 ( .A(rx_data[31]), .X(n29) );
  SAEDRVT14_INV_0P5 U153 ( .A(rx_data[22]), .X(n35) );
  SAEDRVT14_INV_0P5 U154 ( .A(rx_data[20]), .X(n38) );
  SAEDRVT14_INV_0P5 U155 ( .A(state[0]), .X(n15) );
  SAEDRVT14_INV_0P5 U156 ( .A(rx_data[19]), .X(n39) );
  SAEDRVT14_INV_0P5 U157 ( .A(rx_data[25]), .X(n33) );
  SAEDRVT14_NR2_1 U158 ( .A1(state[2]), .A2(state[1]), .X(n11) );
  SAEDRVT14_INV_0P5 U159 ( .A(rx_data[23]), .X(n36) );
  SAEDRVT14_INV_0P5 U160 ( .A(rx_data[18]), .X(n40) );
  SAEDRVT14_INV_0P5 U161 ( .A(rx_data[12]), .X(n47) );
  SAEDRVT14_ND2B_U_0P5 U162 ( .A(state[2]), .B(state[1]), .X(n6) );
  SAEDRVT14_INV_0P5 U163 ( .A(rx_data[8]), .X(n37) );
  SAEDRVT14_INV_0P5 U164 ( .A(rx_data[16]), .X(n42) );
  SAEDRVT14_INV_0P5 U165 ( .A(rx_data[5]), .X(n55) );
  SAEDRVT14_INV_0P5 U166 ( .A(rx_data[6]), .X(n53) );
  SAEDRVT14_INV_0P5 U167 ( .A(rx_data[4]), .X(n54) );
  SAEDRVT14_INV_0P5 U168 ( .A(bit_cnt[4]), .X(n18) );
  SAEDRVT14_INV_0P5 U169 ( .A(rx_data[9]), .X(n49) );
  SAEDRVT14_INV_0P5 U170 ( .A(rx_data[17]), .X(n41) );
  SAEDRVT14_INV_0P5 U171 ( .A(rx_data[14]), .X(n43) );
  SAEDRVT14_AN4_0P5 U172 ( .A1(bit_cnt[3]), .A2(bit_cnt[1]), .A3(bit_cnt[2]), 
        .A4(bit_cnt[0]), .X(n27) );
  SAEDRVT14_INV_0P5 U173 ( .A(rx_data[13]), .X(n46) );
  SAEDRVT14_INV_0P5 U174 ( .A(rx_data[11]), .X(n48) );
  SAEDRVT14_INV_0P5 U175 ( .A(rx_data[10]), .X(n50) );
  SAEDRVT14_INV_0P5 U176 ( .A(shift_tx[0]), .X(n66) );
  SAEDRVT14_INV_0P5 U177 ( .A(rx_data[2]), .X(n59) );
  SAEDRVT14_INV_0P5 U178 ( .A(rx_data[3]), .X(n51) );
  SAEDRVT14_INV_0P5 U179 ( .A(bit_cnt[3]), .X(n9) );
  SAEDRVT14_INV_0P5 U180 ( .A(rx_data[0]), .X(n45) );
  SAEDRVT14_OR3_0P5 U181 ( .A1(bit_cnt[1]), .A2(bit_cnt[2]), .A3(bit_cnt[0]), 
        .X(n25) );
  SAEDRVT14_INV_0P5 U182 ( .A(rx_data[15]), .X(n44) );
  SAEDRVT14_INV_0P5 U183 ( .A(rx_data[1]), .X(n58) );
  SAEDRVT14_INV_0P5 U184 ( .A(rx_data[7]), .X(n52) );
  SAEDRVT14_ND2_CDC_1 U185 ( .A1(n1), .A2(n2), .X(n240) );
  SAEDRVT14_OAI31_0P75 U186 ( .A1(state[2]), .A2(n16), .A3(n15), .B(n14), .X(
        n235) );
  SAEDRVT14_INV_0P5 U187 ( .A(shift_tx[1]), .X(n69) );
  SAEDRVT14_AO21B_0P5 U188 ( .A1(n236), .A2(flash_addr[1]), .B(n68), .X(n231)
         );
  SAEDRVT14_INV_0P5 U189 ( .A(shift_tx[2]), .X(n72) );
  SAEDRVT14_AO21B_0P5 U190 ( .A1(n236), .A2(flash_addr[2]), .B(n71), .X(n230)
         );
  SAEDRVT14_INV_0P5 U191 ( .A(shift_tx[3]), .X(n75) );
  SAEDRVT14_AO21B_0P5 U192 ( .A1(n236), .A2(flash_addr[3]), .B(n74), .X(n229)
         );
  SAEDRVT14_INV_0P5 U193 ( .A(shift_tx[4]), .X(n78) );
  SAEDRVT14_AO21B_0P5 U194 ( .A1(n236), .A2(flash_addr[4]), .B(n77), .X(n228)
         );
  SAEDRVT14_INV_0P5 U195 ( .A(shift_tx[5]), .X(n81) );
  SAEDRVT14_AO21B_0P5 U196 ( .A1(n236), .A2(flash_addr[5]), .B(n80), .X(n227)
         );
  SAEDRVT14_INV_0P5 U197 ( .A(shift_tx[6]), .X(n84) );
  SAEDRVT14_AO21B_0P5 U198 ( .A1(n236), .A2(flash_addr[6]), .B(n83), .X(n226)
         );
  SAEDRVT14_INV_0P5 U199 ( .A(shift_tx[7]), .X(n87) );
  SAEDRVT14_AO21B_0P5 U200 ( .A1(n236), .A2(flash_addr[7]), .B(n86), .X(n225)
         );
  SAEDRVT14_INV_0P5 U201 ( .A(shift_tx[8]), .X(n90) );
  SAEDRVT14_AO21B_0P5 U202 ( .A1(n236), .A2(flash_addr[8]), .B(n89), .X(n224)
         );
  SAEDRVT14_INV_0P5 U203 ( .A(shift_tx[9]), .X(n93) );
  SAEDRVT14_AO21B_0P5 U204 ( .A1(n236), .A2(flash_addr[9]), .B(n92), .X(n223)
         );
  SAEDRVT14_INV_0P5 U205 ( .A(shift_tx[10]), .X(n96) );
  SAEDRVT14_AO21B_0P5 U206 ( .A1(n236), .A2(flash_addr[10]), .B(n95), .X(n222)
         );
  SAEDRVT14_INV_0P5 U207 ( .A(shift_tx[11]), .X(n99) );
  SAEDRVT14_AO21B_0P5 U208 ( .A1(n236), .A2(flash_addr[11]), .B(n98), .X(n221)
         );
  SAEDRVT14_INV_0P5 U209 ( .A(shift_tx[12]), .X(n102) );
  SAEDRVT14_AO21B_0P5 U210 ( .A1(n236), .A2(flash_addr[12]), .B(n101), .X(n220) );
  SAEDRVT14_INV_0P5 U211 ( .A(shift_tx[13]), .X(n105) );
  SAEDRVT14_AO21B_0P5 U212 ( .A1(n236), .A2(flash_addr[13]), .B(n104), .X(n219) );
  SAEDRVT14_INV_0P5 U213 ( .A(shift_tx[14]), .X(n108) );
  SAEDRVT14_AO21B_0P5 U214 ( .A1(n236), .A2(flash_addr[14]), .B(n107), .X(n218) );
  SAEDRVT14_INV_0P5 U215 ( .A(shift_tx[15]), .X(n111) );
  SAEDRVT14_AO21B_0P5 U216 ( .A1(n236), .A2(flash_addr[15]), .B(n110), .X(n217) );
  SAEDRVT14_INV_0P5 U217 ( .A(shift_tx[16]), .X(n114) );
  SAEDRVT14_AO21B_0P5 U218 ( .A1(n236), .A2(flash_addr[16]), .B(n113), .X(n216) );
  SAEDRVT14_INV_0P5 U219 ( .A(shift_tx[17]), .X(n117) );
  SAEDRVT14_AO21B_0P5 U220 ( .A1(n236), .A2(flash_addr[17]), .B(n116), .X(n215) );
  SAEDRVT14_INV_0P5 U221 ( .A(shift_tx[18]), .X(n120) );
  SAEDRVT14_AO21B_0P5 U222 ( .A1(n236), .A2(flash_addr[18]), .B(n119), .X(n214) );
  SAEDRVT14_INV_0P5 U223 ( .A(shift_tx[19]), .X(n123) );
  SAEDRVT14_AO21B_0P5 U224 ( .A1(n236), .A2(flash_addr[19]), .B(n122), .X(n213) );
  SAEDRVT14_INV_0P5 U225 ( .A(shift_tx[20]), .X(n126) );
  SAEDRVT14_AO21B_0P5 U226 ( .A1(n236), .A2(flash_addr[20]), .B(n125), .X(n212) );
  SAEDRVT14_INV_0P5 U227 ( .A(shift_tx[21]), .X(n130) );
  SAEDRVT14_AO21B_0P5 U228 ( .A1(n236), .A2(flash_addr[21]), .B(n129), .X(n211) );
  SAEDRVT14_INV_0P5 U229 ( .A(shift_tx[22]), .X(n133) );
  SAEDRVT14_AO21B_0P5 U230 ( .A1(n236), .A2(flash_addr[22]), .B(n132), .X(n210) );
  SAEDRVT14_AO21B_0P5 U231 ( .A1(n236), .A2(flash_addr[23]), .B(n137), .X(n209) );
  SAEDRVT14_AO32_U_0P5 U232 ( .A1(n238), .A2(n237), .A3(cmd[0]), .B1(n244), 
        .B2(shift_tx[24]), .X(n138) );
  SAEDRVT14_ND2_CDC_1 U233 ( .A1(n140), .A2(n139), .X(n208) );
  SAEDRVT14_AO32_U_0P5 U234 ( .A1(n238), .A2(n237), .A3(cmd[1]), .B1(n244), 
        .B2(shift_tx[25]), .X(n141) );
  SAEDRVT14_ND2_CDC_1 U235 ( .A1(n143), .A2(n142), .X(n207) );
  SAEDRVT14_AO32_U_0P5 U236 ( .A1(n238), .A2(n237), .A3(cmd[2]), .B1(n244), 
        .B2(shift_tx[26]), .X(n144) );
  SAEDRVT14_ND2_CDC_1 U237 ( .A1(n146), .A2(n145), .X(n206) );
  SAEDRVT14_AO32_U_0P5 U238 ( .A1(n238), .A2(n237), .A3(cmd[3]), .B1(n244), 
        .B2(shift_tx[27]), .X(n147) );
  SAEDRVT14_ND2_CDC_1 U239 ( .A1(n149), .A2(n148), .X(n205) );
  SAEDRVT14_AO32_U_0P5 U240 ( .A1(n238), .A2(n237), .A3(cmd[4]), .B1(n244), 
        .B2(shift_tx[28]), .X(n150) );
  SAEDRVT14_ND2_CDC_1 U241 ( .A1(n152), .A2(n151), .X(n204) );
  SAEDRVT14_AO32_U_0P5 U242 ( .A1(n238), .A2(n237), .A3(cmd[5]), .B1(n244), 
        .B2(shift_tx[29]), .X(n153) );
  SAEDRVT14_ND2_CDC_1 U243 ( .A1(n155), .A2(n154), .X(n203) );
  SAEDRVT14_AO32_U_0P5 U244 ( .A1(n238), .A2(n237), .A3(cmd[6]), .B1(n244), 
        .B2(shift_tx[30]), .X(n157) );
  SAEDRVT14_ND2_CDC_1 U245 ( .A1(n159), .A2(n158), .X(n202) );
  SAEDRVT14_AO21B_0P5 U246 ( .A1(bit_cnt[0]), .A2(n244), .B(n162), .X(n198) );
  SAEDRVT14_AO32_U_0P5 U247 ( .A1(n238), .A2(n237), .A3(cmd[7]), .B1(n244), 
        .B2(spi_mosi), .X(n239) );
  SAEDRVT14_ND2_CDC_1 U248 ( .A1(n242), .A2(n241), .X(n195) );
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
  wire   write_en_reg, valid_trans_reg, ctrl_reg_0_, spi_busy, n62, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197;
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
  SAEDRVT14_FDPRBQ_V2_0P5 valid_trans_reg_reg ( .D(n145), .CK(HCLK), .RD(
        HRESETn), .Q(valid_trans_reg) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_7_ ( .D(n144), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_6_ ( .D(n143), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_5_ ( .D(n142), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_4_ ( .D(n141), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_3_ ( .D(n140), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_2_ ( .D(n139), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_1_ ( .D(n138), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 addr_reg_reg_0_ ( .D(n137), .CK(HCLK), .RD(HRESETn), 
        .Q(addr_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 write_en_reg_reg ( .D(n136), .CK(HCLK), .RD(HRESETn), 
        .Q(write_en_reg) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_31_ ( .D(n133), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_30_ ( .D(n132), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_29_ ( .D(n131), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_28_ ( .D(n130), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_26_ ( .D(n128), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_25_ ( .D(n127), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_24_ ( .D(n126), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_23_ ( .D(n125), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_22_ ( .D(n124), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_21_ ( .D(n123), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_20_ ( .D(n122), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_19_ ( .D(n121), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_18_ ( .D(n120), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_17_ ( .D(n119), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_16_ ( .D(n118), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_15_ ( .D(n117), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_14_ ( .D(n116), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_13_ ( .D(n115), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_11_ ( .D(n113), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_10_ ( .D(n112), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_9_ ( .D(n111), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_8_ ( .D(n110), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_7_ ( .D(n109), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_6_ ( .D(n108), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_5_ ( .D(n107), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_4_ ( .D(n106), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_3_ ( .D(n105), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_2_ ( .D(n104), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_1_ ( .D(n103), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 tx_data_reg_reg_0_ ( .D(n134), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ctrl_reg_reg_0_ ( .D(n135), .CK(HCLK), .RD(HRESETn), 
        .Q(ctrl_reg_0_) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_7_ ( .D(n102), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_5_ ( .D(n100), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_4_ ( .D(n99), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_3_ ( .D(n98), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_2_ ( .D(n97), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_1_ ( .D(n96), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_reg_reg_0_ ( .D(n95), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_31_ ( .D(n94), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_30_ ( .D(n93), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_29_ ( .D(n92), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_28_ ( .D(n91), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_27_ ( .D(n90), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_26_ ( .D(n89), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_25_ ( .D(n88), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_24_ ( .D(n87), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_22_ ( .D(n85), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_21_ ( .D(n84), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_20_ ( .D(n83), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_19_ ( .D(n82), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_18_ ( .D(n81), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_17_ ( .D(n80), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_16_ ( .D(n79), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_15_ ( .D(n78), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_14_ ( .D(n77), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_13_ ( .D(n76), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_12_ ( .D(n75), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_11_ ( .D(n74), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_10_ ( .D(n73), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_9_ ( .D(n72), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_7_ ( .D(n70), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_6_ ( .D(n69), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_5_ ( .D(n68), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_4_ ( .D(n67), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_3_ ( .D(n66), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_2_ ( .D(n65), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_1_ ( .D(n64), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 flash_addr_reg_reg_0_ ( .D(n62), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[0]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 tx_data_reg_reg_27_ ( .D(n129), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[27]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 tx_data_reg_reg_12_ ( .D(n114), .CK(HCLK), .RD(
        HRESETn), .Q(tx_data_reg[12]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 cmd_reg_reg_6_ ( .D(n101), .CK(HCLK), .RD(HRESETn), 
        .Q(cmd_reg[6]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 flash_addr_reg_reg_23_ ( .D(n86), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[23]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 flash_addr_reg_reg_8_ ( .D(n71), .CK(HCLK), .RD(
        HRESETn), .Q(flash_addr_reg[8]) );
  SAEDRVT14_TIE0_V1_2 U181 ( .X(HRESP[1]) );
  SAEDRVT14_TIE1_4 U182 ( .X(HREADYOUT) );
  SAEDRVT14_OAI21_0P5 U183 ( .A1(n190), .A2(n189), .B(n188), .X(HRDATA[1]) );
  SAEDRVT14_MUX2_U_0P5 U184 ( .D0(flash_addr_reg[9]), .D1(HWDATA[9]), .S(n197), 
        .X(n72) );
  SAEDRVT14_MUX2_U_0P5 U185 ( .D0(flash_addr_reg[11]), .D1(HWDATA[11]), .S(
        n197), .X(n74) );
  SAEDRVT14_MUX2_U_0P5 U186 ( .D0(flash_addr_reg[12]), .D1(HWDATA[12]), .S(
        n197), .X(n75) );
  SAEDRVT14_MUX2_U_0P5 U187 ( .D0(flash_addr_reg[8]), .D1(HWDATA[8]), .S(n197), 
        .X(n71) );
  SAEDRVT14_MUX2_U_0P5 U188 ( .D0(flash_addr_reg[13]), .D1(HWDATA[13]), .S(
        n197), .X(n76) );
  SAEDRVT14_AO22_0P5 U189 ( .A1(n154), .A2(flash_addr_reg[7]), .B1(n197), .B2(
        HWDATA[7]), .X(n70) );
  SAEDRVT14_MUX2_U_0P5 U190 ( .D0(flash_addr_reg[14]), .D1(HWDATA[14]), .S(
        n197), .X(n77) );
  SAEDRVT14_MUX2_U_0P5 U191 ( .D0(flash_addr_reg[15]), .D1(HWDATA[15]), .S(
        n197), .X(n78) );
  SAEDRVT14_OAI22_0P5 U192 ( .A1(n197), .A2(n152), .B1(n154), .B2(n160), .X(
        n69) );
  SAEDRVT14_MUX2_U_0P5 U193 ( .D0(flash_addr_reg[16]), .D1(HWDATA[16]), .S(
        n197), .X(n79) );
  SAEDRVT14_MUX2_U_0P5 U194 ( .D0(flash_addr_reg[17]), .D1(HWDATA[17]), .S(
        n197), .X(n80) );
  SAEDRVT14_OAI22_0P5 U195 ( .A1(n197), .A2(n153), .B1(n154), .B2(n165), .X(
        n68) );
  SAEDRVT14_MUX2_U_0P5 U196 ( .D0(flash_addr_reg[18]), .D1(HWDATA[18]), .S(
        n197), .X(n81) );
  SAEDRVT14_OAI22_0P5 U197 ( .A1(n197), .A2(n151), .B1(n154), .B2(n158), .X(
        n67) );
  SAEDRVT14_OAI22_0P5 U198 ( .A1(n197), .A2(n149), .B1(n154), .B2(n162), .X(
        n66) );
  SAEDRVT14_OAI22_0P5 U199 ( .A1(n197), .A2(n150), .B1(n154), .B2(n156), .X(
        n65) );
  SAEDRVT14_MUX2_U_0P5 U200 ( .D0(flash_addr_reg[19]), .D1(HWDATA[19]), .S(
        n197), .X(n82) );
  SAEDRVT14_MUX2_U_0P5 U201 ( .D0(flash_addr_reg[20]), .D1(HWDATA[20]), .S(
        n197), .X(n83) );
  SAEDRVT14_MUX2_U_0P5 U202 ( .D0(flash_addr_reg[21]), .D1(HWDATA[21]), .S(
        n197), .X(n84) );
  SAEDRVT14_OAI22_0P5 U203 ( .A1(n197), .A2(n184), .B1(n154), .B2(n164), .X(
        n64) );
  SAEDRVT14_MUX2_U_0P5 U204 ( .D0(flash_addr_reg[22]), .D1(HWDATA[22]), .S(
        n197), .X(n85) );
  SAEDRVT14_OAI22_0P5 U205 ( .A1(n197), .A2(n178), .B1(n154), .B2(n167), .X(
        n62) );
  SAEDRVT14_MUX2_U_0P5 U206 ( .D0(flash_addr_reg[23]), .D1(HWDATA[23]), .S(
        n197), .X(n86) );
  SAEDRVT14_MUX2_U_0P5 U207 ( .D0(flash_addr_reg[24]), .D1(HWDATA[24]), .S(
        n197), .X(n87) );
  SAEDRVT14_MUX2_U_0P5 U208 ( .D0(flash_addr_reg[25]), .D1(HWDATA[25]), .S(
        n197), .X(n88) );
  SAEDRVT14_MUX2_U_0P5 U209 ( .D0(flash_addr_reg[26]), .D1(HWDATA[26]), .S(
        n197), .X(n89) );
  SAEDRVT14_MUX2_U_0P5 U210 ( .D0(flash_addr_reg[27]), .D1(HWDATA[27]), .S(
        n197), .X(n90) );
  SAEDRVT14_MUX2_U_0P5 U211 ( .D0(flash_addr_reg[28]), .D1(HWDATA[28]), .S(
        n197), .X(n91) );
  SAEDRVT14_MUX2_U_0P5 U212 ( .D0(flash_addr_reg[29]), .D1(HWDATA[29]), .S(
        n197), .X(n92) );
  SAEDRVT14_OAI21_0P5 U213 ( .A1(n181), .A2(n190), .B(n180), .X(HRDATA[0]) );
  SAEDRVT14_MUX2_U_0P5 U214 ( .D0(flash_addr_reg[30]), .D1(HWDATA[30]), .S(
        n197), .X(n93) );
  SAEDRVT14_MUX2_U_0P5 U215 ( .D0(flash_addr_reg[31]), .D1(HWDATA[31]), .S(
        n197), .X(n94) );
  SAEDRVT14_OAI22_0P5 U216 ( .A1(n196), .A2(n177), .B1(n168), .B2(n167), .X(
        n95) );
  SAEDRVT14_OAI22_0P5 U217 ( .A1(n196), .A2(n166), .B1(n168), .B2(n165), .X(
        n100) );
  SAEDRVT14_MUX2_U_0P5 U218 ( .D0(flash_addr_reg[10]), .D1(HWDATA[10]), .S(
        n197), .X(n73) );
  SAEDRVT14_OAI22_0P5 U219 ( .A1(n196), .A2(n159), .B1(n168), .B2(n158), .X(
        n99) );
  SAEDRVT14_MUX2_U_0P5 U220 ( .D0(cmd_reg[7]), .D1(HWDATA[7]), .S(n196), .X(
        n102) );
  SAEDRVT14_OAI22_0P5 U221 ( .A1(n196), .A2(n182), .B1(n168), .B2(n164), .X(
        n96) );
  SAEDRVT14_OAI22_0P5 U222 ( .A1(n196), .A2(n161), .B1(n168), .B2(n160), .X(
        n101) );
  SAEDRVT14_OAI22_0P5 U223 ( .A1(n196), .A2(n163), .B1(n168), .B2(n162), .X(
        n98) );
  SAEDRVT14_OAI22_0P5 U224 ( .A1(n196), .A2(n157), .B1(n168), .B2(n156), .X(
        n97) );
  SAEDRVT14_AO22_0P5 U225 ( .A1(n173), .A2(flash_addr_reg[15]), .B1(n187), 
        .B2(rx_data_wire[15]), .X(HRDATA[15]) );
  SAEDRVT14_AO222_1 U226 ( .A1(n173), .A2(flash_addr_reg[7]), .B1(n187), .B2(
        rx_data_wire[7]), .C1(n172), .C2(cmd_reg[7]), .X(HRDATA[7]) );
  SAEDRVT14_AO222_1 U227 ( .A1(n173), .A2(flash_addr_reg[4]), .B1(n187), .B2(
        rx_data_wire[4]), .C1(n172), .C2(cmd_reg[4]), .X(HRDATA[4]) );
  SAEDRVT14_AO22_0P5 U228 ( .A1(n173), .A2(flash_addr_reg[8]), .B1(n187), .B2(
        rx_data_wire[8]), .X(HRDATA[8]) );
  SAEDRVT14_AO222_1 U229 ( .A1(n173), .A2(flash_addr_reg[6]), .B1(n187), .B2(
        rx_data_wire[6]), .C1(n172), .C2(cmd_reg[6]), .X(HRDATA[6]) );
  SAEDRVT14_AO22_0P5 U230 ( .A1(n173), .A2(flash_addr_reg[16]), .B1(n187), 
        .B2(rx_data_wire[16]), .X(HRDATA[16]) );
  SAEDRVT14_AO222_1 U231 ( .A1(n173), .A2(flash_addr_reg[5]), .B1(n187), .B2(
        rx_data_wire[5]), .C1(n172), .C2(cmd_reg[5]), .X(HRDATA[5]) );
  SAEDRVT14_AO22_0P5 U232 ( .A1(n173), .A2(flash_addr_reg[18]), .B1(n187), 
        .B2(rx_data_wire[18]), .X(HRDATA[18]) );
  SAEDRVT14_AO22_0P5 U233 ( .A1(n173), .A2(flash_addr_reg[14]), .B1(n187), 
        .B2(rx_data_wire[14]), .X(HRDATA[14]) );
  SAEDRVT14_AO22_0P5 U234 ( .A1(n173), .A2(flash_addr_reg[11]), .B1(n187), 
        .B2(rx_data_wire[11]), .X(HRDATA[11]) );
  SAEDRVT14_AO22_0P5 U235 ( .A1(n173), .A2(flash_addr_reg[13]), .B1(n187), 
        .B2(rx_data_wire[13]), .X(HRDATA[13]) );
  SAEDRVT14_INV_0P5 U236 ( .A(n154), .X(n197) );
  SAEDRVT14_AO22_0P5 U237 ( .A1(n173), .A2(flash_addr_reg[17]), .B1(n187), 
        .B2(rx_data_wire[17]), .X(HRDATA[17]) );
  SAEDRVT14_INV_0P5 U238 ( .A(n168), .X(n196) );
  SAEDRVT14_AO22_0P5 U239 ( .A1(n173), .A2(flash_addr_reg[12]), .B1(n187), 
        .B2(rx_data_wire[12]), .X(HRDATA[12]) );
  SAEDRVT14_AO22_0P5 U240 ( .A1(n173), .A2(flash_addr_reg[10]), .B1(n187), 
        .B2(rx_data_wire[10]), .X(HRDATA[10]) );
  SAEDRVT14_AO22_0P5 U241 ( .A1(n173), .A2(flash_addr_reg[9]), .B1(n187), .B2(
        rx_data_wire[9]), .X(HRDATA[9]) );
  SAEDRVT14_AO22_0P5 U242 ( .A1(n173), .A2(flash_addr_reg[20]), .B1(n187), 
        .B2(rx_data_wire[20]), .X(HRDATA[20]) );
  SAEDRVT14_AOI21_0P75 U243 ( .A1(n187), .A2(rx_data_wire[0]), .B(n179), .X(
        n180) );
  SAEDRVT14_AO22_0P5 U244 ( .A1(n173), .A2(flash_addr_reg[27]), .B1(n187), 
        .B2(rx_data_wire[27]), .X(HRDATA[27]) );
  SAEDRVT14_AO22_0P5 U245 ( .A1(n173), .A2(flash_addr_reg[19]), .B1(n187), 
        .B2(rx_data_wire[19]), .X(HRDATA[19]) );
  SAEDRVT14_AO22_0P5 U246 ( .A1(n173), .A2(flash_addr_reg[21]), .B1(n187), 
        .B2(rx_data_wire[21]), .X(HRDATA[21]) );
  SAEDRVT14_AO222_1 U247 ( .A1(n173), .A2(flash_addr_reg[2]), .B1(n187), .B2(
        rx_data_wire[2]), .C1(n172), .C2(cmd_reg[2]), .X(HRDATA[2]) );
  SAEDRVT14_AO222_1 U248 ( .A1(n173), .A2(flash_addr_reg[3]), .B1(n187), .B2(
        rx_data_wire[3]), .C1(n172), .C2(cmd_reg[3]), .X(HRDATA[3]) );
  SAEDRVT14_AO22_0P5 U249 ( .A1(n173), .A2(flash_addr_reg[28]), .B1(n187), 
        .B2(rx_data_wire[28]), .X(HRDATA[28]) );
  SAEDRVT14_AO22_0P5 U250 ( .A1(n173), .A2(flash_addr_reg[29]), .B1(n187), 
        .B2(rx_data_wire[29]), .X(HRDATA[29]) );
  SAEDRVT14_AOI21_0P75 U251 ( .A1(n187), .A2(rx_data_wire[1]), .B(n186), .X(
        n188) );
  SAEDRVT14_AO22_0P5 U252 ( .A1(n173), .A2(flash_addr_reg[30]), .B1(n187), 
        .B2(rx_data_wire[30]), .X(HRDATA[30]) );
  SAEDRVT14_AO22_0P5 U253 ( .A1(n173), .A2(flash_addr_reg[31]), .B1(n187), 
        .B2(rx_data_wire[31]), .X(HRDATA[31]) );
  SAEDRVT14_AO22_0P5 U254 ( .A1(n173), .A2(flash_addr_reg[26]), .B1(n187), 
        .B2(rx_data_wire[26]), .X(HRDATA[26]) );
  SAEDRVT14_AO22_0P5 U255 ( .A1(n173), .A2(flash_addr_reg[22]), .B1(n187), 
        .B2(rx_data_wire[22]), .X(HRDATA[22]) );
  SAEDRVT14_AO22_0P5 U256 ( .A1(n173), .A2(flash_addr_reg[23]), .B1(n187), 
        .B2(rx_data_wire[23]), .X(HRDATA[23]) );
  SAEDRVT14_AO22_0P5 U257 ( .A1(n173), .A2(flash_addr_reg[25]), .B1(n187), 
        .B2(rx_data_wire[25]), .X(HRDATA[25]) );
  SAEDRVT14_AO22_0P5 U258 ( .A1(n173), .A2(flash_addr_reg[24]), .B1(n187), 
        .B2(rx_data_wire[24]), .X(HRDATA[24]) );
  SAEDRVT14_MUX2_U_0P5 U259 ( .D0(tx_data_reg[23]), .D1(HWDATA[23]), .S(n195), 
        .X(n125) );
  SAEDRVT14_MUX2_U_0P5 U260 ( .D0(tx_data_reg[22]), .D1(HWDATA[22]), .S(n195), 
        .X(n124) );
  SAEDRVT14_MUX2_U_0P5 U261 ( .D0(tx_data_reg[21]), .D1(HWDATA[21]), .S(n195), 
        .X(n123) );
  SAEDRVT14_MUX2_U_0P5 U262 ( .D0(tx_data_reg[11]), .D1(HWDATA[11]), .S(n195), 
        .X(n113) );
  SAEDRVT14_INV_0P5 U263 ( .A(n183), .X(n172) );
  SAEDRVT14_MUX2_U_0P5 U264 ( .D0(tx_data_reg[8]), .D1(HWDATA[8]), .S(n195), 
        .X(n110) );
  SAEDRVT14_MUX2_U_0P5 U265 ( .D0(tx_data_reg[31]), .D1(HWDATA[31]), .S(n195), 
        .X(n133) );
  SAEDRVT14_ND2_CDC_1 U266 ( .A1(n170), .A2(n174), .X(n154) );
  SAEDRVT14_MUX2_U_0P5 U267 ( .D0(tx_data_reg[25]), .D1(HWDATA[25]), .S(n195), 
        .X(n127) );
  SAEDRVT14_MUX2_U_0P5 U268 ( .D0(tx_data_reg[13]), .D1(HWDATA[13]), .S(n195), 
        .X(n115) );
  SAEDRVT14_MUX2_U_0P5 U269 ( .D0(tx_data_reg[19]), .D1(HWDATA[19]), .S(n195), 
        .X(n121) );
  SAEDRVT14_MUX2_U_0P5 U270 ( .D0(tx_data_reg[10]), .D1(HWDATA[10]), .S(n195), 
        .X(n112) );
  SAEDRVT14_MUX2_U_0P5 U271 ( .D0(tx_data_reg[18]), .D1(HWDATA[18]), .S(n195), 
        .X(n120) );
  SAEDRVT14_MUX2_U_0P5 U272 ( .D0(tx_data_reg[6]), .D1(HWDATA[6]), .S(n195), 
        .X(n108) );
  SAEDRVT14_MUX2_U_0P5 U273 ( .D0(tx_data_reg[5]), .D1(HWDATA[5]), .S(n195), 
        .X(n107) );
  SAEDRVT14_MUX2_U_0P5 U274 ( .D0(tx_data_reg[9]), .D1(HWDATA[9]), .S(n195), 
        .X(n111) );
  SAEDRVT14_MUX2_U_0P5 U275 ( .D0(tx_data_reg[20]), .D1(HWDATA[20]), .S(n195), 
        .X(n122) );
  SAEDRVT14_MUX2_U_0P5 U276 ( .D0(tx_data_reg[4]), .D1(HWDATA[4]), .S(n195), 
        .X(n106) );
  SAEDRVT14_MUX2_U_0P5 U277 ( .D0(tx_data_reg[17]), .D1(HWDATA[17]), .S(n195), 
        .X(n119) );
  SAEDRVT14_MUX2_U_0P5 U278 ( .D0(tx_data_reg[26]), .D1(HWDATA[26]), .S(n195), 
        .X(n128) );
  SAEDRVT14_MUX2_U_0P5 U279 ( .D0(tx_data_reg[14]), .D1(HWDATA[14]), .S(n195), 
        .X(n116) );
  SAEDRVT14_OAI22_0P5 U280 ( .A1(n178), .A2(n185), .B1(n177), .B2(n183), .X(
        n179) );
  SAEDRVT14_MUX2_U_0P5 U281 ( .D0(tx_data_reg[30]), .D1(HWDATA[30]), .S(n195), 
        .X(n132) );
  SAEDRVT14_ND2_CDC_1 U282 ( .A1(n171), .A2(n174), .X(n168) );
  SAEDRVT14_MUX2_U_0P5 U283 ( .D0(tx_data_reg[24]), .D1(HWDATA[24]), .S(n195), 
        .X(n126) );
  SAEDRVT14_MUX2_U_0P5 U284 ( .D0(tx_data_reg[12]), .D1(HWDATA[12]), .S(n195), 
        .X(n114) );
  SAEDRVT14_MUX2_U_0P5 U285 ( .D0(tx_data_reg[27]), .D1(HWDATA[27]), .S(n195), 
        .X(n129) );
  SAEDRVT14_OAI22_0P5 U286 ( .A1(n185), .A2(n184), .B1(n183), .B2(n182), .X(
        n186) );
  SAEDRVT14_MUX2_U_0P5 U287 ( .D0(tx_data_reg[7]), .D1(HWDATA[7]), .S(n195), 
        .X(n109) );
  SAEDRVT14_AN3_0P5 U288 ( .A1(n176), .A2(n174), .A3(HWDATA[0]), .X(n135) );
  SAEDRVT14_MUX2_U_0P5 U289 ( .D0(tx_data_reg[15]), .D1(HWDATA[15]), .S(n195), 
        .X(n117) );
  SAEDRVT14_MUX2_U_0P5 U290 ( .D0(tx_data_reg[3]), .D1(HWDATA[3]), .S(n195), 
        .X(n105) );
  SAEDRVT14_MUX2_U_0P5 U291 ( .D0(tx_data_reg[16]), .D1(HWDATA[16]), .S(n195), 
        .X(n118) );
  SAEDRVT14_MUX2_U_0P5 U292 ( .D0(tx_data_reg[0]), .D1(HWDATA[0]), .S(n195), 
        .X(n134) );
  SAEDRVT14_MUX2_U_0P5 U293 ( .D0(tx_data_reg[2]), .D1(HWDATA[2]), .S(n195), 
        .X(n104) );
  SAEDRVT14_MUX2_U_0P5 U294 ( .D0(tx_data_reg[29]), .D1(HWDATA[29]), .S(n195), 
        .X(n131) );
  SAEDRVT14_MUX2_U_0P5 U295 ( .D0(tx_data_reg[28]), .D1(HWDATA[28]), .S(n195), 
        .X(n130) );
  SAEDRVT14_MUX2_U_0P5 U296 ( .D0(tx_data_reg[1]), .D1(HWDATA[1]), .S(n195), 
        .X(n103) );
  SAEDRVT14_INV_0P5 U297 ( .A(n185), .X(n173) );
  SAEDRVT14_AN2B_MM_1 U298 ( .B(n175), .A(n194), .X(n187) );
  SAEDRVT14_ND2_CDC_1 U299 ( .A1(n175), .A2(n171), .X(n183) );
  SAEDRVT14_INV_0P5 U300 ( .A(n193), .X(n174) );
  SAEDRVT14_ND2_CDC_1 U301 ( .A1(n176), .A2(n175), .X(n190) );
  SAEDRVT14_ND2_CDC_1 U302 ( .A1(n175), .A2(n170), .X(n185) );
  SAEDRVT14_NR2_1 U303 ( .A1(n194), .A2(n193), .X(n195) );
  SAEDRVT14_NR2_1 U304 ( .A1(write_en_reg), .A2(n169), .X(n175) );
  SAEDRVT14_INV_0P5 U305 ( .A(spi_busy), .X(n189) );
  SAEDRVT14_NR2_1 U306 ( .A1(addr_reg[6]), .A2(n146), .X(n147) );
  SAEDRVT14_NR2_1 U307 ( .A1(addr_reg[3]), .A2(n155), .X(n171) );
  SAEDRVT14_OAI21_0P5 U308 ( .A1(HREADY), .A2(n191), .B(n192), .X(n145) );
  SAEDRVT14_INV_0P5 U309 ( .A(cmd_reg[3]), .X(n163) );
  SAEDRVT14_NR2_1 U310 ( .A1(addr_reg[1]), .A2(addr_reg[4]), .X(n148) );
  SAEDRVT14_INV_0P5 U311 ( .A(cmd_reg[4]), .X(n159) );
  SAEDRVT14_INV_0P5 U312 ( .A(cmd_reg[1]), .X(n182) );
  SAEDRVT14_INV_0P5 U313 ( .A(cmd_reg[5]), .X(n166) );
  SAEDRVT14_INV_0P5 U314 ( .A(flash_addr_reg[1]), .X(n184) );
  SAEDRVT14_INV_0P5 U315 ( .A(cmd_reg[6]), .X(n161) );
  SAEDRVT14_ND2_CDC_1 U316 ( .A1(addr_reg[2]), .A2(addr_reg[3]), .X(n194) );
  SAEDRVT14_MUX2_U_0P5 U317 ( .D0(HADDR[3]), .D1(addr_reg[3]), .S(n192), .X(
        n140) );
  SAEDRVT14_INV_0P5 U318 ( .A(cmd_reg[2]), .X(n157) );
  SAEDRVT14_INV_0P5 U319 ( .A(flash_addr_reg[2]), .X(n150) );
  SAEDRVT14_MUX2_U_0P5 U320 ( .D0(HADDR[2]), .D1(addr_reg[2]), .S(n192), .X(
        n139) );
  SAEDRVT14_MUX2_U_0P5 U321 ( .D0(HADDR[0]), .D1(addr_reg[0]), .S(n192), .X(
        n137) );
  SAEDRVT14_MUX2_U_0P5 U322 ( .D0(HADDR[4]), .D1(addr_reg[4]), .S(n192), .X(
        n141) );
  SAEDRVT14_INV_0P5 U323 ( .A(ctrl_reg_0_), .X(n181) );
  SAEDRVT14_INV_0P5 U324 ( .A(flash_addr_reg[5]), .X(n153) );
  SAEDRVT14_MUX2_U_0P5 U325 ( .D0(HADDR[5]), .D1(addr_reg[5]), .S(n192), .X(
        n142) );
  SAEDRVT14_INV_0P5 U326 ( .A(flash_addr_reg[6]), .X(n152) );
  SAEDRVT14_NR2_1 U327 ( .A1(addr_reg[2]), .A2(addr_reg[3]), .X(n176) );
  SAEDRVT14_INV_0P5 U328 ( .A(cmd_reg[0]), .X(n177) );
  SAEDRVT14_MUX2_U_0P5 U329 ( .D0(HADDR[1]), .D1(addr_reg[1]), .S(n192), .X(
        n138) );
  SAEDRVT14_INV_0P5 U330 ( .A(flash_addr_reg[3]), .X(n149) );
  SAEDRVT14_INV_0P5 U331 ( .A(addr_reg[2]), .X(n155) );
  SAEDRVT14_MUX2_U_0P5 U332 ( .D0(HADDR[6]), .D1(addr_reg[6]), .S(n192), .X(
        n143) );
  SAEDRVT14_INV_0P5 U333 ( .A(flash_addr_reg[0]), .X(n178) );
  SAEDRVT14_MUX2_U_0P5 U334 ( .D0(HADDR[7]), .D1(addr_reg[7]), .S(n192), .X(
        n144) );
  SAEDRVT14_MUX2_U_0P5 U335 ( .D0(HWRITE), .D1(write_en_reg), .S(n192), .X(
        n136) );
  SAEDRVT14_INV_0P5 U336 ( .A(flash_addr_reg[4]), .X(n151) );
  SAEDRVT14_INV_0P5 U337 ( .A(HWDATA[0]), .X(n167) );
  SAEDRVT14_INV_0P5 U338 ( .A(HWDATA[1]), .X(n164) );
  SAEDRVT14_INV_0P5 U339 ( .A(HWDATA[2]), .X(n156) );
  SAEDRVT14_INV_0P5 U340 ( .A(HWDATA[3]), .X(n162) );
  SAEDRVT14_INV_0P5 U341 ( .A(HWDATA[4]), .X(n158) );
  SAEDRVT14_INV_0P5 U342 ( .A(HWDATA[5]), .X(n165) );
  SAEDRVT14_INV_0P5 U343 ( .A(HWDATA[6]), .X(n160) );
  SAEDRVT14_ND3_0P5 U344 ( .A1(HREADY), .A2(HSEL), .A3(HTRANS[1]), .X(n192) );
  SAEDRVT14_AN2_MM_0P5 U345 ( .A1(n155), .A2(addr_reg[3]), .X(n170) );
  SAEDRVT14_INV_0P5 U346 ( .A(valid_trans_reg), .X(n191) );
  SAEDRVT14_OR4_1 U347 ( .A1(addr_reg[0]), .A2(addr_reg[5]), .A3(addr_reg[7]), 
        .A4(n191), .X(n146) );
  SAEDRVT14_ND2_CDC_1 U348 ( .A1(n148), .A2(n147), .X(n169) );
  SAEDRVT14_ND2B_U_0P5 U349 ( .A(n169), .B(write_en_reg), .X(n193) );
endmodule

