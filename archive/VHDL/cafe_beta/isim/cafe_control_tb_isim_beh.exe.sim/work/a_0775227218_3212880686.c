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
static const char *ng0 = "C:/Users/vasko/Documents/GitHub/mpis/cafe_beta/control.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0775227218_3212880686_p_0(char *t0)
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

LAB0:    xsi_set_current_line(23, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 9564U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 5960);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t3;
    xsi_driver_first_trans_fast(t4);

LAB2:    t9 = (t0 + 5832);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0775227218_3212880686_p_1(char *t0)
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

LAB0:    xsi_set_current_line(24, ng0);

LAB3:    t2 = (t0 + 2952U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t1, t4, 3);
    t5 = (t0 + 6024);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 3U);
    xsi_driver_first_trans_fast_port(t5);

LAB2:    t10 = (t0 + 5848);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0775227218_3212880686_p_2(char *t0)
{
    char *t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(27, ng0);

LAB3:    t1 = (t0 + 9656);
    t3 = (t0 + 6088);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0775227218_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    xsi_set_current_line(28, ng0);

LAB3:    t1 = (t0 + 6152);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0775227218_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5864);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 6216);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 2792U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t2 = (t0 + 6216);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

}

static void work_a_0775227218_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    unsigned char t13;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB7, &&LAB6, &&LAB8, &&LAB9};

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 6280);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(42, ng0);
    t1 = (t0 + 6344);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t6);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 5880);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(46, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t7 = *((unsigned char *)t4);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB12:    goto LAB2;

LAB4:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 6344);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 5;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB17;

LAB18:    t6 = (unsigned char)0;

LAB19:    if (t6 != 0)
        goto LAB14;

LAB16:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB22;

LAB23:    t6 = (unsigned char)0;

LAB24:    if (t6 != 0)
        goto LAB20;

LAB21:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB27;

LAB28:    t6 = (unsigned char)0;

LAB29:    if (t6 != 0)
        goto LAB25;

LAB26:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB15:    goto LAB2;

LAB5:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 6344);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 4;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB33;

LAB34:    t6 = (unsigned char)0;

LAB35:    if (t6 != 0)
        goto LAB30;

LAB32:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB38;

LAB39:    t6 = (unsigned char)0;

LAB40:    if (t6 != 0)
        goto LAB36;

LAB37:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB43;

LAB44:    t6 = (unsigned char)0;

LAB45:    if (t6 != 0)
        goto LAB41;

LAB42:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB31:    goto LAB2;

LAB6:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 6344);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB49;

LAB50:    t6 = (unsigned char)0;

LAB51:    if (t6 != 0)
        goto LAB46;

LAB48:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB54;

LAB55:    t6 = (unsigned char)0;

LAB56:    if (t6 != 0)
        goto LAB52;

LAB53:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB59;

LAB60:    t6 = (unsigned char)0;

LAB61:    if (t6 != 0)
        goto LAB57;

LAB58:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);

LAB47:    goto LAB2;

LAB7:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 6344);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB65;

LAB66:    t6 = (unsigned char)0;

LAB67:    if (t6 != 0)
        goto LAB62;

LAB64:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB70;

LAB71:    t6 = (unsigned char)0;

LAB72:    if (t6 != 0)
        goto LAB68;

LAB69:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB63:    goto LAB2;

LAB8:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 6344);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((int *)t5) = 1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB73;

LAB75:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);

LAB74:    goto LAB2;

LAB9:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 6280);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB76;

LAB78:    xsi_set_current_line(111, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);

LAB77:    goto LAB2;

LAB10:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 6408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB11:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 6408);
    t5 = (t3 + 56U);
    t9 = *((char **)t5);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t3);
    goto LAB12;

LAB14:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB17:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 5);
    t6 = t13;
    goto LAB19;

LAB20:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB22:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 2);
    t6 = t13;
    goto LAB24;

LAB25:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB27:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 1);
    t6 = t13;
    goto LAB29;

LAB30:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

LAB33:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 2);
    t6 = t13;
    goto LAB35;

LAB36:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

LAB38:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 1);
    t6 = t13;
    goto LAB40;

LAB41:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

LAB43:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 > 2);
    t6 = t13;
    goto LAB45;

LAB46:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB47;

LAB49:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 2);
    t6 = t13;
    goto LAB51;

LAB52:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB47;

LAB54:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 1);
    t6 = t13;
    goto LAB56;

LAB57:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB47;

LAB59:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 > 2);
    t6 = t13;
    goto LAB61;

LAB62:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB63;

LAB65:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 >= 2);
    t6 = t13;
    goto LAB67;

LAB68:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 6408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t9 = (t5 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB63;

LAB70:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t13 = (t12 == 1);
    t6 = t13;
    goto LAB72;

LAB73:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 6408);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t9 = *((char **)t5);
    *((unsigned char *)t9) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB74;

LAB76:    xsi_set_current_line(109, ng0);
    t1 = (t0 + 6408);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t9 = *((char **)t5);
    *((unsigned char *)t9) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB77;

}


extern void work_a_0775227218_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0775227218_3212880686_p_0,(void *)work_a_0775227218_3212880686_p_1,(void *)work_a_0775227218_3212880686_p_2,(void *)work_a_0775227218_3212880686_p_3,(void *)work_a_0775227218_3212880686_p_4,(void *)work_a_0775227218_3212880686_p_5};
	xsi_register_didat("work_a_0775227218_3212880686", "isim/cafe_control_tb_isim_beh.exe.sim/work/a_0775227218_3212880686.didat");
	xsi_register_executes(pe);
}
