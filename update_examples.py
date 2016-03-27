#!/usr/bin/env python
# -*- coding: utf8 -*-
#
# Update all examples
#

from os import chdir, system, unlink
from os.path import getmtime, exists
from glob import glob
from shutil import copyfile

# exnnn
for dir in glob("ex*"):
    print(dir)
    chdir(dir)

    # bash script
    script = glob(dir + ".sh")[0]
    cmd = "bash " + script
    # perl script
    if not script:
        script = glob(dir + ".pl")[0]
        cmd = "perl " + script
    # python script
    if not script:
        script = glob(dir + ".py")[0]
        cmd = "python " + script

    # PNG
    png = dir + ".png"
    if (not exists(png) or getmtime(script) > getmtime(png)):
        system(cmd)
        ps = dir + ".ps"
        system("gmt psconvert -A -P -E50 -Tg -Fthumbnail." + dir + ".png " + ps)
        system("gmt psconvert -A -P -Tg " + ps)
        copyfile(script, "../_includes/" + script)
    chdir("..")

# animxx
for dir in glob("anim*"):
    print(dir)
    chdir(dir)

    # bash script
    script = glob(dir + ".sh")[0]
    cmd = "bash " + script + " 1 "
    # perl script
    if not script:
        script = glob(dir + ".pl")[0]
        cmd = "perl " + script
    # python script
    if not script:
        script = glob(dir + ".py")[0]
        cmd = "python " + script

    # PNG
    gif = dir + ".gif"
    if (not exists(gif) or getmtime(script) > getmtime(gif)):
        system(cmd)
        copyfile(gif, "thumbnail." + gif)
        copyfile(script, "../_includes/" + script)
    chdir("..")
