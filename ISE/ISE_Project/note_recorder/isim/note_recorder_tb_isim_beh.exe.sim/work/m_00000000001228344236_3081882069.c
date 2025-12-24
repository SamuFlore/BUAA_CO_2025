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
static const char *ng0 = "E:/CO/ISE/ISE_Project/note_recorder/note_recorder.v";
static int ng1[] = {0, 0};
static int ng2[] = {127, 0};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {1, 0};
static int ng5[] = {126, 0};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {2U, 0U};



static void Initial_35_0(char *t0)
{
    char t5[8];
    char t14[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(35, ng0);

LAB2:    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 3, 0LL);
    xsi_set_current_line(37, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 8, 0LL);
    xsi_set_current_line(38, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 8, 0LL);
    xsi_set_current_line(39, ng0);
    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2408);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 2408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_leq(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB6:    xsi_set_current_line(40, ng0);
    t12 = ((char*)((ng3)));
    t13 = (t0 + 2568);
    t16 = (t0 + 2568);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 2568);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 2408);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 2408);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng4)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 2408);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, *((unsigned int *)t15), t35, 0LL);
    goto LAB8;

}

static void Always_44_1(char *t0)
{
    char t6[8];
    char t30[8];
    char t31[8];
    char t47[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    int t39;
    char *t40;
    int t41;
    int t42;
    int t43;
    int t44;
    char *t45;
    char *t46;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;

LAB0:    t1 = (t0 + 3896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 4464);
    *((int *)t2) = 1;
    t3 = (t0 + 3928);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);

LAB5:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(53, ng0);

LAB20:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);

LAB21:    t2 = ((char*)((ng3)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t39 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng6)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t39 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng7)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t39 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng8)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t39 == 1)
        goto LAB28;

LAB29:
LAB30:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(45, ng0);

LAB13:    xsi_set_current_line(46, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 3, 0LL);
    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(49, ng0);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB14:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_leq(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB15;

LAB16:    goto LAB12;

LAB15:    xsi_set_current_line(49, ng0);

LAB17:    xsi_set_current_line(50, ng0);
    t8 = ((char*)((ng3)));
    t21 = (t0 + 2568);
    t22 = (t0 + 2568);
    t28 = (t22 + 72U);
    t29 = *((char **)t28);
    t32 = (t0 + 2568);
    t33 = (t32 + 64U);
    t34 = *((char **)t33);
    t35 = (t0 + 2408);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t37, 32, 1);
    t38 = (t30 + 4);
    t14 = *((unsigned int *)t38);
    t39 = (!(t14));
    t40 = (t31 + 4);
    t15 = *((unsigned int *)t40);
    t41 = (!(t15));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB18;

LAB19:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB14;

LAB18:    t16 = *((unsigned int *)t30);
    t17 = *((unsigned int *)t31);
    t43 = (t16 - t17);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t21, t8, 0, *((unsigned int *)t31), t44, 0LL);
    goto LAB19;

LAB22:    xsi_set_current_line(55, ng0);

LAB31:    xsi_set_current_line(56, ng0);
    xsi_set_current_line(56, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 2408);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);

LAB32:    t2 = (t0 + 2408);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng5)));
    memset(t6, 0, 8);
    xsi_vlog_signed_leq(t6, 32, t5, 32, t7, 32);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1368U);
    t4 = *((char **)t2);
    t2 = (t0 + 2568);
    t5 = (t0 + 2568);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t21 = (t0 + 2568);
    t22 = (t21 + 64U);
    t28 = *((char **)t22);
    t29 = ((char*)((ng2)));
    xsi_vlog_generic_convert_array_indices(t6, t30, t8, t28, 2, 1, t29, 32, 1);
    t32 = (t6 + 4);
    t9 = *((unsigned int *)t32);
    t39 = (!(t9));
    t33 = (t30 + 4);
    t10 = *((unsigned int *)t33);
    t41 = (!(t10));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB38;

LAB39:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2248);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 8, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2088);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 3, 0LL);
    goto LAB30;

LAB24:    xsi_set_current_line(63, ng0);

LAB40:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 2568);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2568);
    t21 = (t8 + 72U);
    t22 = *((char **)t21);
    t28 = (t0 + 2568);
    t29 = (t28 + 64U);
    t32 = *((char **)t29);
    t33 = (t0 + 1688U);
    t34 = *((char **)t33);
    xsi_vlog_generic_get_array_select_value(t6, 3, t7, t22, t32, 2, 1, t34, 7, 2);
    t33 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t33, t6, 0, 0, 3, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2248);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 8, 0LL);
    goto LAB30;

LAB26:    xsi_set_current_line(67, ng0);

LAB41:    xsi_set_current_line(68, ng0);
    t4 = (t0 + 2728);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 8, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2088);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 3, 0LL);
    goto LAB30;

LAB28:    xsi_set_current_line(71, ng0);

