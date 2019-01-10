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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/vasko/Documents/GitHub/mpis/cafe_beta/CafeControl_TB.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0612619120_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    int64 t10;

LAB0:    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    if (t4 != 0)
        goto LAB4;

LAB6:    xsi_set_current_line(49, ng0);

LAB17:    *((char **)t1) = &&LAB18;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 5488);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t10 = (t9 / 2);
    t2 = (t0 + 4040);
    xsi_process_wait(t2, t10);

LAB9:    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB5:    goto LAB2;

LAB7:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 5488);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t10 = (t9 / 2);
    t2 = (t0 + 4040);
    xsi_process_wait(t2, t10);

LAB13:    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

LAB11:    goto LAB5;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

LAB15:    goto LAB5;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

}

static void work_a_0612619120_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 9288U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 5552);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t3;
    xsi_driver_first_trans_fast(t4);

LAB2:    t9 = (t0 + 5296);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0612619120_2372691052_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(54, ng0);

LAB3:    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t1, t4, 3);
    t5 = (t0 + 5616);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 3U);
    xsi_driver_first_trans_fast(t5);

LAB2:    t10 = (t0 + 5312);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

void work_a_0612619120_2372691052_sub_992801478_2855802964(char *t0, char *t1)
{
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;

LAB0:    t4 = (t0 + 5872);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t4);
    t4 = (t0 + 992U);
    xsi_add_dynamic_wait(t1, t4, -1, -1);

LAB5:    t5 = (t1 + 224U);
    t5 = *((char **)t5);
    xsi_wp_set_status(t5, 1);
    t6 = (t1 + 88U);
    t7 = *((char **)t6);
    t8 = (t7 + 2480U);
    *((unsigned int *)t8) = 1U;
    t9 = (t1 + 88U);
    t10 = *((char **)t9);
    t11 = (t10 + 0U);
    getcontext(t11);
    t12 = (t1 + 88U);
    t13 = *((char **)t12);
    t14 = (t13 + 2480U);
    t15 = *((unsigned int *)t14);
    if (t15 == 1)
        goto LAB6;

LAB7:    t16 = (t1 + 88U);
    t17 = *((char **)t16);
    t18 = (t17 + 2480U);
    *((unsigned int *)t18) = 3U;

LAB3:
LAB4:    t19 = (t0 + 992U);
    t20 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t19, 0U, 0U);
    if (t20 == 1)
        goto LAB2;
    else
        goto LAB5;

LAB2:    xsi_remove_dynamic_wait(t1, t4);
    t4 = (t0 + 5872);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    t4 = (t0 + 992U);
    xsi_add_dynamic_wait(t1, t4, -1, -1);

LAB11:    t5 = (t1 + 224U);
    t5 = *((char **)t5);
    xsi_wp_set_status(t5, 1);
    t6 = (t1 + 88U);
    t7 = *((char **)t6);
    t8 = (t7 + 2480U);
    *((unsigned int *)t8) = 1U;
    t9 = (t1 + 88U);
    t10 = *((char **)t9);
    t11 = (t10 + 0U);
    getcontext(t11);
    t12 = (t1 + 88U);
    t13 = *((char **)t12);
    t14 = (t13 + 2480U);
    t15 = *((unsigned int *)t14);
    if (t15 == 1)
        goto LAB12;

LAB13:    t16 = (t1 + 88U);
    t17 = *((char **)t16);
    t18 = (t17 + 2480U);
    *((unsigned int *)t18) = 3U;

LAB9:
LAB10:    t19 = (t0 + 992U);
    t20 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t19, 0U, 0U);
    if (t20 == 1)
        goto LAB8;
    else
        goto LAB11;

LAB6:    xsi_saveStackAndSuspend(t1);
    goto LAB7;

LAB8:    xsi_remove_dynamic_wait(t1, t4);

LAB1:    return;
LAB12:    xsi_saveStackAndSuspend(t1);
    goto LAB13;

}

