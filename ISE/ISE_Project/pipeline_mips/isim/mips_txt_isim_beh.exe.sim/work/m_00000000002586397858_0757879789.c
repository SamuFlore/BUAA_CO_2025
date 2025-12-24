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
static const char *ng0 = "E:/CO/ISE/ISE_Project/pipeline_mips/NPC.v";
static unsigned int ng1[] = {4U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {14, 0};
static int ng4[] = {1, 0};
static unsigned int ng5[] = {16768U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {2U, 0U};
static unsigned int ng8[] = {3U, 0U};



static void Cont_40_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1728U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t3, 32, t2, 32);
    t5 = (t0 + 6528);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 6368);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_48_1(char *t0)
{
    char t3[8];
    char t6[8];
    char *t1;
    char *t2;
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
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 5056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 1888U);
    t5 = *((char **)t4);
    t4 = (t0 + 1728U);
    t7 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 28);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 28);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 15U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 15U);
    xsi_vlogtype_concat(t3, 32, 32, 3U, t6, 4, t5, 26, t2, 2);
    t15 = (t0 + 6592);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t3, 8);
    xsi_driver_vfirst_trans(t15, 0, 31);
    t20 = (t0 + 6384);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Cont_49_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 5304U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2048U);
    t3 = *((char **)t2);
    t2 = (t0 + 6656);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 8);
    xsi_driver_vfirst_trans(t2, 0, 31);
    t8 = (t0 + 6400);
    *((int *)t8) = 1;

LAB1:    return;
}

static void Cont_50_3(char *t0)
{
    char t3[8];
    char t6[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 5552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 2208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng3)));
    t7 = (t0 + 2208U);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t9 + 4);
    t10 = (t8 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 15);
    t13 = (t12 & 1);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 >> 15);
    t16 = (t15 & 1);
    *((unsigned int *)t7) = t16;
    xsi_vlog_mul_concat(t6, 14, 1, t4, 1U, t9, 1);
    xsi_vlogtype_concat(t3, 32, 32, 3U, t6, 14, t5, 16, t2, 2);
    t17 = (t0 + 6720);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t3, 8);
    xsi_driver_vfirst_trans(t17, 0, 31);
    t22 = (t0 + 6416);
    *((int *)t22) = 1;

LAB1:    return;
}

static void Cont_51_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t36[8];
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
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;

LAB0:    t1 = (t0 + 5800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2528U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng4)));
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

LAB13:    t37 = *((unsigned int *)t4);
    t38 = (~(t37));
    t39 = *((unsigned int *)t29);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t41, 8);

LAB20:    t33 = (t0 + 6784);
    t42 = (t33 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t3, 8);
    xsi_driver_vfirst_trans(t33, 0, 31);
    t46 = (t0 + 6432);
    *((int *)t46) = 1;

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

LAB12:    t33 = (t0 + 3328U);
    t34 = *((char **)t33);
    t33 = (t0 + 1728U);
    t35 = *((char **)t33);
    memset(t36, 0, 8);
    xsi_vlog_unsigned_add(t36, 32, t34, 32, t35, 32);
    goto LAB13;

LAB14:    t33 = (t0 + 3648U);
    t41 = *((char **)t33);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t36, 32, t41, 32);
    goto LAB20;

LAB18:    memcpy(t3, t36, 8);
    goto LAB20;

}

static void Cont_54_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t21[8];
    char t22[8];
    char t25[8];
    char t58[8];
    char t59[8];
    char t61[8];
    char t94[8];
    char t95[8];
    char t97[8];
    char t130[8];
    char t131[8];
    char t133[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t23;
    char *t24;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t60;
    char *t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    char *t96;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    char *t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    char *t132;
    char *t134;
    char *t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    char *t148;
    char *t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    char *t155;
    char *t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    char *t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    char *t166;
    char *t167;
    char *t168;
    char *t169;
    char *t170;
    char *t171;

LAB0:    t1 = (t0 + 6048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2688U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t17 = *((unsigned int *)t4);
    t18 = (~(t17));
    t19 = *((unsigned int *)t12);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t21, 8);

LAB16:    t160 = (t0 + 6848);
    t167 = (t160 + 56U);
    t168 = *((char **)t167);
    t169 = (t168 + 56U);
    t170 = *((char **)t169);
    memcpy(t170, t3, 8);
    xsi_driver_vfirst_trans(t160, 0, 31);
    t171 = (t0 + 6448);
    *((int *)t171) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = ((char*)((ng5)));
    goto LAB9;

LAB10:    t23 = (t0 + 2368U);
    t24 = *((char **)t23);
    t23 = ((char*)((ng2)));
    memset(t25, 0, 8);
    t26 = (t24 + 4);
    t27 = (t23 + 4);
    t28 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t23);
    t30 = (t28 ^ t29);
    t31 = *((unsigned int *)t26);
    t32 = *((unsigned int *)t27);
    t33 = (t31 ^ t32);
    t34 = (t30 | t33);
    t35 = *((unsigned int *)t26);
    t36 = *((unsigned int *)t27);
    t37 = (t35 | t36);
    t38 = (~(t37));
    t39 = (t34 & t38);
    if (t39 != 0)
        goto LAB20;

