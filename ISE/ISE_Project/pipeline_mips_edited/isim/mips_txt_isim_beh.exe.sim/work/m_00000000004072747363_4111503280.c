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
static const char *ng0 = "E:/CO/ISE/ISE_Project/pipeline_mips_edited/MDU.v";
static int ng1[] = {1, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {21U, 0U};
static unsigned int ng4[] = {23U, 0U};
static unsigned int ng5[] = {25U, 0U};
static unsigned int ng6[] = {26U, 0U};
static unsigned int ng7[] = {27U, 0U};
static unsigned int ng8[] = {28U, 0U};
static unsigned int ng9[] = {32U, 0U};
static unsigned int ng10[] = {5U, 0U};
static unsigned int ng11[] = {10U, 0U};
static unsigned int ng12[] = {22U, 0U};
static unsigned int ng13[] = {24U, 0U};
static int ng14[] = {0, 0};



static void Cont_40_0(char *t0)
{
    char t3[24];
    char t4[16];
    char t10[24];
    char t16[8];
    char t17[24];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t12;
    char *t13;
    char *t15;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 2888);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 2728);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlogtype_concat(t4, 64, 64, 2U, t9, 32, t6, 32);
    xsi_vlogtype_sign_extend(t3, 65, t4, 64);
    t12 = (t0 + 1368U);
    t13 = *((char **)t12);
    t12 = (t0 + 1528U);
    t15 = *((char **)t12);
    memset(t16, 0, 8);
    xsi_vlog_signed_multiply(t16, 32, t13, 32, t15, 32);
    xsi_vlogtype_sign_extend(t10, 65, t16, 32);
    xsi_vlog_signed_add(t17, 65, t3, 65, t10, 65);
    t12 = (t0 + 5160);
    t18 = (t12 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    xsi_vlog_bit_copy(t21, 0, t17, 0, 65);
    xsi_driver_vfirst_trans(t12, 0, 64);
    t22 = (t0 + 5032);
    *((int *)t22) = 1;

LAB1:    return;
}

static void Always_42_1(char *t0)
{
    char t6[8];
    char t31[16];
    char t32[16];
    char t33[16];
    char t34[8];
    char t35[8];
    char t37[8];
    char t80[8];
    char t88[8];
    char t115[8];
    char t130[8];
    char t146[8];
    char t154[8];
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
    int t30;
    char *t36;
    unsigned int t38;
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
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    char *t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    char *t131;
    char *t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    char *t153;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    char *t158;
    char *t159;
    char *t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    char *t168;
    char *t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    char *t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    unsigned int t187;
    char *t188;
    char *t189;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 5048);
    *((int *)t2) = 1;
    t3 = (t0 + 4248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
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

LAB11:    xsi_set_current_line(48, ng0);

LAB14:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);

LAB15:    t2 = ((char*)((ng3)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t30 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng4)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t30 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng5)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t30 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng6)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t30 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng7)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t30 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng8)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t30 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng9)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t30 == 1)
        goto LAB28;

LAB29:
LAB30:
LAB12:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t5 = (t4 + 4);
    t7 = (t2 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t7);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB57;

LAB54:    if (t18 != 0)
        goto LAB56;

LAB55:    *((unsigned int *)t6) = 1;

LAB57:    t21 = (t6 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB58;

LAB59:
LAB60:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3048);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t8 = (t5 + 4);
    t21 = (t7 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t7);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t8);
    t13 = *((unsigned int *)t21);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t8);
    t17 = *((unsigned int *)t21);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB133;

LAB132:    if (t18 != 0)
        goto LAB134;

LAB135:    t28 = (t6 + 4);
    t23 = *((unsigned int *)t28);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB136;

LAB137:
LAB138:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(43, ng0);

LAB13:    xsi_set_current_line(44, ng0);
    t28 = ((char*)((ng2)));
    t29 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 32, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB12;

LAB16:    xsi_set_current_line(50, ng0);

LAB31:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB30;

LAB18:    xsi_set_current_line(53, ng0);

