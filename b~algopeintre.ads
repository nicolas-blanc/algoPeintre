pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 4.8" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_algopeintre" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#a3c9d8c5#;
   pragma Export (C, u00001, "algopeintreB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#b31646c6#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#30d8d53e#;
   pragma Export (C, u00005, "ada__text_ioB");
   u00006 : constant Version_32 := 16#f792461d#;
   pragma Export (C, u00006, "ada__text_ioS");
   u00007 : constant Version_32 := 16#0381b3eb#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#813e0b0c#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#1f42fb5e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#bd760655#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#d02d7c88#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#0b940a95#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#a91821fb#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#47bb7bcd#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#1ed4ba79#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#2c18daf0#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#5665ab64#;
   pragma Export (C, u00024, "system__htableB");
   u00025 : constant Version_32 := 16#3ede485b#;
   pragma Export (C, u00025, "system__htableS");
   u00026 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00026, "system__string_hashB");
   u00027 : constant Version_32 := 16#9beadec1#;
   pragma Export (C, u00027, "system__string_hashS");
   u00028 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#b188cee2#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#85062381#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#bfade697#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#dcf1d220#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00036, "system__wch_conB");
   u00037 : constant Version_32 := 16#029d2868#;
   pragma Export (C, u00037, "system__wch_conS");
   u00038 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00038, "system__wch_stwB");
   u00039 : constant Version_32 := 16#2f8c0469#;
   pragma Export (C, u00039, "system__wch_stwS");
   u00040 : constant Version_32 := 16#b8a9e30d#;
   pragma Export (C, u00040, "system__wch_cnvB");
   u00041 : constant Version_32 := 16#1c63aebe#;
   pragma Export (C, u00041, "system__wch_cnvS");
   u00042 : constant Version_32 := 16#129923ea#;
   pragma Export (C, u00042, "interfacesS");
   u00043 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00043, "system__wch_jisB");
   u00044 : constant Version_32 := 16#481135aa#;
   pragma Export (C, u00044, "system__wch_jisS");
   u00045 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00045, "system__traceback_entriesB");
   u00046 : constant Version_32 := 16#ef57e814#;
   pragma Export (C, u00046, "system__traceback_entriesS");
   u00047 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00047, "ada__streamsS");
   u00048 : constant Version_32 := 16#afd62b40#;
   pragma Export (C, u00048, "ada__tagsB");
   u00049 : constant Version_32 := 16#1442fc05#;
   pragma Export (C, u00049, "ada__tagsS");
   u00050 : constant Version_32 := 16#d7975a23#;
   pragma Export (C, u00050, "system__unsigned_typesS");
   u00051 : constant Version_32 := 16#79817c71#;
   pragma Export (C, u00051, "system__val_unsB");
   u00052 : constant Version_32 := 16#c73fb718#;
   pragma Export (C, u00052, "system__val_unsS");
   u00053 : constant Version_32 := 16#aea309ed#;
   pragma Export (C, u00053, "system__val_utilB");
   u00054 : constant Version_32 := 16#11d6b0ab#;
   pragma Export (C, u00054, "system__val_utilS");
   u00055 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00055, "system__case_utilB");
   u00056 : constant Version_32 := 16#106a66dd#;
   pragma Export (C, u00056, "system__case_utilS");
   u00057 : constant Version_32 := 16#53190229#;
   pragma Export (C, u00057, "interfaces__c_streamsB");
   u00058 : constant Version_32 := 16#3ebb5e8e#;
   pragma Export (C, u00058, "interfaces__c_streamsS");
   u00059 : constant Version_32 := 16#1530815b#;
   pragma Export (C, u00059, "system__crtlS");
   u00060 : constant Version_32 := 16#35bbd729#;
   pragma Export (C, u00060, "system__file_ioB");
   u00061 : constant Version_32 := 16#9f99c2b3#;
   pragma Export (C, u00061, "system__file_ioS");
   u00062 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00062, "ada__finalizationB");
   u00063 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00063, "ada__finalizationS");
   u00064 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00064, "system__finalization_rootB");
   u00065 : constant Version_32 := 16#f28475c5#;
   pragma Export (C, u00065, "system__finalization_rootS");
   u00066 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00066, "ada__io_exceptionsS");
   u00067 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00067, "interfaces__cB");
   u00068 : constant Version_32 := 16#f05a3eb1#;
   pragma Export (C, u00068, "interfaces__cS");
   u00069 : constant Version_32 := 16#b2cb9bcf#;
   pragma Export (C, u00069, "interfaces__c__stringsB");
   u00070 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00070, "interfaces__c__stringsS");
   u00071 : constant Version_32 := 16#17d70f63#;
   pragma Export (C, u00071, "system__crtl__runtimeS");
   u00072 : constant Version_32 := 16#d53b6c45#;
   pragma Export (C, u00072, "system__os_libB");
   u00073 : constant Version_32 := 16#89dce9aa#;
   pragma Export (C, u00073, "system__os_libS");
   u00074 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00074, "system__stringsB");
   u00075 : constant Version_32 := 16#0a9c4c91#;
   pragma Export (C, u00075, "system__stringsS");
   u00076 : constant Version_32 := 16#e8578845#;
   pragma Export (C, u00076, "system__file_control_blockS");
   u00077 : constant Version_32 := 16#91d2300e#;
   pragma Export (C, u00077, "system__finalization_mastersB");
   u00078 : constant Version_32 := 16#d783aa79#;
   pragma Export (C, u00078, "system__finalization_mastersS");
   u00079 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00079, "system__address_imageB");
   u00080 : constant Version_32 := 16#1c9a9b6f#;
   pragma Export (C, u00080, "system__address_imageS");
   u00081 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00081, "system__img_boolB");
   u00082 : constant Version_32 := 16#48af77be#;
   pragma Export (C, u00082, "system__img_boolS");
   u00083 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00083, "system__ioB");
   u00084 : constant Version_32 := 16#2334f11a#;
   pragma Export (C, u00084, "system__ioS");
   u00085 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00085, "system__storage_poolsB");
   u00086 : constant Version_32 := 16#6ed81938#;
   pragma Export (C, u00086, "system__storage_poolsS");
   u00087 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00087, "system__pool_globalB");
   u00088 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00088, "system__pool_globalS");
   u00089 : constant Version_32 := 16#3d0b17cc#;
   pragma Export (C, u00089, "system__memoryB");
   u00090 : constant Version_32 := 16#77fdba40#;
   pragma Export (C, u00090, "system__memoryS");
   u00091 : constant Version_32 := 16#1fd820b1#;
   pragma Export (C, u00091, "system__storage_pools__subpoolsB");
   u00092 : constant Version_32 := 16#951e0de9#;
   pragma Export (C, u00092, "system__storage_pools__subpoolsS");
   u00093 : constant Version_32 := 16#1777d351#;
   pragma Export (C, u00093, "system__storage_pools__subpools__finalizationB");
   u00094 : constant Version_32 := 16#12aaf1de#;
   pragma Export (C, u00094, "system__storage_pools__subpools__finalizationS");
   u00095 : constant Version_32 := 16#d40e90c8#;
   pragma Export (C, u00095, "lectureoffB");
   u00096 : constant Version_32 := 16#d7b406cd#;
   pragma Export (C, u00096, "lectureoffS");
   u00097 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00097, "ada__float_text_ioB");
   u00098 : constant Version_32 := 16#e61b3c6c#;
   pragma Export (C, u00098, "ada__float_text_ioS");
   u00099 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00099, "ada__text_io__float_auxB");
   u00100 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00100, "ada__text_io__float_auxS");
   u00101 : constant Version_32 := 16#7ec503e8#;
   pragma Export (C, u00101, "ada__text_io__generic_auxB");
   u00102 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00102, "ada__text_io__generic_auxS");
   u00103 : constant Version_32 := 16#6d0081c3#;
   pragma Export (C, u00103, "system__img_realB");
   u00104 : constant Version_32 := 16#7ade57b7#;
   pragma Export (C, u00104, "system__img_realS");
   u00105 : constant Version_32 := 16#624dd865#;
   pragma Export (C, u00105, "system__fat_llfS");
   u00106 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00106, "system__float_controlB");
   u00107 : constant Version_32 := 16#5d8a4569#;
   pragma Export (C, u00107, "system__float_controlS");
   u00108 : constant Version_32 := 16#06417083#;
   pragma Export (C, u00108, "system__img_lluB");
   u00109 : constant Version_32 := 16#9e5e5ae0#;
   pragma Export (C, u00109, "system__img_lluS");
   u00110 : constant Version_32 := 16#194ccd7b#;
   pragma Export (C, u00110, "system__img_unsB");
   u00111 : constant Version_32 := 16#486366d4#;
   pragma Export (C, u00111, "system__img_unsS");
   u00112 : constant Version_32 := 16#ed066022#;
   pragma Export (C, u00112, "system__powten_tableS");
   u00113 : constant Version_32 := 16#8ff77155#;
   pragma Export (C, u00113, "system__val_realB");
   u00114 : constant Version_32 := 16#435f7144#;
   pragma Export (C, u00114, "system__val_realS");
   u00115 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00115, "system__exn_llfB");
   u00116 : constant Version_32 := 16#3cf218ba#;
   pragma Export (C, u00116, "system__exn_llfS");
   u00117 : constant Version_32 := 16#3eaf7f82#;
   pragma Export (C, u00117, "system__fat_fltS");
   u00118 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00118, "ada__integer_text_ioB");
   u00119 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00119, "ada__integer_text_ioS");
   u00120 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00120, "ada__text_io__integer_auxB");
   u00121 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00121, "ada__text_io__integer_auxS");
   u00122 : constant Version_32 := 16#ef6c8032#;
   pragma Export (C, u00122, "system__img_biuB");
   u00123 : constant Version_32 := 16#11b5d26e#;
   pragma Export (C, u00123, "system__img_biuS");
   u00124 : constant Version_32 := 16#10618bf9#;
   pragma Export (C, u00124, "system__img_llbB");
   u00125 : constant Version_32 := 16#5072c290#;
   pragma Export (C, u00125, "system__img_llbS");
   u00126 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00126, "system__img_lliB");
   u00127 : constant Version_32 := 16#ac395384#;
   pragma Export (C, u00127, "system__img_lliS");
   u00128 : constant Version_32 := 16#f931f062#;
   pragma Export (C, u00128, "system__img_llwB");
   u00129 : constant Version_32 := 16#f91ee106#;
   pragma Export (C, u00129, "system__img_llwS");
   u00130 : constant Version_32 := 16#b532ff4e#;
   pragma Export (C, u00130, "system__img_wiuB");
   u00131 : constant Version_32 := 16#7ff455fc#;
   pragma Export (C, u00131, "system__img_wiuS");
   u00132 : constant Version_32 := 16#c31442ce#;
   pragma Export (C, u00132, "system__val_intB");
   u00133 : constant Version_32 := 16#f5d32c6a#;
   pragma Export (C, u00133, "system__val_intS");
   u00134 : constant Version_32 := 16#d3757657#;
   pragma Export (C, u00134, "system__val_lliB");
   u00135 : constant Version_32 := 16#2752e0f5#;
   pragma Export (C, u00135, "system__val_lliS");
   u00136 : constant Version_32 := 16#25c21d28#;
   pragma Export (C, u00136, "system__val_lluB");
   u00137 : constant Version_32 := 16#ad650d51#;
   pragma Export (C, u00137, "system__val_lluS");
   u00138 : constant Version_32 := 16#2d083cdb#;
   pragma Export (C, u00138, "tri_paquetsB");
   u00139 : constant Version_32 := 16#c7cec2c3#;
   pragma Export (C, u00139, "tri_paquetsS");
   u00140 : constant Version_32 := 16#235d7985#;
   pragma Export (C, u00140, "type_projetS");
   u00141 : constant Version_32 := 16#bd7d8d74#;
   pragma Export (C, u00141, "trad_post_scriptB");
   u00142 : constant Version_32 := 16#a0dbdb64#;
   pragma Export (C, u00142, "trad_post_scriptS");
   u00143 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00143, "system__concat_2B");
   u00144 : constant Version_32 := 16#46a6f4a9#;
   pragma Export (C, u00144, "system__concat_2S");
   u00145 : constant Version_32 := 16#3493e6c0#;
   pragma Export (C, u00145, "system__concat_4B");
   u00146 : constant Version_32 := 16#bf29e5eb#;
   pragma Export (C, u00146, "system__concat_4S");
   u00147 : constant Version_32 := 16#ae97ef6c#;
   pragma Export (C, u00147, "system__concat_3B");
   u00148 : constant Version_32 := 16#cb5c043f#;
   pragma Export (C, u00148, "system__concat_3S");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_real%s
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.float_aux%s
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  type_projet%s
   --  trad_post_script%s
   --  tri_paquets%s
   --  tri_paquets%b
   --  trad_post_script%b
   --  lectureoff%s
   --  lectureoff%b
   --  algopeintre%b
   --  END ELABORATION ORDER


end ada_main;