LAB17:    if (t37 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t25) = 1;

LAB20:    memset(t22, 0, 8);
    t41 = (t25 + 4);
    t42 = *((unsigned int *)t41);
    t43 = (~(t42));
    t44 = *((unsigned int *)t25);
    t45 = (t44 & t43);
    t46 = (t45 & 1U);
    if (t46 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t41) != 0)
        goto LAB23;

LAB24:    t48 = (t22 + 4);
    t49 = *((unsigned int *)t22);
    t50 = *((unsigned int *)t48);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB25;

LAB26:    t54 = *((unsigned int *)t22);
    t55 = (~(t54));
    t56 = *((unsigned int *)t48);
    t57 = (t55 || t56);
    if (t57 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t48) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t22) > 0)
        goto LAB31;

LAB32:    memcpy(t21, t58, 8);

LAB33:    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t16, 32, t21, 32);
    goto LAB16;

LAB14:    memcpy(t3, t16, 8);
    goto LAB16;

LAB19:    t40 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t22) = 1;
    goto LAB24;

LAB23:    t47 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB24;

LAB25:    t52 = (t0 + 3648U);
    t53 = *((char **)t52);
    goto LAB26;

LAB27:    t52 = (t0 + 2368U);
    t60 = *((char **)t52);
    t52 = ((char*)((ng6)));
    memset(t61, 0, 8);
    t62 = (t60 + 4);
    t63 = (t52 + 4);
    t64 = *((unsigned int *)t60);
    t65 = *((unsigned int *)t52);
    t66 = (t64 ^ t65);
    t67 = *((unsigned int *)t62);
    t68 = *((unsigned int *)t63);
    t69 = (t67 ^ t68);
    t70 = (t66 | t69);
    t71 = *((unsigned int *)t62);
    t72 = *((unsigned int *)t63);
    t73 = (t71 | t72);
    t74 = (~(t73));
    t75 = (t70 & t74);
    if (t75 != 0)
        goto LAB37;

LAB34:    if (t73 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t61) = 1;

LAB37:    memset(t59, 0, 8);
    t77 = (t61 + 4);
    t78 = *((unsigned int *)t77);
    t79 = (~(t78));
    t80 = *((unsigned int *)t61);
    t81 = (t80 & t79);
    t82 = (t81 & 1U);
    if (t82 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t77) != 0)
        goto LAB40;

LAB41:    t84 = (t59 + 4);
    t85 = *((unsigned int *)t59);
    t86 = *((unsigned int *)t84);
    t87 = (t85 || t86);
    if (t87 > 0)
        goto LAB42;

LAB43:    t90 = *((unsigned int *)t59);
    t91 = (~(t90));
    t92 = *((unsigned int *)t84);
    t93 = (t91 || t92);
    if (t93 > 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t84) > 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t59) > 0)
        goto LAB48;

LAB49:    memcpy(t58, t94, 8);

LAB50:    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t21, 32, t53, 32, t58, 32);
    goto LAB33;

LAB31:    memcpy(t21, t53, 8);
    goto LAB33;

LAB36:    t76 = (t61 + 4);
    *((unsigned int *)t61) = 1;
    *((unsigned int *)t76) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t59) = 1;
    goto LAB41;

LAB40:    t83 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t83) = 1;
    goto LAB41;

LAB42:    t88 = (t0 + 3008U);
    t89 = *((char **)t88);
    goto LAB43;

LAB44:    t88 = (t0 + 2368U);
    t96 = *((char **)t88);
    t88 = ((char*)((ng7)));
    memset(t97, 0, 8);
    t98 = (t96 + 4);
    t99 = (t88 + 4);
    t100 = *((unsigned int *)t96);
    t101 = *((unsigned int *)t88);
    t102 = (t100 ^ t101);
    t103 = *((unsigned int *)t98);
    t104 = *((unsigned int *)t99);
    t105 = (t103 ^ t104);
    t106 = (t102 | t105);
    t107 = *((unsigned int *)t98);
    t108 = *((unsigned int *)t99);
    t109 = (t107 | t108);
    t110 = (~(t109));
    t111 = (t106 & t110);
    if (t111 != 0)
        goto LAB54;

LAB51:    if (t109 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t97) = 1;