LAB32:    xsi_set_current_line(54, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB30;

LAB20:    xsi_set_current_line(56, ng0);

LAB33:    xsi_set_current_line(57, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    xsi_vlogtype_sign_extend(t31, 64, t5, 32);
    t4 = (t0 + 1528U);
    t7 = *((char **)t4);
    xsi_vlogtype_sign_extend(t32, 64, t7, 32);
    xsi_vlog_signed_multiply(t33, 64, t31, 64, t32, 64);
    t4 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t4, t33, 0, 0, 32, 0LL);
    t8 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t8, t33, 32, 0, 32, 0LL);
    goto LAB30;

LAB22:    xsi_set_current_line(59, ng0);

LAB34:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 1528U);
    t7 = *((char **)t4);
    xsi_vlog_unsigned_multiply(t31, 64, t5, 32, t7, 32);
    t4 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t4, t31, 0, 0, 32, 0LL);
    t8 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t8, t31, 32, 0, 32, 0LL);
    goto LAB30;

LAB24:    xsi_set_current_line(62, ng0);

LAB35:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
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
        goto LAB37;

LAB36:    if (t18 != 0)
        goto LAB38;

LAB39:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB40;

LAB41:
LAB42:    goto LAB30;

LAB26:    xsi_set_current_line(68, ng0);

LAB44:    xsi_set_current_line(69, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
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
        goto LAB46;

LAB45:    if (t18 != 0)
        goto LAB47;

LAB48:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB49;

LAB50:
LAB51:    goto LAB30;

LAB28:    xsi_set_current_line(74, ng0);

LAB53:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 2328U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t7 = (t5 + 8);
    t8 = (t5 + 12);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 4294967295U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 4294967295U);
    t21 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t21, t6, 0, 0, 32, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t5 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t5);
    t12 = (t11 >> 0);
    *((unsigned int *)t2) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 4294967295U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 4294967295U);
    t7 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 32, 0LL);
    goto LAB30;

LAB37:    *((unsigned int *)t6) = 1;
    goto LAB39;

LAB38:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(63, ng0);

LAB43:    xsi_set_current_line(64, ng0);
    t28 = (t0 + 1368U);
    t29 = *((char **)t28);
    t28 = (t0 + 1528U);
    t36 = *((char **)t28);
    memset(t37, 0, 8);
    xsi_vlog_signed_mod(t37, 32, t29, 32, t36, 32);
    t28 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t28, t37, 0, 0, 32, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1368U);
    t4 = *((char **)t2);
    t2 = (t0 + 1528U);
    t5 = *((char **)t2);
    memset(t35, 0, 8);
    xsi_vlog_signed_divide(t35, 32, t4, 32, t5, 32);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t35, 0, 0, 32, 0LL);
    goto LAB42;

LAB46:    *((unsigned int *)t6) = 1;
    goto LAB48;

LAB47:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB48;

LAB49:    xsi_set_current_line(69, ng0);

LAB52:    xsi_set_current_line(70, ng0);
    t28 = (t0 + 1368U);
    t29 = *((char **)t28);
    t28 = (t0 + 1528U);
    t36 = *((char **)t28);
    memset(t34, 0, 8);
    xsi_vlog_unsigned_mod(t34, 32, t29, 32, t36, 32);
    t28 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t28, t34, 0, 0, 32, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1368U);
    t4 = *((char **)t2);
    t2 = (t0 + 1528U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    xsi_vlog_unsigned_divide(t6, 32, t4, 32, t5, 32);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t6, 0, 0, 32, 0LL);
    goto LAB51;

LAB56:    t8 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB57;

LAB58:    xsi_set_current_line(81, ng0);

LAB61:    xsi_set_current_line(82, ng0);
    t22 = (t0 + 1688U);
    t28 = *((char **)t22);
    t22 = ((char*)((ng5)));
    memset(t34, 0, 8);
    t29 = (t28 + 4);
    t36 = (t22 + 4);
    t38 = *((unsigned int *)t28);
    t39 = *((unsigned int *)t22);
    t40 = (t38 ^ t39);
    t41 = *((unsigned int *)t29);
    t42 = *((unsigned int *)t36);
    t43 = (t41 ^ t42);
    t44 = (t40 | t43);
    t45 = *((unsigned int *)t29);
    t46 = *((unsigned int *)t36);
    t47 = (t45 | t46);
    t48 = (~(t47));
    t49 = (t44 & t48);
    if (t49 != 0)
        goto LAB65;

