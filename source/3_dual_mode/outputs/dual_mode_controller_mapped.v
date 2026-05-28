/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP2
// Date      : Thu May 28 16:59:46 2026
/////////////////////////////////////////////////////////////


module qspi_fsm ( clk, rst_n, start, write_op, addr_in, tx_data, tx_empty, 
        done, tx_pop, qspi_cs_n, qspi_clk, qspi_io_oe, qspi_io_out, rx_data, 
        qspi_io_in );
  input [31:0] addr_in;
  input [31:0] tx_data;
  output [3:0] qspi_io_out;
  output [31:0] rx_data;
  input [3:0] qspi_io_in;
  input clk, rst_n, start, write_op, tx_empty;
  output done, tx_pop, qspi_cs_n, qspi_clk, qspi_io_oe;
  wire   xip_active, N64, N65, N66, N67, N68, N69, N70, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370;
  wire   [3:0] state;
  wire   [5:0] cnt;
  wire   [3:0] next;
  wire   [31:0] sreg;
  wire   [5:0] cmd_latched;

  SAEDRVT14_FDPRBQ_V2_0P5 xip_active_reg ( .D(n354), .CK(clk), .RD(rst_n), .Q(
        xip_active) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_2_ ( .D(next[2]), .CK(clk), .RD(rst_n), 
        .Q(state[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_0_ ( .D(N64), .CK(clk), .RD(rst_n), .Q(
        cnt[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_1_ ( .D(N65), .CK(clk), .RD(rst_n), .Q(
        cnt[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_3_ ( .D(N67), .CK(clk), .RD(rst_n), .Q(
        cnt[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_4_ ( .D(N68), .CK(clk), .RD(rst_n), .Q(
        cnt[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_5_ ( .D(N69), .CK(clk), .RD(rst_n), .Q(
        cnt[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_3_ ( .D(next[3]), .CK(clk), .RD(rst_n), 
        .Q(state[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_1_ ( .D(next[1]), .CK(clk), .RD(rst_n), 
        .Q(state[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_latched_reg_0_ ( .D(n352), .CK(clk), .RD(rst_n), 
        .Q(cmd_latched[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_latched_reg_4_ ( .D(n349), .CK(clk), .RD(rst_n), 
        .Q(cmd_latched[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_latched_reg_2_ ( .D(n351), .CK(clk), .RD(rst_n), 
        .Q(cmd_latched[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_latched_reg_1_ ( .D(n353), .CK(clk), .RD(rst_n), 
        .Q(cmd_latched[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_latched_reg_3_ ( .D(n350), .CK(clk), .RD(rst_n), 
        .Q(cmd_latched[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cmd_latched_reg_5_ ( .D(n348), .CK(clk), .RD(rst_n), 
        .Q(cmd_latched[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_0_ ( .D(n347), .CK(clk), .RD(rst_n), .Q(
        rx_data[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_4_ ( .D(n346), .CK(clk), .RD(rst_n), .Q(
        rx_data[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_8_ ( .D(n345), .CK(clk), .RD(rst_n), .Q(
        rx_data[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_16_ ( .D(n343), .CK(clk), .RD(rst_n), .Q(
        rx_data[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_20_ ( .D(n342), .CK(clk), .RD(rst_n), .Q(
        rx_data[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_24_ ( .D(n341), .CK(clk), .RD(rst_n), .Q(
        rx_data[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_28_ ( .D(n340), .CK(clk), .RD(rst_n), .Q(
        rx_data[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_3_ ( .D(n339), .CK(clk), .RD(rst_n), .Q(
        rx_data[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_7_ ( .D(n338), .CK(clk), .RD(rst_n), .Q(
        rx_data[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_11_ ( .D(n337), .CK(clk), .RD(rst_n), .Q(
        rx_data[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_15_ ( .D(n336), .CK(clk), .RD(rst_n), .Q(
        rx_data[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_19_ ( .D(n335), .CK(clk), .RD(rst_n), .Q(
        rx_data[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_23_ ( .D(n334), .CK(clk), .RD(rst_n), .Q(
        rx_data[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_27_ ( .D(n333), .CK(clk), .RD(rst_n), .Q(
        rx_data[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_31_ ( .D(n332), .CK(clk), .RD(rst_n), .Q(
        rx_data[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_2_ ( .D(n331), .CK(clk), .RD(rst_n), .Q(
        rx_data[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_6_ ( .D(n330), .CK(clk), .RD(rst_n), .Q(
        rx_data[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_14_ ( .D(n328), .CK(clk), .RD(rst_n), .Q(
        rx_data[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_18_ ( .D(n327), .CK(clk), .RD(rst_n), .Q(
        rx_data[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_22_ ( .D(n326), .CK(clk), .RD(rst_n), .Q(
        rx_data[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_26_ ( .D(n325), .CK(clk), .RD(rst_n), .Q(
        rx_data[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_30_ ( .D(n324), .CK(clk), .RD(rst_n), .Q(
        rx_data[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_1_ ( .D(n323), .CK(clk), .RD(rst_n), .Q(
        rx_data[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_5_ ( .D(n322), .CK(clk), .RD(rst_n), .Q(
        rx_data[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_9_ ( .D(n321), .CK(clk), .RD(rst_n), .Q(
        rx_data[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_13_ ( .D(n320), .CK(clk), .RD(rst_n), .Q(
        rx_data[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_17_ ( .D(n319), .CK(clk), .RD(rst_n), .Q(
        rx_data[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_21_ ( .D(n318), .CK(clk), .RD(rst_n), .Q(
        rx_data[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_25_ ( .D(n317), .CK(clk), .RD(rst_n), .Q(
        rx_data[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_29_ ( .D(n316), .CK(clk), .RD(rst_n), .Q(
        rx_data[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_0_ ( .D(n315), .CK(clk), .RD(rst_n), .Q(
        sreg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_2_ ( .D(n285), .CK(clk), .RD(rst_n), .Q(
        sreg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_3_ ( .D(n286), .CK(clk), .RD(rst_n), .Q(
        sreg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_4_ ( .D(n287), .CK(clk), .RD(rst_n), .Q(
        sreg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_5_ ( .D(n288), .CK(clk), .RD(rst_n), .Q(
        sreg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_6_ ( .D(n289), .CK(clk), .RD(rst_n), .Q(
        sreg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_7_ ( .D(n290), .CK(clk), .RD(rst_n), .Q(
        sreg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_8_ ( .D(n291), .CK(clk), .RD(rst_n), .Q(
        sreg[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_9_ ( .D(n292), .CK(clk), .RD(rst_n), .Q(
        sreg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_10_ ( .D(n293), .CK(clk), .RD(rst_n), .Q(
        sreg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_11_ ( .D(n294), .CK(clk), .RD(rst_n), .Q(
        sreg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_12_ ( .D(n295), .CK(clk), .RD(rst_n), .Q(
        sreg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_13_ ( .D(n296), .CK(clk), .RD(rst_n), .Q(
        sreg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_14_ ( .D(n297), .CK(clk), .RD(rst_n), .Q(
        sreg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_15_ ( .D(n298), .CK(clk), .RD(rst_n), .Q(
        sreg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_17_ ( .D(n300), .CK(clk), .RD(rst_n), .Q(
        sreg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_18_ ( .D(n301), .CK(clk), .RD(rst_n), .Q(
        sreg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_19_ ( .D(n302), .CK(clk), .RD(rst_n), .Q(
        sreg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_20_ ( .D(n303), .CK(clk), .RD(rst_n), .Q(
        sreg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_21_ ( .D(n304), .CK(clk), .RD(rst_n), .Q(
        sreg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_22_ ( .D(n305), .CK(clk), .RD(rst_n), .Q(
        sreg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_23_ ( .D(n306), .CK(clk), .RD(rst_n), .Q(
        sreg[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_24_ ( .D(n307), .CK(clk), .RD(rst_n), .Q(
        sreg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_25_ ( .D(n308), .CK(clk), .RD(rst_n), .Q(
        sreg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_26_ ( .D(n309), .CK(clk), .RD(rst_n), .Q(
        sreg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_27_ ( .D(n310), .CK(clk), .RD(rst_n), .Q(
        sreg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_28_ ( .D(n311), .CK(clk), .RD(rst_n), .Q(
        sreg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_29_ ( .D(n312), .CK(clk), .RD(rst_n), .Q(
        sreg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_30_ ( .D(n313), .CK(clk), .RD(rst_n), .Q(
        sreg[30]) );
  SAEDRVT14_FDPSBQ_0P5 qspi_cs_n_reg ( .D(N70), .CK(clk), .SD(rst_n), .Q(
        qspi_cs_n) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 cnt_reg_2_ ( .D(N66), .CK(clk), .RD(rst_n), .Q(
        cnt[2]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 rx_reg_reg_12_ ( .D(n344), .CK(clk), .RD(rst_n), 
        .Q(rx_data[12]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 rx_reg_reg_10_ ( .D(n329), .CK(clk), .RD(rst_n), 
        .Q(rx_data[10]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 sreg_reg_1_ ( .D(n284), .CK(clk), .RD(rst_n), .Q(
        sreg[1]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 sreg_reg_16_ ( .D(n299), .CK(clk), .RD(rst_n), .Q(
        sreg[16]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 sreg_reg_31_ ( .D(n314), .CK(clk), .RD(rst_n), .Q(
        sreg[31]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 state_reg_0_ ( .D(next[0]), .CK(clk), .RD(rst_n), 
        .Q(state[0]) );
  SAEDRVT14_AOI21_0P75 U3 ( .A1(n97), .A2(n96), .B(n95), .X(n98) );
  SAEDRVT14_NR2_1 U4 ( .A1(clk), .A2(n104), .X(qspi_clk) );
  SAEDRVT14_AN3_0P5 U5 ( .A1(cmd_latched[2]), .A2(cmd_latched[5]), .A3(n26), 
        .X(n278) );
  SAEDRVT14_NR2_1 U6 ( .A1(n99), .A2(state[2]), .X(n95) );
  SAEDRVT14_NR2_1 U7 ( .A1(state[1]), .A2(n112), .X(n97) );
  SAEDRVT14_INV_0P5 U8 ( .A(state[3]), .X(n96) );
  SAEDRVT14_INV_0P5 U9 ( .A(state[0]), .X(n91) );
  SAEDRVT14_INV_0P5 U10 ( .A(state[2]), .X(n112) );
  SAEDRVT14_ND2_CDC_1 U11 ( .A1(n91), .A2(n112), .X(n1) );
  SAEDRVT14_ND2_CDC_1 U12 ( .A1(n96), .A2(n1), .X(n104) );
  SAEDRVT14_INV_0P5 U13 ( .A(cmd_latched[0]), .X(n20) );
  SAEDRVT14_NR2_1 U14 ( .A1(state[1]), .A2(n1), .X(n257) );
  SAEDRVT14_AN3_0P5 U15 ( .A1(n257), .A2(start), .A3(n96), .X(n79) );
  SAEDRVT14_INV_0P5 U16 ( .A(n79), .X(n213) );
  SAEDRVT14_INV_0P5 U17 ( .A(cnt[2]), .X(n4) );
  SAEDRVT14_NR2_1 U18 ( .A1(cnt[5]), .A2(cnt[4]), .X(n2) );
  SAEDRVT14_INV_0P5 U19 ( .A(state[1]), .X(n89) );
  SAEDRVT14_NR2_1 U20 ( .A1(n89), .A2(n1), .X(n274) );
  SAEDRVT14_INV_0P5 U21 ( .A(cnt[0]), .X(n202) );
  SAEDRVT14_AN4_0P5 U22 ( .A1(n2), .A2(n274), .A3(n202), .A4(n96), .X(n68) );
  SAEDRVT14_INV_0P5 U23 ( .A(n68), .X(n3) );
  SAEDRVT14_OR4_1 U24 ( .A1(n4), .A2(n3), .A3(cnt[3]), .A4(cnt[1]), .X(n24) );
  SAEDRVT14_ND2_CDC_1 U25 ( .A1(n213), .A2(n24), .X(n223) );
  SAEDRVT14_AN4_0P5 U26 ( .A1(tx_data[21]), .A2(tx_data[22]), .A3(tx_data[23]), 
        .A4(tx_data[24]), .X(n8) );
  SAEDRVT14_AN4_0P5 U27 ( .A1(tx_data[17]), .A2(tx_data[18]), .A3(tx_data[19]), 
        .A4(tx_data[20]), .X(n7) );
  SAEDRVT14_AN4_0P5 U28 ( .A1(tx_data[31]), .A2(tx_data[0]), .A3(tx_data[30]), 
        .A4(tx_data[27]), .X(n6) );
  SAEDRVT14_AN4_0P5 U29 ( .A1(tx_data[29]), .A2(tx_data[26]), .A3(tx_data[25]), 
        .A4(tx_data[28]), .X(n5) );
  SAEDRVT14_AN4_0P5 U30 ( .A1(n8), .A2(n7), .A3(n6), .A4(n5), .X(n14) );
  SAEDRVT14_AN4_0P5 U31 ( .A1(tx_data[5]), .A2(tx_data[6]), .A3(tx_data[7]), 
        .A4(tx_data[8]), .X(n12) );
  SAEDRVT14_AN4_0P5 U32 ( .A1(tx_data[1]), .A2(tx_data[2]), .A3(tx_data[3]), 
        .A4(tx_data[4]), .X(n11) );
  SAEDRVT14_AN4_0P5 U33 ( .A1(tx_data[13]), .A2(tx_data[14]), .A3(tx_data[15]), 
        .A4(tx_data[16]), .X(n10) );
  SAEDRVT14_AN4_0P5 U34 ( .A1(tx_data[9]), .A2(tx_data[10]), .A3(tx_data[11]), 
        .A4(tx_data[12]), .X(n9) );
  SAEDRVT14_AN4_0P5 U35 ( .A1(n12), .A2(n11), .A3(n10), .A4(n9), .X(n13) );
  SAEDRVT14_ND2_CDC_1 U36 ( .A1(n14), .A2(n13), .X(n239) );
  SAEDRVT14_OAI22_0P5 U37 ( .A1(n20), .A2(n223), .B1(n239), .B2(n24), .X(n352)
         );
  SAEDRVT14_INV_0P5 U38 ( .A(n239), .X(n273) );
  SAEDRVT14_INV_0P5 U39 ( .A(cmd_latched[4]), .X(n15) );
  SAEDRVT14_OAI22_0P5 U40 ( .A1(n273), .A2(n24), .B1(n15), .B2(n223), .X(n349)
         );
  SAEDRVT14_INV_0P5 U41 ( .A(cnt[1]), .X(n201) );
  SAEDRVT14_OR4_1 U42 ( .A1(cnt[4]), .A2(cnt[5]), .A3(cnt[3]), .A4(n202), .X(
        n16) );
  SAEDRVT14_NR2_1 U43 ( .A1(n201), .A2(n16), .X(n71) );
  SAEDRVT14_ND2_CDC_1 U44 ( .A1(cnt[2]), .A2(n71), .X(n214) );
  SAEDRVT14_INV_0P5 U45 ( .A(n214), .X(n78) );
  SAEDRVT14_ND2_CDC_1 U46 ( .A1(n96), .A2(state[0]), .X(n99) );
  SAEDRVT14_INV_0P5 U47 ( .A(n95), .X(n102) );
  SAEDRVT14_INV_0P5 U48 ( .A(n99), .X(n19) );
  SAEDRVT14_ND2_CDC_1 U49 ( .A1(n97), .A2(n19), .X(n81) );
  SAEDRVT14_INV_0P5 U50 ( .A(n81), .X(n17) );
  SAEDRVT14_OR3_0P5 U51 ( .A1(cnt[2]), .A2(cnt[1]), .A3(n16), .X(n80) );
  SAEDRVT14_AOI21_0P75 U52 ( .A1(n17), .A2(n80), .B(n257), .X(n18) );
  SAEDRVT14_OAI21_0P5 U53 ( .A1(n78), .A2(n102), .B(n18), .X(n73) );
  SAEDRVT14_ND2_CDC_1 U54 ( .A1(state[1]), .A2(state[2]), .X(n216) );
  SAEDRVT14_INV_0P5 U55 ( .A(n216), .X(n114) );
  SAEDRVT14_ND2_CDC_1 U56 ( .A1(n19), .A2(n114), .X(n27) );
  SAEDRVT14_INV_0P5 U57 ( .A(cmd_latched[5]), .X(n222) );
  SAEDRVT14_OR4_1 U58 ( .A1(cmd_latched[1]), .A2(cmd_latched[4]), .A3(
        cmd_latched[3]), .A4(n20), .X(n21) );
  SAEDRVT14_OR3_0P5 U59 ( .A1(cmd_latched[2]), .A2(n222), .A3(n21), .X(n64) );
  SAEDRVT14_NR2_1 U60 ( .A1(state[0]), .A2(n214), .X(n111) );
  SAEDRVT14_AN2_MM_0P5 U61 ( .A1(n111), .A2(n97), .X(n262) );
  SAEDRVT14_ND2_CDC_1 U62 ( .A1(n96), .A2(n262), .X(n107) );
  SAEDRVT14_OAI22_0P5 U63 ( .A1(n214), .A2(n27), .B1(n64), .B2(n107), .X(n22)
         );
  SAEDRVT14_AOI21_0P75 U64 ( .A1(state[3]), .A2(n73), .B(n22), .X(n106) );
  SAEDRVT14_INV_0P5 U65 ( .A(n106), .X(next[3]) );
  SAEDRVT14_INV_0P5 U66 ( .A(n223), .X(n103) );
  SAEDRVT14_INV_0P5 U67 ( .A(write_op), .X(n212) );
  SAEDRVT14_ND2_CDC_1 U68 ( .A1(n212), .A2(n257), .X(n219) );
  SAEDRVT14_INV_0P5 U69 ( .A(cmd_latched[3]), .X(n25) );
  SAEDRVT14_OAI22_0P5 U70 ( .A1(n103), .A2(n219), .B1(n223), .B2(n25), .X(n350) );
  SAEDRVT14_OAI21_0P5 U71 ( .A1(cmd_latched[2]), .A2(n223), .B(n24), .X(n23)
         );
  SAEDRVT14_OAI21_0P5 U72 ( .A1(n273), .A2(n24), .B(n23), .X(n351) );
  SAEDRVT14_NR4_0P75 U73 ( .A1(cmd_latched[1]), .A2(cmd_latched[0]), .A3(
        cmd_latched[4]), .A4(n25), .X(n26) );
  SAEDRVT14_INV_0P5 U74 ( .A(n27), .X(n61) );
  SAEDRVT14_AN2_MM_0P5 U75 ( .A1(n278), .A2(n61), .X(n224) );
  SAEDRVT14_INV_0P5 U76 ( .A(rx_data[15]), .X(n33) );
  SAEDRVT14_INV_0P5 U77 ( .A(n224), .X(n42) );
  SAEDRVT14_INV_0P5 U78 ( .A(rx_data[11]), .X(n37) );
  SAEDRVT14_OAI22_0P5 U79 ( .A1(n224), .A2(n33), .B1(n42), .B2(n37), .X(n336)
         );
  SAEDRVT14_INV_0P5 U80 ( .A(rx_data[7]), .X(n36) );
  SAEDRVT14_INV_0P5 U81 ( .A(rx_data[3]), .X(n28) );
  SAEDRVT14_OAI22_0P5 U82 ( .A1(n224), .A2(n36), .B1(n42), .B2(n28), .X(n338)
         );
  SAEDRVT14_INV_0P5 U83 ( .A(rx_data[28]), .X(n29) );
  SAEDRVT14_INV_0P5 U84 ( .A(rx_data[24]), .X(n39) );
  SAEDRVT14_OAI22_0P5 U85 ( .A1(n224), .A2(n29), .B1(n42), .B2(n39), .X(n340)
         );
  SAEDRVT14_INV_0P5 U86 ( .A(rx_data[20]), .X(n38) );
  SAEDRVT14_INV_0P5 U87 ( .A(rx_data[16]), .X(n32) );
  SAEDRVT14_OAI22_0P5 U88 ( .A1(n224), .A2(n38), .B1(n42), .B2(n32), .X(n342)
         );
  SAEDRVT14_INV_0P5 U89 ( .A(rx_data[6]), .X(n53) );
  SAEDRVT14_INV_0P5 U90 ( .A(rx_data[2]), .X(n30) );
  SAEDRVT14_OAI22_0P5 U91 ( .A1(n224), .A2(n53), .B1(n42), .B2(n30), .X(n330)
         );
  SAEDRVT14_INV_0P5 U92 ( .A(rx_data[31]), .X(n31) );
  SAEDRVT14_INV_0P5 U93 ( .A(rx_data[27]), .X(n41) );
  SAEDRVT14_OAI22_0P5 U94 ( .A1(n224), .A2(n31), .B1(n42), .B2(n41), .X(n332)
         );
  SAEDRVT14_INV_0P5 U95 ( .A(rx_data[12]), .X(n35) );
  SAEDRVT14_OAI22_0P5 U96 ( .A1(n224), .A2(n32), .B1(n42), .B2(n35), .X(n343)
         );
  SAEDRVT14_INV_0P5 U97 ( .A(rx_data[23]), .X(n40) );
  SAEDRVT14_INV_0P5 U98 ( .A(rx_data[19]), .X(n34) );
  SAEDRVT14_OAI22_0P5 U99 ( .A1(n224), .A2(n40), .B1(n42), .B2(n34), .X(n334)
         );
  SAEDRVT14_OAI22_0P5 U100 ( .A1(n224), .A2(n34), .B1(n42), .B2(n33), .X(n335)
         );
  SAEDRVT14_INV_0P5 U101 ( .A(rx_data[8]), .X(n43) );
  SAEDRVT14_OAI22_0P5 U102 ( .A1(n224), .A2(n35), .B1(n42), .B2(n43), .X(n344)
         );
  SAEDRVT14_OAI22_0P5 U103 ( .A1(n224), .A2(n37), .B1(n42), .B2(n36), .X(n337)
         );
  SAEDRVT14_OAI22_0P5 U104 ( .A1(n224), .A2(n39), .B1(n42), .B2(n38), .X(n341)
         );
  SAEDRVT14_OAI22_0P5 U105 ( .A1(n224), .A2(n41), .B1(n42), .B2(n40), .X(n333)
         );
  SAEDRVT14_INV_0P5 U106 ( .A(rx_data[4]), .X(n49) );
  SAEDRVT14_OAI22_0P5 U107 ( .A1(n224), .A2(n43), .B1(n42), .B2(n49), .X(n345)
         );
  SAEDRVT14_INV_0P5 U108 ( .A(rx_data[5]), .X(n57) );
  SAEDRVT14_INV_0P5 U109 ( .A(n224), .X(n225) );
  SAEDRVT14_INV_0P5 U110 ( .A(rx_data[1]), .X(n44) );
  SAEDRVT14_OAI22_0P5 U111 ( .A1(n224), .A2(n57), .B1(n225), .B2(n44), .X(n322) );
  SAEDRVT14_INV_0P5 U112 ( .A(rx_data[22]), .X(n46) );
  SAEDRVT14_INV_0P5 U113 ( .A(rx_data[18]), .X(n51) );
  SAEDRVT14_OAI22_0P5 U114 ( .A1(n224), .A2(n46), .B1(n225), .B2(n51), .X(n326) );
  SAEDRVT14_INV_0P5 U115 ( .A(rx_data[14]), .X(n50) );
  SAEDRVT14_INV_0P5 U116 ( .A(rx_data[10]), .X(n54) );
  SAEDRVT14_OAI22_0P5 U117 ( .A1(n224), .A2(n50), .B1(n225), .B2(n54), .X(n328) );
  SAEDRVT14_INV_0P5 U118 ( .A(rx_data[30]), .X(n45) );
  SAEDRVT14_INV_0P5 U119 ( .A(rx_data[26]), .X(n47) );
  SAEDRVT14_OAI22_0P5 U120 ( .A1(n224), .A2(n45), .B1(n225), .B2(n47), .X(n324) );
  SAEDRVT14_OAI22_0P5 U121 ( .A1(n224), .A2(n47), .B1(n225), .B2(n46), .X(n325) );
  SAEDRVT14_INV_0P5 U122 ( .A(rx_data[0]), .X(n48) );
  SAEDRVT14_OAI22_0P5 U123 ( .A1(n224), .A2(n49), .B1(n225), .B2(n48), .X(n346) );
  SAEDRVT14_OAI22_0P5 U124 ( .A1(n224), .A2(n51), .B1(n225), .B2(n50), .X(n327) );
  SAEDRVT14_INV_0P5 U125 ( .A(rx_data[29]), .X(n52) );
  SAEDRVT14_INV_0P5 U126 ( .A(rx_data[25]), .X(n60) );
  SAEDRVT14_OAI22_0P5 U127 ( .A1(n224), .A2(n52), .B1(n225), .B2(n60), .X(n316) );
  SAEDRVT14_OAI22_0P5 U128 ( .A1(n224), .A2(n54), .B1(n225), .B2(n53), .X(n329) );
  SAEDRVT14_INV_0P5 U129 ( .A(rx_data[21]), .X(n59) );
  SAEDRVT14_INV_0P5 U130 ( .A(rx_data[17]), .X(n55) );
  SAEDRVT14_OAI22_0P5 U131 ( .A1(n224), .A2(n59), .B1(n225), .B2(n55), .X(n318) );
  SAEDRVT14_INV_0P5 U132 ( .A(rx_data[13]), .X(n56) );
  SAEDRVT14_OAI22_0P5 U133 ( .A1(n224), .A2(n55), .B1(n225), .B2(n56), .X(n319) );
  SAEDRVT14_INV_0P5 U134 ( .A(rx_data[9]), .X(n58) );
  SAEDRVT14_OAI22_0P5 U135 ( .A1(n224), .A2(n56), .B1(n225), .B2(n58), .X(n320) );
  SAEDRVT14_OAI22_0P5 U136 ( .A1(n224), .A2(n58), .B1(n225), .B2(n57), .X(n321) );
  SAEDRVT14_OAI22_0P5 U137 ( .A1(n224), .A2(n60), .B1(n225), .B2(n59), .X(n317) );
  SAEDRVT14_AN4_0P5 U138 ( .A1(state[3]), .A2(state[0]), .A3(n89), .A4(n112), 
        .X(done) );
  SAEDRVT14_NR2_1 U139 ( .A1(state[3]), .A2(state[0]), .X(n62) );
  SAEDRVT14_AOI21_0P75 U140 ( .A1(n97), .A2(n62), .B(n61), .X(n63) );
  SAEDRVT14_ND2_CDC_1 U141 ( .A1(n114), .A2(n62), .X(n67) );
  SAEDRVT14_OAI21_0P5 U142 ( .A1(n78), .A2(n63), .B(n67), .X(n72) );
  SAEDRVT14_INV_0P5 U143 ( .A(xip_active), .X(n217) );
  SAEDRVT14_NR2_1 U144 ( .A1(n217), .A2(write_op), .X(n260) );
  SAEDRVT14_AO21B_0P5 U145 ( .A1(n79), .A2(n260), .B(n81), .X(n66) );
  SAEDRVT14_ND2_CDC_1 U146 ( .A1(state[1]), .A2(n78), .X(n108) );
  SAEDRVT14_ND2B_U_0P5 U147 ( .A(n107), .B(n64), .X(n87) );
  SAEDRVT14_OAI21_0P5 U148 ( .A1(n102), .A2(n108), .B(n87), .X(n65) );
  SAEDRVT14_OR3_0P5 U149 ( .A1(n72), .A2(n66), .A3(n65), .X(next[2]) );
  SAEDRVT14_INV_0P5 U150 ( .A(n257), .X(n259) );
  SAEDRVT14_OAI21_0P5 U151 ( .A1(n259), .A2(n96), .B(n67), .X(n70) );
  SAEDRVT14_AN3_0P5 U152 ( .A1(cnt[1]), .A2(cnt[3]), .A3(n68), .X(n69) );
  SAEDRVT14_AOI21_0P75 U153 ( .A1(n71), .A2(n70), .B(n69), .X(n77) );
  SAEDRVT14_OAI21_0P5 U154 ( .A1(n73), .A2(n72), .B(state[0]), .X(n75) );
  SAEDRVT14_OAI21_0P5 U155 ( .A1(write_op), .A2(n217), .B(n79), .X(n74) );
  SAEDRVT14_AN4_0P5 U156 ( .A1(n87), .A2(n75), .A3(n225), .A4(n74), .X(n76) );
  SAEDRVT14_OAI21_0P5 U157 ( .A1(cnt[2]), .A2(n77), .B(n76), .X(next[0]) );
  SAEDRVT14_AOI21_0P75 U158 ( .A1(state[0]), .A2(n78), .B(state[3]), .X(n84)
         );
  SAEDRVT14_ND2_CDC_1 U159 ( .A1(n79), .A2(n217), .X(n82) );
  SAEDRVT14_OAI22_0P5 U160 ( .A1(write_op), .A2(n82), .B1(n81), .B2(n80), .X(
        n83) );
  SAEDRVT14_AOI21_0P75 U161 ( .A1(state[1]), .A2(n84), .B(n83), .X(n85) );
  SAEDRVT14_OA31_1 U162 ( .A1(state[1]), .A2(n214), .A3(n102), .B(n85), .X(n86) );
  SAEDRVT14_OAI21_0P5 U163 ( .A1(n278), .A2(n87), .B(n86), .X(next[1]) );
  SAEDRVT14_INV_0P5 U164 ( .A(next[2]), .X(n88) );
  SAEDRVT14_OAI22_0P5 U165 ( .A1(state[2]), .A2(next[2]), .B1(n112), .B2(n88), 
        .X(n93) );
  SAEDRVT14_OAI22_0P5 U166 ( .A1(next[0]), .A2(n91), .B1(n89), .B2(next[1]), 
        .X(n90) );
  SAEDRVT14_AOI21_0P75 U167 ( .A1(next[0]), .A2(n91), .B(n90), .X(n92) );
  SAEDRVT14_ND2_CDC_1 U168 ( .A1(n93), .A2(n92), .X(n94) );
  SAEDRVT14_NR2_1 U169 ( .A1(cnt[0]), .A2(n94), .X(N64) );
  SAEDRVT14_INV_0P5 U170 ( .A(n94), .X(n209) );
  SAEDRVT14_OA221_U_0P5 U171 ( .A1(cnt[0]), .A2(cnt[1]), .B1(n202), .B2(n201), 
        .C(n209), .X(N65) );
  SAEDRVT14_OAI21_0P5 U172 ( .A1(n278), .A2(n99), .B(n98), .X(qspi_io_oe) );
  SAEDRVT14_ND2_CDC_1 U173 ( .A1(n102), .A2(qspi_io_oe), .X(n100) );
  SAEDRVT14_AN2B_MM_1 U174 ( .B(sreg[30]), .A(n100), .X(qspi_io_out[2]) );
  SAEDRVT14_INV_0P5 U175 ( .A(sreg[29]), .X(n234) );
  SAEDRVT14_NR2_1 U176 ( .A1(n234), .A2(n100), .X(qspi_io_out[1]) );
  SAEDRVT14_INV_0P5 U177 ( .A(sreg[31]), .X(n101) );
  SAEDRVT14_NR2_1 U178 ( .A1(n101), .A2(n100), .X(qspi_io_out[3]) );
  SAEDRVT14_INV_0P5 U179 ( .A(sreg[28]), .X(n240) );
  SAEDRVT14_OAI22_0P5 U180 ( .A1(n102), .A2(n101), .B1(n240), .B2(n100), .X(
        qspi_io_out[0]) );
  SAEDRVT14_AN3_0P5 U181 ( .A1(n278), .A2(state[0]), .A3(n114), .X(n105) );
  SAEDRVT14_OAI21_0P5 U182 ( .A1(n105), .A2(n104), .B(n103), .X(n366) );
  SAEDRVT14_INV_0P5 U183 ( .A(n366), .X(n272) );
  SAEDRVT14_NR2_1 U184 ( .A1(n278), .A2(n107), .X(n368) );
  SAEDRVT14_INV_0P5 U185 ( .A(n272), .X(n360) );
  SAEDRVT14_NR2_1 U186 ( .A1(n108), .A2(state[2]), .X(n256) );
  SAEDRVT14_AO32_U_0P5 U187 ( .A1(n360), .A2(n260), .A3(n257), .B1(n360), .B2(
        n256), .X(n370) );
  SAEDRVT14_AO222_1 U188 ( .A1(n272), .A2(sreg[0]), .B1(n368), .B2(tx_data[0]), 
        .C1(addr_in[0]), .C2(n370), .X(n315) );
  SAEDRVT14_AOI21_0P75 U189 ( .A1(n106), .A2(next[0]), .B(next[2]), .X(N70) );
  SAEDRVT14_INV_0P5 U190 ( .A(n107), .X(n277) );
  SAEDRVT14_ND2_CDC_1 U191 ( .A1(n278), .A2(n277), .X(n268) );
  SAEDRVT14_AN4_0P5 U192 ( .A1(n217), .A2(n212), .A3(n360), .A4(n257), .X(n249) );
  SAEDRVT14_INV_0P5 U193 ( .A(n249), .X(n233) );
  SAEDRVT14_ND2_CDC_1 U194 ( .A1(n268), .A2(n233), .X(n228) );
  SAEDRVT14_AN4_0P5 U195 ( .A1(state[0]), .A2(n108), .A3(n112), .A4(n360), .X(
        n276) );
  SAEDRVT14_INV_0P5 U196 ( .A(n276), .X(n364) );
  SAEDRVT14_OAI22_0P5 U197 ( .A1(n360), .A2(n234), .B1(n364), .B2(n240), .X(
        n117) );
  SAEDRVT14_AOI21_0P75 U198 ( .A1(n257), .A2(n212), .B(n256), .X(n226) );
  SAEDRVT14_INV_0P5 U199 ( .A(n226), .X(n110) );
  SAEDRVT14_AO21_U_0P5 U200 ( .A1(n262), .A2(tx_data[29]), .B(n274), .X(n109)
         );
  SAEDRVT14_AOI21_0P75 U201 ( .A1(addr_in[29]), .A2(n110), .B(n109), .X(n115)
         );
  SAEDRVT14_INV_0P5 U202 ( .A(sreg[25]), .X(n271) );
  SAEDRVT14_NR2_1 U203 ( .A1(n112), .A2(n111), .X(n113) );
  SAEDRVT14_OAI21_0P5 U204 ( .A1(n114), .A2(n113), .B(n360), .X(n355) );
  SAEDRVT14_OAI22_0P5 U205 ( .A1(n272), .A2(n115), .B1(n271), .B2(n355), .X(
        n116) );
  SAEDRVT14_OR3_0P5 U206 ( .A1(n228), .A2(n117), .A3(n116), .X(n312) );
  SAEDRVT14_INV_0P5 U207 ( .A(sreg[4]), .X(n137) );
  SAEDRVT14_INV_0P5 U208 ( .A(sreg[8]), .X(n192) );
  SAEDRVT14_INV_0P5 U209 ( .A(sreg[7]), .X(n144) );
  SAEDRVT14_OAI22_0P5 U210 ( .A1(n360), .A2(n192), .B1(n364), .B2(n144), .X(
        n118) );
  SAEDRVT14_AOI21_0P75 U211 ( .A1(tx_data[8]), .A2(n368), .B(n118), .X(n119)
         );
  SAEDRVT14_OAI21_0P5 U212 ( .A1(n355), .A2(n137), .B(n119), .X(n120) );
  SAEDRVT14_AO21_U_0P5 U213 ( .A1(n370), .A2(addr_in[8]), .B(n120), .X(n291)
         );
  SAEDRVT14_INV_0P5 U214 ( .A(sreg[2]), .X(n359) );
  SAEDRVT14_INV_0P5 U215 ( .A(sreg[6]), .X(n135) );
  SAEDRVT14_INV_0P5 U216 ( .A(sreg[5]), .X(n138) );
  SAEDRVT14_OAI22_0P5 U217 ( .A1(n360), .A2(n135), .B1(n364), .B2(n138), .X(
        n121) );
  SAEDRVT14_AOI21_0P75 U218 ( .A1(tx_data[6]), .A2(n368), .B(n121), .X(n122)
         );
  SAEDRVT14_OAI21_0P5 U219 ( .A1(n355), .A2(n359), .B(n122), .X(n123) );
  SAEDRVT14_AO21_U_0P5 U220 ( .A1(n370), .A2(addr_in[6]), .B(n123), .X(n289)
         );
  SAEDRVT14_INV_0P5 U221 ( .A(sreg[3]), .X(n356) );
  SAEDRVT14_OAI22_0P5 U222 ( .A1(n360), .A2(n144), .B1(n364), .B2(n135), .X(
        n124) );
  SAEDRVT14_AOI21_0P75 U223 ( .A1(tx_data[7]), .A2(n368), .B(n124), .X(n125)
         );
  SAEDRVT14_OAI21_0P5 U224 ( .A1(n355), .A2(n356), .B(n125), .X(n126) );
  SAEDRVT14_AO21_U_0P5 U225 ( .A1(n370), .A2(addr_in[7]), .B(n126), .X(n290)
         );
  SAEDRVT14_INV_0P5 U226 ( .A(sreg[9]), .X(n186) );
  SAEDRVT14_OAI22_0P5 U227 ( .A1(n360), .A2(n186), .B1(n364), .B2(n192), .X(
        n127) );
  SAEDRVT14_AOI21_0P75 U228 ( .A1(tx_data[9]), .A2(n368), .B(n127), .X(n128)
         );
  SAEDRVT14_OAI21_0P5 U229 ( .A1(n355), .A2(n138), .B(n128), .X(n129) );
  SAEDRVT14_AO21_U_0P5 U230 ( .A1(n370), .A2(addr_in[9]), .B(n129), .X(n292)
         );
  SAEDRVT14_INV_0P5 U231 ( .A(sreg[0]), .X(n363) );
  SAEDRVT14_OAI22_0P5 U232 ( .A1(n360), .A2(n137), .B1(n364), .B2(n356), .X(
        n130) );
  SAEDRVT14_AOI21_0P75 U233 ( .A1(tx_data[4]), .A2(n368), .B(n130), .X(n131)
         );
  SAEDRVT14_OAI21_0P5 U234 ( .A1(n355), .A2(n363), .B(n131), .X(n132) );
  SAEDRVT14_AO21_U_0P5 U235 ( .A1(n370), .A2(addr_in[4]), .B(n132), .X(n287)
         );
  SAEDRVT14_INV_0P5 U236 ( .A(sreg[10]), .X(n161) );
  SAEDRVT14_OAI22_0P5 U237 ( .A1(n360), .A2(n161), .B1(n364), .B2(n186), .X(
        n133) );
  SAEDRVT14_AOI21_0P75 U238 ( .A1(tx_data[10]), .A2(n368), .B(n133), .X(n134)
         );
  SAEDRVT14_OAI21_0P5 U239 ( .A1(n355), .A2(n135), .B(n134), .X(n136) );
  SAEDRVT14_AO21_U_0P5 U240 ( .A1(n370), .A2(addr_in[10]), .B(n136), .X(n293)
         );
  SAEDRVT14_INV_0P5 U241 ( .A(sreg[1]), .X(n365) );
  SAEDRVT14_OAI22_0P5 U242 ( .A1(n360), .A2(n138), .B1(n364), .B2(n137), .X(
        n139) );
  SAEDRVT14_AOI21_0P75 U243 ( .A1(tx_data[5]), .A2(n368), .B(n139), .X(n140)
         );
  SAEDRVT14_OAI21_0P5 U244 ( .A1(n355), .A2(n365), .B(n140), .X(n141) );
  SAEDRVT14_AO21_U_0P5 U245 ( .A1(n370), .A2(addr_in[5]), .B(n141), .X(n288)
         );
  SAEDRVT14_INV_0P5 U246 ( .A(sreg[11]), .X(n188) );
  SAEDRVT14_OAI22_0P5 U247 ( .A1(n366), .A2(n188), .B1(n364), .B2(n161), .X(
        n142) );
  SAEDRVT14_AOI21_0P75 U248 ( .A1(tx_data[11]), .A2(n368), .B(n142), .X(n143)
         );
  SAEDRVT14_OAI21_0P5 U249 ( .A1(n355), .A2(n144), .B(n143), .X(n145) );
  SAEDRVT14_AO21_U_0P5 U250 ( .A1(n370), .A2(addr_in[11]), .B(n145), .X(n294)
         );
  SAEDRVT14_INV_0P5 U251 ( .A(sreg[15]), .X(n174) );
  SAEDRVT14_INV_0P5 U252 ( .A(sreg[14]), .X(n158) );
  SAEDRVT14_OAI22_0P5 U253 ( .A1(n366), .A2(n174), .B1(n364), .B2(n158), .X(
        n146) );
  SAEDRVT14_AOI21_0P75 U254 ( .A1(tx_data[15]), .A2(n368), .B(n146), .X(n147)
         );
  SAEDRVT14_OAI21_0P5 U255 ( .A1(n355), .A2(n188), .B(n147), .X(n148) );
  SAEDRVT14_AO21_U_0P5 U256 ( .A1(n370), .A2(addr_in[15]), .B(n148), .X(n298)
         );
  SAEDRVT14_INV_0P5 U257 ( .A(sreg[13]), .X(n183) );
  SAEDRVT14_INV_0P5 U258 ( .A(sreg[17]), .X(n165) );
  SAEDRVT14_INV_0P5 U259 ( .A(sreg[16]), .X(n181) );
  SAEDRVT14_OAI22_0P5 U260 ( .A1(n366), .A2(n165), .B1(n364), .B2(n181), .X(
        n149) );
  SAEDRVT14_AOI21_0P75 U261 ( .A1(tx_data[17]), .A2(n368), .B(n149), .X(n150)
         );
  SAEDRVT14_OAI21_0P5 U262 ( .A1(n355), .A2(n183), .B(n150), .X(n151) );
  SAEDRVT14_AO21_U_0P5 U263 ( .A1(n370), .A2(addr_in[17]), .B(n151), .X(n300)
         );
  SAEDRVT14_INV_0P5 U264 ( .A(sreg[18]), .X(n169) );
  SAEDRVT14_OAI22_0P5 U265 ( .A1(n366), .A2(n169), .B1(n364), .B2(n165), .X(
        n152) );
  SAEDRVT14_AOI21_0P75 U266 ( .A1(tx_data[18]), .A2(n368), .B(n152), .X(n153)
         );
  SAEDRVT14_OAI21_0P5 U267 ( .A1(n355), .A2(n158), .B(n153), .X(n154) );
  SAEDRVT14_AO21_U_0P5 U268 ( .A1(n370), .A2(addr_in[18]), .B(n154), .X(n301)
         );
  SAEDRVT14_INV_0P5 U269 ( .A(sreg[19]), .X(n178) );
  SAEDRVT14_OAI22_0P5 U270 ( .A1(n366), .A2(n178), .B1(n364), .B2(n169), .X(
        n155) );
  SAEDRVT14_AOI21_0P75 U271 ( .A1(tx_data[19]), .A2(n368), .B(n155), .X(n156)
         );
  SAEDRVT14_OAI21_0P5 U272 ( .A1(n355), .A2(n174), .B(n156), .X(n157) );
  SAEDRVT14_AO21_U_0P5 U273 ( .A1(n370), .A2(addr_in[19]), .B(n157), .X(n302)
         );
  SAEDRVT14_OAI22_0P5 U274 ( .A1(n366), .A2(n158), .B1(n364), .B2(n183), .X(
        n159) );
  SAEDRVT14_AOI21_0P75 U275 ( .A1(tx_data[14]), .A2(n368), .B(n159), .X(n160)
         );
  SAEDRVT14_OAI21_0P5 U276 ( .A1(n355), .A2(n161), .B(n160), .X(n162) );
  SAEDRVT14_AO21_U_0P5 U277 ( .A1(n370), .A2(addr_in[14]), .B(n162), .X(n297)
         );
  SAEDRVT14_INV_0P5 U278 ( .A(sreg[21]), .X(n195) );
  SAEDRVT14_INV_0P5 U279 ( .A(sreg[20]), .X(n283) );
  SAEDRVT14_OAI22_0P5 U280 ( .A1(n366), .A2(n195), .B1(n364), .B2(n283), .X(
        n163) );
  SAEDRVT14_AOI21_0P75 U281 ( .A1(tx_data[21]), .A2(n368), .B(n163), .X(n164)
         );
  SAEDRVT14_OAI21_0P5 U282 ( .A1(n355), .A2(n165), .B(n164), .X(n166) );
  SAEDRVT14_AO21_U_0P5 U283 ( .A1(n370), .A2(addr_in[21]), .B(n166), .X(n304)
         );
  SAEDRVT14_INV_0P5 U284 ( .A(sreg[22]), .X(n266) );
  SAEDRVT14_OAI22_0P5 U285 ( .A1(n366), .A2(n266), .B1(n364), .B2(n195), .X(
        n167) );
  SAEDRVT14_AOI21_0P75 U286 ( .A1(tx_data[22]), .A2(n368), .B(n167), .X(n168)
         );
  SAEDRVT14_OAI21_0P5 U287 ( .A1(n355), .A2(n169), .B(n168), .X(n170) );
  SAEDRVT14_AO21_U_0P5 U288 ( .A1(n370), .A2(addr_in[22]), .B(n170), .X(n305)
         );
  SAEDRVT14_INV_0P5 U289 ( .A(sreg[23]), .X(n255) );
  SAEDRVT14_OAI22_0P5 U290 ( .A1(n366), .A2(n255), .B1(n364), .B2(n266), .X(
        n171) );
  SAEDRVT14_AOI21_0P75 U291 ( .A1(tx_data[23]), .A2(n368), .B(n171), .X(n172)
         );
  SAEDRVT14_OAI21_0P5 U292 ( .A1(n355), .A2(n178), .B(n172), .X(n173) );
  SAEDRVT14_AO21_U_0P5 U293 ( .A1(n370), .A2(addr_in[23]), .B(n173), .X(n306)
         );
  SAEDRVT14_INV_0P5 U294 ( .A(sreg[12]), .X(n189) );
  SAEDRVT14_OAI22_0P5 U295 ( .A1(n366), .A2(n181), .B1(n364), .B2(n174), .X(
        n175) );
  SAEDRVT14_AOI21_0P75 U296 ( .A1(tx_data[16]), .A2(n368), .B(n175), .X(n176)
         );
  SAEDRVT14_OAI21_0P5 U297 ( .A1(n355), .A2(n189), .B(n176), .X(n177) );
  SAEDRVT14_AO21_U_0P5 U298 ( .A1(n370), .A2(addr_in[16]), .B(n177), .X(n299)
         );
  SAEDRVT14_OAI22_0P5 U299 ( .A1(n366), .A2(n283), .B1(n364), .B2(n178), .X(
        n179) );
  SAEDRVT14_AOI21_0P75 U300 ( .A1(tx_data[20]), .A2(n368), .B(n179), .X(n180)
         );
  SAEDRVT14_OAI21_0P5 U301 ( .A1(n355), .A2(n181), .B(n180), .X(n182) );
  SAEDRVT14_AO21_U_0P5 U302 ( .A1(n370), .A2(addr_in[20]), .B(n182), .X(n303)
         );
  SAEDRVT14_OAI22_0P5 U303 ( .A1(n366), .A2(n183), .B1(n364), .B2(n189), .X(
        n184) );
  SAEDRVT14_AOI21_0P75 U304 ( .A1(tx_data[13]), .A2(n368), .B(n184), .X(n185)
         );
  SAEDRVT14_OAI21_0P5 U305 ( .A1(n355), .A2(n186), .B(n185), .X(n187) );
  SAEDRVT14_AO21_U_0P5 U306 ( .A1(n370), .A2(addr_in[13]), .B(n187), .X(n296)
         );
  SAEDRVT14_OAI22_0P5 U307 ( .A1(n366), .A2(n189), .B1(n364), .B2(n188), .X(
        n190) );
  SAEDRVT14_AOI21_0P75 U308 ( .A1(tx_data[12]), .A2(n368), .B(n190), .X(n191)
         );
  SAEDRVT14_OAI21_0P5 U309 ( .A1(n355), .A2(n192), .B(n191), .X(n193) );
  SAEDRVT14_AO21_U_0P5 U310 ( .A1(n370), .A2(addr_in[12]), .B(n193), .X(n295)
         );
  SAEDRVT14_INV_0P5 U311 ( .A(sreg[24]), .X(n243) );
  SAEDRVT14_OAI22_0P5 U312 ( .A1(n366), .A2(n271), .B1(n364), .B2(n243), .X(
        n198) );
  SAEDRVT14_AO21_U_0P5 U313 ( .A1(xip_active), .A2(n257), .B(n256), .X(n194)
         );
  SAEDRVT14_NR2_1 U314 ( .A1(n259), .A2(n212), .X(n218) );
  SAEDRVT14_AOI21_0P75 U315 ( .A1(addr_in[25]), .A2(n194), .B(n218), .X(n196)
         );
  SAEDRVT14_OAI22_0P5 U316 ( .A1(n272), .A2(n196), .B1(n195), .B2(n355), .X(
        n197) );
  SAEDRVT14_NR2_1 U317 ( .A1(n198), .A2(n197), .X(n200) );
  SAEDRVT14_ND2_CDC_1 U318 ( .A1(tx_data[25]), .A2(n368), .X(n199) );
  SAEDRVT14_ND2_CDC_1 U319 ( .A1(n200), .A2(n199), .X(n308) );
  SAEDRVT14_NR2_1 U320 ( .A1(n202), .A2(n201), .X(n205) );
  SAEDRVT14_OAI21_0P5 U321 ( .A1(cnt[2]), .A2(n205), .B(n209), .X(n203) );
  SAEDRVT14_AOI21_0P75 U322 ( .A1(cnt[2]), .A2(n205), .B(n203), .X(N66) );
  SAEDRVT14_AN2_MM_0P5 U323 ( .A1(cnt[2]), .A2(n205), .X(n208) );
  SAEDRVT14_OAI21_0P5 U324 ( .A1(cnt[3]), .A2(n208), .B(n209), .X(n204) );
  SAEDRVT14_AOI21_0P75 U325 ( .A1(cnt[3]), .A2(n208), .B(n204), .X(N67) );
  SAEDRVT14_AN3_0P5 U326 ( .A1(cnt[2]), .A2(cnt[3]), .A3(n205), .X(n207) );
  SAEDRVT14_OAI21_0P5 U327 ( .A1(cnt[4]), .A2(n207), .B(n209), .X(n206) );
  SAEDRVT14_AOI21_0P75 U328 ( .A1(cnt[4]), .A2(n207), .B(n206), .X(N68) );
  SAEDRVT14_AN3_0P5 U329 ( .A1(cnt[4]), .A2(cnt[3]), .A3(n208), .X(n211) );
  SAEDRVT14_OAI21_0P5 U330 ( .A1(cnt[5]), .A2(n211), .B(n209), .X(n210) );
  SAEDRVT14_AOI21_0P75 U331 ( .A1(cnt[5]), .A2(n211), .B(n210), .X(N69) );
  SAEDRVT14_OAI22_0P5 U332 ( .A1(n214), .A2(n225), .B1(n213), .B2(n212), .X(
        n215) );
  SAEDRVT14_MUXI2_U_0P5 U333 ( .D0(n217), .D1(n216), .S(n215), .X(n354) );
  SAEDRVT14_MUX2_U_0P5 U334 ( .D0(cmd_latched[1]), .D1(n218), .S(n223), .X(
        n353) );
  SAEDRVT14_INV_0P5 U335 ( .A(n219), .X(n220) );
  SAEDRVT14_OAI21_0P5 U336 ( .A1(n274), .A2(n220), .B(n223), .X(n221) );
  SAEDRVT14_OAI21_0P5 U337 ( .A1(n223), .A2(n222), .B(n221), .X(n348) );
  SAEDRVT14_MUX2_U_0P5 U338 ( .D0(rx_data[0]), .D1(qspi_io_in[0]), .S(n224), 
        .X(n347) );
  SAEDRVT14_MUX2_U_0P5 U339 ( .D0(qspi_io_in[3]), .D1(rx_data[3]), .S(n225), 
        .X(n339) );
  SAEDRVT14_MUX2_U_0P5 U340 ( .D0(qspi_io_in[2]), .D1(rx_data[2]), .S(n225), 
        .X(n331) );
  SAEDRVT14_MUX2_U_0P5 U341 ( .D0(qspi_io_in[1]), .D1(rx_data[1]), .S(n225), 
        .X(n323) );
  SAEDRVT14_INV_0P5 U342 ( .A(sreg[27]), .X(n247) );
  SAEDRVT14_NR2_1 U343 ( .A1(n272), .A2(n226), .X(n253) );
  SAEDRVT14_AO32_U_0P5 U344 ( .A1(n262), .A2(n360), .A3(tx_data[31]), .B1(n272), .B2(sreg[31]), .X(n227) );
  SAEDRVT14_NR2_1 U345 ( .A1(n228), .A2(n227), .X(n230) );
  SAEDRVT14_ND2_CDC_1 U346 ( .A1(n276), .A2(sreg[30]), .X(n229) );
  SAEDRVT14_ND2_CDC_1 U347 ( .A1(n230), .A2(n229), .X(n231) );
  SAEDRVT14_AOI21_0P75 U348 ( .A1(n253), .A2(addr_in[31]), .B(n231), .X(n232)
         );
  SAEDRVT14_OAI21_0P5 U349 ( .A1(n355), .A2(n247), .B(n232), .X(n314) );
  SAEDRVT14_INV_0P5 U350 ( .A(sreg[26]), .X(n246) );
  SAEDRVT14_OAI21_0P5 U351 ( .A1(n364), .A2(n234), .B(n233), .X(n235) );
  SAEDRVT14_AOI21_0P75 U352 ( .A1(n272), .A2(sreg[30]), .B(n235), .X(n236) );
  SAEDRVT14_AO21B_0P5 U353 ( .A1(tx_data[30]), .A2(n368), .B(n236), .X(n237)
         );
  SAEDRVT14_AOI21_0P75 U354 ( .A1(n253), .A2(addr_in[30]), .B(n237), .X(n238)
         );
  SAEDRVT14_OAI21_0P5 U355 ( .A1(n355), .A2(n246), .B(n238), .X(n313) );
  SAEDRVT14_ND2_CDC_1 U356 ( .A1(n274), .A2(n239), .X(n263) );
  SAEDRVT14_OAI22_0P5 U357 ( .A1(n272), .A2(n263), .B1(n360), .B2(n240), .X(
        n241) );
  SAEDRVT14_AOI21_0P75 U358 ( .A1(sreg[27]), .A2(n276), .B(n241), .X(n242) );
  SAEDRVT14_OAI21_0P5 U359 ( .A1(n355), .A2(n243), .B(n242), .X(n244) );
  SAEDRVT14_AOI21_0P75 U360 ( .A1(tx_data[28]), .A2(n368), .B(n244), .X(n245)
         );
  SAEDRVT14_AO21B_0P5 U361 ( .A1(n370), .A2(addr_in[28]), .B(n245), .X(n311)
         );
  SAEDRVT14_OAI22_0P5 U362 ( .A1(n366), .A2(n247), .B1(n364), .B2(n246), .X(
        n248) );
  SAEDRVT14_NR2_1 U363 ( .A1(n249), .A2(n248), .X(n251) );
  SAEDRVT14_ND2_CDC_1 U364 ( .A1(tx_data[27]), .A2(n368), .X(n250) );
  SAEDRVT14_ND2_CDC_1 U365 ( .A1(n251), .A2(n250), .X(n252) );
  SAEDRVT14_AOI21_0P75 U366 ( .A1(n253), .A2(addr_in[27]), .B(n252), .X(n254)
         );
  SAEDRVT14_OAI21_0P5 U367 ( .A1(n355), .A2(n255), .B(n254), .X(n310) );
  SAEDRVT14_OAI21_0P5 U368 ( .A1(n257), .A2(n256), .B(addr_in[26]), .X(n258)
         );
  SAEDRVT14_OAI21_0P5 U369 ( .A1(n260), .A2(n259), .B(n258), .X(n261) );
  SAEDRVT14_AOI21_0P75 U370 ( .A1(n262), .A2(tx_data[26]), .B(n261), .X(n264)
         );
  SAEDRVT14_AOI21_0P75 U371 ( .A1(n264), .A2(n263), .B(n272), .X(n265) );
  SAEDRVT14_OA21B_1 U372 ( .A1(n266), .A2(n355), .B(n265), .X(n267) );
  SAEDRVT14_ND2_CDC_1 U373 ( .A1(n268), .A2(n267), .X(n269) );
  SAEDRVT14_AOI21_0P75 U374 ( .A1(n272), .A2(sreg[26]), .B(n269), .X(n270) );
  SAEDRVT14_OAI21_0P5 U375 ( .A1(n364), .A2(n271), .B(n270), .X(n309) );
  SAEDRVT14_AO32_U_0P5 U376 ( .A1(n274), .A2(n360), .A3(n273), .B1(n272), .B2(
        sreg[24]), .X(n275) );
  SAEDRVT14_AOI21_0P75 U377 ( .A1(n276), .A2(sreg[23]), .B(n275), .X(n280) );
  SAEDRVT14_OAI21_0P5 U378 ( .A1(n278), .A2(tx_data[24]), .B(n277), .X(n279)
         );
  SAEDRVT14_ND2_CDC_1 U379 ( .A1(n280), .A2(n279), .X(n281) );
  SAEDRVT14_AOI21_0P75 U380 ( .A1(n370), .A2(addr_in[24]), .B(n281), .X(n282)
         );
  SAEDRVT14_OAI21_0P5 U381 ( .A1(n355), .A2(n283), .B(n282), .X(n307) );
  SAEDRVT14_OAI22_0P5 U382 ( .A1(n360), .A2(n356), .B1(n364), .B2(n359), .X(
        n357) );
  SAEDRVT14_AOI21_0P75 U383 ( .A1(tx_data[3]), .A2(n368), .B(n357), .X(n358)
         );
  SAEDRVT14_AO21B_0P5 U384 ( .A1(n370), .A2(addr_in[3]), .B(n358), .X(n286) );
  SAEDRVT14_OAI22_0P5 U385 ( .A1(n360), .A2(n359), .B1(n364), .B2(n365), .X(
        n361) );
  SAEDRVT14_AOI21_0P75 U386 ( .A1(tx_data[2]), .A2(n368), .B(n361), .X(n362)
         );
  SAEDRVT14_AO21B_0P5 U387 ( .A1(n370), .A2(addr_in[2]), .B(n362), .X(n285) );
  SAEDRVT14_OAI22_0P5 U388 ( .A1(n366), .A2(n365), .B1(n364), .B2(n363), .X(
        n367) );
  SAEDRVT14_AOI21_0P75 U389 ( .A1(tx_data[1]), .A2(n368), .B(n367), .X(n369)
         );
  SAEDRVT14_AO21B_0P5 U390 ( .A1(n370), .A2(addr_in[1]), .B(n369), .X(n284) );
endmodule


module ahb_wrapper ( HCLK, HRESETn, HSEL, HREADY, HADDR, HWDATA, HTRANS, 
        HWRITE, HRDATA, HREADYOUT, HRESP, qspi_cs_n, qspi_clk, qspi_data_oen, 
        qspi_data_out, qspi_data_in );
  input [31:0] HADDR;
  input [31:0] HWDATA;
  input [1:0] HTRANS;
  output [31:0] HRDATA;
  output [1:0] HRESP;
  output [3:0] qspi_data_out;
  input [3:0] qspi_data_in;
  input HCLK, HRESETn, HSEL, HREADY, HWRITE;
  output HREADYOUT, qspi_cs_n, qspi_clk, qspi_data_oen;
  wire   fsm_done, w_reg, pending, fsm_done_q, fsm_start, N10, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106;
  wire   [31:0] a_reg;
  wire   [31:0] ahb_rdata_reg;
  wire   [31:0] ahb_wdata_reg;
  wire   [31:0] fsm_rx;
  assign HRESP[0] = HRESP[1];

  qspi_fsm u_core ( .clk(HCLK), .rst_n(HRESETn), .start(fsm_start), .write_op(
        w_reg), .addr_in(a_reg), .tx_data(ahb_wdata_reg), .tx_empty(HRESP[1]), 
        .done(fsm_done), .qspi_cs_n(qspi_cs_n), .qspi_clk(qspi_clk), 
        .qspi_io_oe(qspi_data_oen), .qspi_io_out(qspi_data_out), .rx_data(
        fsm_rx), .qspi_io_in(qspi_data_in) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_31_ ( .D(n99), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_30_ ( .D(n98), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_29_ ( .D(n97), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_28_ ( .D(n96), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_27_ ( .D(n95), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_26_ ( .D(n94), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_25_ ( .D(n93), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_24_ ( .D(n92), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_23_ ( .D(n91), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_22_ ( .D(n90), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_21_ ( .D(n89), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_20_ ( .D(n88), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_19_ ( .D(n87), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_18_ ( .D(n86), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_16_ ( .D(n84), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_15_ ( .D(n83), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_14_ ( .D(n82), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_13_ ( .D(n81), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_12_ ( .D(n80), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_11_ ( .D(n79), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_10_ ( .D(n78), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_9_ ( .D(n77), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_8_ ( .D(n76), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_7_ ( .D(n75), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_6_ ( .D(n74), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_5_ ( .D(n73), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_4_ ( .D(n72), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_3_ ( .D(n71), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_1_ ( .D(n69), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_0_ ( .D(n101), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 w_reg_reg ( .D(n100), .CK(HCLK), .RD(HRESETn), .Q(
        w_reg) );
  SAEDRVT14_FDPRBQ_V2_0P5 fsm_start_reg ( .D(N10), .CK(HCLK), .RD(HRESETn), 
        .Q(fsm_start) );
  SAEDRVT14_FDPRBQ_V2_0P5 fsm_done_q_reg ( .D(fsm_done), .CK(HCLK), .RD(
        HRESETn), .Q(fsm_done_q) );
  SAEDRVT14_FDPRBQ_V2_0P5 pending_reg ( .D(n68), .CK(HCLK), .RD(HRESETn), .Q(
        pending) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_31_ ( .D(n67), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_30_ ( .D(n66), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_29_ ( .D(n65), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_28_ ( .D(n64), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_27_ ( .D(n63), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_26_ ( .D(n62), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_25_ ( .D(n61), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_24_ ( .D(n60), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_22_ ( .D(n58), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_21_ ( .D(n57), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_20_ ( .D(n56), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_19_ ( .D(n55), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_18_ ( .D(n54), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_17_ ( .D(n53), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_16_ ( .D(n52), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_15_ ( .D(n51), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_14_ ( .D(n50), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_13_ ( .D(n49), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_12_ ( .D(n48), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_11_ ( .D(n47), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_10_ ( .D(n46), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_9_ ( .D(n45), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_7_ ( .D(n43), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_6_ ( .D(n42), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_5_ ( .D(n41), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_4_ ( .D(n40), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_3_ ( .D(n39), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_2_ ( .D(n38), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_1_ ( .D(n37), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_0_ ( .D(n36), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_0_ ( .D(n35), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_31_ ( .D(n34), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_30_ ( .D(n33), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_29_ ( .D(n32), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_28_ ( .D(n31), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_27_ ( .D(n30), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_25_ ( .D(n28), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_24_ ( .D(n27), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_23_ ( .D(n26), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_22_ ( .D(n25), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_21_ ( .D(n24), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_20_ ( .D(n23), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_19_ ( .D(n22), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_18_ ( .D(n21), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_17_ ( .D(n20), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_16_ ( .D(n19), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_15_ ( .D(n18), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_14_ ( .D(n17), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_13_ ( .D(n16), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_12_ ( .D(n15), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_10_ ( .D(n13), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_9_ ( .D(n12), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_8_ ( .D(n11), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_7_ ( .D(n10), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_6_ ( .D(n9), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_5_ ( .D(n8), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_4_ ( .D(n7), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_3_ ( .D(n6), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_2_ ( .D(n5), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_wdata_reg_reg_1_ ( .D(n4), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[1]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 a_reg_reg_17_ ( .D(n85), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[17]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 a_reg_reg_2_ ( .D(n70), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[2]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 ahb_rdata_reg_reg_23_ ( .D(n59), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[23]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 ahb_rdata_reg_reg_8_ ( .D(n44), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_rdata_reg[8]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 ahb_wdata_reg_reg_26_ ( .D(n29), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[26]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 ahb_wdata_reg_reg_11_ ( .D(n14), .CK(HCLK), .RD(
        HRESETn), .Q(ahb_wdata_reg[11]) );
  SAEDRVT14_TIE0_V1_2 U139 ( .X(HRESP[1]) );
  SAEDRVT14_ND2_CDC_1 U140 ( .A1(w_reg), .A2(fsm_start), .X(n106) );
  SAEDRVT14_AN3_0P5 U141 ( .A1(HSEL), .A2(HTRANS[1]), .A3(HREADY), .X(N10) );
  SAEDRVT14_ND2B_U_0P5 U142 ( .A(fsm_done_q), .B(pending), .X(HREADYOUT) );
  SAEDRVT14_INV_0P5 U143 ( .A(w_reg), .X(n104) );
  SAEDRVT14_AN2_MM_0P5 U144 ( .A1(ahb_rdata_reg[1]), .A2(n104), .X(HRDATA[1])
         );
  SAEDRVT14_AN2_MM_0P5 U145 ( .A1(ahb_rdata_reg[2]), .A2(n104), .X(HRDATA[2])
         );
  SAEDRVT14_AN2_MM_0P5 U146 ( .A1(ahb_rdata_reg[3]), .A2(n104), .X(HRDATA[3])
         );
  SAEDRVT14_AN2_MM_0P5 U147 ( .A1(ahb_rdata_reg[4]), .A2(n104), .X(HRDATA[4])
         );
  SAEDRVT14_AN2_MM_0P5 U148 ( .A1(ahb_rdata_reg[5]), .A2(n104), .X(HRDATA[5])
         );
  SAEDRVT14_AN2_MM_0P5 U149 ( .A1(ahb_rdata_reg[0]), .A2(n104), .X(HRDATA[0])
         );
  SAEDRVT14_AN2_MM_0P5 U150 ( .A1(ahb_rdata_reg[11]), .A2(n104), .X(HRDATA[11]) );
  SAEDRVT14_AN2_MM_0P5 U151 ( .A1(ahb_rdata_reg[6]), .A2(n104), .X(HRDATA[6])
         );
  SAEDRVT14_AN2_MM_0P5 U152 ( .A1(ahb_rdata_reg[7]), .A2(n104), .X(HRDATA[7])
         );
  SAEDRVT14_AN2_MM_0P5 U153 ( .A1(ahb_rdata_reg[24]), .A2(n104), .X(HRDATA[24]) );
  SAEDRVT14_AN2_MM_0P5 U154 ( .A1(ahb_rdata_reg[25]), .A2(n104), .X(HRDATA[25]) );
  SAEDRVT14_AN2_MM_0P5 U155 ( .A1(ahb_rdata_reg[10]), .A2(n104), .X(HRDATA[10]) );
  SAEDRVT14_AN2_MM_0P5 U156 ( .A1(ahb_rdata_reg[8]), .A2(n104), .X(HRDATA[8])
         );
  SAEDRVT14_AN2_MM_0P5 U157 ( .A1(ahb_rdata_reg[9]), .A2(n104), .X(HRDATA[9])
         );
  SAEDRVT14_AN2_MM_0P5 U158 ( .A1(ahb_rdata_reg[28]), .A2(n104), .X(HRDATA[28]) );
  SAEDRVT14_AN2_MM_0P5 U159 ( .A1(ahb_rdata_reg[26]), .A2(n104), .X(HRDATA[26]) );
  SAEDRVT14_BUF_U_0P5 U160 ( .A(n104), .X(n102) );
  SAEDRVT14_AN2_MM_0P5 U161 ( .A1(ahb_rdata_reg[16]), .A2(n102), .X(HRDATA[16]) );
  SAEDRVT14_AN2_MM_0P5 U162 ( .A1(ahb_rdata_reg[13]), .A2(n102), .X(HRDATA[13]) );
  SAEDRVT14_AN2_MM_0P5 U163 ( .A1(ahb_rdata_reg[15]), .A2(n102), .X(HRDATA[15]) );
  SAEDRVT14_AN2_MM_0P5 U164 ( .A1(ahb_rdata_reg[14]), .A2(n102), .X(HRDATA[14]) );
  SAEDRVT14_AN2_MM_0P5 U165 ( .A1(ahb_rdata_reg[12]), .A2(n102), .X(HRDATA[12]) );
  SAEDRVT14_AN2_MM_0P5 U166 ( .A1(ahb_rdata_reg[27]), .A2(n102), .X(HRDATA[27]) );
  SAEDRVT14_AN2_MM_0P5 U167 ( .A1(ahb_rdata_reg[17]), .A2(n102), .X(HRDATA[17]) );
  SAEDRVT14_AN2_MM_0P5 U168 ( .A1(ahb_rdata_reg[19]), .A2(n102), .X(HRDATA[19]) );
  SAEDRVT14_AN2_MM_0P5 U169 ( .A1(ahb_rdata_reg[20]), .A2(n102), .X(HRDATA[20]) );
  SAEDRVT14_AN2_MM_0P5 U170 ( .A1(ahb_rdata_reg[21]), .A2(n102), .X(HRDATA[21]) );
  SAEDRVT14_AN2_MM_0P5 U171 ( .A1(ahb_rdata_reg[22]), .A2(n102), .X(HRDATA[22]) );
  SAEDRVT14_AN2_MM_0P5 U172 ( .A1(ahb_rdata_reg[23]), .A2(n102), .X(HRDATA[23]) );
  SAEDRVT14_AN2_MM_0P5 U173 ( .A1(ahb_rdata_reg[18]), .A2(n102), .X(HRDATA[18]) );
  SAEDRVT14_AN2_MM_0P5 U174 ( .A1(ahb_rdata_reg[29]), .A2(n102), .X(HRDATA[29]) );
  SAEDRVT14_AN2_MM_0P5 U175 ( .A1(ahb_rdata_reg[30]), .A2(n102), .X(HRDATA[30]) );
  SAEDRVT14_AN2_MM_0P5 U176 ( .A1(ahb_rdata_reg[31]), .A2(n102), .X(HRDATA[31]) );
  SAEDRVT14_MUX2_U_0P5 U177 ( .D0(a_reg[0]), .D1(HADDR[0]), .S(N10), .X(n101)
         );
  SAEDRVT14_MUX2_U_0P5 U178 ( .D0(w_reg), .D1(HWRITE), .S(N10), .X(n100) );
  SAEDRVT14_MUX2_U_0P5 U179 ( .D0(a_reg[31]), .D1(HADDR[31]), .S(N10), .X(n99)
         );
  SAEDRVT14_MUX2_U_0P5 U180 ( .D0(a_reg[30]), .D1(HADDR[30]), .S(N10), .X(n98)
         );
  SAEDRVT14_MUX2_U_0P5 U181 ( .D0(a_reg[29]), .D1(HADDR[29]), .S(N10), .X(n97)
         );
  SAEDRVT14_MUX2_U_0P5 U182 ( .D0(a_reg[28]), .D1(HADDR[28]), .S(N10), .X(n96)
         );
  SAEDRVT14_MUX2_U_0P5 U183 ( .D0(a_reg[27]), .D1(HADDR[27]), .S(N10), .X(n95)
         );
  SAEDRVT14_MUX2_U_0P5 U184 ( .D0(a_reg[26]), .D1(HADDR[26]), .S(N10), .X(n94)
         );
  SAEDRVT14_MUX2_U_0P5 U185 ( .D0(a_reg[25]), .D1(HADDR[25]), .S(N10), .X(n93)
         );
  SAEDRVT14_MUX2_U_0P5 U186 ( .D0(a_reg[24]), .D1(HADDR[24]), .S(N10), .X(n92)
         );
  SAEDRVT14_MUX2_U_0P5 U187 ( .D0(a_reg[23]), .D1(HADDR[23]), .S(N10), .X(n91)
         );
  SAEDRVT14_MUX2_U_0P5 U188 ( .D0(a_reg[22]), .D1(HADDR[22]), .S(N10), .X(n90)
         );
  SAEDRVT14_BUF_U_0P5 U189 ( .A(N10), .X(n103) );
  SAEDRVT14_MUX2_U_0P5 U190 ( .D0(a_reg[21]), .D1(HADDR[21]), .S(n103), .X(n89) );
  SAEDRVT14_MUX2_U_0P5 U191 ( .D0(a_reg[20]), .D1(HADDR[20]), .S(n103), .X(n88) );
  SAEDRVT14_MUX2_U_0P5 U192 ( .D0(a_reg[19]), .D1(HADDR[19]), .S(n103), .X(n87) );
  SAEDRVT14_MUX2_U_0P5 U193 ( .D0(a_reg[18]), .D1(HADDR[18]), .S(n103), .X(n86) );
  SAEDRVT14_MUX2_U_0P5 U194 ( .D0(a_reg[17]), .D1(HADDR[17]), .S(n103), .X(n85) );
  SAEDRVT14_MUX2_U_0P5 U195 ( .D0(a_reg[16]), .D1(HADDR[16]), .S(n103), .X(n84) );
  SAEDRVT14_MUX2_U_0P5 U196 ( .D0(a_reg[15]), .D1(HADDR[15]), .S(n103), .X(n83) );
  SAEDRVT14_MUX2_U_0P5 U197 ( .D0(a_reg[14]), .D1(HADDR[14]), .S(n103), .X(n82) );
  SAEDRVT14_MUX2_U_0P5 U198 ( .D0(a_reg[13]), .D1(HADDR[13]), .S(n103), .X(n81) );
  SAEDRVT14_MUX2_U_0P5 U199 ( .D0(a_reg[12]), .D1(HADDR[12]), .S(n103), .X(n80) );
  SAEDRVT14_MUX2_U_0P5 U200 ( .D0(a_reg[11]), .D1(HADDR[11]), .S(n103), .X(n79) );
  SAEDRVT14_MUX2_U_0P5 U201 ( .D0(a_reg[10]), .D1(HADDR[10]), .S(n103), .X(n78) );
  SAEDRVT14_MUX2_U_0P5 U202 ( .D0(a_reg[9]), .D1(HADDR[9]), .S(N10), .X(n77)
         );
  SAEDRVT14_MUX2_U_0P5 U203 ( .D0(a_reg[8]), .D1(HADDR[8]), .S(N10), .X(n76)
         );
  SAEDRVT14_MUX2_U_0P5 U204 ( .D0(a_reg[7]), .D1(HADDR[7]), .S(N10), .X(n75)
         );
  SAEDRVT14_MUX2_U_0P5 U205 ( .D0(a_reg[6]), .D1(HADDR[6]), .S(N10), .X(n74)
         );
  SAEDRVT14_MUX2_U_0P5 U206 ( .D0(a_reg[5]), .D1(HADDR[5]), .S(N10), .X(n73)
         );
  SAEDRVT14_MUX2_U_0P5 U207 ( .D0(a_reg[4]), .D1(HADDR[4]), .S(N10), .X(n72)
         );
  SAEDRVT14_MUX2_U_0P5 U208 ( .D0(a_reg[3]), .D1(HADDR[3]), .S(N10), .X(n71)
         );
  SAEDRVT14_MUX2_U_0P5 U209 ( .D0(a_reg[2]), .D1(HADDR[2]), .S(n103), .X(n70)
         );
  SAEDRVT14_MUX2_U_0P5 U210 ( .D0(a_reg[1]), .D1(HADDR[1]), .S(n103), .X(n69)
         );
  SAEDRVT14_ND2B_U_0P5 U211 ( .A(N10), .B(HREADYOUT), .X(n68) );
  SAEDRVT14_ND2_CDC_1 U212 ( .A1(fsm_done), .A2(n104), .X(n105) );
  SAEDRVT14_MUX2_U_0P5 U213 ( .D0(fsm_rx[31]), .D1(ahb_rdata_reg[31]), .S(n105), .X(n67) );
  SAEDRVT14_MUX2_U_0P5 U214 ( .D0(fsm_rx[30]), .D1(ahb_rdata_reg[30]), .S(n105), .X(n66) );
  SAEDRVT14_MUX2_U_0P5 U215 ( .D0(fsm_rx[29]), .D1(ahb_rdata_reg[29]), .S(n105), .X(n65) );
  SAEDRVT14_MUX2_U_0P5 U216 ( .D0(fsm_rx[28]), .D1(ahb_rdata_reg[28]), .S(n105), .X(n64) );
  SAEDRVT14_MUX2_U_0P5 U217 ( .D0(fsm_rx[27]), .D1(ahb_rdata_reg[27]), .S(n105), .X(n63) );
  SAEDRVT14_MUX2_U_0P5 U218 ( .D0(fsm_rx[26]), .D1(ahb_rdata_reg[26]), .S(n105), .X(n62) );
  SAEDRVT14_MUX2_U_0P5 U219 ( .D0(fsm_rx[25]), .D1(ahb_rdata_reg[25]), .S(n105), .X(n61) );
  SAEDRVT14_MUX2_U_0P5 U220 ( .D0(fsm_rx[24]), .D1(ahb_rdata_reg[24]), .S(n105), .X(n60) );
  SAEDRVT14_MUX2_U_0P5 U221 ( .D0(fsm_rx[23]), .D1(ahb_rdata_reg[23]), .S(n105), .X(n59) );
  SAEDRVT14_MUX2_U_0P5 U222 ( .D0(fsm_rx[22]), .D1(ahb_rdata_reg[22]), .S(n105), .X(n58) );
  SAEDRVT14_MUX2_U_0P5 U223 ( .D0(fsm_rx[21]), .D1(ahb_rdata_reg[21]), .S(n105), .X(n57) );
  SAEDRVT14_MUX2_U_0P5 U224 ( .D0(fsm_rx[20]), .D1(ahb_rdata_reg[20]), .S(n105), .X(n56) );
  SAEDRVT14_MUX2_U_0P5 U225 ( .D0(fsm_rx[19]), .D1(ahb_rdata_reg[19]), .S(n105), .X(n55) );
  SAEDRVT14_MUX2_U_0P5 U226 ( .D0(fsm_rx[18]), .D1(ahb_rdata_reg[18]), .S(n105), .X(n54) );
  SAEDRVT14_MUX2_U_0P5 U227 ( .D0(fsm_rx[17]), .D1(ahb_rdata_reg[17]), .S(n105), .X(n53) );
  SAEDRVT14_MUX2_U_0P5 U228 ( .D0(fsm_rx[16]), .D1(ahb_rdata_reg[16]), .S(n105), .X(n52) );
  SAEDRVT14_MUX2_U_0P5 U229 ( .D0(fsm_rx[15]), .D1(ahb_rdata_reg[15]), .S(n105), .X(n51) );
  SAEDRVT14_MUX2_U_0P5 U230 ( .D0(fsm_rx[14]), .D1(ahb_rdata_reg[14]), .S(n105), .X(n50) );
  SAEDRVT14_MUX2_U_0P5 U231 ( .D0(fsm_rx[13]), .D1(ahb_rdata_reg[13]), .S(n105), .X(n49) );
  SAEDRVT14_MUX2_U_0P5 U232 ( .D0(fsm_rx[12]), .D1(ahb_rdata_reg[12]), .S(n105), .X(n48) );
  SAEDRVT14_MUX2_U_0P5 U233 ( .D0(fsm_rx[11]), .D1(ahb_rdata_reg[11]), .S(n105), .X(n47) );
  SAEDRVT14_MUX2_U_0P5 U234 ( .D0(fsm_rx[10]), .D1(ahb_rdata_reg[10]), .S(n105), .X(n46) );
  SAEDRVT14_MUX2_U_0P5 U235 ( .D0(fsm_rx[9]), .D1(ahb_rdata_reg[9]), .S(n105), 
        .X(n45) );
  SAEDRVT14_MUX2_U_0P5 U236 ( .D0(fsm_rx[8]), .D1(ahb_rdata_reg[8]), .S(n105), 
        .X(n44) );
  SAEDRVT14_MUX2_U_0P5 U237 ( .D0(fsm_rx[7]), .D1(ahb_rdata_reg[7]), .S(n105), 
        .X(n43) );
  SAEDRVT14_MUX2_U_0P5 U238 ( .D0(fsm_rx[6]), .D1(ahb_rdata_reg[6]), .S(n105), 
        .X(n42) );
  SAEDRVT14_MUX2_U_0P5 U239 ( .D0(fsm_rx[5]), .D1(ahb_rdata_reg[5]), .S(n105), 
        .X(n41) );
  SAEDRVT14_MUX2_U_0P5 U240 ( .D0(fsm_rx[4]), .D1(ahb_rdata_reg[4]), .S(n105), 
        .X(n40) );
  SAEDRVT14_MUX2_U_0P5 U241 ( .D0(fsm_rx[3]), .D1(ahb_rdata_reg[3]), .S(n105), 
        .X(n39) );
  SAEDRVT14_MUX2_U_0P5 U242 ( .D0(fsm_rx[2]), .D1(ahb_rdata_reg[2]), .S(n105), 
        .X(n38) );
  SAEDRVT14_MUX2_U_0P5 U243 ( .D0(fsm_rx[1]), .D1(ahb_rdata_reg[1]), .S(n105), 
        .X(n37) );
  SAEDRVT14_MUX2_U_0P5 U244 ( .D0(fsm_rx[0]), .D1(ahb_rdata_reg[0]), .S(n105), 
        .X(n36) );
  SAEDRVT14_MUX2_U_0P5 U245 ( .D0(HWDATA[0]), .D1(ahb_wdata_reg[0]), .S(n106), 
        .X(n35) );
  SAEDRVT14_MUX2_U_0P5 U246 ( .D0(HWDATA[31]), .D1(ahb_wdata_reg[31]), .S(n106), .X(n34) );
  SAEDRVT14_MUX2_U_0P5 U247 ( .D0(HWDATA[30]), .D1(ahb_wdata_reg[30]), .S(n106), .X(n33) );
  SAEDRVT14_MUX2_U_0P5 U248 ( .D0(HWDATA[29]), .D1(ahb_wdata_reg[29]), .S(n106), .X(n32) );
  SAEDRVT14_MUX2_U_0P5 U249 ( .D0(HWDATA[28]), .D1(ahb_wdata_reg[28]), .S(n106), .X(n31) );
  SAEDRVT14_MUX2_U_0P5 U250 ( .D0(HWDATA[27]), .D1(ahb_wdata_reg[27]), .S(n106), .X(n30) );
  SAEDRVT14_MUX2_U_0P5 U251 ( .D0(HWDATA[26]), .D1(ahb_wdata_reg[26]), .S(n106), .X(n29) );
  SAEDRVT14_MUX2_U_0P5 U252 ( .D0(HWDATA[25]), .D1(ahb_wdata_reg[25]), .S(n106), .X(n28) );
  SAEDRVT14_MUX2_U_0P5 U253 ( .D0(HWDATA[24]), .D1(ahb_wdata_reg[24]), .S(n106), .X(n27) );
  SAEDRVT14_MUX2_U_0P5 U254 ( .D0(HWDATA[23]), .D1(ahb_wdata_reg[23]), .S(n106), .X(n26) );
  SAEDRVT14_MUX2_U_0P5 U255 ( .D0(HWDATA[22]), .D1(ahb_wdata_reg[22]), .S(n106), .X(n25) );
  SAEDRVT14_MUX2_U_0P5 U256 ( .D0(HWDATA[21]), .D1(ahb_wdata_reg[21]), .S(n106), .X(n24) );
  SAEDRVT14_MUX2_U_0P5 U257 ( .D0(HWDATA[20]), .D1(ahb_wdata_reg[20]), .S(n106), .X(n23) );
  SAEDRVT14_MUX2_U_0P5 U258 ( .D0(HWDATA[19]), .D1(ahb_wdata_reg[19]), .S(n106), .X(n22) );
  SAEDRVT14_MUX2_U_0P5 U259 ( .D0(HWDATA[18]), .D1(ahb_wdata_reg[18]), .S(n106), .X(n21) );
  SAEDRVT14_MUX2_U_0P5 U260 ( .D0(HWDATA[17]), .D1(ahb_wdata_reg[17]), .S(n106), .X(n20) );
  SAEDRVT14_MUX2_U_0P5 U261 ( .D0(HWDATA[16]), .D1(ahb_wdata_reg[16]), .S(n106), .X(n19) );
  SAEDRVT14_MUX2_U_0P5 U262 ( .D0(HWDATA[15]), .D1(ahb_wdata_reg[15]), .S(n106), .X(n18) );
  SAEDRVT14_MUX2_U_0P5 U263 ( .D0(HWDATA[14]), .D1(ahb_wdata_reg[14]), .S(n106), .X(n17) );
  SAEDRVT14_MUX2_U_0P5 U264 ( .D0(HWDATA[13]), .D1(ahb_wdata_reg[13]), .S(n106), .X(n16) );
  SAEDRVT14_MUX2_U_0P5 U265 ( .D0(HWDATA[12]), .D1(ahb_wdata_reg[12]), .S(n106), .X(n15) );
  SAEDRVT14_MUX2_U_0P5 U266 ( .D0(HWDATA[11]), .D1(ahb_wdata_reg[11]), .S(n106), .X(n14) );
  SAEDRVT14_MUX2_U_0P5 U267 ( .D0(HWDATA[10]), .D1(ahb_wdata_reg[10]), .S(n106), .X(n13) );
  SAEDRVT14_MUX2_U_0P5 U268 ( .D0(HWDATA[9]), .D1(ahb_wdata_reg[9]), .S(n106), 
        .X(n12) );
  SAEDRVT14_MUX2_U_0P5 U269 ( .D0(HWDATA[8]), .D1(ahb_wdata_reg[8]), .S(n106), 
        .X(n11) );
  SAEDRVT14_MUX2_U_0P5 U270 ( .D0(HWDATA[7]), .D1(ahb_wdata_reg[7]), .S(n106), 
        .X(n10) );
  SAEDRVT14_MUX2_U_0P5 U271 ( .D0(HWDATA[6]), .D1(ahb_wdata_reg[6]), .S(n106), 
        .X(n9) );
  SAEDRVT14_MUX2_U_0P5 U272 ( .D0(HWDATA[5]), .D1(ahb_wdata_reg[5]), .S(n106), 
        .X(n8) );
  SAEDRVT14_MUX2_U_0P5 U273 ( .D0(HWDATA[4]), .D1(ahb_wdata_reg[4]), .S(n106), 
        .X(n7) );
  SAEDRVT14_MUX2_U_0P5 U274 ( .D0(HWDATA[3]), .D1(ahb_wdata_reg[3]), .S(n106), 
        .X(n6) );
  SAEDRVT14_MUX2_U_0P5 U275 ( .D0(HWDATA[2]), .D1(ahb_wdata_reg[2]), .S(n106), 
        .X(n5) );
  SAEDRVT14_MUX2_U_0P5 U276 ( .D0(HWDATA[1]), .D1(ahb_wdata_reg[1]), .S(n106), 
        .X(n4) );
endmodule

