/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_364(char*, char *);
extern void execute_365(char*, char *);
extern void execute_366(char*, char *);
extern void execute_785(char*, char *);
extern void execute_786(char*, char *);
extern void execute_787(char*, char *);
extern void execute_788(char*, char *);
extern void execute_789(char*, char *);
extern void execute_790(char*, char *);
extern void execute_791(char*, char *);
extern void execute_792(char*, char *);
extern void execute_793(char*, char *);
extern void execute_794(char*, char *);
extern void execute_795(char*, char *);
extern void execute_796(char*, char *);
extern void execute_797(char*, char *);
extern void execute_798(char*, char *);
extern void execute_799(char*, char *);
extern void execute_800(char*, char *);
extern void execute_801(char*, char *);
extern void execute_802(char*, char *);
extern void execute_803(char*, char *);
extern void execute_804(char*, char *);
extern void execute_805(char*, char *);
extern void execute_66(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_86(char*, char *);
extern void execute_401(char*, char *);
extern void execute_402(char*, char *);
extern void execute_403(char*, char *);
extern void execute_404(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_766(char*, char *);
extern void execute_767(char*, char *);
extern void execute_768(char*, char *);
extern void execute_769(char*, char *);
extern void execute_770(char*, char *);
extern void execute_771(char*, char *);
extern void execute_772(char*, char *);
extern void execute_773(char*, char *);
extern void execute_774(char*, char *);
extern void execute_775(char*, char *);
extern void execute_776(char*, char *);
extern void execute_777(char*, char *);
extern void execute_778(char*, char *);
extern void execute_779(char*, char *);
extern void execute_780(char*, char *);
extern void execute_781(char*, char *);
extern void execute_782(char*, char *);
extern void execute_783(char*, char *);
extern void execute_784(char*, char *);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void execute_7(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_374(char*, char *);
extern void execute_375(char*, char *);
extern void execute_376(char*, char *);
extern void execute_377(char*, char *);
extern void execute_378(char*, char *);
extern void execute_379(char*, char *);
extern void execute_380(char*, char *);
extern void execute_381(char*, char *);
extern void execute_382(char*, char *);
extern void execute_10(char*, char *);
extern void execute_11(char*, char *);
extern void execute_12(char*, char *);
extern void execute_13(char*, char *);
extern void execute_383(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_405(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_71(char*, char *);
extern void execute_72(char*, char *);
extern void execute_73(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_77(char*, char *);
extern void execute_81(char*, char *);
extern void execute_419(char*, char *);
extern void execute_420(char*, char *);
extern void execute_421(char*, char *);
extern void execute_422(char*, char *);
extern void execute_79(char*, char *);
extern void execute_80(char*, char *);
extern void execute_409(char*, char *);
extern void execute_410(char*, char *);
extern void execute_411(char*, char *);
extern void execute_412(char*, char *);
extern void execute_413(char*, char *);
extern void execute_414(char*, char *);
extern void execute_415(char*, char *);
extern void execute_416(char*, char *);
extern void execute_417(char*, char *);
extern void execute_418(char*, char *);
extern void execute_83(char*, char *);
extern void execute_88(char*, char *);
extern void execute_89(char*, char *);
extern void execute_90(char*, char *);
extern void execute_423(char*, char *);
extern void execute_424(char*, char *);
extern void execute_425(char*, char *);
extern void execute_426(char*, char *);
extern void execute_427(char*, char *);
extern void execute_428(char*, char *);
extern void execute_92(char*, char *);
extern void execute_93(char*, char *);
extern void execute_94(char*, char *);
extern void execute_95(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_429(char*, char *);
extern void execute_430(char*, char *);
extern void execute_431(char*, char *);
extern void execute_432(char*, char *);
extern void execute_433(char*, char *);
extern void execute_434(char*, char *);
extern void execute_225(char*, char *);
extern void execute_226(char*, char *);
extern void execute_227(char*, char *);
extern void execute_435(char*, char *);
extern void execute_436(char*, char *);
extern void execute_437(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_108(char*, char *);
extern void execute_438(char*, char *);
extern void execute_439(char*, char *);
extern void execute_440(char*, char *);
extern void execute_353(char*, char *);
extern void execute_741(char*, char *);
extern void execute_742(char*, char *);
extern void execute_743(char*, char *);
extern void execute_744(char*, char *);
extern void execute_368(char*, char *);
extern void execute_369(char*, char *);
extern void execute_370(char*, char *);
extern void execute_806(char*, char *);
extern void execute_807(char*, char *);
extern void execute_808(char*, char *);
extern void execute_809(char*, char *);
extern void execute_810(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_282(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_286(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_290(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_294(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_298(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_302(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_306(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_310(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_314(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_318(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_322(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_326(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_330(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_334(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_338(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_342(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_346(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_350(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_354(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_358(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_362(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_366(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_370(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_374(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_378(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_382(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_386(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_390(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_394(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_398(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_474(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_478(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_482(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_486(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_490(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_494(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_498(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_502(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_506(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_510(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_514(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_518(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_522(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_526(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_530(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_534(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_538(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_542(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_546(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_550(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_554(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_558(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_562(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_566(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_570(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_574(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_578(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_582(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_586(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_590(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[216] = {(funcp)execute_364, (funcp)execute_365, (funcp)execute_366, (funcp)execute_785, (funcp)execute_786, (funcp)execute_787, (funcp)execute_788, (funcp)execute_789, (funcp)execute_790, (funcp)execute_791, (funcp)execute_792, (funcp)execute_793, (funcp)execute_794, (funcp)execute_795, (funcp)execute_796, (funcp)execute_797, (funcp)execute_798, (funcp)execute_799, (funcp)execute_800, (funcp)execute_801, (funcp)execute_802, (funcp)execute_803, (funcp)execute_804, (funcp)execute_805, (funcp)execute_66, (funcp)execute_84, (funcp)execute_85, (funcp)execute_86, (funcp)execute_401, (funcp)execute_402, (funcp)execute_403, (funcp)execute_404, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_766, (funcp)execute_767, (funcp)execute_768, (funcp)execute_769, (funcp)execute_770, (funcp)execute_771, (funcp)execute_772, (funcp)execute_773, (funcp)execute_774, (funcp)execute_775, (funcp)execute_776, (funcp)execute_777, (funcp)execute_778, (funcp)execute_779, (funcp)execute_780, (funcp)execute_781, (funcp)execute_782, (funcp)execute_783, (funcp)execute_784, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_54, (funcp)execute_55, (funcp)execute_374, (funcp)execute_375, (funcp)execute_376, (funcp)execute_377, (funcp)execute_378, (funcp)execute_379, (funcp)execute_380, (funcp)execute_381, (funcp)execute_382, (funcp)execute_10, (funcp)execute_11, (funcp)execute_12, (funcp)execute_13, (funcp)execute_383, (funcp)execute_57, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_405, (funcp)execute_68, (funcp)execute_69, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_75, (funcp)execute_76, (funcp)execute_77, (funcp)execute_81, (funcp)execute_419, (funcp)execute_420, (funcp)execute_421, (funcp)execute_422, (funcp)execute_79, (funcp)execute_80, (funcp)execute_409, (funcp)execute_410, (funcp)execute_411, (funcp)execute_412, (funcp)execute_413, (funcp)execute_414, (funcp)execute_415, (funcp)execute_416, (funcp)execute_417, (funcp)execute_418, (funcp)execute_83, (funcp)execute_88, (funcp)execute_89, (funcp)execute_90, (funcp)execute_423, (funcp)execute_424, (funcp)execute_425, (funcp)execute_426, (funcp)execute_427, (funcp)execute_428, (funcp)execute_92, (funcp)execute_93, (funcp)execute_94, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_429, (funcp)execute_430, (funcp)execute_431, (funcp)execute_432, (funcp)execute_433, (funcp)execute_434, (funcp)execute_225, (funcp)execute_226, (funcp)execute_227, (funcp)execute_435, (funcp)execute_436, (funcp)execute_437, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_438, (funcp)execute_439, (funcp)execute_440, (funcp)execute_353, (funcp)execute_741, (funcp)execute_742, (funcp)execute_743, (funcp)execute_744, (funcp)execute_368, (funcp)execute_369, (funcp)execute_370, (funcp)execute_806, (funcp)execute_807, (funcp)execute_808, (funcp)execute_809, (funcp)execute_810, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_282, (funcp)transaction_286, (funcp)transaction_290, (funcp)transaction_294, (funcp)transaction_298, (funcp)transaction_302, (funcp)transaction_306, (funcp)transaction_310, (funcp)transaction_314, (funcp)transaction_318, (funcp)transaction_322, (funcp)transaction_326, (funcp)transaction_330, (funcp)transaction_334, (funcp)transaction_338, (funcp)transaction_342, (funcp)transaction_346, (funcp)transaction_350, (funcp)transaction_354, (funcp)transaction_358, (funcp)transaction_362, (funcp)transaction_366, (funcp)transaction_370, (funcp)transaction_374, (funcp)transaction_378, (funcp)transaction_382, (funcp)transaction_386, (funcp)transaction_390, (funcp)transaction_394, (funcp)transaction_398, (funcp)transaction_474, (funcp)transaction_478, (funcp)transaction_482, (funcp)transaction_486, (funcp)transaction_490, (funcp)transaction_494, (funcp)transaction_498, (funcp)transaction_502, (funcp)transaction_506, (funcp)transaction_510, (funcp)transaction_514, (funcp)transaction_518, (funcp)transaction_522, (funcp)transaction_526, (funcp)transaction_530, (funcp)transaction_534, (funcp)transaction_538, (funcp)transaction_542, (funcp)transaction_546, (funcp)transaction_550, (funcp)transaction_554, (funcp)transaction_558, (funcp)transaction_562, (funcp)transaction_566, (funcp)transaction_570, (funcp)transaction_574, (funcp)transaction_578, (funcp)transaction_582, (funcp)transaction_586, (funcp)transaction_590};
const int NumRelocateId= 216;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/top_tb_behav/xsim.reloc",  (void **)funcTab, 216);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/top_tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/top_tb_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/top_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/top_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/top_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
