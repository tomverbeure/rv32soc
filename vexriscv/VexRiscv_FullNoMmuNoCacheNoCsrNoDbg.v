// Generator : SpinalHDL v1.1.5    git head : 0310b2489a097f2b9de5535e02192d9ddd2764ae
// Date      : 24/05/2018, 21:29:42
// Component : VexRiscv


`define BranchCtrlEnum_binary_sequancial_type [1:0]
`define BranchCtrlEnum_binary_sequancial_INC 2'b00
`define BranchCtrlEnum_binary_sequancial_B 2'b01
`define BranchCtrlEnum_binary_sequancial_JAL 2'b10
`define BranchCtrlEnum_binary_sequancial_JALR 2'b11

`define ShiftCtrlEnum_binary_sequancial_type [1:0]
`define ShiftCtrlEnum_binary_sequancial_DISABLE_1 2'b00
`define ShiftCtrlEnum_binary_sequancial_SLL_1 2'b01
`define ShiftCtrlEnum_binary_sequancial_SRL_1 2'b10
`define ShiftCtrlEnum_binary_sequancial_SRA_1 2'b11

`define Src1CtrlEnum_binary_sequancial_type [1:0]
`define Src1CtrlEnum_binary_sequancial_RS 2'b00
`define Src1CtrlEnum_binary_sequancial_IMU 2'b01
`define Src1CtrlEnum_binary_sequancial_FOUR 2'b10

`define AluCtrlEnum_binary_sequancial_type [1:0]
`define AluCtrlEnum_binary_sequancial_ADD_SUB 2'b00
`define AluCtrlEnum_binary_sequancial_SLT_SLTU 2'b01
`define AluCtrlEnum_binary_sequancial_BITWISE 2'b10

`define Src2CtrlEnum_binary_sequancial_type [1:0]
`define Src2CtrlEnum_binary_sequancial_RS 2'b00
`define Src2CtrlEnum_binary_sequancial_IMI 2'b01
`define Src2CtrlEnum_binary_sequancial_IMS 2'b10
`define Src2CtrlEnum_binary_sequancial_PC 2'b11

`define AluBitwiseCtrlEnum_binary_sequancial_type [1:0]
`define AluBitwiseCtrlEnum_binary_sequancial_XOR_1 2'b00
`define AluBitwiseCtrlEnum_binary_sequancial_OR_1 2'b01
`define AluBitwiseCtrlEnum_binary_sequancial_AND_1 2'b10
`define AluBitwiseCtrlEnum_binary_sequancial_SRC1 2'b11