LAB42:    xsi_set_current_line(72, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 8, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2088);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 3, 0LL);
    goto LAB30;

LAB33:    xsi_set_current_line(56, ng0);

LAB35:    xsi_set_current_line(57, ng0);
    t21 = (t0 + 2568);
    t22 = (t21 + 56U);
    t28 = *((char **)t22);
    t29 = (t0 + 2568);
    t32 = (t29 + 72U);
    t33 = *((char **)t32);
    t34 = (t0 + 2568);
    t35 = (t34 + 64U);
    t36 = *((char **)t35);
    t37 = (t0 + 2408);
    t38 = (t37 + 56U);
    t40 = *((char **)t38);
    t45 = ((char*)((ng4)));
    memset(t31, 0, 8);
    xsi_vlog_signed_add(t31, 32, t40, 32, t45, 32);
    xsi_vlog_generic_get_array_select_value(t30, 3, t28, t33, t36, 2, 1, t31, 32, 1);
    t46 = (t0 + 2568);
    t49 = (t0 + 2568);
    t50 = (t49 + 72U);
    t51 = *((char **)t50);
    t52 = (t0 + 2568);
    t53 = (t52 + 64U);
    t54 = *((char **)t53);
    t55 = (t0 + 2408);
    t56 = (t55 + 56U);
    t57 = *((char **)t56);
    xsi_vlog_generic_convert_array_indices(t47, t48, t51, t54, 2, 1, t57, 32, 1);
    t58 = (t47 + 4);
    t14 = *((unsigned int *)t58);
    t39 = (!(t14));
    t59 = (t48 + 4);
    t15 = *((unsigned int *)t59);
    t41 = (!(t15));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB36;

LAB37:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2408);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t5, 32, t7, 32);
    t8 = (t0 + 2408);
    xsi_vlogvar_assign_value(t8, t6, 0, 0, 32);
    goto LAB32;

LAB36:    t16 = *((unsigned int *)t47);
    t17 = *((unsigned int *)t48);
    t43 = (t16 - t17);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t46, t30, 0, *((unsigned int *)t48), t44, 0LL);
    goto LAB37;

LAB38:    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t30);
    t43 = (t11 - t12);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, *((unsigned int *)t30), t44, 0LL);
    goto LAB39;

}

static void Always_79_2(char *t0)
{
    char t6[8];
    char t16[8];
    char t26[8];
    char t36[8];
    char t62[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t63;

LAB0:    t1 = (t0 + 4144U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 4480);
    *((int *)t2) = 1;
    t3 = (t0 + 4176);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(79, ng0);

LAB5:    xsi_set_current_line(80, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 2728);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(81, ng0);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB6:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_leq(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB7;

LAB8:    goto LAB2;

LAB7:    xsi_set_current_line(81, ng0);

LAB9:    xsi_set_current_line(82, ng0);
    t13 = (t0 + 2568);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t17 = (t0 + 2568);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 2568);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 2408);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_get_array_select_value(t16, 3, t15, t19, t22, 2, 1, t25, 32, 1);
    t27 = (t0 + 1688U);
    t28 = *((char **)t27);
    memset(t26, 0, 8);
    t27 = (t26 + 4);
    t29 = (t28 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (t30 >> 0);
    *((unsigned int *)t26) = t31;
    t32 = *((unsigned int *)t29);
    t33 = (t32 >> 0);
    *((unsigned int *)t27) = t33;
    t34 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t34 & 7U);
    t35 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t35 & 7U);
    memset(t36, 0, 8);
    t37 = (t16 + 4);
    t38 = (t26 + 4);
    t39 = *((unsigned int *)t16);
    t40 = *((unsigned int *)t26);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB13;

LAB10:    if (t48 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t36) = 1;

LAB13:    t52 = (t36 + 4);
    t53 = *((unsigned int *)t52);
    t54 = (~(t53));
    t55 = *((unsigned int *)t36);
    t56 = (t55 & t54);
    t57 = (t56 != 0);
    if (t57 > 0)
        goto LAB14;

LAB15:
LAB16:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB6;

LAB12:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(82, ng0);
    t58 = (t0 + 2728);
    t59 = (t58 + 56U);
    t60 = *((char **)t59);
    t61 = ((char*)((ng4)));
    memset(t62, 0, 8);
    xsi_vlog_unsigned_add(t62, 32, t60, 8, t61, 32);
    t63 = (t0 + 2728);
    xsi_vlogvar_assign_value(t63, t62, 0, 0, 8);
    goto LAB16;

}


extern void work_m_00000000001228344236_3081882069_init()
{
	static char *pe[] = {(void *)Initial_35_0,(void *)Always_44_1,(void *)Always_79_2};
	xsi_register_didat("work_m_00000000001228344236_3081882069", "isim/note_recorder_tb_isim_beh.exe.sim/work/m_00000000001228344236_3081882069.didat");
	xsi_register_executes(pe);
}