LAB62:    if (t47 != 0)
        goto LAB64;

LAB63:    *((unsigned int *)t34) = 1;

LAB65:    memset(t35, 0, 8);
    t51 = (t34 + 4);
    t52 = *((unsigned int *)t51);
    t53 = (~(t52));
    t54 = *((unsigned int *)t34);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB66;

LAB67:    if (*((unsigned int *)t51) != 0)
        goto LAB68;

LAB69:    t58 = (t35 + 4);
    t59 = *((unsigned int *)t35);
    t60 = (!(t59));
    t61 = *((unsigned int *)t58);
    t62 = (t60 || t61);
    if (t62 > 0)
        goto LAB70;

LAB71:    memcpy(t88, t35, 8);

LAB72:    memset(t115, 0, 8);
    t116 = (t88 + 4);
    t117 = *((unsigned int *)t116);
    t118 = (~(t117));
    t119 = *((unsigned int *)t88);
    t120 = (t119 & t118);
    t121 = (t120 & 1U);
    if (t121 != 0)
        goto LAB84;

LAB85:    if (*((unsigned int *)t116) != 0)
        goto LAB86;

LAB87:    t123 = (t115 + 4);
    t124 = *((unsigned int *)t115);
    t125 = (!(t124));
    t126 = *((unsigned int *)t123);
    t127 = (t125 || t126);
    if (t127 > 0)
        goto LAB88;

LAB89:    memcpy(t154, t115, 8);

LAB90:    t182 = (t154 + 4);
    t183 = *((unsigned int *)t182);
    t184 = (~(t183));
    t185 = *((unsigned int *)t154);
    t186 = (t185 & t184);
    t187 = (t186 != 0);
    if (t187 > 0)
        goto LAB102;

LAB103:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng7)));
    memset(t6, 0, 8);
    t5 = (t4 + 4);
    t7 = (t2 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t7);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB109;

LAB106:    if (t18 != 0)
        goto LAB108;

LAB107:    *((unsigned int *)t6) = 1;

LAB109:    memset(t34, 0, 8);
    t21 = (t6 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB110;

LAB111:    if (*((unsigned int *)t21) != 0)
        goto LAB112;

LAB113:    t28 = (t34 + 4);
    t38 = *((unsigned int *)t34);
    t39 = (!(t38));
    t40 = *((unsigned int *)t28);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB114;

LAB115:    memcpy(t80, t34, 8);

LAB116:    t87 = (t80 + 4);
    t95 = *((unsigned int *)t87);
    t96 = (~(t95));
    t97 = *((unsigned int *)t80);
    t98 = (t97 & t96);
    t99 = (t98 != 0);
    if (t99 > 0)
        goto LAB128;

LAB129:
LAB130:
LAB104:    goto LAB60;

LAB64:    t50 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t50) = 1;
    goto LAB65;

LAB66:    *((unsigned int *)t35) = 1;
    goto LAB69;

LAB68:    t57 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB69;

LAB70:    t63 = (t0 + 1688U);
    t64 = *((char **)t63);
    t63 = ((char*)((ng6)));
    memset(t37, 0, 8);
    t65 = (t64 + 4);
    t66 = (t63 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t63);
    t69 = (t67 ^ t68);
    t70 = *((unsigned int *)t65);
    t71 = *((unsigned int *)t66);
    t72 = (t70 ^ t71);
    t73 = (t69 | t72);
    t74 = *((unsigned int *)t65);
    t75 = *((unsigned int *)t66);
    t76 = (t74 | t75);
    t77 = (~(t76));
    t78 = (t73 & t77);
    if (t78 != 0)
        goto LAB76;

LAB73:    if (t76 != 0)
        goto LAB75;

LAB74:    *((unsigned int *)t37) = 1;