module VexRiscv (
      output  iBus_cmd_valid,
      input   iBus_cmd_ready,
      output [31:0] iBus_cmd_payload_pc,
      input   iBus_rsp_ready,
      input   iBus_rsp_error,
      input  [31:0] iBus_rsp_inst,
      output  dBus_cmd_valid,
      input   dBus_cmd_ready,
      output  dBus_cmd_payload_wr,
      output [31:0] dBus_cmd_payload_address,
      output [31:0] dBus_cmd_payload_data,
      output [1:0] dBus_cmd_payload_size,
      input   dBus_rsp_ready,
      input   dBus_rsp_error,
      input  [31:0] dBus_rsp_data,
      input   clk,
      input   reset);
  reg [31:0] _zz_204;
  reg [31:0] _zz_205;
  wire  _zz_206;
  wire [1:0] _zz_207;
  wire [31:0] _zz_208;
  reg [31:0] _zz_209;
  wire  _zz_210;
  wire  _zz_211;
  wire  _zz_212;
  wire [1:0] _zz_213;
  wire [1:0] _zz_214;
  wire [1:0] _zz_215;
  wire [2:0] _zz_216;
  wire [31:0] _zz_217;
  wire [1:0] _zz_218;
  wire [1:0] _zz_219;
  wire [0:0] _zz_220;
  wire [0:0] _zz_221;
  wire [0:0] _zz_222;
  wire [0:0] _zz_223;
  wire [0:0] _zz_224;
  wire [0:0] _zz_225;
  wire [0:0] _zz_226;
  wire [0:0] _zz_227;
  wire [0:0] _zz_228;
  wire [0:0] _zz_229;
  wire [0:0] _zz_230;
  wire [0:0] _zz_231;
  wire [0:0] _zz_232;
  wire [11:0] _zz_233;
  wire [11:0] _zz_234;
  wire [31:0] _zz_235;
  wire [31:0] _zz_236;
  wire [31:0] _zz_237;
  wire [31:0] _zz_238;
  wire [1:0] _zz_239;
  wire [31:0] _zz_240;
  wire [1:0] _zz_241;
  wire [1:0] _zz_242;
  wire [32:0] _zz_243;
  wire [31:0] _zz_244;
  wire [32:0] _zz_245;
  wire [51:0] _zz_246;
  wire [51:0] _zz_247;
  wire [51:0] _zz_248;
  wire [32:0] _zz_249;
  wire [51:0] _zz_250;
  wire [49:0] _zz_251;
  wire [51:0] _zz_252;
  wire [49:0] _zz_253;
  wire [51:0] _zz_254;
  wire [65:0] _zz_255;
  wire [65:0] _zz_256;
  wire [31:0] _zz_257;
  wire [31:0] _zz_258;
  wire [0:0] _zz_259;
  wire [5:0] _zz_260;
  wire [32:0] _zz_261;
  wire [32:0] _zz_262;
  wire [31:0] _zz_263;
  wire [31:0] _zz_264;
  wire [32:0] _zz_265;
  wire [32:0] _zz_266;
  wire [32:0] _zz_267;
  wire [0:0] _zz_268;
  wire [32:0] _zz_269;
  wire [0:0] _zz_270;
  wire [32:0] _zz_271;
  wire [0:0] _zz_272;
  wire [31:0] _zz_273;
  wire [11:0] _zz_274;
  wire [31:0] _zz_275;
  wire [19:0] _zz_276;
  wire [11:0] _zz_277;
  wire [11:0] _zz_278;
  wire [11:0] _zz_279;
  wire [0:0] _zz_280;
  wire [31:0] _zz_281;
  wire [31:0] _zz_282;
  wire [31:0] _zz_283;
  wire [31:0] _zz_284;
  wire [31:0] _zz_285;
  wire [31:0] _zz_286;
  wire [0:0] _zz_287;
  wire [3:0] _zz_288;
  wire [0:0] _zz_289;
  wire [0:0] _zz_290;
  wire  _zz_291;
  wire [0:0] _zz_292;
  wire [17:0] _zz_293;
  wire [31:0] _zz_294;
  wire [31:0] _zz_295;
  wire  _zz_296;
  wire [0:0] _zz_297;
  wire [0:0] _zz_298;
  wire  _zz_299;
  wire [0:0] _zz_300;
  wire [0:0] _zz_301;
  wire  _zz_302;
  wire [0:0] _zz_303;
  wire [14:0] _zz_304;
  wire [31:0] _zz_305;
  wire [31:0] _zz_306;
  wire [31:0] _zz_307;
  wire [31:0] _zz_308;
  wire [0:0] _zz_309;
  wire [0:0] _zz_310;
  wire [1:0] _zz_311;
  wire [1:0] _zz_312;
  wire  _zz_313;
  wire [0:0] _zz_314;
  wire [11:0] _zz_315;
  wire [31:0] _zz_316;
  wire [31:0] _zz_317;
  wire [31:0] _zz_318;
  wire [31:0] _zz_319;
  wire [31:0] _zz_320;
  wire [31:0] _zz_321;
  wire [0:0] _zz_322;
  wire [0:0] _zz_323;
  wire [0:0] _zz_324;
  wire [0:0] _zz_325;
  wire  _zz_326;
  wire [0:0] _zz_327;
  wire [7:0] _zz_328;
  wire [31:0] _zz_329;
  wire [31:0] _zz_330;
  wire [31:0] _zz_331;
  wire [31:0] _zz_332;
  wire [31:0] _zz_333;
  wire [0:0] _zz_334;
  wire [1:0] _zz_335;
  wire [1:0] _zz_336;
  wire [1:0] _zz_337;
  wire  _zz_338;
  wire [0:0] _zz_339;
  wire [4:0] _zz_340;
  wire [31:0] _zz_341;
  wire [31:0] _zz_342;
  wire [31:0] _zz_343;
  wire  _zz_344;
  wire [0:0] _zz_345;
  wire [0:0] _zz_346;
  wire  _zz_347;
  wire [0:0] _zz_348;
  wire [1:0] _zz_349;
  wire  _zz_350;
  wire [0:0] _zz_351;
  wire [0:0] _zz_352;
  wire  _zz_353;
  wire  _zz_354;
  wire [0:0] _zz_355;
  wire [1:0] _zz_356;
  wire [0:0] _zz_357;
  wire [1:0] _zz_358;
  wire [31:0] _zz_359;
  wire [31:0] _zz_360;
  wire [31:0] _zz_361;
  wire [31:0] _zz_362;
  wire [31:0] _zz_363;
  wire [31:0] _zz_364;
  wire [31:0] _zz_365;
  wire [31:0] _zz_366;
  wire [31:0] _zz_367;
  wire [31:0] _zz_368;
  wire [31:0] _zz_369;
  wire [31:0] _zz_370;
  wire [0:0] _zz_371;
  wire [7:0] _zz_372;
  wire  _zz_373;
  wire [0:0] _zz_374;
  wire [0:0] _zz_375;
  wire  decode_SRC_LESS_UNSIGNED;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire [31:0] fetch_FORMAL_PC_NEXT;
  wire [31:0] prefetch_FORMAL_PC_NEXT;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire `AluCtrlEnum_binary_sequancial_type decode_ALU_CTRL;
  wire `AluCtrlEnum_binary_sequancial_type _zz_1;
  wire `AluCtrlEnum_binary_sequancial_type _zz_2;
  wire `AluCtrlEnum_binary_sequancial_type _zz_3;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire  execute_BRANCH_DO;
  wire `Src1CtrlEnum_binary_sequancial_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_4;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_5;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_6;
  wire [31:0] fetch_INSTRUCTION;
  wire  decode_IS_DIV;
  wire [33:0] execute_MUL_LH;
  wire [31:0] execute_MUL_LL;
  wire  decode_MEMORY_ENABLE;
  wire  memory_IS_MUL;
  wire  execute_IS_MUL;
  wire  decode_IS_MUL;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_IS_RS2_SIGNED;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_7;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_8;
  wire [33:0] execute_MUL_HL;
  wire [31:0] execute_SHIFT_RIGHT;
  wire [31:0] memory_PC;
  wire [31:0] fetch_PC;
  wire [33:0] memory_MUL_HH;
  wire [33:0] execute_MUL_HH;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_9;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_10;
  wire `ShiftCtrlEnum_binary_sequancial_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_11;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_12;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_13;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_14;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_15;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_16;
  wire `Src2CtrlEnum_binary_sequancial_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_17;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_18;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_19;
  wire [51:0] memory_MUL_LOW;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] execute_BRANCH_CALC;
  wire  decode_IS_RS1_SIGNED;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_BRANCH_DO;
  wire [31:0] _zz_20;
  wire [31:0] execute_PC;
  wire  execute_PREDICTION_HAD_BRANCHED2;
  wire  _zz_21;
  wire `BranchCtrlEnum_binary_sequancial_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_22;
  wire  decode_PREDICTION_HAD_BRANCHED2;
  wire `BranchCtrlEnum_binary_sequancial_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_23;
  wire  _zz_24;
  wire  execute_IS_RS1_SIGNED;
  wire [31:0] execute_RS1;
  wire  execute_IS_DIV;
  wire  execute_IS_RS2_SIGNED;
  wire  memory_IS_DIV;
  wire  writeBack_IS_MUL;
  wire [33:0] writeBack_MUL_HH;
  wire [51:0] writeBack_MUL_LOW;
  wire [33:0] memory_MUL_HL;
  wire [33:0] memory_MUL_LH;
  wire [31:0] memory_MUL_LL;
  wire [51:0] _zz_25;
  wire [33:0] _zz_26;
  wire [33:0] _zz_27;
  wire [33:0] _zz_28;
  wire [31:0] _zz_29;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  wire [31:0] _zz_30;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  reg [31:0] decode_RS2;
  reg [31:0] decode_RS1;
  wire [31:0] memory_SHIFT_RIGHT;
  reg [31:0] _zz_31;
  wire `ShiftCtrlEnum_binary_sequancial_type memory_SHIFT_CTRL;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_32;
  wire [31:0] _zz_33;
  wire `ShiftCtrlEnum_binary_sequancial_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_34;
  wire  _zz_35;
  wire [31:0] _zz_36;
  wire [31:0] _zz_37;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_38;
  wire `Src2CtrlEnum_binary_sequancial_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_39;
  wire [31:0] _zz_40;
  wire `Src1CtrlEnum_binary_sequancial_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_41;
  wire [31:0] _zz_42;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_binary_sequancial_type execute_ALU_CTRL;
  wire `AluCtrlEnum_binary_sequancial_type _zz_43;
  wire [31:0] _zz_44;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_45;
  wire [31:0] _zz_46;
  wire  _zz_47;
  reg  _zz_48;
  wire [31:0] _zz_49;
  wire [31:0] _zz_50;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire `AluCtrlEnum_binary_sequancial_type _zz_51;
  wire  _zz_52;
  wire  _zz_53;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_54;
  wire  _zz_55;
  wire  _zz_56;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_57;
  wire  _zz_58;
  wire  _zz_59;
  wire  _zz_60;
  wire  _zz_61;
  wire  _zz_62;
  wire  _zz_63;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_64;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_65;
  wire  _zz_66;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_67;
  wire  _zz_68;
  reg [31:0] _zz_69;
  wire  writeBack_MEMORY_ENABLE;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_MEMORY_ENABLE;
  wire [31:0] _zz_70;
  wire [1:0] _zz_71;
  wire [31:0] execute_RS2;
  wire [31:0] execute_SRC_ADD;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_ALIGNEMENT_FAULT;
  wire  execute_MEMORY_ENABLE;
  wire  _zz_72;
  wire [31:0] _zz_73;
  wire [31:0] _zz_74;
  reg [31:0] _zz_75;
  wire [31:0] _zz_76;
  reg [31:0] _zz_77;
  wire [31:0] prefetch_PC;
  wire [31:0] _zz_78;
  wire [31:0] _zz_79;
  wire [31:0] prefetch_PC_CALC_WITHOUT_JUMP;
  wire [31:0] _zz_80;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
  wire [31:0] decode_PC /* verilator public */ ;
  wire [31:0] decode_INSTRUCTION /* verilator public */ ;
  reg  prefetch_arbitration_haltItself;
  wire  prefetch_arbitration_haltByOther;
  wire  prefetch_arbitration_removeIt;
  wire  prefetch_arbitration_flushAll;
  wire  prefetch_arbitration_redoIt;
  reg  prefetch_arbitration_isValid;
  wire  prefetch_arbitration_isStuck;
  wire  prefetch_arbitration_isStuckByOthers;
  wire  prefetch_arbitration_isFlushed;
  wire  prefetch_arbitration_isMoving;
  wire  prefetch_arbitration_isFiring;
  reg  fetch_arbitration_haltItself;
  wire  fetch_arbitration_haltByOther;
  reg  fetch_arbitration_removeIt;
  reg  fetch_arbitration_flushAll;
  wire  fetch_arbitration_redoIt;
  reg  fetch_arbitration_isValid;
  wire  fetch_arbitration_isStuck;
  wire  fetch_arbitration_isStuckByOthers;
  wire  fetch_arbitration_isFlushed;
  wire  fetch_arbitration_isMoving;
  wire  fetch_arbitration_isFiring;
  reg  decode_arbitration_haltItself /* verilator public */ ;
  wire  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  wire  decode_arbitration_flushAll /* verilator public */ ;
  wire  decode_arbitration_redoIt;
  reg  decode_arbitration_isValid /* verilator public */ ;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  wire  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushAll;
  wire  execute_arbitration_redoIt;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  wire  memory_arbitration_flushAll;
  wire  memory_arbitration_redoIt;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  wire  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  wire  writeBack_arbitration_flushAll;
  wire  writeBack_arbitration_redoIt;
  reg  writeBack_arbitration_isValid /* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring /* verilator public */ ;
  wire  _zz_81;
  wire  _zz_82;
  wire [31:0] _zz_83;
  reg [31:0] prefetch_PcManagerSimplePlugin_pcReg /* verilator public */ ;
  reg  prefetch_PcManagerSimplePlugin_inc;
  wire [31:0] prefetch_PcManagerSimplePlugin_pcBeforeJumps;
  reg [31:0] prefetch_PcManagerSimplePlugin_pc;
  reg  prefetch_PcManagerSimplePlugin_samplePcNext;
  wire  prefetch_PcManagerSimplePlugin_jump_pcLoad_valid;
  wire [31:0] prefetch_PcManagerSimplePlugin_jump_pcLoad_payload;
  wire [1:0] _zz_84;
  wire  _zz_85;
  reg  prefetch_IBusSimplePlugin_pendingCmd;
  reg  _zz_86;
  reg [31:0] _zz_87;
  reg [31:0] _zz_88;
  reg [3:0] _zz_89;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_90;
  reg [31:0] _zz_91;
  wire  _zz_92;
  reg [31:0] _zz_93;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [23:0] _zz_94;
  wire  _zz_95;
  wire  _zz_96;
  wire  _zz_97;
  wire  _zz_98;
  wire `ShiftCtrlEnum_binary_sequancial_type _zz_99;
  wire `Src1CtrlEnum_binary_sequancial_type _zz_100;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _zz_101;
  wire `Src2CtrlEnum_binary_sequancial_type _zz_102;
  wire `BranchCtrlEnum_binary_sequancial_type _zz_103;
  wire `AluCtrlEnum_binary_sequancial_type _zz_104;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire  _zz_105;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  wire  _zz_106;
  reg  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg  _zz_107;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_108;
  reg [31:0] _zz_109;
  wire  _zz_110;
  reg [19:0] _zz_111;
  wire  _zz_112;
  reg [19:0] _zz_113;
  reg [31:0] _zz_114;
  wire [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  wire [4:0] execute_FullBarrielShifterPlugin_amplitude;
  reg [31:0] _zz_115;
  wire [31:0] execute_FullBarrielShifterPlugin_reversed;
  reg [31:0] _zz_116;
  reg  _zz_117;
  reg  _zz_118;
  reg  _zz_119;
  reg [4:0] _zz_120;
  reg [31:0] _zz_121;
  wire  _zz_122;
  wire  _zz_123;
  wire  _zz_124;
  wire  _zz_125;
  wire  _zz_126;
  wire  _zz_127;
  wire  _zz_128;
  reg  execute_MulPlugin_aSigned;
  reg  execute_MulPlugin_bSigned;
  wire [31:0] execute_MulPlugin_a;
  wire [31:0] execute_MulPlugin_b;
  wire [15:0] execute_MulPlugin_aULow;
  wire [15:0] execute_MulPlugin_bULow;
  wire [16:0] execute_MulPlugin_aSLow;
  wire [16:0] execute_MulPlugin_bSLow;
  wire [16:0] execute_MulPlugin_aHigh;
  wire [16:0] execute_MulPlugin_bHigh;
  wire [65:0] writeBack_MulPlugin_result;
  reg [32:0] memory_DivPlugin_rs1;
  reg [31:0] memory_DivPlugin_rs2;
  reg [64:0] memory_DivPlugin_accumulator;
  reg  memory_DivPlugin_div_needRevert;
  reg  memory_DivPlugin_div_counter_willIncrement;
  reg  memory_DivPlugin_div_counter_willClear;
  reg [5:0] memory_DivPlugin_div_counter_valueNext;
  reg [5:0] memory_DivPlugin_div_counter_value;
  wire  memory_DivPlugin_div_done;
  wire  memory_DivPlugin_div_counter_willOverflow;
  reg [31:0] memory_DivPlugin_div_result;
  wire [31:0] _zz_129;
  wire [32:0] _zz_130;
  wire [32:0] _zz_131;
  wire [31:0] _zz_132;
  wire  _zz_133;
  wire  _zz_134;
  reg [32:0] _zz_135;
  wire  _zz_136;
  reg [18:0] _zz_137;
  wire  decode_BranchPlugin_conditionalBranchPrediction;
  wire  _zz_138;
  reg [10:0] _zz_139;
  wire  _zz_140;
  reg [18:0] _zz_141;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_142;
  reg  _zz_143;
  reg  _zz_144;
  reg [31:0] execute_BranchPlugin_branch_src1;
  reg [31:0] execute_BranchPlugin_branch_src2;
  wire  _zz_145;
  reg [19:0] _zz_146;
  wire  _zz_147;
  reg [18:0] _zz_148;
  wire [31:0] execute_BranchPlugin_branchAdder;
  reg  _zz_149;
  reg [31:0] _zz_150;
  reg [1:0] _zz_151;
  reg [1:0] _zz_152;
  reg [51:0] _zz_153;
  reg `Src2CtrlEnum_binary_sequancial_type _zz_154;
  reg `AluBitwiseCtrlEnum_binary_sequancial_type _zz_155;
  reg `ShiftCtrlEnum_binary_sequancial_type _zz_156;
  reg `ShiftCtrlEnum_binary_sequancial_type _zz_157;
  reg [33:0] _zz_158;
  reg [33:0] _zz_159;
  reg  _zz_160;
  reg [31:0] _zz_161;
  reg [31:0] _zz_162;
  reg [31:0] _zz_163;
  reg [31:0] _zz_164;
  reg [31:0] _zz_165;
  reg [31:0] _zz_166;
  reg [33:0] _zz_167;
  reg `BranchCtrlEnum_binary_sequancial_type _zz_168;
  reg  _zz_169;
  reg  _zz_170;
  reg  _zz_171;
  reg  _zz_172;
  reg  _zz_173;
  reg  _zz_174;
  reg  _zz_175;
  reg  _zz_176;
  reg [31:0] _zz_177;
  reg [31:0] _zz_178;
  reg [33:0] _zz_179;
  reg  _zz_180;
  reg  _zz_181;
  reg  _zz_182;
  reg  _zz_183;
  reg  _zz_184;
  reg [31:0] _zz_185;
  reg [31:0] _zz_186;
  reg [31:0] _zz_187;
  reg [31:0] _zz_188;
  reg `Src1CtrlEnum_binary_sequancial_type _zz_189;
  reg  _zz_190;
  reg [31:0] _zz_191;
  reg  _zz_192;
  reg `AluCtrlEnum_binary_sequancial_type _zz_193;
  reg  _zz_194;
  reg  _zz_195;
  reg [31:0] _zz_196;
  reg [31:0] _zz_197;
  reg [31:0] _zz_198;
  reg [31:0] _zz_199;
  reg [31:0] _zz_200;
  reg [31:0] _zz_201;
  reg [31:0] _zz_202;
  reg  _zz_203;
  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign iBus_cmd_valid = _zz_206;
  assign dBus_cmd_payload_size = _zz_207;
  assign dBus_cmd_payload_address = _zz_208;
  assign _zz_210 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_211 = (! memory_DivPlugin_div_done);
  assign _zz_212 = (! memory_arbitration_isStuck);
  assign _zz_213 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_214 = execute_INSTRUCTION[13 : 12];
  assign _zz_215 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_216 = {prefetch_PcManagerSimplePlugin_inc,(2'b00)};
  assign _zz_217 = {29'd0, _zz_216};
  assign _zz_218 = (_zz_84 & (~ _zz_219));
  assign _zz_219 = (_zz_84 - (2'b01));
  assign _zz_220 = _zz_94[0 : 0];
  assign _zz_221 = _zz_94[3 : 3];
  assign _zz_222 = _zz_94[8 : 8];
  assign _zz_223 = _zz_94[9 : 9];
  assign _zz_224 = _zz_94[10 : 10];
  assign _zz_225 = _zz_94[11 : 11];
  assign _zz_226 = _zz_94[12 : 12];
  assign _zz_227 = _zz_94[13 : 13];
  assign _zz_228 = _zz_94[16 : 16];
  assign _zz_229 = _zz_94[17 : 17];
  assign _zz_230 = _zz_94[20 : 20];
  assign _zz_231 = _zz_94[21 : 21];
  assign _zz_232 = execute_SRC_LESS;
  assign _zz_233 = execute_INSTRUCTION[31 : 20];
  assign _zz_234 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_235 = ($signed(_zz_236) + $signed(_zz_240));
  assign _zz_236 = ($signed(_zz_237) + $signed(_zz_238));
  assign _zz_237 = execute_SRC1;
  assign _zz_238 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_239 = (execute_SRC_USE_SUB_LESS ? _zz_241 : _zz_242);
  assign _zz_240 = {{30{_zz_239[1]}}, _zz_239};
  assign _zz_241 = (2'b01);
  assign _zz_242 = (2'b00);
  assign _zz_243 = ($signed(_zz_245) >>> execute_FullBarrielShifterPlugin_amplitude);
  assign _zz_244 = _zz_243[31 : 0];
  assign _zz_245 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_binary_sequancial_SRA_1) && execute_FullBarrielShifterPlugin_reversed[31]),execute_FullBarrielShifterPlugin_reversed};
  assign _zz_246 = ($signed(_zz_247) + $signed(_zz_252));
  assign _zz_247 = ($signed(_zz_248) + $signed(_zz_250));
  assign _zz_248 = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_249 = {1'b0,memory_MUL_LL};
  assign _zz_250 = {{19{_zz_249[32]}}, _zz_249};
  assign _zz_251 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_252 = {{2{_zz_251[49]}}, _zz_251};
  assign _zz_253 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_254 = {{2{_zz_253[49]}}, _zz_253};
  assign _zz_255 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_256 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_257 = writeBack_MUL_LOW[31 : 0];
  assign _zz_258 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_259 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_260 = {5'd0, _zz_259};
  assign _zz_261 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_262 = {_zz_129,(! _zz_131[32])};
  assign _zz_263 = _zz_131[31:0];
  assign _zz_264 = _zz_130[31:0];
  assign _zz_265 = _zz_266;
  assign _zz_266 = _zz_267;
  assign _zz_267 = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_132) : _zz_132)} + _zz_269);
  assign _zz_268 = memory_DivPlugin_div_needRevert;
  assign _zz_269 = {32'd0, _zz_268};
  assign _zz_270 = _zz_134;
  assign _zz_271 = {32'd0, _zz_270};
  assign _zz_272 = _zz_133;
  assign _zz_273 = {31'd0, _zz_272};
  assign _zz_274 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_275 = {{_zz_137,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_276 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_277 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_278 = execute_INSTRUCTION[31 : 20];
  assign _zz_279 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_280 = _zz_85;
  assign _zz_281 = (decode_INSTRUCTION & (32'b00000000000000000100000000000100));
  assign _zz_282 = (32'b00000000000000000100000000000000);
  assign _zz_283 = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_284 = (32'b00000000000000000000000000100100);
  assign _zz_285 = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_286 = (32'b00000000000000000010000000000000);
  assign _zz_287 = _zz_95;
  assign _zz_288 = {(_zz_294 == _zz_295),{_zz_296,{_zz_297,_zz_298}}};
  assign _zz_289 = _zz_98;
  assign _zz_290 = (1'b0);
  assign _zz_291 = (_zz_96 != (1'b0));
  assign _zz_292 = (_zz_299 != (1'b0));
  assign _zz_293 = {(_zz_300 != _zz_301),{_zz_302,{_zz_303,_zz_304}}};
  assign _zz_294 = (decode_INSTRUCTION & (32'b00000000000000000010000000110000));
  assign _zz_295 = (32'b00000000000000000010000000010000);
  assign _zz_296 = ((decode_INSTRUCTION & (32'b00000010000000000010000000100000)) == (32'b00000000000000000010000000100000));
  assign _zz_297 = ((decode_INSTRUCTION & _zz_305) == (32'b00000000000000000000000000100000));
  assign _zz_298 = ((decode_INSTRUCTION & _zz_306) == (32'b00000000000000000000000000010000));
  assign _zz_299 = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001000000));
  assign _zz_300 = _zz_98;
  assign _zz_301 = (1'b0);
  assign _zz_302 = ((_zz_307 == _zz_308) != (1'b0));
  assign _zz_303 = ({_zz_309,_zz_310} != (2'b00));
  assign _zz_304 = {(_zz_311 != _zz_312),{_zz_313,{_zz_314,_zz_315}}};
  assign _zz_305 = (32'b00000010000000000001000000100000);
  assign _zz_306 = (32'b00000000000000000001000000110000);
  assign _zz_307 = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_308 = (32'b00000000000000000000000000000000);
  assign _zz_309 = _zz_95;
  assign _zz_310 = ((decode_INSTRUCTION & (32'b00000000000000000000000001110000)) == (32'b00000000000000000000000000100000));
  assign _zz_311 = {_zz_95,_zz_97};
  assign _zz_312 = (2'b00);
  assign _zz_313 = ({(_zz_316 == _zz_317),(_zz_318 == _zz_319)} != (2'b00));
  assign _zz_314 = ((_zz_320 == _zz_321) != (1'b0));
  assign _zz_315 = {({_zz_322,_zz_323} != (2'b00)),{(_zz_324 != _zz_325),{_zz_326,{_zz_327,_zz_328}}}};
  assign _zz_316 = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_317 = (32'b00000000000000000010000000000000);
  assign _zz_318 = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_319 = (32'b00000000000000000001000000000000);
  assign _zz_320 = (decode_INSTRUCTION & (32'b00000010000000000100000000110100));
  assign _zz_321 = (32'b00000010000000000000000000110000);
  assign _zz_322 = ((decode_INSTRUCTION & _zz_329) == (32'b00000000000000000000000000000000));
  assign _zz_323 = ((decode_INSTRUCTION & _zz_330) == (32'b00000000000000000000000000000000));
  assign _zz_324 = ((decode_INSTRUCTION & _zz_331) == (32'b00000010000000000100000000100000));
  assign _zz_325 = (1'b0);
  assign _zz_326 = ((_zz_332 == _zz_333) != (1'b0));
  assign _zz_327 = ({_zz_334,_zz_335} != (3'b000));
  assign _zz_328 = {(_zz_336 != _zz_337),{_zz_338,{_zz_339,_zz_340}}};
  assign _zz_329 = (32'b00000000000000000000000000000100);
  assign _zz_330 = (32'b00000000000000000000000000011000);
  assign _zz_331 = (32'b00000010000000000100000001100100);
  assign _zz_332 = (decode_INSTRUCTION & (32'b00000000000000000000000000100100));
  assign _zz_333 = (32'b00000000000000000000000000100000);
  assign _zz_334 = ((decode_INSTRUCTION & _zz_341) == (32'b00000000000000000000000000010000));
  assign _zz_335 = {_zz_95,_zz_97};
  assign _zz_336 = {(_zz_342 == _zz_343),_zz_95};
  assign _zz_337 = (2'b00);
  assign _zz_338 = ({_zz_95,_zz_344} != (2'b00));
  assign _zz_339 = (_zz_96 != (1'b0));
  assign _zz_340 = {(_zz_345 != _zz_346),{_zz_347,{_zz_348,_zz_349}}};
  assign _zz_341 = (32'b00000000000000000000000000010000);
  assign _zz_342 = (decode_INSTRUCTION & (32'b00000000000000000001000000000000));
  assign _zz_343 = (32'b00000000000000000001000000000000);
  assign _zz_344 = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000));
  assign _zz_345 = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000000000100));
  assign _zz_346 = (1'b0);
  assign _zz_347 = ({_zz_95,{_zz_350,{_zz_351,_zz_352}}} != (4'b0000));
  assign _zz_348 = ({_zz_353,_zz_354} != (2'b00));
  assign _zz_349 = {({_zz_355,_zz_356} != (3'b000)),({_zz_357,_zz_358} != (3'b000))};
  assign _zz_350 = ((decode_INSTRUCTION & (32'b00000000000000000100000000100000)) == (32'b00000000000000000100000000100000));
  assign _zz_351 = ((decode_INSTRUCTION & _zz_359) == (32'b00000000000000000000000000010000));
  assign _zz_352 = ((decode_INSTRUCTION & _zz_360) == (32'b00000000000000000000000000100000));
  assign _zz_353 = ((decode_INSTRUCTION & (32'b00000000000000000111000000110100)) == (32'b00000000000000000101000000010000));
  assign _zz_354 = ((decode_INSTRUCTION & (32'b00000010000000000111000001100100)) == (32'b00000000000000000101000000100000));
  assign _zz_355 = ((decode_INSTRUCTION & _zz_361) == (32'b01000000000000000001000000010000));
  assign _zz_356 = {(_zz_362 == _zz_363),(_zz_364 == _zz_365)};
  assign _zz_357 = ((decode_INSTRUCTION & _zz_366) == (32'b00000000000000000000000001000000));
  assign _zz_358 = {(_zz_367 == _zz_368),(_zz_369 == _zz_370)};
  assign _zz_359 = (32'b00000000000000000000000000110000);
  assign _zz_360 = (32'b00000010000000000000000000100000);
  assign _zz_361 = (32'b01000000000000000011000000010100);
  assign _zz_362 = (decode_INSTRUCTION & (32'b00000010000000000111000000010100));
  assign _zz_363 = (32'b00000000000000000001000000010000);
  assign _zz_364 = (decode_INSTRUCTION & (32'b00000000000000000111000000110100));
  assign _zz_365 = (32'b00000000000000000001000000010000);
  assign _zz_366 = (32'b00000000000000000000000001000100);
  assign _zz_367 = (decode_INSTRUCTION & (32'b01000000000000000000000000110000));
  assign _zz_368 = (32'b01000000000000000000000000110000);
  assign _zz_369 = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_370 = (32'b00000000000000000010000000010000);
  assign _zz_371 = decode_INSTRUCTION[31];
  assign _zz_372 = decode_INSTRUCTION[19 : 12];
  assign _zz_373 = decode_INSTRUCTION[20];
  assign _zz_374 = decode_INSTRUCTION[31];
  assign _zz_375 = decode_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_48) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_105) begin
      _zz_204 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_106) begin
      _zz_205 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(*) begin
    case(_zz_280)
      1'b0 : begin
        _zz_209 = memory_BRANCH_CALC;
      end
      default : begin
        _zz_209 = _zz_83;
      end
    endcase
  end

  assign decode_SRC_LESS_UNSIGNED = _zz_58;
  assign memory_FORMAL_PC_NEXT = _zz_201;
  assign execute_FORMAL_PC_NEXT = _zz_200;
  assign decode_FORMAL_PC_NEXT = _zz_199;
  assign fetch_FORMAL_PC_NEXT = _zz_198;
  assign prefetch_FORMAL_PC_NEXT = _zz_78;
  assign writeBack_REGFILE_WRITE_DATA = _zz_197;
  assign memory_REGFILE_WRITE_DATA = _zz_196;
  assign execute_REGFILE_WRITE_DATA = _zz_44;
  assign execute_BYPASSABLE_MEMORY_STAGE = _zz_194;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_66;
  assign decode_ALU_CTRL = _zz_1;
  assign _zz_2 = _zz_3;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_52;
  assign memory_MEMORY_READ_DATA = _zz_70;
  assign execute_BRANCH_DO = _zz_21;
  assign decode_SRC1_CTRL = _zz_4;
  assign _zz_5 = _zz_6;
  assign fetch_INSTRUCTION = _zz_75;
  assign decode_IS_DIV = _zz_61;
  assign execute_MUL_LH = _zz_28;
  assign execute_MUL_LL = _zz_29;
  assign decode_MEMORY_ENABLE = _zz_56;
  assign memory_IS_MUL = _zz_172;
  assign execute_IS_MUL = _zz_171;
  assign decode_IS_MUL = _zz_59;
  assign decode_SRC_USE_SUB_LESS = _zz_68;
  assign decode_IS_RS2_SIGNED = _zz_55;
  assign _zz_7 = _zz_8;
  assign execute_MUL_HL = _zz_27;
  assign execute_SHIFT_RIGHT = _zz_33;
  assign memory_PC = _zz_164;
  assign fetch_PC = _zz_161;
  assign memory_MUL_HH = _zz_158;
  assign execute_MUL_HH = _zz_26;
  assign _zz_9 = _zz_10;
  assign decode_SHIFT_CTRL = _zz_11;
  assign _zz_12 = _zz_13;
  assign decode_ALU_BITWISE_CTRL = _zz_14;
  assign _zz_15 = _zz_16;
  assign decode_SRC2_CTRL = _zz_17;
  assign _zz_18 = _zz_19;
  assign memory_MUL_LOW = _zz_25;
  assign memory_MEMORY_ADDRESS_LOW = _zz_151;
  assign execute_MEMORY_ADDRESS_LOW = _zz_71;
  assign execute_BRANCH_CALC = _zz_20;
  assign decode_IS_RS1_SIGNED = _zz_53;
  assign memory_BRANCH_CALC = _zz_150;
  assign memory_BRANCH_DO = _zz_190;
  assign execute_PC = _zz_163;
  assign execute_PREDICTION_HAD_BRANCHED2 = _zz_160;
  assign execute_BRANCH_CTRL = _zz_22;
  assign decode_PREDICTION_HAD_BRANCHED2 = _zz_24;
  assign decode_BRANCH_CTRL = _zz_23;
  assign execute_IS_RS1_SIGNED = _zz_149;
  assign execute_RS1 = _zz_177;
  assign execute_IS_DIV = _zz_180;
  assign execute_IS_RS2_SIGNED = _zz_169;
  assign memory_IS_DIV = _zz_181;
  assign writeBack_IS_MUL = _zz_173;
  assign writeBack_MUL_HH = _zz_159;
  assign writeBack_MUL_LOW = _zz_153;
  assign memory_MUL_HL = _zz_167;
  assign memory_MUL_LH = _zz_179;
  assign memory_MUL_LL = _zz_178;
  assign decode_RS2_USE = _zz_62;
  assign decode_RS1_USE = _zz_60;
  assign _zz_30 = execute_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_VALID = _zz_182;
  assign execute_BYPASSABLE_EXECUTE_STAGE = _zz_192;
  assign memory_REGFILE_WRITE_VALID = _zz_183;
  assign memory_BYPASSABLE_MEMORY_STAGE = _zz_195;
  assign writeBack_REGFILE_WRITE_VALID = _zz_184;
  always @ (*) begin
    decode_RS2 = _zz_49;
    decode_RS1 = _zz_50;
    if(_zz_119)begin
      if((_zz_120 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_121;
      end
      if((_zz_120 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_121;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if(_zz_122)begin
        if(_zz_123)begin
          decode_RS1 = _zz_69;
        end
        if(_zz_124)begin
          decode_RS2 = _zz_69;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_125)begin
          decode_RS1 = _zz_31;
        end
        if(_zz_126)begin
          decode_RS2 = _zz_31;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_127)begin
          decode_RS1 = _zz_30;
        end
        if(_zz_128)begin
          decode_RS2 = _zz_30;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = _zz_166;
  always @ (*) begin
    _zz_31 = memory_REGFILE_WRITE_DATA;
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequancial_SLL_1 : begin
        _zz_31 = _zz_116;
      end
      `ShiftCtrlEnum_binary_sequancial_SRL_1, `ShiftCtrlEnum_binary_sequancial_SRA_1 : begin
        _zz_31 = memory_SHIFT_RIGHT;
      end
      default : begin
      end
    endcase
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_210)begin
      if(_zz_211)begin
        memory_arbitration_haltItself = 1'b1;
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
      _zz_31 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_32;
  assign execute_SHIFT_CTRL = _zz_34;
  assign execute_SRC_LESS_UNSIGNED = _zz_203;
  assign execute_SRC_USE_SUB_LESS = _zz_170;
  assign _zz_38 = execute_PC;
  assign execute_SRC2_CTRL = _zz_39;
  assign execute_SRC1_CTRL = _zz_41;
  assign execute_SRC_ADD_SUB = _zz_37;
  assign execute_SRC_LESS = _zz_35;
  assign execute_ALU_CTRL = _zz_43;
  assign execute_SRC2 = _zz_40;
  assign execute_SRC1 = _zz_42;
  assign execute_ALU_BITWISE_CTRL = _zz_45;
  assign _zz_46 = writeBack_INSTRUCTION;
  assign _zz_47 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_48 = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_48 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = _zz_74;
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_63;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_69 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_69 = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_215)
        2'b00 : begin
          _zz_69 = _zz_257;
        end
        2'b01, 2'b10, 2'b11 : begin
          _zz_69 = _zz_258;
        end
        default : begin
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = _zz_176;
  assign writeBack_MEMORY_ADDRESS_LOW = _zz_152;
  assign writeBack_MEMORY_READ_DATA = _zz_191;
  assign memory_INSTRUCTION = _zz_187;
  assign memory_MEMORY_ENABLE = _zz_175;
  assign execute_RS2 = _zz_202;
  assign execute_SRC_ADD = _zz_36;
  assign execute_INSTRUCTION = _zz_186;
  assign execute_ALIGNEMENT_FAULT = _zz_72;
  assign execute_MEMORY_ENABLE = _zz_174;
  assign _zz_73 = fetch_INSTRUCTION;
  assign _zz_76 = prefetch_PC;
  always @ (*) begin
    _zz_77 = decode_FORMAL_PC_NEXT;
    if(_zz_82)begin
      _zz_77 = _zz_83;
    end
  end

  assign prefetch_PC = _zz_79;
  assign prefetch_PC_CALC_WITHOUT_JUMP = _zz_80;
  assign writeBack_PC = _zz_165;
  assign writeBack_INSTRUCTION = _zz_188;
  assign decode_PC = _zz_162;
  assign decode_INSTRUCTION = _zz_185;
  always @ (*) begin
    prefetch_arbitration_haltItself = 1'b0;
    if(((! iBus_cmd_ready) || (prefetch_IBusSimplePlugin_pendingCmd && (! iBus_rsp_ready))))begin
      prefetch_arbitration_haltItself = 1'b1;
    end
  end

  assign prefetch_arbitration_haltByOther = 1'b0;
  assign prefetch_arbitration_removeIt = 1'b0;
  assign prefetch_arbitration_flushAll = 1'b0;
  assign prefetch_arbitration_redoIt = 1'b0;
  always @ (*) begin
    fetch_arbitration_haltItself = 1'b0;
    if(((fetch_arbitration_isValid && (! iBus_rsp_ready)) && (! _zz_86)))begin
      fetch_arbitration_haltItself = 1'b1;
    end
  end

  assign fetch_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    fetch_arbitration_removeIt = 1'b0;
    if(fetch_arbitration_isFlushed)begin
      fetch_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    fetch_arbitration_flushAll = 1'b0;
    if(_zz_82)begin
      fetch_arbitration_flushAll = 1'b1;
    end
  end

  assign fetch_arbitration_redoIt = 1'b0;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if((decode_arbitration_isValid && (_zz_117 || _zz_118)))begin
      decode_arbitration_haltItself = 1'b1;
    end
  end

  assign decode_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushAll = 1'b0;
  assign decode_arbitration_redoIt = 1'b0;
  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_ALIGNEMENT_FAULT)))begin
      execute_arbitration_haltItself = 1'b1;
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(_zz_81)begin
      execute_arbitration_flushAll = 1'b1;
    end
  end

  assign execute_arbitration_redoIt = 1'b0;
  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushAll = 1'b0;
  assign memory_arbitration_redoIt = 1'b0;
  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushAll = 1'b0;
  assign writeBack_arbitration_redoIt = 1'b0;
  assign prefetch_PcManagerSimplePlugin_pcBeforeJumps = (prefetch_PcManagerSimplePlugin_pcReg + _zz_217);
  assign _zz_80 = prefetch_PcManagerSimplePlugin_pcBeforeJumps;
  always @ (*) begin
    prefetch_PcManagerSimplePlugin_pc = prefetch_PC_CALC_WITHOUT_JUMP;
    prefetch_PcManagerSimplePlugin_samplePcNext = 1'b0;
    if(prefetch_PcManagerSimplePlugin_jump_pcLoad_valid)begin
      prefetch_PcManagerSimplePlugin_samplePcNext = 1'b1;
      prefetch_PcManagerSimplePlugin_pc = prefetch_PcManagerSimplePlugin_jump_pcLoad_payload;
    end
    if(prefetch_arbitration_isFiring)begin
      prefetch_PcManagerSimplePlugin_samplePcNext = 1'b1;
    end
  end

  assign prefetch_PcManagerSimplePlugin_jump_pcLoad_valid = (_zz_81 || _zz_82);
  assign _zz_84 = {_zz_82,_zz_81};
  assign _zz_85 = _zz_218[1];
  assign prefetch_PcManagerSimplePlugin_jump_pcLoad_payload = _zz_209;
  assign _zz_79 = prefetch_PcManagerSimplePlugin_pc;
  assign _zz_78 = (prefetch_PC + (32'b00000000000000000000000000000100));
  assign _zz_206 = (((prefetch_arbitration_isValid && (! prefetch_arbitration_removeIt)) && (! prefetch_arbitration_isStuckByOthers)) && (! (prefetch_IBusSimplePlugin_pendingCmd && (! iBus_rsp_ready))));
  assign iBus_cmd_payload_pc = _zz_76;
  always @ (*) begin
    _zz_75 = iBus_rsp_inst;
    if(_zz_86)begin
      _zz_75 = _zz_87;
    end
  end

  assign _zz_74 = (decode_arbitration_isStuck ? decode_INSTRUCTION : _zz_73);
  assign _zz_72 = 1'b0;
  assign dBus_cmd_valid = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_removeIt)) && (! execute_ALIGNEMENT_FAULT));
  assign dBus_cmd_payload_wr = execute_INSTRUCTION[5];
  assign _zz_208 = execute_SRC_ADD;
  assign _zz_207 = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(_zz_207)
      2'b00 : begin
        _zz_88 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_88 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_88 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_88;
  assign _zz_71 = _zz_208[1 : 0];
  always @ (*) begin
    case(_zz_207)
      2'b00 : begin
        _zz_89 = (4'b0001);
      end
      2'b01 : begin
        _zz_89 = (4'b0011);
      end
      default : begin
        _zz_89 = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_89 <<< _zz_208[1 : 0]);
  assign _zz_70 = dBus_rsp_data;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_90 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_91[31] = _zz_90;
    _zz_91[30] = _zz_90;
    _zz_91[29] = _zz_90;
    _zz_91[28] = _zz_90;
    _zz_91[27] = _zz_90;
    _zz_91[26] = _zz_90;
    _zz_91[25] = _zz_90;
    _zz_91[24] = _zz_90;
    _zz_91[23] = _zz_90;
    _zz_91[22] = _zz_90;
    _zz_91[21] = _zz_90;
    _zz_91[20] = _zz_90;
    _zz_91[19] = _zz_90;
    _zz_91[18] = _zz_90;
    _zz_91[17] = _zz_90;
    _zz_91[16] = _zz_90;
    _zz_91[15] = _zz_90;
    _zz_91[14] = _zz_90;
    _zz_91[13] = _zz_90;
    _zz_91[12] = _zz_90;
    _zz_91[11] = _zz_90;
    _zz_91[10] = _zz_90;
    _zz_91[9] = _zz_90;
    _zz_91[8] = _zz_90;
    _zz_91[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_92 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_93[31] = _zz_92;
    _zz_93[30] = _zz_92;
    _zz_93[29] = _zz_92;
    _zz_93[28] = _zz_92;
    _zz_93[27] = _zz_92;
    _zz_93[26] = _zz_92;
    _zz_93[25] = _zz_92;
    _zz_93[24] = _zz_92;
    _zz_93[23] = _zz_92;
    _zz_93[22] = _zz_92;
    _zz_93[21] = _zz_92;
    _zz_93[20] = _zz_92;
    _zz_93[19] = _zz_92;
    _zz_93[18] = _zz_92;
    _zz_93[17] = _zz_92;
    _zz_93[16] = _zz_92;
    _zz_93[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_213)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_91;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_93;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_95 = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_96 = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_97 = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_98 = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_94 = {({(_zz_281 == _zz_282),(_zz_283 == _zz_284)} != (2'b00)),{((_zz_285 == _zz_286) != (1'b0)),{({_zz_287,_zz_288} != (5'b00000)),{(_zz_289 != _zz_290),{_zz_291,{_zz_292,_zz_293}}}}}};
  assign _zz_68 = _zz_220[0];
  assign _zz_99 = _zz_94[2 : 1];
  assign _zz_67 = _zz_99;
  assign _zz_66 = _zz_221[0];
  assign _zz_100 = _zz_94[5 : 4];
  assign _zz_65 = _zz_100;
  assign _zz_101 = _zz_94[7 : 6];
  assign _zz_64 = _zz_101;
  assign _zz_63 = _zz_222[0];
  assign _zz_62 = _zz_223[0];
  assign _zz_61 = _zz_224[0];
  assign _zz_60 = _zz_225[0];
  assign _zz_59 = _zz_226[0];
  assign _zz_58 = _zz_227[0];
  assign _zz_102 = _zz_94[15 : 14];
  assign _zz_57 = _zz_102;
  assign _zz_56 = _zz_228[0];
  assign _zz_55 = _zz_229[0];
  assign _zz_103 = _zz_94[19 : 18];
  assign _zz_54 = _zz_103;
  assign _zz_53 = _zz_230[0];
  assign _zz_52 = _zz_231[0];
  assign _zz_104 = _zz_94[23 : 22];
  assign _zz_51 = _zz_104;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign _zz_105 = 1'b1;
  assign decode_RegFilePlugin_rs1Data = _zz_204;
  assign _zz_106 = 1'b1;
  assign decode_RegFilePlugin_rs2Data = _zz_205;
  assign _zz_50 = decode_RegFilePlugin_rs1Data;
  assign _zz_49 = decode_RegFilePlugin_rs2Data;
  always @ (*) begin
    writeBack_RegFilePlugin_regFileWrite_valid = (_zz_47 && writeBack_arbitration_isFiring);
    if(_zz_107)begin
      writeBack_RegFilePlugin_regFileWrite_valid = 1'b1;
    end
  end

  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _zz_46[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_69;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequancial_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequancial_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequancial_XOR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = execute_SRC1;
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequancial_BITWISE : begin
        _zz_108 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_binary_sequancial_SLT_SLTU : begin
        _zz_108 = {31'd0, _zz_232};
      end
      default : begin
        _zz_108 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_44 = _zz_108;
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequancial_RS : begin
        _zz_109 = execute_RS1;
      end
      `Src1CtrlEnum_binary_sequancial_FOUR : begin
        _zz_109 = (32'b00000000000000000000000000000100);
      end
      default : begin
        _zz_109 = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
    endcase
  end

  assign _zz_42 = _zz_109;
  assign _zz_110 = _zz_233[11];
  always @ (*) begin
    _zz_111[19] = _zz_110;
    _zz_111[18] = _zz_110;
    _zz_111[17] = _zz_110;
    _zz_111[16] = _zz_110;
    _zz_111[15] = _zz_110;
    _zz_111[14] = _zz_110;
    _zz_111[13] = _zz_110;
    _zz_111[12] = _zz_110;
    _zz_111[11] = _zz_110;
    _zz_111[10] = _zz_110;
    _zz_111[9] = _zz_110;
    _zz_111[8] = _zz_110;
    _zz_111[7] = _zz_110;
    _zz_111[6] = _zz_110;
    _zz_111[5] = _zz_110;
    _zz_111[4] = _zz_110;
    _zz_111[3] = _zz_110;
    _zz_111[2] = _zz_110;
    _zz_111[1] = _zz_110;
    _zz_111[0] = _zz_110;
  end

  assign _zz_112 = _zz_234[11];
  always @ (*) begin
    _zz_113[19] = _zz_112;
    _zz_113[18] = _zz_112;
    _zz_113[17] = _zz_112;
    _zz_113[16] = _zz_112;
    _zz_113[15] = _zz_112;
    _zz_113[14] = _zz_112;
    _zz_113[13] = _zz_112;
    _zz_113[12] = _zz_112;
    _zz_113[11] = _zz_112;
    _zz_113[10] = _zz_112;
    _zz_113[9] = _zz_112;
    _zz_113[8] = _zz_112;
    _zz_113[7] = _zz_112;
    _zz_113[6] = _zz_112;
    _zz_113[5] = _zz_112;
    _zz_113[4] = _zz_112;
    _zz_113[3] = _zz_112;
    _zz_113[2] = _zz_112;
    _zz_113[1] = _zz_112;
    _zz_113[0] = _zz_112;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequancial_RS : begin
        _zz_114 = execute_RS2;
      end
      `Src2CtrlEnum_binary_sequancial_IMI : begin
        _zz_114 = {_zz_111,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_binary_sequancial_IMS : begin
        _zz_114 = {_zz_113,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_114 = _zz_38;
      end
    endcase
  end

  assign _zz_40 = _zz_114;
  assign execute_SrcPlugin_addSub = _zz_235;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_37 = execute_SrcPlugin_addSub;
  assign _zz_36 = execute_SrcPlugin_addSub;
  assign _zz_35 = execute_SrcPlugin_less;
  assign execute_FullBarrielShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_115[0] = execute_SRC1[31];
    _zz_115[1] = execute_SRC1[30];
    _zz_115[2] = execute_SRC1[29];
    _zz_115[3] = execute_SRC1[28];
    _zz_115[4] = execute_SRC1[27];
    _zz_115[5] = execute_SRC1[26];
    _zz_115[6] = execute_SRC1[25];
    _zz_115[7] = execute_SRC1[24];
    _zz_115[8] = execute_SRC1[23];
    _zz_115[9] = execute_SRC1[22];
    _zz_115[10] = execute_SRC1[21];
    _zz_115[11] = execute_SRC1[20];
    _zz_115[12] = execute_SRC1[19];
    _zz_115[13] = execute_SRC1[18];
    _zz_115[14] = execute_SRC1[17];
    _zz_115[15] = execute_SRC1[16];
    _zz_115[16] = execute_SRC1[15];
    _zz_115[17] = execute_SRC1[14];
    _zz_115[18] = execute_SRC1[13];
    _zz_115[19] = execute_SRC1[12];
    _zz_115[20] = execute_SRC1[11];
    _zz_115[21] = execute_SRC1[10];
    _zz_115[22] = execute_SRC1[9];
    _zz_115[23] = execute_SRC1[8];
    _zz_115[24] = execute_SRC1[7];
    _zz_115[25] = execute_SRC1[6];
    _zz_115[26] = execute_SRC1[5];
    _zz_115[27] = execute_SRC1[4];
    _zz_115[28] = execute_SRC1[3];
    _zz_115[29] = execute_SRC1[2];
    _zz_115[30] = execute_SRC1[1];
    _zz_115[31] = execute_SRC1[0];
  end

  assign execute_FullBarrielShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_binary_sequancial_SLL_1) ? _zz_115 : execute_SRC1);
  assign _zz_33 = _zz_244;
  always @ (*) begin
    _zz_116[0] = memory_SHIFT_RIGHT[31];
    _zz_116[1] = memory_SHIFT_RIGHT[30];
    _zz_116[2] = memory_SHIFT_RIGHT[29];
    _zz_116[3] = memory_SHIFT_RIGHT[28];
    _zz_116[4] = memory_SHIFT_RIGHT[27];
    _zz_116[5] = memory_SHIFT_RIGHT[26];
    _zz_116[6] = memory_SHIFT_RIGHT[25];
    _zz_116[7] = memory_SHIFT_RIGHT[24];
    _zz_116[8] = memory_SHIFT_RIGHT[23];
    _zz_116[9] = memory_SHIFT_RIGHT[22];
    _zz_116[10] = memory_SHIFT_RIGHT[21];
    _zz_116[11] = memory_SHIFT_RIGHT[20];
    _zz_116[12] = memory_SHIFT_RIGHT[19];
    _zz_116[13] = memory_SHIFT_RIGHT[18];
    _zz_116[14] = memory_SHIFT_RIGHT[17];
    _zz_116[15] = memory_SHIFT_RIGHT[16];
    _zz_116[16] = memory_SHIFT_RIGHT[15];
    _zz_116[17] = memory_SHIFT_RIGHT[14];
    _zz_116[18] = memory_SHIFT_RIGHT[13];
    _zz_116[19] = memory_SHIFT_RIGHT[12];
    _zz_116[20] = memory_SHIFT_RIGHT[11];
    _zz_116[21] = memory_SHIFT_RIGHT[10];
    _zz_116[22] = memory_SHIFT_RIGHT[9];
    _zz_116[23] = memory_SHIFT_RIGHT[8];
    _zz_116[24] = memory_SHIFT_RIGHT[7];
    _zz_116[25] = memory_SHIFT_RIGHT[6];
    _zz_116[26] = memory_SHIFT_RIGHT[5];
    _zz_116[27] = memory_SHIFT_RIGHT[4];
    _zz_116[28] = memory_SHIFT_RIGHT[3];
    _zz_116[29] = memory_SHIFT_RIGHT[2];
    _zz_116[30] = memory_SHIFT_RIGHT[1];
    _zz_116[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_117 = 1'b0;
    _zz_118 = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! _zz_122)))begin
        if(_zz_123)begin
          _zz_117 = 1'b1;
        end
        if(_zz_124)begin
          _zz_118 = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if(_zz_125)begin
          _zz_117 = 1'b1;
        end
        if(_zz_126)begin
          _zz_118 = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE)))begin
        if(_zz_127)begin
          _zz_117 = 1'b1;
        end
        if(_zz_128)begin
          _zz_118 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_117 = 1'b0;
    end
    if((! decode_RS2_USE))begin
      _zz_118 = 1'b0;
    end
  end

  assign _zz_122 = 1'b1;
  assign _zz_123 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_124 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_125 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_126 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_127 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_128 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_MulPlugin_a = execute_SRC1;
  assign execute_MulPlugin_b = execute_SRC2;
  always @ (*) begin
    case(_zz_214)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign _zz_29 = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_28 = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign _zz_27 = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_26 = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign _zz_25 = ($signed(_zz_246) + $signed(_zz_254));
  assign writeBack_MulPlugin_result = ($signed(_zz_255) + $signed(_zz_256));
  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_212)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_done = (memory_DivPlugin_div_counter_value == (6'b100001));
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_done && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_260);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_129 = memory_DivPlugin_rs1[31 : 0];
  assign _zz_130 = {memory_DivPlugin_accumulator[31 : 0],_zz_129[31]};
  assign _zz_131 = (_zz_130 - _zz_261);
  assign _zz_132 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_133 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_134 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_135[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_135[31 : 0] = execute_RS1;
  end

  assign _zz_136 = _zz_274[11];
  always @ (*) begin
    _zz_137[18] = _zz_136;
    _zz_137[17] = _zz_136;
    _zz_137[16] = _zz_136;
    _zz_137[15] = _zz_136;
    _zz_137[14] = _zz_136;
    _zz_137[13] = _zz_136;
    _zz_137[12] = _zz_136;
    _zz_137[11] = _zz_136;
    _zz_137[10] = _zz_136;
    _zz_137[9] = _zz_136;
    _zz_137[8] = _zz_136;
    _zz_137[7] = _zz_136;
    _zz_137[6] = _zz_136;
    _zz_137[5] = _zz_136;
    _zz_137[4] = _zz_136;
    _zz_137[3] = _zz_136;
    _zz_137[2] = _zz_136;
    _zz_137[1] = _zz_136;
    _zz_137[0] = _zz_136;
  end

  assign decode_BranchPlugin_conditionalBranchPrediction = _zz_275[31];
  assign _zz_24 = ((decode_BRANCH_CTRL == `BranchCtrlEnum_binary_sequancial_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_binary_sequancial_B) && decode_BranchPlugin_conditionalBranchPrediction));
  assign _zz_82 = (decode_PREDICTION_HAD_BRANCHED2 && decode_arbitration_isFiring);
  assign _zz_138 = _zz_276[19];
  always @ (*) begin
    _zz_139[10] = _zz_138;
    _zz_139[9] = _zz_138;
    _zz_139[8] = _zz_138;
    _zz_139[7] = _zz_138;
    _zz_139[6] = _zz_138;
    _zz_139[5] = _zz_138;
    _zz_139[4] = _zz_138;
    _zz_139[3] = _zz_138;
    _zz_139[2] = _zz_138;
    _zz_139[1] = _zz_138;
    _zz_139[0] = _zz_138;
  end

  assign _zz_140 = _zz_277[11];
  always @ (*) begin
    _zz_141[18] = _zz_140;
    _zz_141[17] = _zz_140;
    _zz_141[16] = _zz_140;
    _zz_141[15] = _zz_140;
    _zz_141[14] = _zz_140;
    _zz_141[13] = _zz_140;
    _zz_141[12] = _zz_140;
    _zz_141[11] = _zz_140;
    _zz_141[10] = _zz_140;
    _zz_141[9] = _zz_140;
    _zz_141[8] = _zz_140;
    _zz_141[7] = _zz_140;
    _zz_141[6] = _zz_140;
    _zz_141[5] = _zz_140;
    _zz_141[4] = _zz_140;
    _zz_141[3] = _zz_140;
    _zz_141[2] = _zz_140;
    _zz_141[1] = _zz_140;
    _zz_141[0] = _zz_140;
  end

  assign _zz_83 = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_binary_sequancial_JAL) ? {{_zz_139,{{{_zz_371,_zz_372},_zz_373},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_141,{{{_zz_374,_zz_375},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_142 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_142 == (3'b000))) begin
        _zz_143 = execute_BranchPlugin_eq;
    end else if((_zz_142 == (3'b001))) begin
        _zz_143 = (! execute_BranchPlugin_eq);
    end else if((((_zz_142 & (3'b101)) == (3'b101)))) begin
        _zz_143 = (! execute_SRC_LESS);
    end else begin
        _zz_143 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequancial_INC : begin
        _zz_144 = 1'b0;
      end
      `BranchCtrlEnum_binary_sequancial_JAL : begin
        _zz_144 = 1'b1;
      end
      `BranchCtrlEnum_binary_sequancial_JALR : begin
        _zz_144 = 1'b1;
      end
      default : begin
        _zz_144 = _zz_143;
      end
    endcase
  end

  assign _zz_21 = (execute_PREDICTION_HAD_BRANCHED2 != _zz_144);
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequancial_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
        execute_BranchPlugin_branch_src2 = {_zz_146,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
        execute_BranchPlugin_branch_src2 = (execute_PREDICTION_HAD_BRANCHED2 ? (32'b00000000000000000000000000000100) : {{_zz_148,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
      end
    endcase
  end

  assign _zz_145 = _zz_278[11];
  always @ (*) begin
    _zz_146[19] = _zz_145;
    _zz_146[18] = _zz_145;
    _zz_146[17] = _zz_145;
    _zz_146[16] = _zz_145;
    _zz_146[15] = _zz_145;
    _zz_146[14] = _zz_145;
    _zz_146[13] = _zz_145;
    _zz_146[12] = _zz_145;
    _zz_146[11] = _zz_145;
    _zz_146[10] = _zz_145;
    _zz_146[9] = _zz_145;
    _zz_146[8] = _zz_145;
    _zz_146[7] = _zz_145;
    _zz_146[6] = _zz_145;
    _zz_146[5] = _zz_145;
    _zz_146[4] = _zz_145;
    _zz_146[3] = _zz_145;
    _zz_146[2] = _zz_145;
    _zz_146[1] = _zz_145;
    _zz_146[0] = _zz_145;
  end

  assign _zz_147 = _zz_279[11];
  always @ (*) begin
    _zz_148[18] = _zz_147;
    _zz_148[17] = _zz_147;
    _zz_148[16] = _zz_147;
    _zz_148[15] = _zz_147;
    _zz_148[14] = _zz_147;
    _zz_148[13] = _zz_147;
    _zz_148[12] = _zz_147;
    _zz_148[11] = _zz_147;
    _zz_148[10] = _zz_147;
    _zz_148[9] = _zz_147;
    _zz_148[8] = _zz_147;
    _zz_148[7] = _zz_147;
    _zz_148[6] = _zz_147;
    _zz_148[5] = _zz_147;
    _zz_148[4] = _zz_147;
    _zz_148[3] = _zz_147;
    _zz_148[2] = _zz_147;
    _zz_148[1] = _zz_147;
    _zz_148[0] = _zz_147;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_20 = {execute_BranchPlugin_branchAdder[31 : 1],((execute_BRANCH_CTRL == `BranchCtrlEnum_binary_sequancial_JALR) ? 1'b0 : execute_BranchPlugin_branchAdder[0])};
  assign _zz_81 = (memory_BRANCH_DO && memory_arbitration_isFiring);
  assign _zz_19 = decode_SRC2_CTRL;
  assign _zz_17 = _zz_57;
  assign _zz_39 = _zz_154;
  assign _zz_16 = decode_ALU_BITWISE_CTRL;
  assign _zz_14 = _zz_64;
  assign _zz_45 = _zz_155;
  assign _zz_13 = decode_SHIFT_CTRL;
  assign _zz_10 = execute_SHIFT_CTRL;
  assign _zz_11 = _zz_67;
  assign _zz_34 = _zz_156;
  assign _zz_32 = _zz_157;
  assign _zz_8 = decode_BRANCH_CTRL;
  assign _zz_23 = _zz_54;
  assign _zz_22 = _zz_168;
  assign _zz_6 = decode_SRC1_CTRL;
  assign _zz_4 = _zz_65;
  assign _zz_41 = _zz_189;
  assign _zz_3 = decode_ALU_CTRL;
  assign _zz_1 = _zz_51;
  assign _zz_43 = _zz_193;
  assign prefetch_arbitration_isFlushed = (((((prefetch_arbitration_flushAll || fetch_arbitration_flushAll) || decode_arbitration_flushAll) || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign fetch_arbitration_isFlushed = ((((fetch_arbitration_flushAll || decode_arbitration_flushAll) || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign decode_arbitration_isFlushed = (((decode_arbitration_flushAll || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign execute_arbitration_isFlushed = ((execute_arbitration_flushAll || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign memory_arbitration_isFlushed = (memory_arbitration_flushAll || writeBack_arbitration_flushAll);
  assign writeBack_arbitration_isFlushed = writeBack_arbitration_flushAll;
  assign prefetch_arbitration_isStuckByOthers = (prefetch_arbitration_haltByOther || (((((1'b0 || fetch_arbitration_haltItself) || decode_arbitration_haltItself) || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign prefetch_arbitration_isStuck = (prefetch_arbitration_haltItself || prefetch_arbitration_isStuckByOthers);
  assign prefetch_arbitration_isMoving = ((! prefetch_arbitration_isStuck) && (! prefetch_arbitration_removeIt));
  assign prefetch_arbitration_isFiring = ((prefetch_arbitration_isValid && (! prefetch_arbitration_isStuck)) && (! prefetch_arbitration_removeIt));
  assign fetch_arbitration_isStuckByOthers = (fetch_arbitration_haltByOther || ((((1'b0 || decode_arbitration_haltItself) || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign fetch_arbitration_isStuck = (fetch_arbitration_haltItself || fetch_arbitration_isStuckByOthers);
  assign fetch_arbitration_isMoving = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt));
  assign fetch_arbitration_isFiring = ((fetch_arbitration_isValid && (! fetch_arbitration_isStuck)) && (! fetch_arbitration_removeIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_haltItself));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      prefetch_arbitration_isValid <= 1'b0;
      fetch_arbitration_isValid <= 1'b0;
      decode_arbitration_isValid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      prefetch_PcManagerSimplePlugin_pcReg <= (32'b00000000000000000000000000000000);
      prefetch_PcManagerSimplePlugin_inc <= 1'b0;
      prefetch_IBusSimplePlugin_pendingCmd <= 1'b0;
      _zz_86 <= 1'b0;
      _zz_107 <= 1'b1;
      _zz_119 <= 1'b0;
      memory_DivPlugin_div_counter_value <= (6'b000000);
      _zz_197 <= (32'b00000000000000000000000000000000);
      _zz_188 <= (32'b00000000000000000000000000000000);
    end else begin
      prefetch_arbitration_isValid <= 1'b1;
      if(prefetch_PcManagerSimplePlugin_jump_pcLoad_valid)begin
        prefetch_PcManagerSimplePlugin_inc <= 1'b0;
      end
      if(prefetch_arbitration_isFiring)begin
        prefetch_PcManagerSimplePlugin_inc <= 1'b1;
      end
      if(prefetch_PcManagerSimplePlugin_samplePcNext)begin
        prefetch_PcManagerSimplePlugin_pcReg <= prefetch_PcManagerSimplePlugin_pc;
      end
      if(iBus_rsp_ready)begin
        prefetch_IBusSimplePlugin_pendingCmd <= 1'b0;
      end
      if((_zz_206 && iBus_cmd_ready))begin
        prefetch_IBusSimplePlugin_pendingCmd <= 1'b1;
      end
      if(iBus_rsp_ready)begin
        _zz_86 <= 1'b1;
      end
      if((! fetch_arbitration_isStuck))begin
        _zz_86 <= 1'b0;
      end
      _zz_107 <= 1'b0;
      _zz_119 <= (_zz_47 && writeBack_arbitration_isFiring);
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      if((! writeBack_arbitration_isStuck))begin
        _zz_188 <= memory_INSTRUCTION;
      end
      if((! writeBack_arbitration_isStuck))begin
        _zz_197 <= _zz_31;
      end
      if(((! fetch_arbitration_isStuck) || fetch_arbitration_removeIt))begin
        fetch_arbitration_isValid <= 1'b0;
      end
      if(((! prefetch_arbitration_isStuck) && (! prefetch_arbitration_removeIt)))begin
        fetch_arbitration_isValid <= prefetch_arbitration_isValid;
      end
      if(((! decode_arbitration_isStuck) || decode_arbitration_removeIt))begin
        decode_arbitration_isValid <= 1'b0;
      end
      if(((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt)))begin
        decode_arbitration_isValid <= fetch_arbitration_isValid;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
    end
  end

  always @ (posedge clk) begin
    if((! _zz_86))begin
      _zz_87 <= iBus_rsp_inst;
    end
    if (!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if (!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_INSTRUCTION[5])) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    _zz_120 <= _zz_46[11 : 7];
    _zz_121 <= _zz_69;
    if(_zz_210)begin
      if(_zz_211)begin
        memory_DivPlugin_rs1[31 : 0] <= _zz_262[31:0];
        memory_DivPlugin_accumulator[31 : 0] <= ((! _zz_131[32]) ? _zz_263 : _zz_264);
        if((memory_DivPlugin_div_counter_value == (6'b100000)))begin
          memory_DivPlugin_div_result <= _zz_265[31:0];
        end
      end
    end
    if(_zz_212)begin
      memory_DivPlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_DivPlugin_rs1 <= ((_zz_134 ? (~ _zz_135) : _zz_135) + _zz_271);
      memory_DivPlugin_rs2 <= ((_zz_133 ? (~ execute_RS2) : execute_RS2) + _zz_273);
      memory_DivPlugin_div_needRevert <= (_zz_134 ^ (_zz_133 && (! execute_INSTRUCTION[13])));
    end
    if((! execute_arbitration_isStuck))begin
      _zz_149 <= decode_IS_RS1_SIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_150 <= execute_BRANCH_CALC;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_151 <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_152 <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_153 <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_154 <= _zz_18;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_155 <= _zz_15;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_156 <= _zz_12;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_157 <= _zz_9;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_158 <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_159 <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_160 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! fetch_arbitration_isStuck))begin
      _zz_161 <= _zz_76;
    end
    if((! decode_arbitration_isStuck))begin
      _zz_162 <= fetch_PC;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_163 <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_164 <= _zz_38;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_165 <= memory_PC;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_166 <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_167 <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_168 <= _zz_7;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_169 <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_170 <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_171 <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_172 <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_173 <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_174 <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_175 <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_176 <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_177 <= decode_RS1;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_178 <= execute_MUL_LL;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_179 <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_180 <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_181 <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_182 <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_183 <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_184 <= memory_REGFILE_WRITE_VALID;
    end
    if((! decode_arbitration_isStuck))begin
      _zz_185 <= _zz_73;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_186 <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_187 <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_189 <= _zz_5;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_190 <= execute_BRANCH_DO;
    end
    if((! writeBack_arbitration_isStuck))begin
      _zz_191 <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_192 <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_193 <= _zz_2;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_194 <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_195 <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_196 <= _zz_30;
    end
    if((! fetch_arbitration_isStuck))begin
      _zz_198 <= prefetch_FORMAL_PC_NEXT;
    end
    if((! decode_arbitration_isStuck))begin
      _zz_199 <= fetch_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_200 <= _zz_77;
    end
    if((! memory_arbitration_isStuck))begin
      _zz_201 <= execute_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_202 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      _zz_203 <= decode_SRC_LESS_UNSIGNED;
    end
    if (!(prefetch_arbitration_removeIt == 1'b0)) begin
      $display("ERROR removeIt should never be asserted on this stage");
    end
  end

endmodule