static void work_a_0612619120_2372691052_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    int t8;
    unsigned char t9;

LAB0:    t1 = (t0 + 4976U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 5680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(66, ng0);

LAB6:    t2 = (t0 + 5328);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t4 = (t0 + 5328);
    *((int *)t4) = 0;
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 5680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 5744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(69, ng0);

LAB10:    t2 = (t0 + 5344);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t4 = (t0 + 5344);
    *((int *)t4) = 0;
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 5744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(71, ng0);

LAB14:    t2 = (t0 + 5360);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB12:    t4 = (t0 + 5360);
    *((int *)t4) = 0;
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 5808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = 2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 4784);
    work_a_0612619120_2372691052_sub_992801478_2855802964(t0, t2);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t7 = (t8 == 3);
    if (t7 == 0)
        goto LAB16;

LAB17:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 5808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = 1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 4784);
    work_a_0612619120_2372691052_sub_992801478_2855802964(t0, t2);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t7 = (t8 == 2);
    if (t7 == 0)
        goto LAB18;

LAB19:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 5808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = 1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 4784);
    work_a_0612619120_2372691052_sub_992801478_2855802964(t0, t2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t7 = (t8 == 1);
    if (t7 == 0)
        goto LAB20;

LAB21:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 5808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = 2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 4784);
    work_a_0612619120_2372691052_sub_992801478_2855802964(t0, t2);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t8 = *((int *)t3);
    t7 = (t8 == 0);
    if (t7 == 0)
        goto LAB22;

LAB23:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t7 = *((unsigned char *)t3);
    t9 = (t7 == (unsigned char)3);
    if (t9 == 0)
        goto LAB24;

LAB25:    xsi_set_current_line(90, ng0);

LAB28:    t2 = (t0 + 5376);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB13:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB12;
    else
        goto LAB14;

LAB15:    goto LAB13;

LAB16:    t2 = (t0 + 9385);
    xsi_report(t2, 19U, 2);
    goto LAB17;

LAB18:    t2 = (t0 + 9405);
    xsi_report(t2, 19U, 2);
    goto LAB19;

LAB20:    t2 = (t0 + 9425);
    xsi_report(t2, 19U, 2);
    goto LAB21;

LAB22:    t2 = (t0 + 9445);
    xsi_report(t2, 19U, 2);
    goto LAB23;

LAB24:    t2 = (t0 + 9465);
    xsi_report(t2, 6U, 2);
    goto LAB25;

LAB26:    t4 = (t0 + 5376);
    *((int *)t4) = 0;
    xsi_set_current_line(91, ng0);

LAB32:    t2 = (t0 + 5392);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB27:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB26;
    else
        goto LAB28;

LAB29:    goto LAB27;

LAB30:    t4 = (t0 + 5392);
    *((int *)t4) = 0;
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 5936);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);

LAB36:    t2 = (t0 + 5408);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB31:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB30;
    else
        goto LAB32;

LAB33:    goto LAB31;

LAB34:    t4 = (t0 + 5408);
    *((int *)t4) = 0;
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 5936);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 6000);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(97, ng0);

LAB40:    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB35:    t3 = (t0 + 992U);
    t7 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t7 == 1)
        goto LAB34;
    else
        goto LAB36;

LAB37:    goto LAB35;

LAB38:    goto LAB2;

LAB39:    goto LAB38;

LAB41:    goto LAB39;

}


extern void work_a_0612619120_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0612619120_2372691052_p_0,(void *)work_a_0612619120_2372691052_p_1,(void *)work_a_0612619120_2372691052_p_2,(void *)work_a_0612619120_2372691052_p_3};
	static char *se[] = {(void *)work_a_0612619120_2372691052_sub_992801478_2855802964};
	xsi_register_didat("work_a_0612619120_2372691052", "isim/cafe_control_tb_isim_beh.exe.sim/work/a_0612619120_2372691052.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