LAB76:    memset(t80, 0, 8);
    t81 = (t37 + 4);
    t82 = *((unsigned int *)t81);
    t83 = (~(t82));
    t84 = *((unsigned int *)t37);
    t85 = (t84 & t83);
    t86 = (t85 & 1U);
    if (t86 != 0)
        goto LAB77;

LAB78:    if (*((unsigned int *)t81) != 0)
        goto LAB79;

LAB80:    t89 = *((unsigned int *)t35);
    t90 = *((unsigned int *)t80);
    t91 = (t89 | t90);
    *((unsigned int *)t88) = t91;
    t92 = (t35 + 4);
    t93 = (t80 + 4);
    t94 = (t88 + 4);
    t95 = *((unsigned int *)t92);
    t96 = *((unsigned int *)t93);
    t97 = (t95 | t96);
    *((unsigned int *)t94) = t97;
    t98 = *((unsigned int *)t94);
    t99 = (t98 != 0);
    if (t99 == 1)
        goto LAB81;

LAB82:
LAB83:    goto LAB72;

LAB75:    t79 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t79) = 1;
    goto LAB76;

LAB77:    *((unsigned int *)t80) = 1;
    goto LAB80;

LAB79:    t87 = (t80 + 4);
    *((unsigned int *)t80) = 1;
    *((unsigned int *)t87) = 1;
    goto LAB80;

LAB81:    t100 = *((unsigned int *)t88);
    t101 = *((unsigned int *)t94);
    *((unsigned int *)t88) = (t100 | t101);
    t102 = (t35 + 4);
    t103 = (t80 + 4);
    t104 = *((unsigned int *)t102);
    t105 = (~(t104));
    t106 = *((unsigned int *)t35);
    t30 = (t106 & t105);
    t107 = *((unsigned int *)t103);
    t108 = (~(t107));
    t109 = *((unsigned int *)t80);
    t110 = (t109 & t108);
    t111 = (~(t30));
    t112 = (~(t110));
    t113 = *((unsigned int *)t94);
    *((unsigned int *)t94) = (t113 & t111);
    t114 = *((unsigned int *)t94);
    *((unsigned int *)t94) = (t114 & t112);
    goto LAB83;

LAB84:    *((unsigned int *)t115) = 1;
    goto LAB87;

LAB86:    t122 = (t115 + 4);
    *((unsigned int *)t115) = 1;
    *((unsigned int *)t122) = 1;
    goto LAB87;

LAB88:    t128 = (t0 + 1688U);
    t129 = *((char **)t128);
    t128 = ((char*)((ng9)));
    memset(t130, 0, 8);
    t131 = (t129 + 4);
    t132 = (t128 + 4);
    t133 = *((unsigned int *)t129);
    t134 = *((unsigned int *)t128);
    t135 = (t133 ^ t134);
    t136 = *((unsigned int *)t131);
    t137 = *((unsigned int *)t132);
    t138 = (t136 ^ t137);
    t139 = (t135 | t138);
    t140 = *((unsigned int *)t131);
    t141 = *((unsigned int *)t132);
    t142 = (t140 | t141);
    t143 = (~(t142));
    t144 = (t139 & t143);
    if (t144 != 0)
        goto LAB94;

LAB91:    if (t142 != 0)
        goto LAB93;

LAB92:    *((unsigned int *)t130) = 1;

LAB94:    memset(t146, 0, 8);
    t147 = (t130 + 4);
    t148 = *((unsigned int *)t147);
    t149 = (~(t148));
    t150 = *((unsigned int *)t130);
    t151 = (t150 & t149);
    t152 = (t151 & 1U);
    if (t152 != 0)
        goto LAB95;

LAB96:    if (*((unsigned int *)t147) != 0)
        goto LAB97;

LAB98:    t155 = *((unsigned int *)t115);
    t156 = *((unsigned int *)t146);
    t157 = (t155 | t156);
    *((unsigned int *)t154) = t157;
    t158 = (t115 + 4);
    t159 = (t146 + 4);
    t160 = (t154 + 4);
    t161 = *((unsigned int *)t158);
    t162 = *((unsigned int *)t159);
    t163 = (t161 | t162);
    *((unsigned int *)t160) = t163;
    t164 = *((unsigned int *)t160);
    t165 = (t164 != 0);
    if (t165 == 1)
        goto LAB99;

