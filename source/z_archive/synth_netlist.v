/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : V-2023.12-SP2
// Date      : Tue Apr  7 10:37:28 2026
/////////////////////////////////////////////////////////////


module qspi_fsm ( clk, rst_n, start, addr_in, data_in, write_op, data_out, 
        ready, qspi_cs_n, qspi_clk, qspi_io_out, qspi_io_oe, qspi_io_in );
  input [31:0] addr_in;
  input [31:0] data_in;
  output [31:0] data_out;
  output [3:0] qspi_io_out;
  input [3:0] qspi_io_in;
  input clk, rst_n, start, write_op;
  output ready, qspi_cs_n, qspi_clk, qspi_io_oe;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, is_erase_op, N53, N54,
         N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68,
         N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82,
         N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96,
         N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108,
         N109, N110, N111, N112, N113, N114, N115, N116, N117, N118, N119,
         N120, N121, N122, N123, N124, N125, N126, N127, N128, N129, N130,
         N131, N132, N133, N134, N135, N136, N137, N138, N139, N140, N141,
         N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N196,
         N197, N198, N199, N200, N201, N202, N203, N204, N205, N206, N207,
         N208, N209, N210, N211, N212, N213, N214, N215, N216, N217, N218,
         N219, N220, N221, N222, N223, N224, N225, N226, N227, N228, N229,
         N230, N231, N232, N233, N234, N235, N236, N237, N238, N239, N240,
         N241, N242, N243, N244, N245, N246, N247, N248, N249, N250, N251,
         N252, N253, N254, N255, N256, N257, N258, N259, N260, N261, N262,
         N263, N264, N265, N266, N267, N268, N269, N270, N271, N272, N273,
         N274, N275, N276, N277, N278, N279, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, N291, N292, N293, N294, N295,
         N296, N297, N298, N299, N300, N301, N302, N303, N304, N305, N306,
         N307, N308, N309, N310, N311, N312, N313, N314, N315, N316, N317,
         N318, N319, N320, N321, N322, N323, N324, N325, N326, N327, N328,
         N329, N330, N331, N332, N333, N334, N335, N336, N337, N338, N339,
         N340, N341, N342, N343, N344, N345, N346, N347, N348, N349, N350,
         N351, N352, N353, N354, N355, N356, N357, N358, N359, N360, N361,
         N362, N363, N364, N365, N366, N367, N368, N369, N370, N371, N372,
         N373, N374, N375, N376, N377, N378, N379, N380, N381, N382, N383,
         N384, N385, N386, N387, N388, N389, N390, N391, N392, N393, N394,
         N395, N396, N397, N398, N399, N400, N401, N402, N403, N404, N405,
         N406, N407, N408, N409, N410, N411, N412, N413, N414, N415, N416,
         N417, N418, N419, N420, N421, N422, N423, N424, N425, N426, N427,
         N428, N429, N430, N431, N432, N433, N434, N435, N436, N437, N438,
         N439, N440, N441, N442, N443, N444, N445, N446, N447, N448, N449,
         N450, N451, N452, N453, N454, N455, N456, N457, N458, N459, N460,
         N461, N462, N463, N464, N465, N466, N467, N468, N469, N470, N471,
         N472, N473, N474, N475, N476, N477, N478, N479, N480, N481, N482,
         N483, N484, N485, N486, N487, N488, N489, N490, N491, N492, N493,
         N494, N495, N496, N497, N498, N499, N500, N501, N502, N503, N504,
         N505, N506, N507, N508, N509, N510, N511, N512, N513, N514, N515,
         N516, N517, N518, N519, N520, N521, N522, N523, N524, N525, N526,
         N527, N528, N529, N530, N531, N532, N533, N534, N535, N536, N537,
         N538, N539, N540, N541, N542, N543, N544, N545, N546, N547, N548,
         N549, N550, N551, N552, N553, N554, N555, N556, N557, N558, N559,
         N560, N561, N562, N563, N564, N565, N566, N567, N568, N569, N570,
         N571, N572, N573, N574, N575, N576, N577, N578, N579, N580, N581,
         N582, N583, N584, N585, N586, N587, N588, N589, N590, N591, N592,
         N593, net141;
  wire   [3:0] next_state;
  wire   [3:0] current_state;
  wire   [5:0] bit_cnt;
  wire   [31:0] shift_reg;
  wire   [7:0] current_cmd;
  wire   [27:0] read_data_reg;
  wire   [15:0] wait_counter;
  wire   [31:0] stored_data;
  wire   [31:0] stored_addr;
  tri   [3:0] qspi_io_in;

  NE_UNS_OP ne_79 ( .A(current_state), .B(next_state), .Z(N57) );
  GTECH_AND2 C115 ( .A(N103), .B(N414), .Z(N105) );
  GTECH_AND2 C116 ( .A(N105), .B(N104), .Z(N106) );
  GTECH_OR2 C118 ( .A(current_state[2]), .B(current_state[1]), .Z(N107) );
  GTECH_OR2 C119 ( .A(N107), .B(N104), .Z(N108) );
  GTECH_OR2 C122 ( .A(current_state[2]), .B(N414), .Z(N110) );
  GTECH_OR2 C123 ( .A(N110), .B(current_state[0]), .Z(N111) );
  GTECH_OR2 C127 ( .A(current_state[2]), .B(N414), .Z(N113) );
  GTECH_OR2 C128 ( .A(N113), .B(N104), .Z(N114) );
  GTECH_OR2 C131 ( .A(N103), .B(current_state[1]), .Z(N116) );
  GTECH_OR2 C132 ( .A(N116), .B(current_state[0]), .Z(N117) );
  GTECH_AND2 C134 ( .A(current_state[2]), .B(current_state[1]), .Z(N119) );
  GTECH_AND2 C135 ( .A(N119), .B(current_state[0]), .Z(N120) );
  \**SEQGEN**  \stored_data_reg[31]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[31]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[31]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[30]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[30]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[30]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[29]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[29]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[29]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[28]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[28]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[28]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[27]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[27]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[27]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[26]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[26]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[26]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[25]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[25]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[25]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[24]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[24]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[24]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[23]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[23]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[23]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[22]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[22]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[22]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[21]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[21]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[21]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[20]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[20]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[20]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[19]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[19]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[19]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[18]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[18]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[18]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[17]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[17]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[17]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[16]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[16]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[16]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[15]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[14]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[13]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[12]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[11]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[10]  ( .clear(N53), .preset(1'b0), 
        .next_state(data_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_data[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[9]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[8]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[7]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[6]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[5]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[4]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[3]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[2]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[1]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_data_reg[0]  ( .clear(N53), .preset(1'b0), .next_state(
        data_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_data[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \shift_reg_reg[31]  ( .clear(N53), .preset(1'b0), .next_state(
        N234), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[31]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[30]  ( .clear(N53), .preset(1'b0), .next_state(
        N233), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[30]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[29]  ( .clear(N53), .preset(1'b0), .next_state(
        N232), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[29]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[28]  ( .clear(N53), .preset(1'b0), .next_state(
        N231), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[28]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[27]  ( .clear(N53), .preset(1'b0), .next_state(
        N230), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[27]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[26]  ( .clear(N53), .preset(1'b0), .next_state(
        N229), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[26]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[25]  ( .clear(N53), .preset(1'b0), .next_state(
        N228), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[25]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[24]  ( .clear(N53), .preset(1'b0), .next_state(
        N227), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[24]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[23]  ( .clear(N53), .preset(1'b0), .next_state(
        N226), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[23]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[22]  ( .clear(N53), .preset(1'b0), .next_state(
        N225), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[22]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[21]  ( .clear(N53), .preset(1'b0), .next_state(
        N224), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[21]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[20]  ( .clear(N53), .preset(1'b0), .next_state(
        N223), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[20]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[19]  ( .clear(N53), .preset(1'b0), .next_state(
        N222), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[19]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[18]  ( .clear(N53), .preset(1'b0), .next_state(
        N221), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[18]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[17]  ( .clear(N53), .preset(1'b0), .next_state(
        N220), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[17]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[16]  ( .clear(N53), .preset(1'b0), .next_state(
        N219), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[16]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[15]  ( .clear(N53), .preset(1'b0), .next_state(
        N218), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[14]  ( .clear(N53), .preset(1'b0), .next_state(
        N217), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[13]  ( .clear(N53), .preset(1'b0), .next_state(
        N216), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[12]  ( .clear(N53), .preset(1'b0), .next_state(
        N215), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[11]  ( .clear(N53), .preset(1'b0), .next_state(
        N214), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[10]  ( .clear(N53), .preset(1'b0), .next_state(
        N213), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[9]  ( .clear(N53), .preset(1'b0), .next_state(
        N212), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[8]  ( .clear(N53), .preset(1'b0), .next_state(
        N211), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[7]  ( .clear(N53), .preset(1'b0), .next_state(
        N210), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[6]  ( .clear(N53), .preset(1'b0), .next_state(
        N209), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[5]  ( .clear(N53), .preset(1'b0), .next_state(
        N208), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[4]  ( .clear(N53), .preset(1'b0), .next_state(
        N207), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[3]  ( .clear(N53), .preset(1'b0), .next_state(
        N206), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[2]  ( .clear(N53), .preset(1'b0), .next_state(
        N205), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[1]  ( .clear(N53), .preset(1'b0), .next_state(
        N204), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \shift_reg_reg[0]  ( .clear(N53), .preset(1'b0), .next_state(
        N203), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N271) );
  \**SEQGEN**  \bit_cnt_reg[5]  ( .clear(N53), .preset(1'b0), .next_state(N86), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \bit_cnt_reg[4]  ( .clear(N53), .preset(1'b0), .next_state(N85), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \bit_cnt_reg[3]  ( .clear(N53), .preset(1'b0), .next_state(N84), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \bit_cnt_reg[2]  ( .clear(N53), .preset(1'b0), .next_state(N83), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \bit_cnt_reg[1]  ( .clear(N53), .preset(1'b0), .next_state(N82), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \bit_cnt_reg[0]  ( .clear(N53), .preset(1'b0), .next_state(N81), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(bit_cnt[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  is_erase_op_reg ( .clear(N53), .preset(1'b0), .next_state(N56), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(is_erase_op), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N55) );
  \**SEQGEN**  \current_cmd_reg[7]  ( .clear(N53), .preset(1'b0), .next_state(
        N106), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \current_cmd_reg[6]  ( .clear(N53), .preset(1'b0), .next_state(
        N106), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \current_cmd_reg[5]  ( .clear(N53), .preset(1'b0), .next_state(
        1'b1), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \current_cmd_reg[4]  ( .clear(N53), .preset(1'b0), .next_state(
        N238), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \current_cmd_reg[3]  ( .clear(N53), .preset(1'b0), .next_state(
        N106), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \current_cmd_reg[2]  ( .clear(N53), .preset(1'b0), .next_state(
        N237), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \current_cmd_reg[1]  ( .clear(N53), .preset(1'b0), .next_state(
        1'b0), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \current_cmd_reg[0]  ( .clear(N53), .preset(1'b0), .next_state(
        N236), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        current_cmd[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N272) );
  \**SEQGEN**  \wait_counter_reg[15]  ( .clear(N53), .preset(1'b0), 
        .next_state(N102), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(wait_counter[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[14]  ( .clear(N53), .preset(1'b0), 
        .next_state(N101), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(wait_counter[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[13]  ( .clear(N53), .preset(1'b0), 
        .next_state(N100), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(wait_counter[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[12]  ( .clear(N53), .preset(1'b0), 
        .next_state(N99), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[11]  ( .clear(N53), .preset(1'b0), 
        .next_state(N98), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[10]  ( .clear(N53), .preset(1'b0), 
        .next_state(N97), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[9]  ( .clear(N53), .preset(1'b0), 
        .next_state(N96), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[8]  ( .clear(N53), .preset(1'b0), 
        .next_state(N95), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[7]  ( .clear(N53), .preset(1'b0), 
        .next_state(N94), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[6]  ( .clear(N53), .preset(1'b0), 
        .next_state(N93), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[5]  ( .clear(N53), .preset(1'b0), 
        .next_state(N92), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[4]  ( .clear(N53), .preset(1'b0), 
        .next_state(N91), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[3]  ( .clear(N53), .preset(1'b0), 
        .next_state(N90), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[2]  ( .clear(N53), .preset(1'b0), 
        .next_state(N89), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[1]  ( .clear(N53), .preset(1'b0), 
        .next_state(N88), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \wait_counter_reg[0]  ( .clear(N53), .preset(1'b0), 
        .next_state(N87), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        wait_counter[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[3]  ( .clear(N53), .preset(1'b0), 
        .next_state(next_state[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[2]  ( .clear(N53), .preset(1'b0), 
        .next_state(next_state[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[1]  ( .clear(N53), .preset(1'b0), 
        .next_state(next_state[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \current_state_reg[0]  ( .clear(N53), .preset(1'b0), 
        .next_state(next_state[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(current_state[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \stored_addr_reg[31]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[31]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[31]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[30]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[30]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[30]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[29]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[29]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[29]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[28]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[28]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[28]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[27]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[27]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[27]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[26]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[26]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[26]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[25]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[25]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[25]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[24]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[24]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[24]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[23]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[23]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[23]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[22]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[22]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[22]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[21]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[21]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[21]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[20]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[20]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[20]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[19]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[19]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[19]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[18]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[18]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[18]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[17]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[17]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[17]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[16]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[16]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[16]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[15]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[14]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[13]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[12]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[11]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[10]  ( .clear(N53), .preset(1'b0), 
        .next_state(addr_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(stored_addr[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[9]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[8]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[7]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[6]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[5]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[4]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[3]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[2]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[1]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \stored_addr_reg[0]  ( .clear(N53), .preset(1'b0), .next_state(
        addr_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        stored_addr[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N55) );
  \**SEQGEN**  \final_read_data_reg[31]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[27]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[31]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[30]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[26]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[30]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[29]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[25]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[29]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[28]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[24]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[28]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[27]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[23]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[27]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[26]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[22]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[26]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[25]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[21]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[25]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[24]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[20]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[24]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[23]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[19]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[23]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[22]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[18]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[22]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[21]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[17]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[21]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[20]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[16]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[20]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[19]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[15]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[19]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[18]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[14]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[18]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[17]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[13]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[17]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[16]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[12]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[16]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[15]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[11]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[15]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[14]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[10]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[14]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[13]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[9]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[13]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[12]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[8]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[12]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[11]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[7]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[11]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[10]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[6]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[10]), .synch_clear(1'b0), .synch_preset(
        1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[9]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[5]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[8]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[4]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[7]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[3]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[6]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[2]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[5]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[1]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[4]  ( .clear(N53), .preset(1'b0), 
        .next_state(read_data_reg[0]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(data_out[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[3]  ( .clear(N53), .preset(1'b0), 
        .next_state(qspi_io_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(data_out[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[2]  ( .clear(N53), .preset(1'b0), 
        .next_state(qspi_io_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(data_out[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[1]  ( .clear(N53), .preset(1'b0), 
        .next_state(qspi_io_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(data_out[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \final_read_data_reg[0]  ( .clear(N53), .preset(1'b0), 
        .next_state(qspi_io_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(
        1'b0), .Q(data_out[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N270) );
  \**SEQGEN**  \read_data_reg_reg[27]  ( .clear(N53), .preset(1'b0), 
        .next_state(N266), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[27]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[26]  ( .clear(N53), .preset(1'b0), 
        .next_state(N265), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[26]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[25]  ( .clear(N53), .preset(1'b0), 
        .next_state(N264), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[25]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[24]  ( .clear(N53), .preset(1'b0), 
        .next_state(N263), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[24]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[23]  ( .clear(N53), .preset(1'b0), 
        .next_state(N262), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[23]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[22]  ( .clear(N53), .preset(1'b0), 
        .next_state(N261), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[22]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[21]  ( .clear(N53), .preset(1'b0), 
        .next_state(N260), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[21]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[20]  ( .clear(N53), .preset(1'b0), 
        .next_state(N259), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[20]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[19]  ( .clear(N53), .preset(1'b0), 
        .next_state(N258), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[19]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[18]  ( .clear(N53), .preset(1'b0), 
        .next_state(N257), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[18]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[17]  ( .clear(N53), .preset(1'b0), 
        .next_state(N256), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[17]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[16]  ( .clear(N53), .preset(1'b0), 
        .next_state(N255), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[16]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[15]  ( .clear(N53), .preset(1'b0), 
        .next_state(N254), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[14]  ( .clear(N53), .preset(1'b0), 
        .next_state(N253), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[13]  ( .clear(N53), .preset(1'b0), 
        .next_state(N252), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[12]  ( .clear(N53), .preset(1'b0), 
        .next_state(N251), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[11]  ( .clear(N53), .preset(1'b0), 
        .next_state(N250), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[10]  ( .clear(N53), .preset(1'b0), 
        .next_state(N249), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[9]  ( .clear(N53), .preset(1'b0), 
        .next_state(N248), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[8]  ( .clear(N53), .preset(1'b0), 
        .next_state(N247), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[7]  ( .clear(N53), .preset(1'b0), 
        .next_state(N246), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[6]  ( .clear(N53), .preset(1'b0), 
        .next_state(N245), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[5]  ( .clear(N53), .preset(1'b0), 
        .next_state(N244), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[4]  ( .clear(N53), .preset(1'b0), 
        .next_state(N243), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[3]  ( .clear(N53), .preset(1'b0), 
        .next_state(N242), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[2]  ( .clear(N53), .preset(1'b0), 
        .next_state(N241), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[1]  ( .clear(N53), .preset(1'b0), 
        .next_state(N240), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  \**SEQGEN**  \read_data_reg_reg[0]  ( .clear(N53), .preset(1'b0), 
        .next_state(N239), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), 
        .Q(read_data_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N269) );
  GTECH_AND2 C1713 ( .A(N418), .B(N103), .Z(N273) );
  GTECH_AND2 C1714 ( .A(N414), .B(N104), .Z(N274) );
  GTECH_AND2 C1715 ( .A(N273), .B(N274), .Z(N275) );
  GTECH_OR2 C1717 ( .A(current_state[3]), .B(current_state[2]), .Z(N276) );
  GTECH_OR2 C1718 ( .A(current_state[1]), .B(N104), .Z(N277) );
  GTECH_OR2 C1719 ( .A(N276), .B(N277), .Z(N278) );
  GTECH_OR2 C1722 ( .A(current_state[3]), .B(current_state[2]), .Z(N280) );
  GTECH_OR2 C1723 ( .A(N414), .B(current_state[0]), .Z(N281) );
  GTECH_OR2 C1724 ( .A(N280), .B(N281), .Z(N282) );
  GTECH_OR2 C1728 ( .A(current_state[3]), .B(current_state[2]), .Z(N284) );
  GTECH_OR2 C1729 ( .A(N414), .B(N104), .Z(N285) );
  GTECH_OR2 C1730 ( .A(N284), .B(N285), .Z(N286) );
  GTECH_OR2 C1733 ( .A(current_state[3]), .B(N103), .Z(N288) );
  GTECH_OR2 C1734 ( .A(current_state[1]), .B(current_state[0]), .Z(N289) );
  GTECH_OR2 C1735 ( .A(N288), .B(N289), .Z(N290) );
  GTECH_OR2 C1739 ( .A(current_state[3]), .B(N103), .Z(N292) );
  GTECH_OR2 C1740 ( .A(current_state[1]), .B(N104), .Z(N293) );
  GTECH_OR2 C1741 ( .A(N292), .B(N293), .Z(N294) );
  GTECH_OR2 C1745 ( .A(current_state[3]), .B(N103), .Z(N296) );
  GTECH_OR2 C1746 ( .A(N414), .B(current_state[0]), .Z(N297) );
  GTECH_OR2 C1747 ( .A(N296), .B(N297), .Z(N298) );
  GTECH_OR2 C1752 ( .A(current_state[3]), .B(N103), .Z(N300) );
  GTECH_OR2 C1753 ( .A(N414), .B(N104), .Z(N301) );
  GTECH_OR2 C1754 ( .A(N300), .B(N301), .Z(N302) );
  GTECH_OR2 C1757 ( .A(N418), .B(current_state[2]), .Z(N304) );
  GTECH_OR2 C1758 ( .A(current_state[1]), .B(current_state[0]), .Z(N305) );
  GTECH_OR2 C1759 ( .A(N304), .B(N305), .Z(N306) );
  GEQ_UNS_OP gte_196 ( .A(wait_counter), .B({1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 
        1'b0}), .Z(N347) );
  GTECH_AND2 C1901 ( .A(N418), .B(N103), .Z(N364) );
  GTECH_AND2 C1902 ( .A(N414), .B(N104), .Z(N365) );
  GTECH_AND2 C1903 ( .A(N364), .B(N365), .Z(N366) );
  GTECH_OR2 C1905 ( .A(current_state[3]), .B(current_state[2]), .Z(N367) );
  GTECH_OR2 C1906 ( .A(current_state[1]), .B(N104), .Z(N368) );
  GTECH_OR2 C1907 ( .A(N367), .B(N368), .Z(N369) );
  GTECH_OR2 C1910 ( .A(current_state[3]), .B(current_state[2]), .Z(N371) );
  GTECH_OR2 C1911 ( .A(N414), .B(current_state[0]), .Z(N372) );
  GTECH_OR2 C1912 ( .A(N371), .B(N372), .Z(N373) );
  GTECH_OR2 C1916 ( .A(current_state[3]), .B(current_state[2]), .Z(N375) );
  GTECH_OR2 C1917 ( .A(N414), .B(N104), .Z(N376) );
  GTECH_OR2 C1918 ( .A(N375), .B(N376), .Z(N377) );
  GTECH_OR2 C1921 ( .A(current_state[3]), .B(N103), .Z(N379) );
  GTECH_OR2 C1922 ( .A(current_state[1]), .B(current_state[0]), .Z(N380) );
  GTECH_OR2 C1923 ( .A(N379), .B(N380), .Z(N381) );
  GTECH_OR2 C1926 ( .A(current_state[3]), .B(N103), .Z(N382) );
  GTECH_OR2 C1927 ( .A(current_state[1]), .B(N104), .Z(N383) );
  GTECH_OR2 C1928 ( .A(N382), .B(N383), .Z(N384) );
  GTECH_OR2 C1932 ( .A(current_state[3]), .B(N103), .Z(N386) );
  GTECH_OR2 C1933 ( .A(N414), .B(current_state[0]), .Z(N387) );
  GTECH_OR2 C1934 ( .A(N386), .B(N387), .Z(N388) );
  GTECH_OR2 C1939 ( .A(current_state[3]), .B(N103), .Z(N390) );
  GTECH_OR2 C1940 ( .A(N414), .B(N104), .Z(N391) );
  GTECH_OR2 C1941 ( .A(N390), .B(N391), .Z(N392) );
  GTECH_OR2 C1944 ( .A(N418), .B(current_state[2]), .Z(N394) );
  GTECH_OR2 C1945 ( .A(current_state[1]), .B(current_state[0]), .Z(N395) );
  GTECH_OR2 C1946 ( .A(N394), .B(N395), .Z(N396) );
  GEQ_UNS_OP gte_256 ( .A(wait_counter), .B({1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 
        1'b0}), .Z(N402) );
  GTECH_OR2 C1989 ( .A(current_state[2]), .B(current_state[3]), .Z(N411) );
  GTECH_OR2 C1990 ( .A(current_state[1]), .B(N411), .Z(N412) );
  GTECH_OR2 C1991 ( .A(current_state[0]), .B(N412), .Z(N413) );
  GTECH_NOT I_0 ( .A(current_state[1]), .Z(N414) );
  GTECH_OR2 C1995 ( .A(current_state[2]), .B(current_state[3]), .Z(N415) );
  GTECH_OR2 C1996 ( .A(N414), .B(N415), .Z(N416) );
  GTECH_OR2 C1997 ( .A(current_state[0]), .B(N416), .Z(N417) );
  GTECH_NOT I_1 ( .A(current_state[3]), .Z(N418) );
  GTECH_OR2 C2001 ( .A(current_state[2]), .B(N418), .Z(N419) );
  GTECH_OR2 C2002 ( .A(current_state[1]), .B(N419), .Z(N420) );
  GTECH_OR2 C2003 ( .A(current_state[0]), .B(N420), .Z(N421) );
  GTECH_NOT I_2 ( .A(current_cmd[5]), .Z(N422) );
  GTECH_NOT I_3 ( .A(current_cmd[4]), .Z(N423) );
  GTECH_NOT I_4 ( .A(current_cmd[2]), .Z(N424) );
  GTECH_OR2 C2009 ( .A(current_cmd[6]), .B(current_cmd[7]), .Z(N425) );
  GTECH_OR2 C2010 ( .A(N422), .B(N425), .Z(N426) );
  GTECH_OR2 C2011 ( .A(N423), .B(N426), .Z(N427) );
  GTECH_OR2 C2012 ( .A(current_cmd[3]), .B(N427), .Z(N428) );
  GTECH_OR2 C2013 ( .A(N424), .B(N428), .Z(N429) );
  GTECH_OR2 C2014 ( .A(current_cmd[1]), .B(N429), .Z(N430) );
  GTECH_OR2 C2015 ( .A(current_cmd[0]), .B(N430), .Z(N431) );
  GTECH_NOT I_5 ( .A(N431), .Z(N432) );
  GTECH_AND2 C2017 ( .A(data_in[30]), .B(data_in[31]), .Z(N433) );
  GTECH_AND2 C2018 ( .A(data_in[29]), .B(N433), .Z(N434) );
  GTECH_AND2 C2019 ( .A(data_in[28]), .B(N434), .Z(N435) );
  GTECH_AND2 C2020 ( .A(data_in[27]), .B(N435), .Z(N436) );
  GTECH_AND2 C2021 ( .A(data_in[26]), .B(N436), .Z(N437) );
  GTECH_AND2 C2022 ( .A(data_in[25]), .B(N437), .Z(N438) );
  GTECH_AND2 C2023 ( .A(data_in[24]), .B(N438), .Z(N439) );
  GTECH_AND2 C2024 ( .A(data_in[23]), .B(N439), .Z(N440) );
  GTECH_AND2 C2025 ( .A(data_in[22]), .B(N440), .Z(N441) );
  GTECH_AND2 C2026 ( .A(data_in[21]), .B(N441), .Z(N442) );
  GTECH_AND2 C2027 ( .A(data_in[20]), .B(N442), .Z(N443) );
  GTECH_AND2 C2028 ( .A(data_in[19]), .B(N443), .Z(N444) );
  GTECH_AND2 C2029 ( .A(data_in[18]), .B(N444), .Z(N445) );
  GTECH_AND2 C2030 ( .A(data_in[17]), .B(N445), .Z(N446) );
  GTECH_AND2 C2031 ( .A(data_in[16]), .B(N446), .Z(N447) );
  GTECH_AND2 C2032 ( .A(data_in[15]), .B(N447), .Z(N448) );
  GTECH_AND2 C2033 ( .A(data_in[14]), .B(N448), .Z(N449) );
  GTECH_AND2 C2034 ( .A(data_in[13]), .B(N449), .Z(N450) );
  GTECH_AND2 C2035 ( .A(data_in[12]), .B(N450), .Z(N451) );
  GTECH_AND2 C2036 ( .A(data_in[11]), .B(N451), .Z(N452) );
  GTECH_AND2 C2037 ( .A(data_in[10]), .B(N452), .Z(N453) );
  GTECH_AND2 C2038 ( .A(data_in[9]), .B(N453), .Z(N454) );
  GTECH_AND2 C2039 ( .A(data_in[8]), .B(N454), .Z(N455) );
  GTECH_AND2 C2040 ( .A(data_in[7]), .B(N455), .Z(N456) );
  GTECH_AND2 C2041 ( .A(data_in[6]), .B(N456), .Z(N457) );
  GTECH_AND2 C2042 ( .A(data_in[5]), .B(N457), .Z(N458) );
  GTECH_AND2 C2043 ( .A(data_in[4]), .B(N458), .Z(N459) );
  GTECH_AND2 C2044 ( .A(data_in[3]), .B(N459), .Z(N460) );
  GTECH_AND2 C2045 ( .A(data_in[2]), .B(N460), .Z(N461) );
  GTECH_AND2 C2046 ( .A(data_in[1]), .B(N461), .Z(N462) );
  GTECH_AND2 C2047 ( .A(data_in[0]), .B(N462), .Z(N463) );
  GTECH_NOT I_6 ( .A(bit_cnt[2]), .Z(N464) );
  GTECH_NOT I_7 ( .A(bit_cnt[1]), .Z(N465) );
  GTECH_NOT I_8 ( .A(bit_cnt[0]), .Z(N466) );
  GTECH_OR2 C2051 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N467) );
  GTECH_OR2 C2052 ( .A(bit_cnt[3]), .B(N467), .Z(N468) );
  GTECH_OR2 C2053 ( .A(N464), .B(N468), .Z(N469) );
  GTECH_OR2 C2054 ( .A(N465), .B(N469), .Z(N470) );
  GTECH_OR2 C2055 ( .A(N466), .B(N470), .Z(N471) );
  GTECH_NOT I_9 ( .A(N471), .Z(N472) );
  GTECH_OR2 C2060 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N473) );
  GTECH_OR2 C2061 ( .A(bit_cnt[3]), .B(N473), .Z(N474) );
  GTECH_OR2 C2062 ( .A(N464), .B(N474), .Z(N475) );
  GTECH_OR2 C2063 ( .A(N465), .B(N475), .Z(N476) );
  GTECH_OR2 C2064 ( .A(N466), .B(N476), .Z(N477) );
  GTECH_NOT I_10 ( .A(N477), .Z(N478) );
  GTECH_OR2 C2066 ( .A(current_state[2]), .B(current_state[3]), .Z(N479) );
  GTECH_OR2 C2067 ( .A(current_state[1]), .B(N479), .Z(N480) );
  GTECH_OR2 C2068 ( .A(current_state[0]), .B(N480), .Z(N481) );
  GTECH_NOT I_11 ( .A(N481), .Z(N482) );
  GTECH_OR2 C2070 ( .A(next_state[2]), .B(next_state[3]), .Z(N483) );
  GTECH_OR2 C2071 ( .A(next_state[1]), .B(N483), .Z(N484) );
  GTECH_OR2 C2072 ( .A(next_state[0]), .B(N484), .Z(N485) );
  GTECH_OR2 C2078 ( .A(current_cmd[6]), .B(current_cmd[7]), .Z(N486) );
  GTECH_OR2 C2079 ( .A(N422), .B(N486), .Z(N487) );
  GTECH_OR2 C2080 ( .A(N423), .B(N487), .Z(N488) );
  GTECH_OR2 C2081 ( .A(current_cmd[3]), .B(N488), .Z(N489) );
  GTECH_OR2 C2082 ( .A(N424), .B(N489), .Z(N490) );
  GTECH_OR2 C2083 ( .A(current_cmd[1]), .B(N490), .Z(N491) );
  GTECH_OR2 C2084 ( .A(current_cmd[0]), .B(N491), .Z(N492) );
  GTECH_NOT I_12 ( .A(N492), .Z(N493) );
  GTECH_OR2 C2089 ( .A(current_cmd[6]), .B(current_cmd[7]), .Z(N494) );
  GTECH_OR2 C2090 ( .A(N422), .B(N494), .Z(N495) );
  GTECH_OR2 C2091 ( .A(N423), .B(N495), .Z(N496) );
  GTECH_OR2 C2092 ( .A(current_cmd[3]), .B(N496), .Z(N497) );
  GTECH_OR2 C2093 ( .A(N424), .B(N497), .Z(N498) );
  GTECH_OR2 C2094 ( .A(current_cmd[1]), .B(N498), .Z(N499) );
  GTECH_OR2 C2095 ( .A(current_cmd[0]), .B(N499), .Z(N500) );
  GTECH_NOT I_13 ( .A(N500), .Z(N501) );
  GTECH_NOT I_14 ( .A(current_cmd[7]), .Z(N502) );
  GTECH_NOT I_15 ( .A(current_cmd[6]), .Z(N503) );
  GTECH_NOT I_16 ( .A(current_cmd[3]), .Z(N504) );
  GTECH_OR2 C2102 ( .A(N503), .B(N502), .Z(N505) );
  GTECH_OR2 C2103 ( .A(N422), .B(N505), .Z(N506) );
  GTECH_OR2 C2104 ( .A(current_cmd[4]), .B(N506), .Z(N507) );
  GTECH_OR2 C2105 ( .A(N504), .B(N507), .Z(N508) );
  GTECH_OR2 C2106 ( .A(N424), .B(N508), .Z(N509) );
  GTECH_OR2 C2107 ( .A(current_cmd[1]), .B(N509), .Z(N510) );
  GTECH_OR2 C2108 ( .A(current_cmd[0]), .B(N510), .Z(N511) );
  GTECH_NOT I_17 ( .A(N511), .Z(N512) );
  GTECH_OR2 C2113 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N513) );
  GTECH_OR2 C2114 ( .A(bit_cnt[3]), .B(N513), .Z(N514) );
  GTECH_OR2 C2115 ( .A(N464), .B(N514), .Z(N515) );
  GTECH_OR2 C2116 ( .A(N465), .B(N515), .Z(N516) );
  GTECH_OR2 C2117 ( .A(N466), .B(N516), .Z(N517) );
  GTECH_NOT I_18 ( .A(N517), .Z(N518) );
  GTECH_OR2 C2122 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N519) );
  GTECH_OR2 C2123 ( .A(bit_cnt[3]), .B(N519), .Z(N520) );
  GTECH_OR2 C2124 ( .A(N464), .B(N520), .Z(N521) );
  GTECH_OR2 C2125 ( .A(N465), .B(N521), .Z(N522) );
  GTECH_OR2 C2126 ( .A(N466), .B(N522), .Z(N523) );
  GTECH_NOT I_19 ( .A(N523), .Z(N524) );
  GTECH_OR2 C2129 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N525) );
  GTECH_OR2 C2130 ( .A(bit_cnt[3]), .B(N525), .Z(N526) );
  GTECH_OR2 C2131 ( .A(bit_cnt[2]), .B(N526), .Z(N527) );
  GTECH_OR2 C2132 ( .A(bit_cnt[1]), .B(N527), .Z(N528) );
  GTECH_OR2 C2133 ( .A(N466), .B(N528), .Z(N529) );
  GTECH_NOT I_20 ( .A(N529), .Z(N530) );
  GTECH_OR2 C2137 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N531) );
  GTECH_OR2 C2138 ( .A(bit_cnt[3]), .B(N531), .Z(N532) );
  GTECH_OR2 C2139 ( .A(bit_cnt[2]), .B(N532), .Z(N533) );
  GTECH_OR2 C2140 ( .A(N465), .B(N533), .Z(N534) );
  GTECH_OR2 C2141 ( .A(N466), .B(N534), .Z(N535) );
  GTECH_NOT I_21 ( .A(N535), .Z(N536) );
  GTECH_OR2 C2146 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N537) );
  GTECH_OR2 C2147 ( .A(bit_cnt[3]), .B(N537), .Z(N538) );
  GTECH_OR2 C2148 ( .A(N464), .B(N538), .Z(N539) );
  GTECH_OR2 C2149 ( .A(N465), .B(N539), .Z(N540) );
  GTECH_OR2 C2150 ( .A(N466), .B(N540), .Z(N541) );
  GTECH_NOT I_22 ( .A(N541), .Z(N542) );
  GTECH_OR2 C2155 ( .A(current_cmd[6]), .B(current_cmd[7]), .Z(N543) );
  GTECH_OR2 C2156 ( .A(N422), .B(N543), .Z(N544) );
  GTECH_OR2 C2157 ( .A(N423), .B(N544), .Z(N545) );
  GTECH_OR2 C2158 ( .A(current_cmd[3]), .B(N545), .Z(N546) );
  GTECH_OR2 C2159 ( .A(N424), .B(N546), .Z(N547) );
  GTECH_OR2 C2160 ( .A(current_cmd[1]), .B(N547), .Z(N548) );
  GTECH_OR2 C2161 ( .A(current_cmd[0]), .B(N548), .Z(N549) );
  GTECH_NOT I_23 ( .A(N549), .Z(N550) );
  GTECH_OR2 C2166 ( .A(current_cmd[6]), .B(current_cmd[7]), .Z(N551) );
  GTECH_OR2 C2167 ( .A(N422), .B(N551), .Z(N552) );
  GTECH_OR2 C2168 ( .A(N423), .B(N552), .Z(N553) );
  GTECH_OR2 C2169 ( .A(current_cmd[3]), .B(N553), .Z(N554) );
  GTECH_OR2 C2170 ( .A(N424), .B(N554), .Z(N555) );
  GTECH_OR2 C2171 ( .A(current_cmd[1]), .B(N555), .Z(N556) );
  GTECH_OR2 C2172 ( .A(current_cmd[0]), .B(N556), .Z(N557) );
  GTECH_NOT I_24 ( .A(N557), .Z(N558) );
  GTECH_OR2 C2179 ( .A(N503), .B(N502), .Z(N559) );
  GTECH_OR2 C2180 ( .A(N422), .B(N559), .Z(N560) );
  GTECH_OR2 C2181 ( .A(current_cmd[4]), .B(N560), .Z(N561) );
  GTECH_OR2 C2182 ( .A(N504), .B(N561), .Z(N562) );
  GTECH_OR2 C2183 ( .A(N424), .B(N562), .Z(N563) );
  GTECH_OR2 C2184 ( .A(current_cmd[1]), .B(N563), .Z(N564) );
  GTECH_OR2 C2185 ( .A(current_cmd[0]), .B(N564), .Z(N565) );
  GTECH_NOT I_25 ( .A(N565), .Z(N566) );
  GTECH_OR2 C2190 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N567) );
  GTECH_OR2 C2191 ( .A(bit_cnt[3]), .B(N567), .Z(N568) );
  GTECH_OR2 C2192 ( .A(N464), .B(N568), .Z(N569) );
  GTECH_OR2 C2193 ( .A(N465), .B(N569), .Z(N570) );
  GTECH_OR2 C2194 ( .A(N466), .B(N570), .Z(N571) );
  GTECH_NOT I_26 ( .A(N571), .Z(N572) );
  GTECH_OR2 C2199 ( .A(bit_cnt[4]), .B(bit_cnt[5]), .Z(N573) );
  GTECH_OR2 C2200 ( .A(bit_cnt[3]), .B(N573), .Z(N574) );
  GTECH_OR2 C2201 ( .A(N464), .B(N574), .Z(N575) );
  GTECH_OR2 C2202 ( .A(N465), .B(N575), .Z(N576) );
  GTECH_OR2 C2203 ( .A(N466), .B(N576), .Z(N577) );
  GTECH_NOT I_27 ( .A(N577), .Z(N578) );
  ADD_UNS_OP add_83 ( .A(bit_cnt), .B(1'b1), .Z({N64, N63, N62, N61, N60, N59}) );
  ADD_UNS_OP add_84 ( .A(wait_counter), .B(1'b1), .Z({N80, N79, N78, N77, N76, 
        N75, N74, N73, N72, N71, N70, N69, N68, N67, N66, N65}) );
  SELECT_OP C2233 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N64, 
        N63, N62, N61, N60, N59}), .CONTROL1(N0), .CONTROL2(N58), .Z({N86, N85, 
        N84, N83, N82, N81}) );
  GTECH_BUF B_0 ( .A(N57), .Z(N0) );
  SELECT_OP C2234 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N80, N79, 
        N78, N77, N76, N75, N74, N73, N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CONTROL1(N0), .CONTROL2(N58), .Z({N102, N101, N100, N99, N98, N97, 
        N96, N95, N94, N93, N92, N91, N90, N89, N88, N87}) );
  SELECT_OP C2235 ( .DATA1(N122), .DATA2(1'b0), .CONTROL1(N1), .CONTROL2(N2), 
        .Z(N123) );
  GTECH_BUF B_1 ( .A(start), .Z(N1) );
  GTECH_BUF B_2 ( .A(N121), .Z(N2) );
  SELECT_OP C2236 ( .DATA1(stored_addr), .DATA2({shift_reg[30:0], 1'b0}), 
        .CONTROL1(N3), .CONTROL2(N4), .Z({N156, N155, N154, N153, N152, N151, 
        N150, N149, N148, N147, N146, N145, N144, N143, N142, N141, N140, N139, 
        N138, N137, N136, N135, N134, N133, N132, N131, N130, N129, N128, N127, 
        N126, N125}) );
  GTECH_BUF B_3 ( .A(N472), .Z(N3) );
  GTECH_BUF B_4 ( .A(N471), .Z(N4) );
  SELECT_OP C2238 ( .DATA1(N492), .DATA2(1'b0), .CONTROL1(N5), .CONTROL2(N6), 
        .Z(N157) );
  GTECH_BUF B_5 ( .A(N542), .Z(N5) );
  GTECH_BUF B_6 ( .A(N541), .Z(N6) );
  SELECT_OP C2239 ( .DATA1(N493), .DATA2(1'b1), .CONTROL1(N5), .CONTROL2(N6), 
        .Z(N158) );
  SELECT_OP C2240 ( .DATA1(stored_data), .DATA2({shift_reg[27:0], 1'b0, 1'b0, 
        1'b0, 1'b0}), .CONTROL1(N5), .CONTROL2(N6), .Z({N190, N189, N188, N187, 
        N186, N185, N184, N183, N182, N181, N180, N179, N178, N177, N176, N175, 
        N174, N173, N172, N171, N170, N169, N168, N167, N166, N165, N164, N163, 
        N162, N161, N160, N159}) );
  SELECT_OP C2241 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .CONTROL1(N7), 
        .CONTROL2(N8), .CONTROL3(N192), .Z(N193) );
  GTECH_BUF B_7 ( .A(N512), .Z(N7) );
  GTECH_BUF B_8 ( .A(N501), .Z(N8) );
  SELECT_OP C2242 ( .DATA1(N478), .DATA2(1'b0), .DATA3(1'b0), .CONTROL1(N7), 
        .CONTROL2(N8), .CONTROL3(N192), .Z(N194) );
  SELECT_OP C2243 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N7), 
        .CONTROL2(N8), .CONTROL3(N192), .Z(N195) );
  SELECT_OP C2244 ( .DATA1(start), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(N158), .DATA6(N195), .DATA7(1'b0), .CONTROL1(N9), .CONTROL2(N10), .CONTROL3(N11), .CONTROL4(N12), .CONTROL5(N13), .CONTROL6(N14), .CONTROL7(
        N201), .Z(N202) );
  GTECH_BUF B_9 ( .A(N106), .Z(N9) );
  GTECH_BUF B_10 ( .A(N109), .Z(N10) );
  GTECH_BUF B_11 ( .A(N112), .Z(N11) );
  GTECH_BUF B_12 ( .A(N115), .Z(N12) );
  GTECH_BUF B_13 ( .A(N118), .Z(N13) );
  GTECH_BUF B_14 ( .A(N120), .Z(N14) );
  SELECT_OP C2245 ( .DATA1({N122, N122, N122, 1'b0, N122, 1'b1, write_op, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({shift_reg[30:0], 1'b0}), .DATA3({1'b0, 1'b0, 1'b1, N124, 1'b0, N124, 
        1'b0, is_erase_op, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .DATA4({N156, N155, N154, N153, N152, N151, 
        N150, N149, N148, N147, N146, N145, N144, N143, N142, N141, N140, N139, 
        N138, N137, N136, N135, N134, N133, N132, N131, N130, N129, N128, N127, 
        N126, N125}), .DATA5({N190, N189, N188, N187, N186, N185, N184, N183, 
        N182, N181, N180, N179, N178, N177, N176, N175, N174, N173, N172, N171, 
        N170, N169, N168, N167, N166, N165, N164, N163, N162, N161, N160, N159}), .DATA6({shift_reg[27:0], 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N9), 
        .CONTROL2(N10), .CONTROL3(N11), .CONTROL4(N12), .CONTROL5(N13), 
        .CONTROL6(N14), .Z({N234, N233, N232, N231, N230, N229, N228, N227, 
        N226, N225, N224, N223, N222, N221, N220, N219, N218, N217, N216, N215, 
        N214, N213, N212, N211, N210, N209, N208, N207, N206, N205, N204, N203}) );
  SELECT_OP C2246 ( .DATA1(N123), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .CONTROL1(N9), .CONTROL2(N10), .CONTROL3(N11), .CONTROL4(N12), .CONTROL5(N13), .CONTROL6(N14), .CONTROL7(
        N201), .Z(N235) );
  SELECT_OP C2247 ( .DATA1({1'b0, 1'b1, 1'b0}), .DATA2({N124, N124, 
        is_erase_op}), .CONTROL1(N9), .CONTROL2(N11), .Z({N238, N237, N236})
         );
  SELECT_OP C2248 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({
        read_data_reg[23:0], qspi_io_in}), .CONTROL1(N13), .CONTROL2(N14), .Z(
        {N266, N265, N264, N263, N262, N261, N260, N259, N258, N257, N256, 
        N255, N254, N253, N252, N251, N250, N249, N248, N247, N246, N245, N244, 
        N243, N242, N241, N240, N239}) );
  SELECT_OP C2249 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(N157), .DATA6(N193), .DATA7(1'b0), .CONTROL1(N9), .CONTROL2(N10), .CONTROL3(N11), .CONTROL4(N12), .CONTROL5(N13), .CONTROL6(N14), .CONTROL7(
        N201), .Z(N267) );
  SELECT_OP C2250 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(N194), .DATA7(1'b0), .CONTROL1(N9), .CONTROL2(N10), .CONTROL3(N11), .CONTROL4(N12), .CONTROL5(N13), .CONTROL6(N14), .CONTROL7(
        N201), .Z(N268) );
  SELECT_OP C2251 ( .DATA1(N267), .DATA2(1'b0), .CONTROL1(N15), .CONTROL2(N16), 
        .Z(N269) );
  GTECH_BUF B_15 ( .A(N418), .Z(N15) );
  GTECH_BUF B_16 ( .A(current_state[3]), .Z(N16) );
  SELECT_OP C2252 ( .DATA1(N268), .DATA2(1'b0), .CONTROL1(N15), .CONTROL2(N16), 
        .Z(N270) );
  SELECT_OP C2253 ( .DATA1(N202), .DATA2(1'b0), .CONTROL1(N15), .CONTROL2(N16), 
        .Z(N271) );
  SELECT_OP C2254 ( .DATA1(N235), .DATA2(1'b0), .CONTROL1(N15), .CONTROL2(N16), 
        .Z(N272) );
  SELECT_OP C2255 ( .DATA1({1'b0, 1'b0, N122, 1'b1}), .DATA2(current_state), 
        .CONTROL1(N1), .CONTROL2(N2), .Z({N311, N310, N309, N308}) );
  SELECT_OP C2256 ( .DATA1({1'b0, 1'b0, 1'b1, 1'b0}), .DATA2(current_state), 
        .CONTROL1(N17), .CONTROL2(N18), .Z({N315, N314, N313, N312}) );
  GTECH_BUF B_17 ( .A(N518), .Z(N17) );
  GTECH_BUF B_18 ( .A(N517), .Z(N18) );
  SELECT_OP C2257 ( .DATA1({1'b0, 1'b0, 1'b1, 1'b1}), .DATA2(current_state), 
        .CONTROL1(N19), .CONTROL2(N317), .Z({N321, N320, N319, N318}) );
  GTECH_BUF B_19 ( .A(N316), .Z(N19) );
  SELECT_OP C2258 ( .DATA1({1'b0, 1'b1, 1'b0, 1'b0}), .DATA2(current_state), 
        .CONTROL1(N20), .CONTROL2(N21), .Z({N325, N324, N323, N322}) );
  GTECH_BUF B_20 ( .A(N524), .Z(N20) );
  GTECH_BUF B_21 ( .A(N523), .Z(N21) );
  SELECT_OP C2259 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({1'b0, 1'b1, 1'b1}), 
        .DATA3({1'b1, 1'b0, 1'b0}), .CONTROL1(N22), .CONTROL2(N23), .CONTROL3(
        N327), .Z({N330, N329, N328}) );
  GTECH_BUF B_22 ( .A(N566), .Z(N22) );
  GTECH_BUF B_23 ( .A(N558), .Z(N23) );
  SELECT_OP C2260 ( .DATA1({N330, N328, N329, N328}), .DATA2(current_state), 
        .CONTROL1(N24), .CONTROL2(N25), .Z({N334, N333, N332, N331}) );
  GTECH_BUF B_24 ( .A(N578), .Z(N24) );
  GTECH_BUF B_25 ( .A(N577), .Z(N25) );
  SELECT_OP C2261 ( .DATA1({1'b0, 1'b1, 1'b1, 1'b0}), .DATA2(current_state), 
        .CONTROL1(N26), .CONTROL2(N27), .Z({N338, N337, N336, N335}) );
  GTECH_BUF B_26 ( .A(N530), .Z(N26) );
  GTECH_BUF B_27 ( .A(N529), .Z(N27) );
  SELECT_OP C2262 ( .DATA1({1'b0, 1'b1, 1'b1, 1'b1}), .DATA2(current_state), 
        .CONTROL1(N28), .CONTROL2(N29), .Z({N342, N341, N340, N339}) );
  GTECH_BUF B_28 ( .A(N536), .Z(N28) );
  GTECH_BUF B_29 ( .A(N535), .Z(N29) );
  SELECT_OP C2263 ( .DATA1({N550, 1'b0, 1'b0, 1'b0}), .DATA2(current_state), 
        .CONTROL1(N30), .CONTROL2(N31), .Z({N346, N345, N344, N343}) );
  GTECH_BUF B_30 ( .A(N572), .Z(N30) );
  GTECH_BUF B_31 ( .A(N571), .Z(N31) );
  SELECT_OP C2264 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(current_state), 
        .CONTROL1(N32), .CONTROL2(N348), .Z({N352, N351, N350, N349}) );
  GTECH_BUF B_32 ( .A(N347), .Z(N32) );
  SELECT_OP C2265 ( .DATA1({N311, N310, N309, N308}), .DATA2({N315, N314, N313, 
        N312}), .DATA3({N321, N320, N319, N318}), .DATA4({N325, N324, N323, 
        N322}), .DATA5({N334, N333, N332, N331}), .DATA6({N338, N337, N336, 
        N335}), .DATA7({N342, N341, N340, N339}), .DATA8({N346, N345, N344, 
        N343}), .DATA9({N352, N351, N350, N349}), .DATA10(current_state), 
        .CONTROL1(N33), .CONTROL2(N34), .CONTROL3(N35), .CONTROL4(N36), 
        .CONTROL5(N37), .CONTROL6(N38), .CONTROL7(N39), .CONTROL8(N40), 
        .CONTROL9(N41), .CONTROL10(N361), .Z(next_state) );
  GTECH_BUF B_33 ( .A(N275), .Z(N33) );
  GTECH_BUF B_34 ( .A(N279), .Z(N34) );
  GTECH_BUF B_35 ( .A(N283), .Z(N35) );
  GTECH_BUF B_36 ( .A(N287), .Z(N36) );
  GTECH_BUF B_37 ( .A(N291), .Z(N37) );
  GTECH_BUF B_38 ( .A(N295), .Z(N38) );
  GTECH_BUF B_39 ( .A(N299), .Z(N39) );
  GTECH_BUF B_40 ( .A(N303), .Z(N40) );
  GTECH_BUF B_41 ( .A(N307), .Z(N41) );
  SELECT_OP C2266 ( .DATA1(clk), .DATA2(1'b0), .CONTROL1(N42), .CONTROL2(N363), 
        .Z(qspi_clk) );
  GTECH_BUF B_42 ( .A(N362), .Z(N42) );
  SELECT_OP C2267 ( .DATA1(shift_reg[31:28]), .DATA2({1'b0, 1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N43), .CONTROL2(N44), .Z({N401, N400, N399, N398}) );
  GTECH_BUF B_43 ( .A(N432), .Z(N43) );
  GTECH_BUF B_44 ( .A(N431), .Z(N44) );
  SELECT_OP C2268 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .DATA8(N402), .DATA9(1'b0), 
        .CONTROL1(N45), .CONTROL2(N46), .CONTROL3(N47), .CONTROL4(N48), 
        .CONTROL5(N49), .CONTROL6(N50), .CONTROL7(N51), .CONTROL8(N52), 
        .CONTROL9(N410), .Z(ready) );
  GTECH_BUF B_45 ( .A(N366), .Z(N45) );
  GTECH_BUF B_46 ( .A(N370), .Z(N46) );
  GTECH_BUF B_47 ( .A(N374), .Z(N47) );
  GTECH_BUF B_48 ( .A(N378), .Z(N48) );
  GTECH_BUF B_49 ( .A(N385), .Z(N49) );
  GTECH_BUF B_50 ( .A(N389), .Z(N50) );
  GTECH_BUF B_51 ( .A(N393), .Z(N51) );
  GTECH_BUF B_52 ( .A(N397), .Z(N52) );
  SELECT_OP C2269 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b0), .DATA8(1'b1), .DATA9(1'b1), 
        .CONTROL1(N45), .CONTROL2(N46), .CONTROL3(N47), .CONTROL4(N48), 
        .CONTROL5(N49), .CONTROL6(N50), .CONTROL7(N51), .CONTROL8(N52), 
        .CONTROL9(N410), .Z(qspi_cs_n) );
  SELECT_OP C2270 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b0), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b0), .DATA7(N432), .DATA8(1'b0), .DATA9(1'b0), 
        .CONTROL1(N45), .CONTROL2(N46), .CONTROL3(N47), .CONTROL4(N48), 
        .CONTROL5(N49), .CONTROL6(N50), .CONTROL7(N51), .CONTROL8(N52), 
        .CONTROL9(N410), .Z(qspi_io_oe) );
  SELECT_OP C2271 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({1'b0, 1'b0, 1'b0, 
        shift_reg[31]}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0}), .DATA4({1'b0, 1'b0, 
        1'b0, shift_reg[31]}), .DATA5(shift_reg[31:28]), .DATA6({1'b0, 1'b0, 
        1'b0, 1'b0}), .DATA7({N401, N400, N399, N398}), .DATA8({1'b0, 1'b0, 
        1'b0, 1'b0}), .DATA9({1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N45), 
        .CONTROL2(N46), .CONTROL3(N47), .CONTROL4(N48), .CONTROL5(N49), 
        .CONTROL6(N50), .CONTROL7(N51), .CONTROL8(N52), .CONTROL9(N410), .Z(
        qspi_io_out) );
  GTECH_NOT I_28 ( .A(rst_n), .Z(N53) );
  GTECH_BUF B_53 ( .A(rst_n), .Z(N54) );
  GTECH_AND2 C2277 ( .A(N482), .B(N485), .Z(N55) );
  GTECH_AND2 C2279 ( .A(write_op), .B(N463), .Z(N56) );
  GTECH_NOT I_29 ( .A(N57), .Z(N58) );
  GTECH_AND2 C2282 ( .A(N54), .B(N58), .Z(net141) );
  GTECH_NOT I_30 ( .A(current_state[2]), .Z(N103) );
  GTECH_NOT I_31 ( .A(current_state[0]), .Z(N104) );
  GTECH_NOT I_32 ( .A(N108), .Z(N109) );
  GTECH_NOT I_33 ( .A(N111), .Z(N112) );
  GTECH_NOT I_34 ( .A(N114), .Z(N115) );
  GTECH_NOT I_35 ( .A(N117), .Z(N118) );
  GTECH_NOT I_36 ( .A(start), .Z(N121) );
  GTECH_NOT I_37 ( .A(write_op), .Z(N122) );
  GTECH_NOT I_38 ( .A(is_erase_op), .Z(N124) );
  GTECH_OR2 C2319 ( .A(N501), .B(N512), .Z(N191) );
  GTECH_NOT I_39 ( .A(N191), .Z(N192) );
  GTECH_OR2 C2322 ( .A(N109), .B(N106), .Z(N196) );
  GTECH_OR2 C2323 ( .A(N112), .B(N196), .Z(N197) );
  GTECH_OR2 C2324 ( .A(N115), .B(N197), .Z(N198) );
  GTECH_OR2 C2325 ( .A(N118), .B(N198), .Z(N199) );
  GTECH_OR2 C2326 ( .A(N120), .B(N199), .Z(N200) );
  GTECH_NOT I_40 ( .A(N200), .Z(N201) );
  GTECH_NOT I_41 ( .A(N278), .Z(N279) );
  GTECH_NOT I_42 ( .A(N282), .Z(N283) );
  GTECH_NOT I_43 ( .A(N286), .Z(N287) );
  GTECH_NOT I_44 ( .A(N290), .Z(N291) );
  GTECH_NOT I_45 ( .A(N294), .Z(N295) );
  GTECH_NOT I_46 ( .A(N298), .Z(N299) );
  GTECH_NOT I_47 ( .A(N302), .Z(N303) );
  GTECH_NOT I_48 ( .A(N306), .Z(N307) );
  GTECH_OR2 C2367 ( .A(N590), .B(wait_counter[2]), .Z(N316) );
  GTECH_OR2 C2368 ( .A(N589), .B(wait_counter[3]), .Z(N590) );
  GTECH_OR2 C2369 ( .A(N588), .B(wait_counter[4]), .Z(N589) );
  GTECH_OR2 C2370 ( .A(N587), .B(wait_counter[5]), .Z(N588) );
  GTECH_OR2 C2371 ( .A(N586), .B(wait_counter[6]), .Z(N587) );
  GTECH_OR2 C2372 ( .A(N585), .B(wait_counter[7]), .Z(N586) );
  GTECH_OR2 C2373 ( .A(N584), .B(wait_counter[8]), .Z(N585) );
  GTECH_OR2 C2374 ( .A(N583), .B(wait_counter[9]), .Z(N584) );
  GTECH_OR2 C2375 ( .A(N582), .B(wait_counter[10]), .Z(N583) );
  GTECH_OR2 C2376 ( .A(N581), .B(wait_counter[11]), .Z(N582) );
  GTECH_OR2 C2377 ( .A(N580), .B(wait_counter[12]), .Z(N581) );
  GTECH_OR2 C2378 ( .A(N579), .B(wait_counter[13]), .Z(N580) );
  GTECH_OR2 C2379 ( .A(wait_counter[15]), .B(wait_counter[14]), .Z(N579) );
  GTECH_NOT I_49 ( .A(N316), .Z(N317) );
  GTECH_OR2 C2388 ( .A(N558), .B(N566), .Z(N326) );
  GTECH_NOT I_50 ( .A(N326), .Z(N327) );
  GTECH_BUF B_54 ( .A(N307) );
  GTECH_NOT I_51 ( .A(N347), .Z(N348) );
  GTECH_OR2 C2400 ( .A(N279), .B(N275), .Z(N353) );
  GTECH_OR2 C2401 ( .A(N283), .B(N353), .Z(N354) );
  GTECH_OR2 C2402 ( .A(N287), .B(N354), .Z(N355) );
  GTECH_OR2 C2403 ( .A(N291), .B(N355), .Z(N356) );
  GTECH_OR2 C2404 ( .A(N295), .B(N356), .Z(N357) );
  GTECH_OR2 C2405 ( .A(N299), .B(N357), .Z(N358) );
  GTECH_OR2 C2406 ( .A(N303), .B(N358), .Z(N359) );
  GTECH_OR2 C2407 ( .A(N307), .B(N359), .Z(N360) );
  GTECH_NOT I_52 ( .A(N360), .Z(N361) );
  GTECH_AND2 C2409 ( .A(N591), .B(N421), .Z(N362) );
  GTECH_AND2 C2410 ( .A(N413), .B(N417), .Z(N591) );
  GTECH_NOT I_53 ( .A(N362), .Z(N363) );
  GTECH_NOT I_54 ( .A(N369), .Z(N370) );
  GTECH_NOT I_55 ( .A(N373), .Z(N374) );
  GTECH_NOT I_56 ( .A(N377), .Z(N378) );
  GTECH_OR2 C2427 ( .A(N592), .B(N593), .Z(N385) );
  GTECH_NOT I_57 ( .A(N381), .Z(N592) );
  GTECH_NOT I_58 ( .A(N384), .Z(N593) );
  GTECH_NOT I_59 ( .A(N388), .Z(N389) );
  GTECH_NOT I_60 ( .A(N392), .Z(N393) );
  GTECH_NOT I_61 ( .A(N396), .Z(N397) );
  GTECH_BUF B_55 ( .A(N397) );
  GTECH_OR2 C2450 ( .A(N370), .B(N366), .Z(N403) );
  GTECH_OR2 C2451 ( .A(N374), .B(N403), .Z(N404) );
  GTECH_OR2 C2452 ( .A(N378), .B(N404), .Z(N405) );
  GTECH_OR2 C2453 ( .A(N385), .B(N405), .Z(N406) );
  GTECH_OR2 C2454 ( .A(N389), .B(N406), .Z(N407) );
  GTECH_OR2 C2455 ( .A(N393), .B(N407), .Z(N408) );
  GTECH_OR2 C2456 ( .A(N397), .B(N408), .Z(N409) );
  GTECH_NOT I_62 ( .A(N409), .Z(N410) );
endmodule


module ahb_wrapper ( HCLK, HRESETn, HADDR, HSEL, HREADY, HTRANS, HWRITE, 
        HWDATA, HREADYOUT, HRESP, HRDATA, qspi_cs_n, qspi_clk, qspi_io );
  input [31:0] HADDR;
  input [1:0] HTRANS;
  input [31:0] HWDATA;
  output [1:0] HRESP;
  output [31:0] HRDATA;
  inout [3:0] qspi_io;
  input HCLK, HRESETn, HSEL, HREADY, HWRITE;
  output HREADYOUT, qspi_cs_n, qspi_clk;
  wire   N0, N1, N2, N3, N4, N5, valid_transfer, is_busy, N6, latched_write,
         core_start, N7, N8, N9, core_ready, N10, N11, N12, N13, io_oe, N14,
         N15, N16, N17, N18, N19, N20;
  wire   [31:0] latched_addr;
  wire   [31:0] latched_wdata;
  wire   [3:0] io_out;
  tri   [3:0] qspi_io;
  assign HRESP[0] = 1'b0;
  assign HRESP[1] = 1'b0;

  \**SEQGEN**  \latched_addr_reg[31]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[31]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[31]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[30]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[30]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[30]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[29]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[29]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[29]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[28]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[28]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[28]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[27]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[27]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[27]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[26]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[26]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[26]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[25]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[25]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[25]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[24]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[24]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[24]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[23]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[23]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[23]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[22]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[22]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[22]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[21]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[21]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[21]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[20]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[20]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[20]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[19]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[19]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[19]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[18]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[18]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[18]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[17]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[17]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[17]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[16]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[16]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[16]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[15]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[15]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[14]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[14]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[13]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[13]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[12]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[12]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[11]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[11]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[10]  ( .clear(N6), .preset(1'b0), 
        .next_state(HADDR[10]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_addr[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[9]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[9]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[8]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[8]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[7]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[7]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[6]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[6]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[5]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[5]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[4]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[4]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[3]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[3]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[2]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[2]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[1]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[1]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  \latched_addr_reg[0]  ( .clear(N6), .preset(1'b0), .next_state(
        HADDR[0]), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_addr[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  latched_write_reg ( .clear(N6), .preset(1'b0), .next_state(
        HWRITE), .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(
        latched_write), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N7) );
  \**SEQGEN**  is_busy_reg ( .clear(N6), .preset(1'b0), .next_state(N12), 
        .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(is_busy), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N13) );
  \**SEQGEN**  \latched_wdata_reg[31]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[31]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[31]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[30]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[30]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[30]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[29]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[29]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[29]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[28]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[28]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[28]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[27]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[27]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[27]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[26]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[26]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[26]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[25]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[25]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[25]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[24]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[24]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[24]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[23]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[23]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[23]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[22]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[22]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[22]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[21]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[21]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[21]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[20]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[20]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[20]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[19]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[19]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[19]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[18]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[18]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[18]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[17]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[17]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[17]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[16]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[16]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[16]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[15]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[15]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[14]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[14]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[13]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[13]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[12]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[12]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[11]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[11]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[10]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[10]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[9]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[9]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[8]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[8]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[7]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[7]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[6]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[6]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[5]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[5]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[4]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[4]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[3]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[3]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[2]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[2]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[1]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[1]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  \latched_wdata_reg[0]  ( .clear(N6), .preset(1'b0), 
        .next_state(HWDATA[0]), .clocked_on(HCLK), .data_in(1'b0), .enable(
        1'b0), .Q(latched_wdata[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N9) );
  \**SEQGEN**  core_start_reg ( .clear(N6), .preset(1'b0), .next_state(N7), 
        .clocked_on(HCLK), .data_in(1'b0), .enable(1'b0), .Q(core_start), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  qspi_fsm u_qspi_core ( .clk(HCLK), .rst_n(HRESETn), .start(core_start), 
        .addr_in(latched_addr), .data_in(latched_wdata), .write_op(
        latched_write), .data_out(HRDATA), .ready(core_ready), .qspi_cs_n(
        qspi_cs_n), .qspi_clk(qspi_clk), .qspi_io_out(io_out), .qspi_io_oe(
        io_oe), .qspi_io_in(qspi_io) );
  \**TSGEN**  \qspi_io_tri[0]  ( .\function (io_out[0]), .three_state(N0), 
        .\output (qspi_io[0]) );
  GTECH_NOT I_0 ( .A(io_oe), .Z(N0) );
  \**TSGEN**  \qspi_io_tri[1]  ( .\function (io_out[1]), .three_state(N1), 
        .\output (qspi_io[1]) );
  GTECH_NOT I_1 ( .A(io_oe), .Z(N1) );
  \**TSGEN**  \qspi_io_tri[2]  ( .\function (io_out[2]), .three_state(N2), 
        .\output (qspi_io[2]) );
  GTECH_NOT I_2 ( .A(io_oe), .Z(N2) );
  \**TSGEN**  \qspi_io_tri[3]  ( .\function (io_out[3]), .three_state(N3), 
        .\output (qspi_io[3]) );
  GTECH_NOT I_3 ( .A(io_oe), .Z(N3) );
  GTECH_NOT I_4 ( .A(HTRANS[1]), .Z(N14) );
  GTECH_OR2 C455 ( .A(HTRANS[0]), .B(N14), .Z(N15) );
  GTECH_NOT I_5 ( .A(N15), .Z(N16) );
  SELECT_OP C457 ( .DATA1(HWRITE), .DATA2(1'b0), .CONTROL1(N4), .CONTROL2(N8), 
        .Z(N9) );
  GTECH_BUF B_0 ( .A(N7), .Z(N4) );
  GTECH_NOT I_6 ( .A(N10), .Z(N12) );
  SELECT_OP C459 ( .DATA1(1'b1), .DATA2(N7), .CONTROL1(N5), .CONTROL2(N11), 
        .Z(N13) );
  GTECH_BUF B_1 ( .A(N10), .Z(N5) );
  GTECH_AND2 C462 ( .A(N17), .B(N16), .Z(valid_transfer) );
  GTECH_AND2 C463 ( .A(HSEL), .B(HREADY), .Z(N17) );
  GTECH_NOT I_7 ( .A(HRESETn), .Z(N6) );
  GTECH_AND2 C465 ( .A(valid_transfer), .B(N18), .Z(N7) );
  GTECH_NOT I_8 ( .A(is_busy), .Z(N18) );
  GTECH_NOT I_9 ( .A(N7), .Z(N8) );
  GTECH_AND2 C470 ( .A(N19), .B(N20), .Z(N10) );
  GTECH_AND2 C471 ( .A(is_busy), .B(core_ready), .Z(N19) );
  GTECH_NOT I_10 ( .A(core_start), .Z(N20) );
  GTECH_NOT I_11 ( .A(N10), .Z(N11) );
  GTECH_NOT I_12 ( .A(is_busy), .Z(HREADYOUT) );
endmodule