LAB54:    memset(t95, 0, 8);
    t113 = (t97 + 4);
    t114 = *((unsigned int *)t113);
    t115 = (~(t114));
    t116 = *((unsigned int *)t97);
    t117 = (t116 & t115);
    t118 = (t117 & 1U);
    if (t118 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t113) != 0)
        goto LAB57;

LAB58:    t120 = (t95 + 4);
    t121 = *((unsigned int *)t95);
    t122 = *((unsigned int *)t120);
    t123 = (t121 || t122);
    if (t123 > 0)
        goto LAB59;

LAB60:    t126 = *((unsigned int *)t95);
    t127 = (~(t126));
    t128 = *((unsigned int *)t120);
    t129 = (t127 || t128);
    if (t129 > 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t120) > 0)
        goto LAB63;

LAB64:    if (*((unsigned int *)t95) > 0)
        goto LAB65;

LAB66:    memcpy(t94, t130, 8);

LAB67:    goto LAB45;

LAB46:    xsi_vlog_unsigned_bit_combine(t58, 32, t89, 32, t94, 32);
    goto LAB50;

LAB48:    memcpy(t58, t89, 8);
    goto LAB50;

LAB53:    t112 = (t97 + 4);
    *((unsigned int *)t97) = 1;
    *((unsigned int *)t112) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t95) = 1;
    goto LAB58;

LAB57:    t119 = (t95 + 4);
    *((unsigned int *)t95) = 1;
    *((unsigned int *)t119) = 1;
    goto LAB58;

LAB59:    t124 = (t0 + 3168U);
    t125 = *((char **)t124);
    goto LAB60;

LAB61:    t124 = (t0 + 2368U);
    t132 = *((char **)t124);
    t124 = ((char*)((ng8)));
    memset(t133, 0, 8);
    t134 = (t132 + 4);
    t135 = (t124 + 4);
    t136 = *((unsigned int *)t132);
    t137 = *((unsigned int *)t124);
    t138 = (t136 ^ t137);
    t139 = *((unsigned int *)t134);
    t140 = *((unsigned int *)t135);
    t141 = (t139 ^ t140);
    t142 = (t138 | t141);
    t143 = *((unsigned int *)t134);
    t144 = *((unsigned int *)t135);
    t145 = (t143 | t144);
    t146 = (~(t145));
    t147 = (t142 & t146);
    if (t147 != 0)
        goto LAB71;

LAB68:    if (t145 != 0)
        goto LAB70;

LAB69:    *((unsigned int *)t133) = 1;

LAB71:    memset(t131, 0, 8);
    t149 = (t133 + 4);
    t150 = *((unsigned int *)t149);
    t151 = (~(t150));
    t152 = *((unsigned int *)t133);
    t153 = (t152 & t151);
    t154 = (t153 & 1U);
    if (t154 != 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t149) != 0)
        goto LAB74;

LAB75:    t156 = (t131 + 4);
    t157 = *((unsigned int *)t131);
    t158 = *((unsigned int *)t156);
    t159 = (t157 || t158);
    if (t159 > 0)
        goto LAB76;

LAB77:    t162 = *((unsigned int *)t131);
    t163 = (~(t162));
    t164 = *((unsigned int *)t156);
    t165 = (t163 || t164);
    if (t165 > 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t156) > 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t131) > 0)
        goto LAB82;

LAB83:    memcpy(t130, t166, 8);

LAB84:    goto LAB62;

LAB63:    xsi_vlog_unsigned_bit_combine(t94, 32, t125, 32, t130, 32);
    goto LAB67;

LAB65:    memcpy(t94, t125, 8);
    goto LAB67;

LAB70:    t148 = (t133 + 4);
    *((unsigned int *)t133) = 1;
    *((unsigned int *)t148) = 1;
    goto LAB71;

LAB72:    *((unsigned int *)t131) = 1;
    goto LAB75;

LAB74:    t155 = (t131 + 4);
    *((unsigned int *)t131) = 1;
    *((unsigned int *)t155) = 1;
    goto LAB75;

LAB76:    t160 = (t0 + 3488U);
    t161 = *((char **)t160);
    goto LAB77;

LAB78:    t160 = (t0 + 3648U);
    t166 = *((char **)t160);
    goto LAB79;

LAB80:    xsi_vlog_unsigned_bit_combine(t130, 32, t161, 32, t166, 32);
    goto LAB84;

LAB82:    memcpy(t130, t161, 8);
    goto LAB84;

}


extern void work_m_00000000002586397858_0757879789_init()
{
	static char *pe[] = {(void *)Cont_40_0,(void *)Cont_48_1,(void *)Cont_49_2,(void *)Cont_50_3,(void *)Cont_51_4,(void *)Cont_54_5};
	xsi_register_didat("work_m_00000000002586397858_0757879789", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000002586397858_0757879789.didat");
	xsi_register_executes(pe);
}
