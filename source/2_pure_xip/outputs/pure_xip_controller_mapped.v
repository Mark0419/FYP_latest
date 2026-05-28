/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP2
// Date      : Thu May 28 16:27:52 2026
/////////////////////////////////////////////////////////////


module qspi_pure_xip ( clk, rst_n, start, addr_in, done, qspi_cs_n, qspi_clk, 
        qspi_io_oe, qspi_io_out, rx_data, qspi_io_in );
  input [31:0] addr_in;
  output [3:0] qspi_io_out;
  output [31:0] rx_data;
  input [3:0] qspi_io_in;
  input clk, rst_n, start;
  output done, qspi_cs_n, qspi_clk, qspi_io_oe;
  wire   xip_active, N45, N46, N47, N48, N49, N50, N51, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n1, n2, n3, n4, n5, n6, n7, n8,
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
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258;
  wire   [2:0] next;
  wire   [2:0] state;
  wire   [5:0] cnt;
  wire   [31:0] sreg;

  SAEDRVT14_FDPRBQ_V2_0P5 xip_active_reg ( .D(n241), .CK(clk), .RD(rst_n), .Q(
        xip_active) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_0_ ( .D(next[0]), .CK(clk), .RD(rst_n), 
        .Q(state[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_0_ ( .D(N45), .CK(clk), .RD(rst_n), .Q(
        cnt[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_1_ ( .D(N46), .CK(clk), .RD(rst_n), .Q(
        cnt[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_2_ ( .D(N47), .CK(clk), .RD(rst_n), .Q(
        cnt[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_3_ ( .D(N48), .CK(clk), .RD(rst_n), .Q(
        cnt[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 cnt_reg_4_ ( .D(N49), .CK(clk), .RD(rst_n), .Q(
        cnt[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_1_ ( .D(next[1]), .CK(clk), .RD(rst_n), 
        .Q(state[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 state_reg_2_ ( .D(next[2]), .CK(clk), .RD(rst_n), 
        .Q(state[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_0_ ( .D(n240), .CK(clk), .RD(rst_n), .Q(
        rx_data[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_4_ ( .D(n239), .CK(clk), .RD(rst_n), .Q(
        rx_data[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_8_ ( .D(n238), .CK(clk), .RD(rst_n), .Q(
        rx_data[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_12_ ( .D(n237), .CK(clk), .RD(rst_n), .Q(
        rx_data[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_16_ ( .D(n236), .CK(clk), .RD(rst_n), .Q(
        rx_data[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_20_ ( .D(n235), .CK(clk), .RD(rst_n), .Q(
        rx_data[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_24_ ( .D(n234), .CK(clk), .RD(rst_n), .Q(
        rx_data[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_28_ ( .D(n233), .CK(clk), .RD(rst_n), .Q(
        rx_data[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_3_ ( .D(n232), .CK(clk), .RD(rst_n), .Q(
        rx_data[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_7_ ( .D(n231), .CK(clk), .RD(rst_n), .Q(
        rx_data[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_11_ ( .D(n230), .CK(clk), .RD(rst_n), .Q(
        rx_data[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_15_ ( .D(n229), .CK(clk), .RD(rst_n), .Q(
        rx_data[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_23_ ( .D(n227), .CK(clk), .RD(rst_n), .Q(
        rx_data[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_27_ ( .D(n226), .CK(clk), .RD(rst_n), .Q(
        rx_data[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_31_ ( .D(n225), .CK(clk), .RD(rst_n), .Q(
        rx_data[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_2_ ( .D(n224), .CK(clk), .RD(rst_n), .Q(
        rx_data[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_6_ ( .D(n223), .CK(clk), .RD(rst_n), .Q(
        rx_data[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_10_ ( .D(n222), .CK(clk), .RD(rst_n), .Q(
        rx_data[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_14_ ( .D(n221), .CK(clk), .RD(rst_n), .Q(
        rx_data[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_18_ ( .D(n220), .CK(clk), .RD(rst_n), .Q(
        rx_data[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_22_ ( .D(n219), .CK(clk), .RD(rst_n), .Q(
        rx_data[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_26_ ( .D(n218), .CK(clk), .RD(rst_n), .Q(
        rx_data[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_30_ ( .D(n217), .CK(clk), .RD(rst_n), .Q(
        rx_data[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_1_ ( .D(n216), .CK(clk), .RD(rst_n), .Q(
        rx_data[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_5_ ( .D(n215), .CK(clk), .RD(rst_n), .Q(
        rx_data[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_9_ ( .D(n214), .CK(clk), .RD(rst_n), .Q(
        rx_data[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_17_ ( .D(n212), .CK(clk), .RD(rst_n), .Q(
        rx_data[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_21_ ( .D(n211), .CK(clk), .RD(rst_n), .Q(
        rx_data[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_25_ ( .D(n210), .CK(clk), .RD(rst_n), .Q(
        rx_data[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 rx_reg_reg_29_ ( .D(n209), .CK(clk), .RD(rst_n), .Q(
        rx_data[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_0_ ( .D(n207), .CK(clk), .RD(rst_n), .Q(
        sreg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_1_ ( .D(n206), .CK(clk), .RD(rst_n), .Q(
        sreg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_2_ ( .D(n205), .CK(clk), .RD(rst_n), .Q(
        sreg[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_3_ ( .D(n204), .CK(clk), .RD(rst_n), .Q(
        sreg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_4_ ( .D(n203), .CK(clk), .RD(rst_n), .Q(
        sreg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_5_ ( .D(n202), .CK(clk), .RD(rst_n), .Q(
        sreg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_6_ ( .D(n201), .CK(clk), .RD(rst_n), .Q(
        sreg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_7_ ( .D(n200), .CK(clk), .RD(rst_n), .Q(
        sreg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_8_ ( .D(n199), .CK(clk), .RD(rst_n), .Q(
        sreg[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_9_ ( .D(n198), .CK(clk), .RD(rst_n), .Q(
        sreg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_11_ ( .D(n196), .CK(clk), .RD(rst_n), .Q(
        sreg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_12_ ( .D(n195), .CK(clk), .RD(rst_n), .Q(
        sreg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_13_ ( .D(n194), .CK(clk), .RD(rst_n), .Q(
        sreg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_14_ ( .D(n193), .CK(clk), .RD(rst_n), .Q(
        sreg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_15_ ( .D(n192), .CK(clk), .RD(rst_n), .Q(
        sreg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_16_ ( .D(n191), .CK(clk), .RD(rst_n), .Q(
        sreg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_17_ ( .D(n190), .CK(clk), .RD(rst_n), .Q(
        sreg[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_18_ ( .D(n189), .CK(clk), .RD(rst_n), .Q(
        sreg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_19_ ( .D(n188), .CK(clk), .RD(rst_n), .Q(
        sreg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_20_ ( .D(n187), .CK(clk), .RD(rst_n), .Q(
        sreg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_21_ ( .D(n186), .CK(clk), .RD(rst_n), .Q(
        sreg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_22_ ( .D(n185), .CK(clk), .RD(rst_n), .Q(
        sreg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_23_ ( .D(n184), .CK(clk), .RD(rst_n), .Q(
        sreg[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_24_ ( .D(n183), .CK(clk), .RD(rst_n), .Q(
        sreg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_26_ ( .D(n181), .CK(clk), .RD(rst_n), .Q(
        sreg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_27_ ( .D(n180), .CK(clk), .RD(rst_n), .Q(
        sreg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_28_ ( .D(n179), .CK(clk), .RD(rst_n), .Q(
        sreg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_29_ ( .D(n178), .CK(clk), .RD(rst_n), .Q(
        sreg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 sreg_reg_30_ ( .D(n208), .CK(clk), .RD(rst_n), .Q(
        sreg[30]) );
  SAEDRVT14_FDPSBQ_0P5 qspi_cs_n_reg ( .D(N51), .CK(clk), .SD(rst_n), .Q(
        qspi_cs_n) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 cnt_reg_5_ ( .D(N50), .CK(clk), .RD(rst_n), .Q(
        cnt[5]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 rx_reg_reg_19_ ( .D(n228), .CK(clk), .RD(rst_n), 
        .Q(rx_data[19]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 rx_reg_reg_13_ ( .D(n213), .CK(clk), .RD(rst_n), 
        .Q(rx_data[13]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 sreg_reg_10_ ( .D(n197), .CK(clk), .RD(rst_n), .Q(
        sreg[10]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 sreg_reg_25_ ( .D(n182), .CK(clk), .RD(rst_n), .Q(
        sreg[25]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 sreg_reg_31_ ( .D(n177), .CK(clk), .RD(rst_n), .Q(
        sreg[31]) );
  SAEDRVT14_INV_1P5 U3 ( .A(state[0]), .X(n39) );
  SAEDRVT14_AOI21_0P75 U4 ( .A1(n39), .A2(n36), .B(state[2]), .X(qspi_io_oe)
         );
  SAEDRVT14_INV_S_0P75 U5 ( .A(state[1]), .X(n36) );
  SAEDRVT14_OR2_MM_0P5 U6 ( .A1(n80), .A2(n148), .X(n1) );
  SAEDRVT14_OAI21_0P5 U7 ( .A1(n244), .A2(n2), .B(n1), .X(n258) );
  SAEDRVT14_ND2_CDC_1 U8 ( .A1(n78), .A2(xip_active), .X(n2) );
  SAEDRVT14_ND2_CDC_1 U9 ( .A1(n36), .A2(state[2]), .X(n38) );
  SAEDRVT14_INV_0P5 U10 ( .A(n38), .X(n81) );
  SAEDRVT14_OA21B_1 U11 ( .A1(n81), .A2(qspi_io_oe), .B(clk), .X(qspi_clk) );
  SAEDRVT14_OR2_MM_0P5 U12 ( .A1(cnt[5]), .A2(cnt[3]), .X(n3) );
  SAEDRVT14_NR2_1 U13 ( .A1(cnt[4]), .A2(n3), .X(n4) );
  SAEDRVT14_ND2_CDC_1 U14 ( .A1(cnt[0]), .A2(n4), .X(n11) );
  SAEDRVT14_OR3_0P5 U15 ( .A1(cnt[1]), .A2(cnt[2]), .A3(n11), .X(n7) );
  SAEDRVT14_INV_0P5 U16 ( .A(state[2]), .X(n5) );
  SAEDRVT14_ND2_CDC_1 U17 ( .A1(n5), .A2(state[1]), .X(n150) );
  SAEDRVT14_INV_0P5 U18 ( .A(n150), .X(n9) );
  SAEDRVT14_ND2_CDC_1 U19 ( .A1(state[0]), .A2(n9), .X(n6) );
  SAEDRVT14_OAI21_0P5 U20 ( .A1(n7), .A2(n6), .B(n38), .X(next[2]) );
  SAEDRVT14_AN2_MM_0P5 U21 ( .A1(cnt[0]), .A2(cnt[1]), .X(n76) );
  SAEDRVT14_ND2_CDC_1 U22 ( .A1(n76), .A2(cnt[2]), .X(n165) );
  SAEDRVT14_OR4_1 U23 ( .A1(cnt[5]), .A2(cnt[4]), .A3(cnt[3]), .A4(n165), .X(
        n80) );
  SAEDRVT14_ND2_CDC_1 U24 ( .A1(state[0]), .A2(n36), .X(n32) );
  SAEDRVT14_OR3_0P5 U25 ( .A1(state[0]), .A2(state[2]), .A3(state[1]), .X(n159) );
  SAEDRVT14_INV_0P5 U26 ( .A(n159), .X(n78) );
  SAEDRVT14_ND2_CDC_1 U27 ( .A1(n78), .A2(start), .X(n18) );
  SAEDRVT14_INV_0P5 U28 ( .A(xip_active), .X(n77) );
  SAEDRVT14_AN3_0P5 U29 ( .A1(n9), .A2(state[0]), .A3(n7), .X(n15) );
  SAEDRVT14_INV_0P5 U30 ( .A(n15), .X(n8) );
  SAEDRVT14_OAI21_0P5 U31 ( .A1(n18), .A2(n77), .B(n8), .X(n35) );
  SAEDRVT14_AOI21_0P75 U32 ( .A1(n9), .A2(n39), .B(n35), .X(n37) );
  SAEDRVT14_OAI21_0P5 U33 ( .A1(n80), .A2(n32), .B(n37), .X(next[1]) );
  SAEDRVT14_ND2_CDC_1 U34 ( .A1(n9), .A2(n39), .X(n10) );
  SAEDRVT14_NR2_1 U35 ( .A1(n80), .A2(n10), .X(n154) );
  SAEDRVT14_INV_0P5 U36 ( .A(n80), .X(n19) );
  SAEDRVT14_INV_0P5 U37 ( .A(cnt[1]), .X(n12) );
  SAEDRVT14_OA31_1 U38 ( .A1(n12), .A2(n38), .A3(n11), .B(n32), .X(n13) );
  SAEDRVT14_OAI22_0P5 U39 ( .A1(xip_active), .A2(n18), .B1(n19), .B2(n13), .X(
        n14) );
  SAEDRVT14_OR3_0P5 U40 ( .A1(n154), .A2(n15), .A3(n14), .X(next[0]) );
  SAEDRVT14_INV_0P5 U41 ( .A(next[1]), .X(n17) );
  SAEDRVT14_INV_0P5 U42 ( .A(next[0]), .X(n33) );
  SAEDRVT14_OAI21_0P5 U43 ( .A1(n17), .A2(next[2]), .B(n33), .X(n16) );
  SAEDRVT14_AOI21_0P75 U44 ( .A1(n17), .A2(next[2]), .B(n16), .X(N51) );
  SAEDRVT14_AN3_0P5 U45 ( .A1(state[2]), .A2(state[1]), .A3(n39), .X(done) );
  SAEDRVT14_OAI21_0P5 U46 ( .A1(n38), .A2(state[0]), .B(n150), .X(n155) );
  SAEDRVT14_INV_0P5 U47 ( .A(n155), .X(n21) );
  SAEDRVT14_OR2_MM_0P5 U48 ( .A1(n32), .A2(state[2]), .X(n148) );
  SAEDRVT14_AN3_0P5 U49 ( .A1(n21), .A2(n18), .A3(n148), .X(n244) );
  SAEDRVT14_OAI21_0P5 U50 ( .A1(n80), .A2(n148), .B(n159), .X(n176) );
  SAEDRVT14_INV_0P5 U51 ( .A(sreg[25]), .X(n122) );
  SAEDRVT14_NR2_1 U52 ( .A1(n148), .A2(n19), .X(n24) );
  SAEDRVT14_AO21_U_0P5 U53 ( .A1(n78), .A2(n77), .B(n154), .X(n28) );
  SAEDRVT14_AOI21_0P75 U54 ( .A1(n24), .A2(sreg[28]), .B(n28), .X(n20) );
  SAEDRVT14_OAI21_0P5 U55 ( .A1(n21), .A2(n122), .B(n20), .X(n22) );
  SAEDRVT14_AOI21_0P75 U56 ( .A1(addr_in[29]), .A2(n176), .B(n22), .X(n23) );
  SAEDRVT14_INV_0P5 U57 ( .A(n244), .X(n256) );
  SAEDRVT14_BUF_U_0P5 U58 ( .A(n256), .X(n158) );
  SAEDRVT14_INV_0P5 U59 ( .A(sreg[29]), .X(n248) );
  SAEDRVT14_OAI22_0P5 U60 ( .A1(n244), .A2(n23), .B1(n158), .B2(n248), .X(n178) );
  SAEDRVT14_INV_0P5 U61 ( .A(n24), .X(n254) );
  SAEDRVT14_INV_0P5 U62 ( .A(sreg[30]), .X(n243) );
  SAEDRVT14_AOI21_0P75 U63 ( .A1(sreg[27]), .A2(n155), .B(n28), .X(n25) );
  SAEDRVT14_OAI21_0P5 U64 ( .A1(n254), .A2(n243), .B(n25), .X(n26) );
  SAEDRVT14_AOI21_0P75 U65 ( .A1(addr_in[31]), .A2(n176), .B(n26), .X(n27) );
  SAEDRVT14_INV_0P5 U66 ( .A(sreg[31]), .X(n147) );
  SAEDRVT14_OAI22_0P5 U67 ( .A1(n244), .A2(n27), .B1(n158), .B2(n147), .X(n177) );
  SAEDRVT14_AOI21_0P75 U68 ( .A1(sreg[22]), .A2(n155), .B(n28), .X(n29) );
  SAEDRVT14_OAI21_0P5 U69 ( .A1(n254), .A2(n122), .B(n29), .X(n30) );
  SAEDRVT14_AOI21_0P75 U70 ( .A1(addr_in[26]), .A2(n176), .B(n30), .X(n31) );
  SAEDRVT14_INV_0P5 U71 ( .A(sreg[26]), .X(n164) );
  SAEDRVT14_OAI22_0P5 U72 ( .A1(n244), .A2(n31), .B1(n158), .B2(n164), .X(n181) );
  SAEDRVT14_OAI22_0P5 U73 ( .A1(state[0]), .A2(n33), .B1(n80), .B2(n32), .X(
        n34) );
  SAEDRVT14_AO221_0P5 U74 ( .A1(state[1]), .A2(n37), .B1(n36), .B2(n35), .C(
        n34), .X(n72) );
  SAEDRVT14_NR2_1 U75 ( .A1(cnt[0]), .A2(n72), .X(N45) );
  SAEDRVT14_NR2_1 U76 ( .A1(n39), .A2(n38), .X(n173) );
  SAEDRVT14_INV_0P5 U77 ( .A(rx_data[4]), .X(n41) );
  SAEDRVT14_INV_0P5 U78 ( .A(n173), .X(n174) );
  SAEDRVT14_INV_0P5 U79 ( .A(rx_data[0]), .X(n40) );
  SAEDRVT14_OAI22_0P5 U80 ( .A1(n173), .A2(n41), .B1(n174), .B2(n40), .X(n239)
         );
  SAEDRVT14_INV_0P5 U81 ( .A(rx_data[8]), .X(n42) );
  SAEDRVT14_OAI22_0P5 U82 ( .A1(n173), .A2(n42), .B1(n174), .B2(n41), .X(n238)
         );
  SAEDRVT14_INV_0P5 U83 ( .A(rx_data[12]), .X(n43) );
  SAEDRVT14_OAI22_0P5 U84 ( .A1(n173), .A2(n43), .B1(n174), .B2(n42), .X(n237)
         );
  SAEDRVT14_INV_0P5 U85 ( .A(rx_data[16]), .X(n44) );
  SAEDRVT14_OAI22_0P5 U86 ( .A1(n173), .A2(n44), .B1(n174), .B2(n43), .X(n236)
         );
  SAEDRVT14_INV_0P5 U87 ( .A(rx_data[20]), .X(n45) );
  SAEDRVT14_OAI22_0P5 U88 ( .A1(n173), .A2(n45), .B1(n174), .B2(n44), .X(n235)
         );
  SAEDRVT14_INV_0P5 U89 ( .A(rx_data[24]), .X(n46) );
  SAEDRVT14_OAI22_0P5 U90 ( .A1(n173), .A2(n46), .B1(n174), .B2(n45), .X(n234)
         );
  SAEDRVT14_INV_0P5 U91 ( .A(rx_data[28]), .X(n47) );
  SAEDRVT14_OAI22_0P5 U92 ( .A1(n173), .A2(n47), .B1(n174), .B2(n46), .X(n233)
         );
  SAEDRVT14_INV_0P5 U93 ( .A(rx_data[7]), .X(n49) );
  SAEDRVT14_INV_0P5 U94 ( .A(rx_data[3]), .X(n48) );
  SAEDRVT14_OAI22_0P5 U95 ( .A1(n173), .A2(n49), .B1(n174), .B2(n48), .X(n231)
         );
  SAEDRVT14_INV_0P5 U96 ( .A(rx_data[11]), .X(n50) );
  SAEDRVT14_OAI22_0P5 U97 ( .A1(n173), .A2(n50), .B1(n174), .B2(n49), .X(n230)
         );
  SAEDRVT14_INV_0P5 U98 ( .A(rx_data[15]), .X(n51) );
  SAEDRVT14_OAI22_0P5 U99 ( .A1(n173), .A2(n51), .B1(n174), .B2(n50), .X(n229)
         );
  SAEDRVT14_INV_0P5 U100 ( .A(rx_data[17]), .X(n57) );
  SAEDRVT14_INV_0P5 U101 ( .A(rx_data[13]), .X(n66) );
  SAEDRVT14_OAI22_0P5 U102 ( .A1(n173), .A2(n57), .B1(n174), .B2(n66), .X(n212) );
  SAEDRVT14_INV_0P5 U103 ( .A(rx_data[19]), .X(n53) );
  SAEDRVT14_OAI22_0P5 U104 ( .A1(n173), .A2(n53), .B1(n174), .B2(n51), .X(n228) );
  SAEDRVT14_INV_0P5 U105 ( .A(rx_data[5]), .X(n64) );
  SAEDRVT14_INV_0P5 U106 ( .A(rx_data[1]), .X(n52) );
  SAEDRVT14_OAI22_0P5 U107 ( .A1(n173), .A2(n64), .B1(n174), .B2(n52), .X(n215) );
  SAEDRVT14_INV_0P5 U108 ( .A(rx_data[23]), .X(n54) );
  SAEDRVT14_OAI22_0P5 U109 ( .A1(n173), .A2(n54), .B1(n174), .B2(n53), .X(n227) );
  SAEDRVT14_INV_0P5 U110 ( .A(rx_data[27]), .X(n55) );
  SAEDRVT14_OAI22_0P5 U111 ( .A1(n173), .A2(n55), .B1(n174), .B2(n54), .X(n226) );
  SAEDRVT14_INV_0P5 U112 ( .A(rx_data[31]), .X(n56) );
  SAEDRVT14_OAI22_0P5 U113 ( .A1(n173), .A2(n56), .B1(n174), .B2(n55), .X(n225) );
  SAEDRVT14_INV_0P5 U114 ( .A(rx_data[21]), .X(n70) );
  SAEDRVT14_OAI22_0P5 U115 ( .A1(n173), .A2(n70), .B1(n174), .B2(n57), .X(n211) );
  SAEDRVT14_INV_0P5 U116 ( .A(rx_data[6]), .X(n59) );
  SAEDRVT14_INV_0P5 U117 ( .A(rx_data[2]), .X(n58) );
  SAEDRVT14_OAI22_0P5 U118 ( .A1(n173), .A2(n59), .B1(n174), .B2(n58), .X(n223) );
  SAEDRVT14_INV_0P5 U119 ( .A(rx_data[10]), .X(n60) );
  SAEDRVT14_OAI22_0P5 U120 ( .A1(n173), .A2(n60), .B1(n174), .B2(n59), .X(n222) );
  SAEDRVT14_INV_0P5 U121 ( .A(rx_data[14]), .X(n62) );
  SAEDRVT14_OAI22_0P5 U122 ( .A1(n173), .A2(n62), .B1(n174), .B2(n60), .X(n221) );
  SAEDRVT14_INV_0P5 U123 ( .A(rx_data[30]), .X(n61) );
  SAEDRVT14_INV_0P5 U124 ( .A(rx_data[26]), .X(n68) );
  SAEDRVT14_OAI22_0P5 U125 ( .A1(n173), .A2(n61), .B1(n174), .B2(n68), .X(n217) );
  SAEDRVT14_INV_0P5 U126 ( .A(rx_data[18]), .X(n63) );
  SAEDRVT14_OAI22_0P5 U127 ( .A1(n173), .A2(n63), .B1(n174), .B2(n62), .X(n220) );
  SAEDRVT14_INV_0P5 U128 ( .A(rx_data[22]), .X(n67) );
  SAEDRVT14_OAI22_0P5 U129 ( .A1(n173), .A2(n67), .B1(n174), .B2(n63), .X(n219) );
  SAEDRVT14_INV_0P5 U130 ( .A(rx_data[9]), .X(n65) );
  SAEDRVT14_OAI22_0P5 U131 ( .A1(n173), .A2(n65), .B1(n174), .B2(n64), .X(n214) );
  SAEDRVT14_OAI22_0P5 U132 ( .A1(n173), .A2(n66), .B1(n174), .B2(n65), .X(n213) );
  SAEDRVT14_OAI22_0P5 U133 ( .A1(n173), .A2(n68), .B1(n174), .B2(n67), .X(n218) );
  SAEDRVT14_INV_0P5 U134 ( .A(rx_data[29]), .X(n69) );
  SAEDRVT14_INV_0P5 U135 ( .A(rx_data[25]), .X(n71) );
  SAEDRVT14_OAI22_0P5 U136 ( .A1(n173), .A2(n69), .B1(n174), .B2(n71), .X(n209) );
  SAEDRVT14_OAI22_0P5 U137 ( .A1(n173), .A2(n71), .B1(n174), .B2(n70), .X(n210) );
  SAEDRVT14_NR2_1 U138 ( .A1(cnt[2]), .A2(n76), .X(n74) );
  SAEDRVT14_INV_0P5 U139 ( .A(n72), .X(n170) );
  SAEDRVT14_ND2_CDC_1 U140 ( .A1(n165), .A2(n170), .X(n73) );
  SAEDRVT14_NR2_1 U141 ( .A1(n74), .A2(n73), .X(N47) );
  SAEDRVT14_OAI21_0P5 U142 ( .A1(cnt[0]), .A2(cnt[1]), .B(n170), .X(n75) );
  SAEDRVT14_NR2_1 U143 ( .A1(n76), .A2(n75), .X(N46) );
  SAEDRVT14_OAI21_0P5 U144 ( .A1(n80), .A2(n174), .B(n77), .X(n241) );
  SAEDRVT14_INV_0P5 U145 ( .A(sreg[0]), .X(n249) );
  SAEDRVT14_ND2_CDC_1 U146 ( .A1(addr_in[0]), .A2(n258), .X(n79) );
  SAEDRVT14_OAI21_0P5 U147 ( .A1(n249), .A2(n158), .B(n79), .X(n207) );
  SAEDRVT14_OA31_1 U148 ( .A1(state[0]), .A2(n81), .A3(n80), .B(n155), .X(n246) );
  SAEDRVT14_INV_0P5 U149 ( .A(n246), .X(n146) );
  SAEDRVT14_INV_0P5 U150 ( .A(sreg[8]), .X(n98) );
  SAEDRVT14_INV_0P5 U151 ( .A(sreg[12]), .X(n111) );
  SAEDRVT14_INV_0P5 U152 ( .A(sreg[11]), .X(n121) );
  SAEDRVT14_OAI22_0P5 U153 ( .A1(n158), .A2(n111), .B1(n254), .B2(n121), .X(
        n82) );
  SAEDRVT14_AOI21_0P75 U154 ( .A1(n258), .A2(addr_in[12]), .B(n82), .X(n83) );
  SAEDRVT14_OAI21_0P5 U155 ( .A1(n146), .A2(n98), .B(n83), .X(n195) );
  SAEDRVT14_INV_0P5 U156 ( .A(sreg[17]), .X(n127) );
  SAEDRVT14_INV_0P5 U157 ( .A(sreg[21]), .X(n133) );
  SAEDRVT14_INV_0P5 U158 ( .A(sreg[20]), .X(n107) );
  SAEDRVT14_OAI22_0P5 U159 ( .A1(n158), .A2(n133), .B1(n254), .B2(n107), .X(
        n84) );
  SAEDRVT14_AOI21_0P75 U160 ( .A1(n258), .A2(addr_in[21]), .B(n84), .X(n85) );
  SAEDRVT14_OAI21_0P5 U161 ( .A1(n146), .A2(n127), .B(n85), .X(n186) );
  SAEDRVT14_INV_0P5 U162 ( .A(sreg[13]), .X(n137) );
  SAEDRVT14_INV_0P5 U163 ( .A(sreg[16]), .X(n110) );
  SAEDRVT14_OAI22_0P5 U164 ( .A1(n158), .A2(n127), .B1(n254), .B2(n110), .X(
        n86) );
  SAEDRVT14_AOI21_0P75 U165 ( .A1(n258), .A2(addr_in[17]), .B(n86), .X(n87) );
  SAEDRVT14_OAI21_0P5 U166 ( .A1(n146), .A2(n137), .B(n87), .X(n190) );
  SAEDRVT14_INV_0P5 U167 ( .A(sreg[4]), .X(n115) );
  SAEDRVT14_INV_0P5 U168 ( .A(sreg[3]), .X(n255) );
  SAEDRVT14_OAI22_0P5 U169 ( .A1(n256), .A2(n115), .B1(n254), .B2(n255), .X(
        n88) );
  SAEDRVT14_AOI21_0P75 U170 ( .A1(n258), .A2(addr_in[4]), .B(n88), .X(n89) );
  SAEDRVT14_OAI21_0P5 U171 ( .A1(n146), .A2(n249), .B(n89), .X(n203) );
  SAEDRVT14_INV_0P5 U172 ( .A(sreg[15]), .X(n132) );
  SAEDRVT14_OAI22_0P5 U173 ( .A1(n158), .A2(n110), .B1(n254), .B2(n132), .X(
        n90) );
  SAEDRVT14_AOI21_0P75 U174 ( .A1(n258), .A2(addr_in[16]), .B(n90), .X(n91) );
  SAEDRVT14_OAI21_0P5 U175 ( .A1(n146), .A2(n111), .B(n91), .X(n191) );
  SAEDRVT14_INV_0P5 U176 ( .A(sreg[2]), .X(n253) );
  SAEDRVT14_INV_0P5 U177 ( .A(sreg[6]), .X(n103) );
  SAEDRVT14_INV_0P5 U178 ( .A(sreg[5]), .X(n116) );
  SAEDRVT14_OAI22_0P5 U179 ( .A1(n256), .A2(n103), .B1(n254), .B2(n116), .X(
        n92) );
  SAEDRVT14_AOI21_0P75 U180 ( .A1(n258), .A2(addr_in[6]), .B(n92), .X(n93) );
  SAEDRVT14_OAI21_0P5 U181 ( .A1(n146), .A2(n253), .B(n93), .X(n201) );
  SAEDRVT14_INV_0P5 U182 ( .A(sreg[7]), .X(n106) );
  SAEDRVT14_OAI22_0P5 U183 ( .A1(n256), .A2(n106), .B1(n254), .B2(n103), .X(
        n94) );
  SAEDRVT14_AOI21_0P75 U184 ( .A1(n258), .A2(addr_in[7]), .B(n94), .X(n95) );
  SAEDRVT14_OAI21_0P5 U185 ( .A1(n146), .A2(n255), .B(n95), .X(n200) );
  SAEDRVT14_OAI22_0P5 U186 ( .A1(n256), .A2(n98), .B1(n254), .B2(n106), .X(n96) );
  SAEDRVT14_AOI21_0P75 U187 ( .A1(n258), .A2(addr_in[8]), .B(n96), .X(n97) );
  SAEDRVT14_OAI21_0P5 U188 ( .A1(n146), .A2(n115), .B(n97), .X(n199) );
  SAEDRVT14_INV_0P5 U189 ( .A(sreg[9]), .X(n114) );
  SAEDRVT14_OAI22_0P5 U190 ( .A1(n256), .A2(n114), .B1(n254), .B2(n98), .X(n99) );
  SAEDRVT14_AOI21_0P75 U191 ( .A1(n258), .A2(addr_in[9]), .B(n99), .X(n100) );
  SAEDRVT14_OAI21_0P5 U192 ( .A1(n146), .A2(n116), .B(n100), .X(n198) );
  SAEDRVT14_INV_0P5 U193 ( .A(sreg[10]), .X(n141) );
  SAEDRVT14_OAI22_0P5 U194 ( .A1(n256), .A2(n141), .B1(n254), .B2(n114), .X(
        n101) );
  SAEDRVT14_AOI21_0P75 U195 ( .A1(n258), .A2(addr_in[10]), .B(n101), .X(n102)
         );
  SAEDRVT14_OAI21_0P5 U196 ( .A1(n146), .A2(n103), .B(n102), .X(n197) );
  SAEDRVT14_OAI22_0P5 U197 ( .A1(n256), .A2(n121), .B1(n254), .B2(n141), .X(
        n104) );
  SAEDRVT14_AOI21_0P75 U198 ( .A1(n258), .A2(addr_in[11]), .B(n104), .X(n105)
         );
  SAEDRVT14_OAI21_0P5 U199 ( .A1(n146), .A2(n106), .B(n105), .X(n196) );
  SAEDRVT14_INV_0P5 U200 ( .A(sreg[19]), .X(n145) );
  SAEDRVT14_OAI22_0P5 U201 ( .A1(n158), .A2(n107), .B1(n254), .B2(n145), .X(
        n108) );
  SAEDRVT14_AOI21_0P75 U202 ( .A1(n258), .A2(addr_in[20]), .B(n108), .X(n109)
         );
  SAEDRVT14_OAI21_0P5 U203 ( .A1(n146), .A2(n110), .B(n109), .X(n187) );
  SAEDRVT14_OAI22_0P5 U204 ( .A1(n158), .A2(n137), .B1(n254), .B2(n111), .X(
        n112) );
  SAEDRVT14_AOI21_0P75 U205 ( .A1(n258), .A2(addr_in[13]), .B(n112), .X(n113)
         );
  SAEDRVT14_OAI21_0P5 U206 ( .A1(n146), .A2(n114), .B(n113), .X(n194) );
  SAEDRVT14_INV_0P5 U207 ( .A(sreg[1]), .X(n251) );
  SAEDRVT14_OAI22_0P5 U208 ( .A1(n256), .A2(n116), .B1(n254), .B2(n115), .X(
        n117) );
  SAEDRVT14_AOI21_0P75 U209 ( .A1(n258), .A2(addr_in[5]), .B(n117), .X(n118)
         );
  SAEDRVT14_OAI21_0P5 U210 ( .A1(n146), .A2(n251), .B(n118), .X(n202) );
  SAEDRVT14_INV_0P5 U211 ( .A(sreg[14]), .X(n138) );
  SAEDRVT14_OAI22_0P5 U212 ( .A1(n158), .A2(n132), .B1(n254), .B2(n138), .X(
        n119) );
  SAEDRVT14_AOI21_0P75 U213 ( .A1(n258), .A2(addr_in[15]), .B(n119), .X(n120)
         );
  SAEDRVT14_OAI21_0P5 U214 ( .A1(n146), .A2(n121), .B(n120), .X(n192) );
  SAEDRVT14_INV_0P5 U215 ( .A(sreg[24]), .X(n152) );
  SAEDRVT14_OAI22_0P5 U216 ( .A1(n158), .A2(n122), .B1(n254), .B2(n152), .X(
        n123) );
  SAEDRVT14_AOI21_0P75 U217 ( .A1(n258), .A2(addr_in[25]), .B(n123), .X(n124)
         );
  SAEDRVT14_OAI21_0P5 U218 ( .A1(n146), .A2(n133), .B(n124), .X(n182) );
  SAEDRVT14_INV_0P5 U219 ( .A(sreg[28]), .X(n149) );
  SAEDRVT14_INV_0P5 U220 ( .A(sreg[27]), .X(n161) );
  SAEDRVT14_OAI22_0P5 U221 ( .A1(n158), .A2(n149), .B1(n254), .B2(n161), .X(
        n125) );
  SAEDRVT14_AOI21_0P75 U222 ( .A1(n258), .A2(addr_in[28]), .B(n125), .X(n126)
         );
  SAEDRVT14_OAI21_0P5 U223 ( .A1(n146), .A2(n152), .B(n126), .X(n179) );
  SAEDRVT14_INV_0P5 U224 ( .A(sreg[18]), .X(n136) );
  SAEDRVT14_OAI22_0P5 U225 ( .A1(n158), .A2(n136), .B1(n254), .B2(n127), .X(
        n128) );
  SAEDRVT14_AOI21_0P75 U226 ( .A1(n258), .A2(addr_in[18]), .B(n128), .X(n129)
         );
  SAEDRVT14_OAI21_0P5 U227 ( .A1(n146), .A2(n138), .B(n129), .X(n189) );
  SAEDRVT14_OAI22_0P5 U228 ( .A1(n158), .A2(n145), .B1(n254), .B2(n136), .X(
        n130) );
  SAEDRVT14_AOI21_0P75 U229 ( .A1(n258), .A2(addr_in[19]), .B(n130), .X(n131)
         );
  SAEDRVT14_OAI21_0P5 U230 ( .A1(n146), .A2(n132), .B(n131), .X(n188) );
  SAEDRVT14_INV_0P5 U231 ( .A(sreg[22]), .X(n142) );
  SAEDRVT14_OAI22_0P5 U232 ( .A1(n158), .A2(n142), .B1(n254), .B2(n133), .X(
        n134) );
  SAEDRVT14_AOI21_0P75 U233 ( .A1(n258), .A2(addr_in[22]), .B(n134), .X(n135)
         );
  SAEDRVT14_OAI21_0P5 U234 ( .A1(n146), .A2(n136), .B(n135), .X(n185) );
  SAEDRVT14_OAI22_0P5 U235 ( .A1(n158), .A2(n138), .B1(n254), .B2(n137), .X(
        n139) );
  SAEDRVT14_AOI21_0P75 U236 ( .A1(n258), .A2(addr_in[14]), .B(n139), .X(n140)
         );
  SAEDRVT14_OAI21_0P5 U237 ( .A1(n146), .A2(n141), .B(n140), .X(n193) );
  SAEDRVT14_INV_0P5 U238 ( .A(sreg[23]), .X(n151) );
  SAEDRVT14_OAI22_0P5 U239 ( .A1(n158), .A2(n151), .B1(n254), .B2(n142), .X(
        n143) );
  SAEDRVT14_AOI21_0P75 U240 ( .A1(n258), .A2(addr_in[23]), .B(n143), .X(n144)
         );
  SAEDRVT14_OAI21_0P5 U241 ( .A1(n146), .A2(n145), .B(n144), .X(n184) );
  SAEDRVT14_NR2_1 U242 ( .A1(n150), .A2(n248), .X(qspi_io_out[1]) );
  SAEDRVT14_NR2_1 U243 ( .A1(n150), .A2(n243), .X(qspi_io_out[2]) );
  SAEDRVT14_NR2_1 U244 ( .A1(n150), .A2(n147), .X(qspi_io_out[3]) );
  SAEDRVT14_OAI22_0P5 U245 ( .A1(n150), .A2(n149), .B1(n148), .B2(n147), .X(
        qspi_io_out[0]) );
  SAEDRVT14_OAI22_0P5 U246 ( .A1(n158), .A2(n152), .B1(n254), .B2(n151), .X(
        n153) );
  SAEDRVT14_AOI21_0P75 U247 ( .A1(n258), .A2(addr_in[24]), .B(n153), .X(n157)
         );
  SAEDRVT14_AOI21_0P75 U248 ( .A1(n155), .A2(sreg[20]), .B(n154), .X(n156) );
  SAEDRVT14_ND2_CDC_1 U249 ( .A1(n157), .A2(n156), .X(n183) );
  SAEDRVT14_OAI21_0P5 U250 ( .A1(xip_active), .A2(n159), .B(n158), .X(n175) );
  SAEDRVT14_AOI21_0P75 U251 ( .A1(addr_in[27]), .A2(n176), .B(n175), .X(n160)
         );
  SAEDRVT14_AOI21_0P75 U252 ( .A1(n244), .A2(n161), .B(n160), .X(n162) );
  SAEDRVT14_AOI21_0P75 U253 ( .A1(n246), .A2(sreg[23]), .B(n162), .X(n163) );
  SAEDRVT14_OAI21_0P5 U254 ( .A1(n254), .A2(n164), .B(n163), .X(n180) );
  SAEDRVT14_INV_0P5 U255 ( .A(n165), .X(n169) );
  SAEDRVT14_OAI21_0P5 U256 ( .A1(n169), .A2(cnt[3]), .B(n170), .X(n166) );
  SAEDRVT14_AOI21_0P75 U257 ( .A1(n169), .A2(cnt[3]), .B(n166), .X(N48) );
  SAEDRVT14_AN2_MM_0P5 U258 ( .A1(n169), .A2(cnt[3]), .X(n168) );
  SAEDRVT14_OAI21_0P5 U259 ( .A1(cnt[4]), .A2(n168), .B(n170), .X(n167) );
  SAEDRVT14_AOI21_0P75 U260 ( .A1(cnt[4]), .A2(n168), .B(n167), .X(N49) );
  SAEDRVT14_AN3_0P5 U261 ( .A1(n169), .A2(cnt[4]), .A3(cnt[3]), .X(n172) );
  SAEDRVT14_OAI21_0P5 U262 ( .A1(cnt[5]), .A2(n172), .B(n170), .X(n171) );
  SAEDRVT14_AOI21_0P75 U263 ( .A1(cnt[5]), .A2(n172), .B(n171), .X(N50) );
  SAEDRVT14_MUX2_U_0P5 U264 ( .D0(rx_data[0]), .D1(qspi_io_in[0]), .S(n173), 
        .X(n240) );
  SAEDRVT14_MUX2_U_0P5 U265 ( .D0(qspi_io_in[3]), .D1(rx_data[3]), .S(n174), 
        .X(n232) );
  SAEDRVT14_MUX2_U_0P5 U266 ( .D0(qspi_io_in[2]), .D1(rx_data[2]), .S(n174), 
        .X(n224) );
  SAEDRVT14_MUX2_U_0P5 U267 ( .D0(qspi_io_in[1]), .D1(rx_data[1]), .S(n174), 
        .X(n216) );
  SAEDRVT14_AOI21_0P75 U268 ( .A1(addr_in[30]), .A2(n176), .B(n175), .X(n242)
         );
  SAEDRVT14_AOI21_0P75 U269 ( .A1(n244), .A2(n243), .B(n242), .X(n245) );
  SAEDRVT14_AOI21_0P75 U270 ( .A1(n246), .A2(sreg[26]), .B(n245), .X(n247) );
  SAEDRVT14_OAI21_0P5 U271 ( .A1(n254), .A2(n248), .B(n247), .X(n208) );
  SAEDRVT14_OAI22_0P5 U272 ( .A1(n256), .A2(n251), .B1(n254), .B2(n249), .X(
        n250) );
  SAEDRVT14_AO21_U_0P5 U273 ( .A1(n258), .A2(addr_in[1]), .B(n250), .X(n206)
         );
  SAEDRVT14_OAI22_0P5 U274 ( .A1(n256), .A2(n253), .B1(n254), .B2(n251), .X(
        n252) );
  SAEDRVT14_AO21_U_0P5 U275 ( .A1(n258), .A2(addr_in[2]), .B(n252), .X(n205)
         );
  SAEDRVT14_OAI22_0P5 U276 ( .A1(n256), .A2(n255), .B1(n254), .B2(n253), .X(
        n257) );
  SAEDRVT14_AO21_U_0P5 U277 ( .A1(n258), .A2(addr_in[3]), .B(n257), .X(n204)
         );
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
  wire   fsm_done, pending, fsm_done_q, fsm_start, N11, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68;
  wire   [31:0] a_reg;
  wire   [31:0] fsm_rx;
  assign HRESP[0] = HRESP[1];

  qspi_pure_xip u_core ( .clk(HCLK), .rst_n(HRESETn), .start(fsm_start), 
        .addr_in(a_reg), .done(fsm_done), .qspi_cs_n(qspi_cs_n), .qspi_clk(
        qspi_clk), .qspi_io_oe(qspi_data_oen), .qspi_io_out(qspi_data_out), 
        .rx_data(fsm_rx), .qspi_io_in(qspi_data_in) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_31_ ( .D(n65), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_30_ ( .D(n64), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_29_ ( .D(n63), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_28_ ( .D(n62), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_27_ ( .D(n61), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_26_ ( .D(n60), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_25_ ( .D(n59), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_24_ ( .D(n58), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_23_ ( .D(n57), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[23]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_22_ ( .D(n56), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_21_ ( .D(n55), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_20_ ( .D(n54), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_19_ ( .D(n53), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_18_ ( .D(n52), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_16_ ( .D(n50), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_15_ ( .D(n49), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_14_ ( .D(n48), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_13_ ( .D(n47), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_12_ ( .D(n46), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_11_ ( .D(n45), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_10_ ( .D(n44), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_9_ ( .D(n43), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_8_ ( .D(n42), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[8]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_7_ ( .D(n41), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_6_ ( .D(n40), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_5_ ( .D(n39), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_4_ ( .D(n38), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_3_ ( .D(n37), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_1_ ( .D(n35), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 a_reg_reg_0_ ( .D(n66), .CK(HCLK), .RD(HRESETn), .Q(
        a_reg[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 fsm_start_reg ( .D(N11), .CK(HCLK), .RD(HRESETn), 
        .Q(fsm_start) );
  SAEDRVT14_FDPRBQ_V2_0P5 fsm_done_q_reg ( .D(fsm_done), .CK(HCLK), .RD(
        HRESETn), .Q(fsm_done_q) );
  SAEDRVT14_FDPRBQ_V2_0P5 pending_reg ( .D(n34), .CK(HCLK), .RD(HRESETn), .Q(
        pending) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_0_ ( .D(n33), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_31_ ( .D(n32), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[31]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_30_ ( .D(n31), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[30]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_29_ ( .D(n30), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[29]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_28_ ( .D(n29), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[28]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_27_ ( .D(n28), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[27]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_26_ ( .D(n27), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[26]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_25_ ( .D(n26), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[25]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_24_ ( .D(n25), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[24]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_22_ ( .D(n23), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[22]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_21_ ( .D(n22), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[21]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_20_ ( .D(n21), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[20]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_19_ ( .D(n20), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[19]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_18_ ( .D(n19), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[18]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_17_ ( .D(n18), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[17]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_16_ ( .D(n17), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[16]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_15_ ( .D(n16), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[15]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_14_ ( .D(n15), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[14]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_13_ ( .D(n14), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[13]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_12_ ( .D(n13), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[12]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_11_ ( .D(n12), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[11]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_10_ ( .D(n11), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[10]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_9_ ( .D(n10), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[9]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_7_ ( .D(n8), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[7]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_6_ ( .D(n7), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[6]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_5_ ( .D(n6), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[5]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_4_ ( .D(n5), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[4]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_3_ ( .D(n4), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[3]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_2_ ( .D(n3), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 ahb_rdata_reg_reg_1_ ( .D(n2), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[1]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 a_reg_reg_17_ ( .D(n51), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[17]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 a_reg_reg_2_ ( .D(n36), .CK(HCLK), .RD(HRESETn), 
        .Q(a_reg[2]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 ahb_rdata_reg_reg_23_ ( .D(n24), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[23]) );
  SAEDRVT14_FDPRBQ_V2LP_0P5 ahb_rdata_reg_reg_8_ ( .D(n9), .CK(HCLK), .RD(
        HRESETn), .Q(HRDATA[8]) );
  SAEDRVT14_TIE0_V1_2 U71 ( .X(HRESP[1]) );
  SAEDRVT14_AN3_0P5 U72 ( .A1(HSEL), .A2(HTRANS[1]), .A3(HREADY), .X(N11) );
  SAEDRVT14_ND2B_U_0P5 U73 ( .A(fsm_done_q), .B(pending), .X(HREADYOUT) );
  SAEDRVT14_MUX2_U_0P5 U74 ( .D0(a_reg[0]), .D1(HADDR[0]), .S(N11), .X(n66) );
  SAEDRVT14_MUX2_U_0P5 U75 ( .D0(a_reg[31]), .D1(HADDR[31]), .S(N11), .X(n65)
         );
  SAEDRVT14_MUX2_U_0P5 U76 ( .D0(a_reg[30]), .D1(HADDR[30]), .S(N11), .X(n64)
         );
  SAEDRVT14_MUX2_U_0P5 U77 ( .D0(a_reg[29]), .D1(HADDR[29]), .S(N11), .X(n63)
         );
  SAEDRVT14_MUX2_U_0P5 U78 ( .D0(a_reg[28]), .D1(HADDR[28]), .S(N11), .X(n62)
         );
  SAEDRVT14_MUX2_U_0P5 U79 ( .D0(a_reg[27]), .D1(HADDR[27]), .S(N11), .X(n61)
         );
  SAEDRVT14_MUX2_U_0P5 U80 ( .D0(a_reg[26]), .D1(HADDR[26]), .S(N11), .X(n60)
         );
  SAEDRVT14_MUX2_U_0P5 U81 ( .D0(a_reg[25]), .D1(HADDR[25]), .S(N11), .X(n59)
         );
  SAEDRVT14_MUX2_U_0P5 U82 ( .D0(a_reg[24]), .D1(HADDR[24]), .S(N11), .X(n58)
         );
  SAEDRVT14_MUX2_U_0P5 U83 ( .D0(a_reg[23]), .D1(HADDR[23]), .S(N11), .X(n57)
         );
  SAEDRVT14_MUX2_U_0P5 U84 ( .D0(a_reg[22]), .D1(HADDR[22]), .S(N11), .X(n56)
         );
  SAEDRVT14_MUX2_U_0P5 U85 ( .D0(a_reg[21]), .D1(HADDR[21]), .S(N11), .X(n55)
         );
  SAEDRVT14_BUF_U_0P5 U86 ( .A(N11), .X(n67) );
  SAEDRVT14_MUX2_U_0P5 U87 ( .D0(a_reg[20]), .D1(HADDR[20]), .S(n67), .X(n54)
         );
  SAEDRVT14_MUX2_U_0P5 U88 ( .D0(a_reg[19]), .D1(HADDR[19]), .S(n67), .X(n53)
         );
  SAEDRVT14_MUX2_U_0P5 U89 ( .D0(a_reg[18]), .D1(HADDR[18]), .S(n67), .X(n52)
         );
  SAEDRVT14_MUX2_U_0P5 U90 ( .D0(a_reg[17]), .D1(HADDR[17]), .S(n67), .X(n51)
         );
  SAEDRVT14_MUX2_U_0P5 U91 ( .D0(a_reg[16]), .D1(HADDR[16]), .S(n67), .X(n50)
         );
  SAEDRVT14_MUX2_U_0P5 U92 ( .D0(a_reg[15]), .D1(HADDR[15]), .S(n67), .X(n49)
         );
  SAEDRVT14_MUX2_U_0P5 U93 ( .D0(a_reg[14]), .D1(HADDR[14]), .S(n67), .X(n48)
         );
  SAEDRVT14_MUX2_U_0P5 U94 ( .D0(a_reg[13]), .D1(HADDR[13]), .S(n67), .X(n47)
         );
  SAEDRVT14_MUX2_U_0P5 U95 ( .D0(a_reg[12]), .D1(HADDR[12]), .S(n67), .X(n46)
         );
  SAEDRVT14_MUX2_U_0P5 U96 ( .D0(a_reg[11]), .D1(HADDR[11]), .S(n67), .X(n45)
         );
  SAEDRVT14_MUX2_U_0P5 U97 ( .D0(a_reg[10]), .D1(HADDR[10]), .S(n67), .X(n44)
         );
  SAEDRVT14_MUX2_U_0P5 U98 ( .D0(a_reg[9]), .D1(HADDR[9]), .S(n67), .X(n43) );
  SAEDRVT14_MUX2_U_0P5 U99 ( .D0(a_reg[8]), .D1(HADDR[8]), .S(N11), .X(n42) );
  SAEDRVT14_MUX2_U_0P5 U100 ( .D0(a_reg[7]), .D1(HADDR[7]), .S(N11), .X(n41)
         );
  SAEDRVT14_MUX2_U_0P5 U101 ( .D0(a_reg[6]), .D1(HADDR[6]), .S(N11), .X(n40)
         );
  SAEDRVT14_MUX2_U_0P5 U102 ( .D0(a_reg[5]), .D1(HADDR[5]), .S(N11), .X(n39)
         );
  SAEDRVT14_MUX2_U_0P5 U103 ( .D0(a_reg[4]), .D1(HADDR[4]), .S(N11), .X(n38)
         );
  SAEDRVT14_MUX2_U_0P5 U104 ( .D0(a_reg[3]), .D1(HADDR[3]), .S(N11), .X(n37)
         );
  SAEDRVT14_MUX2_U_0P5 U105 ( .D0(a_reg[2]), .D1(HADDR[2]), .S(n67), .X(n36)
         );
  SAEDRVT14_MUX2_U_0P5 U106 ( .D0(a_reg[1]), .D1(HADDR[1]), .S(n67), .X(n35)
         );
  SAEDRVT14_ND2B_U_0P5 U107 ( .A(N11), .B(HREADYOUT), .X(n34) );
  SAEDRVT14_MUX2_U_0P5 U108 ( .D0(HRDATA[0]), .D1(fsm_rx[0]), .S(fsm_done), 
        .X(n33) );
  SAEDRVT14_MUX2_U_0P5 U109 ( .D0(HRDATA[31]), .D1(fsm_rx[31]), .S(fsm_done), 
        .X(n32) );
  SAEDRVT14_MUX2_U_0P5 U110 ( .D0(HRDATA[30]), .D1(fsm_rx[30]), .S(fsm_done), 
        .X(n31) );
  SAEDRVT14_MUX2_U_0P5 U111 ( .D0(HRDATA[29]), .D1(fsm_rx[29]), .S(fsm_done), 
        .X(n30) );
  SAEDRVT14_MUX2_U_0P5 U112 ( .D0(HRDATA[28]), .D1(fsm_rx[28]), .S(fsm_done), 
        .X(n29) );
  SAEDRVT14_MUX2_U_0P5 U113 ( .D0(HRDATA[27]), .D1(fsm_rx[27]), .S(fsm_done), 
        .X(n28) );
  SAEDRVT14_MUX2_U_0P5 U114 ( .D0(HRDATA[26]), .D1(fsm_rx[26]), .S(fsm_done), 
        .X(n27) );
  SAEDRVT14_MUX2_U_0P5 U115 ( .D0(HRDATA[25]), .D1(fsm_rx[25]), .S(fsm_done), 
        .X(n26) );
  SAEDRVT14_MUX2_U_0P5 U116 ( .D0(HRDATA[24]), .D1(fsm_rx[24]), .S(fsm_done), 
        .X(n25) );
  SAEDRVT14_MUX2_U_0P5 U117 ( .D0(HRDATA[23]), .D1(fsm_rx[23]), .S(fsm_done), 
        .X(n24) );
  SAEDRVT14_MUX2_U_0P5 U118 ( .D0(HRDATA[22]), .D1(fsm_rx[22]), .S(fsm_done), 
        .X(n23) );
  SAEDRVT14_BUF_U_0P5 U119 ( .A(fsm_done), .X(n68) );
  SAEDRVT14_MUX2_U_0P5 U120 ( .D0(HRDATA[21]), .D1(fsm_rx[21]), .S(n68), .X(
        n22) );
  SAEDRVT14_MUX2_U_0P5 U121 ( .D0(HRDATA[20]), .D1(fsm_rx[20]), .S(n68), .X(
        n21) );
  SAEDRVT14_MUX2_U_0P5 U122 ( .D0(HRDATA[19]), .D1(fsm_rx[19]), .S(n68), .X(
        n20) );
  SAEDRVT14_MUX2_U_0P5 U123 ( .D0(HRDATA[18]), .D1(fsm_rx[18]), .S(n68), .X(
        n19) );
  SAEDRVT14_MUX2_U_0P5 U124 ( .D0(HRDATA[17]), .D1(fsm_rx[17]), .S(n68), .X(
        n18) );
  SAEDRVT14_MUX2_U_0P5 U125 ( .D0(HRDATA[16]), .D1(fsm_rx[16]), .S(n68), .X(
        n17) );
  SAEDRVT14_MUX2_U_0P5 U126 ( .D0(HRDATA[15]), .D1(fsm_rx[15]), .S(n68), .X(
        n16) );
  SAEDRVT14_MUX2_U_0P5 U127 ( .D0(HRDATA[14]), .D1(fsm_rx[14]), .S(n68), .X(
        n15) );
  SAEDRVT14_MUX2_U_0P5 U128 ( .D0(HRDATA[13]), .D1(fsm_rx[13]), .S(n68), .X(
        n14) );
  SAEDRVT14_MUX2_U_0P5 U129 ( .D0(HRDATA[12]), .D1(fsm_rx[12]), .S(n68), .X(
        n13) );
  SAEDRVT14_MUX2_U_0P5 U130 ( .D0(HRDATA[11]), .D1(fsm_rx[11]), .S(n68), .X(
        n12) );
  SAEDRVT14_MUX2_U_0P5 U131 ( .D0(HRDATA[10]), .D1(fsm_rx[10]), .S(n68), .X(
        n11) );
  SAEDRVT14_MUX2_U_0P5 U132 ( .D0(HRDATA[9]), .D1(fsm_rx[9]), .S(n68), .X(n10)
         );
  SAEDRVT14_MUX2_U_0P5 U133 ( .D0(HRDATA[8]), .D1(fsm_rx[8]), .S(fsm_done), 
        .X(n9) );
  SAEDRVT14_MUX2_U_0P5 U134 ( .D0(HRDATA[7]), .D1(fsm_rx[7]), .S(fsm_done), 
        .X(n8) );
  SAEDRVT14_MUX2_U_0P5 U135 ( .D0(HRDATA[6]), .D1(fsm_rx[6]), .S(fsm_done), 
        .X(n7) );
  SAEDRVT14_MUX2_U_0P5 U136 ( .D0(HRDATA[5]), .D1(fsm_rx[5]), .S(fsm_done), 
        .X(n6) );
  SAEDRVT14_MUX2_U_0P5 U137 ( .D0(HRDATA[4]), .D1(fsm_rx[4]), .S(fsm_done), 
        .X(n5) );
  SAEDRVT14_MUX2_U_0P5 U138 ( .D0(HRDATA[3]), .D1(fsm_rx[3]), .S(fsm_done), 
        .X(n4) );
  SAEDRVT14_MUX2_U_0P5 U139 ( .D0(HRDATA[2]), .D1(fsm_rx[2]), .S(fsm_done), 
        .X(n3) );
  SAEDRVT14_MUX2_U_0P5 U140 ( .D0(HRDATA[1]), .D1(fsm_rx[1]), .S(fsm_done), 
        .X(n2) );
endmodule

