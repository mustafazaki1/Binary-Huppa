/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *WORK_P_3281450535;
char *IEEE_P_0774719531;
char *STD_TEXTIO;
char *WORK_P_3921110962;
char *IEEE_P_3620187407;
char *WORK_P_0958452875;
char *WORK_P_3606787979;
char *WORK_P_1438776945;
char *WORK_P_0897173179;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_0887401000;
char *WORK_P_2161947389;
char *IEEE_P_1242562249;
char *WORK_P_3689236428;
char *IEEE_P_3564397177;
char *IEEE_P_3499444699;
char *WORK_P_4119516181;
char *WORK_P_0457014155;
char *WORK_P_2992614942;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    work_p_0457014155_init();
    work_p_0958452875_init();
    work_p_3281450535_init();
    work_p_0887401000_init();
    work_p_2161947389_init();
    ieee_p_0774719531_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_4119516181_init();
    work_p_2992614942_init();
    work_p_3921110962_init();
    work_p_1438776945_init();
    work_p_3689236428_init();
    work_a_0416899894_3212880686_init();
    work_a_0763730103_3212880686_init();
    work_a_3061610604_3212880686_init();
    work_a_2263464102_3212880686_init();
    work_a_0084720048_3212880686_init();
    work_a_0293385300_3212880686_init();
    work_a_1506983852_3212880686_init();
    work_a_2166523021_3212880686_init();
    work_p_3606787979_init();
    work_p_0897173179_init();
    work_a_0734482308_3212880686_init();
    work_a_1153420228_3212880686_init();
    work_a_3279062471_3212880686_init();
    work_a_1526946367_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_0431830435_3212880686_init();
    work_a_1809836099_2372691052_init();


    xsi_register_tops("work_a_1809836099_2372691052");

    WORK_P_3281450535 = xsi_get_engine_memory("work_p_3281450535");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    WORK_P_3921110962 = xsi_get_engine_memory("work_p_3921110962");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    WORK_P_0958452875 = xsi_get_engine_memory("work_p_0958452875");
    WORK_P_3606787979 = xsi_get_engine_memory("work_p_3606787979");
    WORK_P_1438776945 = xsi_get_engine_memory("work_p_1438776945");
    WORK_P_0897173179 = xsi_get_engine_memory("work_p_0897173179");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_0887401000 = xsi_get_engine_memory("work_p_0887401000");
    WORK_P_2161947389 = xsi_get_engine_memory("work_p_2161947389");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_3689236428 = xsi_get_engine_memory("work_p_3689236428");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    WORK_P_4119516181 = xsi_get_engine_memory("work_p_4119516181");
    WORK_P_0457014155 = xsi_get_engine_memory("work_p_0457014155");
    WORK_P_2992614942 = xsi_get_engine_memory("work_p_2992614942");

    return xsi_run_simulation(argc, argv);

}