LAB100:
LAB101:    goto LAB90;

LAB93:    t145 = (t130 + 4);
    *((unsigned int *)t130) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB94;

LAB95:    *((unsigned int *)t146) = 1;
    goto LAB98;

LAB97:    t153 = (t146 + 4);
    *((unsigned int *)t146) = 1;
    *((unsigned int *)t153) = 1;
    goto LAB98;

LAB99:    t166 = *((unsigned int *)t154);
    t167 = *((unsigned int *)t160);
    *((unsigned int *)t154) = (t166 | t167);
    t168 = (t115 + 4);
    t169 = (t146 + 4);
    t170 = *((unsigned int *)t168);
    t171 = (~(t170));
    t172 = *((unsigned int *)t115);
    t173 = (t172 & t171);
    t174 = *((unsigned int *)t169);
    t175 = (~(t174));
    t176 = *((unsigned int *)t146);
    t177 = (t176 & t175);
    t178 = (~(t173));
    t179 = (~(t177));
    t180 = *((unsigned int *)t160);
    *((unsigned int *)t160) = (t180 & t178);
    t181 = *((unsigned int *)t160);
    *((unsigned int *)t160) = (t181 & t179);
    goto LAB101;

LAB102:    xsi_set_current_line(82, ng0);

LAB105:    xsi_set_current_line(83, ng0);
    t188 = ((char*)((ng10)));
    t189 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t189, t188, 0, 0, 4, 0LL);
    goto LAB104;

LAB108:    t8 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB109;

LAB110:    *((unsigned int *)t34) = 1;
    goto LAB113;

LAB112:    t22 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB113;

LAB114:    t29 = (t0 + 1688U);
    t36 = *((char **)t29);
    t29 = ((char*)((ng8)));
    memset(t35, 0, 8);
    t50 = (t36 + 4);
    t51 = (t29 + 4);
    t42 = *((unsigned int *)t36);
    t43 = *((unsigned int *)t29);
    t44 = (t42 ^ t43);
    t45 = *((unsigned int *)t50);
    t46 = *((unsigned int *)t51);
    t47 = (t45 ^ t46);
    t48 = (t44 | t47);
    t49 = *((unsigned int *)t50);
    t52 = *((unsigned int *)t51);
    t53 = (t49 | t52);
    t54 = (~(t53));
    t55 = (t48 & t54);
    if (t55 != 0)
        goto LAB120;

LAB117:    if (t53 != 0)
        goto LAB119;

LAB118:    *((unsigned int *)t35) = 1;

LAB120:    memset(t37, 0, 8);
    t58 = (t35 + 4);
    t56 = *((unsigned int *)t58);
    t59 = (~(t56));
    t60 = *((unsigned int *)t35);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB121;

LAB122:    if (*((unsigned int *)t58) != 0)
        goto LAB123;

LAB124:    t67 = *((unsigned int *)t34);
    t68 = *((unsigned int *)t37);
    t69 = (t67 | t68);
    *((unsigned int *)t80) = t69;
    t64 = (t34 + 4);
    t65 = (t37 + 4);
    t66 = (t80 + 4);
    t70 = *((unsigned int *)t64);
    t71 = *((unsigned int *)t65);
    t72 = (t70 | t71);
    *((unsigned int *)t66) = t72;
    t73 = *((unsigned int *)t66);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB125;

LAB126:
LAB127:    goto LAB116;

LAB119:    t57 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB120;

LAB121:    *((unsigned int *)t37) = 1;
    goto LAB124;

LAB123:    t63 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB124;

LAB125:    t75 = *((unsigned int *)t80);
    t76 = *((unsigned int *)t66);
    *((unsigned int *)t80) = (t75 | t76);
    t79 = (t34 + 4);
    t81 = (t37 + 4);
    t77 = *((unsigned int *)t79);
    t78 = (~(t77));
    t82 = *((unsigned int *)t34);
    t30 = (t82 & t78);
    t83 = *((unsigned int *)t81);
    t84 = (~(t83));
    t85 = *((unsigned int *)t37);
    t110 = (t85 & t84);
    t86 = (~(t30));
    t89 = (~(t110));
    t90 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t90 & t86);
    t91 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t91 & t89);
    goto LAB127;

