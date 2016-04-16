#!/bin/bash
#   绘制2D矢量场以及矢量场的等值线
#
# GMT模块 : grdmath, grdcontour, grdvector, pstext
# Unix命令: echo, rm
#
ps=ex013.ps

# 生成 z = x exp(-x^2-y^2)
gmt grdmath -R-2/2/-2/2 -I0.1 X Y R2 NEG EXP X MUL = z.nc
# 计算X和Y方向的偏导
gmt grdmath z.nc DDX = dzdx.nc
gmt grdmath z.nc DDY = dzdy.nc
# 绘制X方向偏导的等值线
gmt grdcontour dzdx.nc -JX3i -B1 -BWSne -C0.1 -A0.5 -K -P -Gd2i -S4 -T+d0.1i/0.03i > $ps
# 绘制Y方向偏导的等值线
gmt grdcontour dzdy.nc -J -B -C0.05 -A0.2 -O -K -Gd2i -S4 -T+d0.1i/0.03i -Xa3.45i >> $ps
# 绘制Z等值线
gmt grdcontour z.nc -J -B -C0.05 -A0.1 -O -K -Gd2i -S4 -T+d0.1i/0.03i -Y3.45i >> $ps
# 绘制Z等值线
gmt grdcontour z.nc -J -B -C0.05 -O -K -Gd2i -S4 -X3.45i >> $ps
# 绘制矢量场
gmt grdvector dzdx.nc dzdy.nc -I0.2 -J -O -K -Q0.1i+e+n0.25i -Gblack -W1p -S5i \
	--MAP_VECTOR_SHAPE=0.5 >> $ps
# 加标题
echo "3.2 3.6 z(x,y) = x@~\327@~exp(-x@+2@+-y@+2@+)" \
	| gmt pstext -R0/6/0/4.5 -Jx1i -F+f40p,Times-Italic+jCB -O -X-3.45i >> $ps
rm -f z.nc dzdx.nc dzdy.nc
rm gmt.*
