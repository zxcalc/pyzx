# Synthesized by applying the method "Reversible Circuit Synthesis Using a Cycle-Based Approach" (http://arxiv.org/abs/1004.4320)
# (c) Copyright 2007-2010 Mehdi Saeedi  Morteza Saheb Zamani  Mehdi Sedighi  and Zahra Sasanian (http://ceit.aut.ac.ir/QDA/)
# Distributing this file without an express written permission or erasing this note is prohibited.
.v a b c d e f 0
.i a b c d e f
.o a b c d e f
BEGIN
X a
tof c a
H c
Z a b c
H c
tof f d
tof e f
H b
Z a c b
H b
H f
Z a c f
H f
X c
tof b d
X b
H f
Z b d f
H f
tof f e
tof a b
tof b a
tof a e
tof a b
X c
H d
Z b c d
H d
tof b f
X f
H c
Z e f c
H c
H 0
Z c e 0
H 0
H b
Z 0 f b
H b
H 0
Zd c e 0
H 0
tof f a
tof a d
tof f c
H f
Z b c f
H f
tof d e
tof d b
tof e a
H f
Z c e f
H f
tof f c
tof e f
H d
Z b e d
H d
H f
Z a d f
H f
X a
tof a c
H a
Z b e a
H a
tof d c
H b
Z a c b
H b
tof b a
tof c e
X c
tof b c
tof a b
tof d e
tof f d
X f
END