LAB128:    xsi_set_current_line(85, ng0);

LAB131:    xsi_set_current_line(86, ng0);
    t92 = ((char*)((ng11)));
    t93 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t93, t92, 0, 0, 4, 0LL);
    goto LAB130;

LAB133:    *((unsigned int *)t6) = 1;
    goto LAB135;

LAB134:    t22 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB135;

LAB136:    xsi_set_current_line(90, ng0);

LAB139:    xsi_set_current_line(91, ng0);
    t29 = (t0 + 3048);
    t36 = (t29 + 56U);
    t50 = *((char **)t36);
    t51 = ((char*)((ng1)));
    memset(t34, 0, 8);
    xsi_vlog_unsigned_minus(t34, 32, t50, 4, t51, 32);
    t57 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t57, t34, 0, 0, 4, 0LL);
    goto LAB138;

}

static void Cont_95_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t40[8];
    char t41[8];
    char t44[8];
    char *t1;
    char *t2;
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
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t84;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1688U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng12)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
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
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t29);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t79 = (t0 + 5224);
    t80 = (t79 + 56U);
    t81 = *((char **)t80);
    t82 = (t81 + 56U);
    t83 = *((char **)t82);
    memcpy(t83, t3, 8);
    xsi_driver_vfirst_trans(t79, 0, 31);
    t84 = (t0 + 5064);
    *((int *)t84) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 2728);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    goto LAB13;

LAB14:    t42 = (t0 + 1688U);
    t43 = *((char **)t42);
    t42 = ((char*)((ng13)));
    memset(t44, 0, 8);
    t45 = (t43 + 4);
    t46 = (t42 + 4);
    t47 = *((unsigned int *)t43);
    t48 = *((unsigned int *)t42);
    t49 = (t47 ^ t48);
    t50 = *((unsigned int *)t45);
    t51 = *((unsigned int *)t46);
    t52 = (t50 ^ t51);
    t53 = (t49 | t52);
    t54 = *((unsigned int *)t45);
    t55 = *((unsigned int *)t46);
    t56 = (t54 | t55);
    t57 = (~(t56));
    t58 = (t53 & t57);
    if (t58 != 0)
        goto LAB24;

LAB21:    if (t56 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t44) = 1;

LAB24:    memset(t41, 0, 8);
    t60 = (t44 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t44);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t60) != 0)
        goto LAB27;

LAB28:    t67 = (t41 + 4);
    t68 = *((unsigned int *)t41);
    t69 = *((unsigned int *)t67);
    t70 = (t68 || t69);
    if (t70 > 0)
        goto LAB29;

LAB30:    t74 = *((unsigned int *)t41);
    t75 = (~(t74));
    t76 = *((unsigned int *)t67);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t67) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t41) > 0)
        goto LAB35;

LAB36:    memcpy(t40, t78, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

LAB23:    t59 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t41) = 1;
    goto LAB28;

LAB27:    t66 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t66) = 1;
    goto LAB28;

LAB29:    t71 = (t0 + 2888);
    t72 = (t71 + 56U);
    t73 = *((char **)t72);
    goto LAB30;

LAB31:    t78 = ((char*)((ng2)));
    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t40, 32, t73, 32, t78, 32);
    goto LAB37;

LAB35:    memcpy(t40, t73, 8);
    goto LAB37;

}

static void Cont_99_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
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
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 3048);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB5;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t41 = (t0 + 5288);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 1U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 5080);
    *((int *)t54) = 1;

LAB1:    return;
LAB5:    *((unsigned int *)t8) = 1;
    goto LAB7;

LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = ((char*)((ng14)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}


extern void work_m_00000000004072747363_4111503280_init()
{
	static char *pe[] = {(void *)Cont_40_0,(void *)Always_42_1,(void *)Cont_95_2,(void *)Cont_99_3};
	xsi_register_didat("work_m_00000000004072747363_4111503280", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000004072747363_4111503280.didat");
	xsi_register_executes(pe);
}
