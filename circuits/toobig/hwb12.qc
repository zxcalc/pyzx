# Synthesized by applying the method "Reversible Circuit Synthesis Using a Cycle-Based Approach" (http://arxiv.org/abs/1004.4320)
# (c) Copyright 2007-2010 Mehdi Saeedi  Morteza Saheb Zamani  Mehdi Sedighi  and Zahra Sasanian (http://ceit.aut.ac.ir/QDA/)
# Distributing this file without an express written permission or erasing this note is prohibited.
.v a b c d e f g h i j k l 0 1 2 3 4 5 6 7
.i a b c d e f g h i j k l
.o a b c d e f g h i j k l
BEGIN
X a
tof a c
tof c a
tof c d
tof c e
tof d i
tof i c
tof i d
tof i f
tof e j
tof j e
tof j g
tof j i
tof d l
tof l c
tof l d
tof l g
tof l h
tof l i
tof l j
tof e k
tof k e
tof k g
tof k h
tof k j
tof k i
tof k l
tof e f
tof e i
tof e a
tof a e
tof e a
tof e l
tof e c
tof e b
H e
Z l c e
H e
tof e f
tof e i
H e
Z l b e
H e
tof e f
tof e i
tof f l
tof f k
tof f h
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f h
tof f k
tof f l
tof e i
tof e f
H e
Z l b e
H e
tof e i
tof e f
H e
Z l c e
H e
tof e i
tof e f
tof e b
tof e a
tof e c
tof e l
tof a i
tof a f
tof a e
tof e a
tof j i
tof l j
tof l h
tof l g
tof k l
tof k e
tof e k
tof l d
tof l c
tof d l
tof j g
tof j e
tof e j
tof i f
tof i d
tof i c
tof d i
tof c e
tof c d
tof a c
tof a b
X a
tof c a
tof a c
tof c d
tof d i
tof i d
tof i c
tof c f
tof i e
tof i g
tof e j
tof j e
tof j f
tof j g
tof j i
tof j h
tof e l
tof l e
tof l g
tof l h
tof l i
tof k c
tof k d
tof k f
tof e a
tof a e
tof a g
tof a i
tof f l
tof e f
tof f b
H f
Z l c f
H f
tof e a
tof e h
tof d e
tof e j
H e
Z l b e
H e
tof d k
tof d b
tof d c
tof d g
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d g
tof d e
tof d c
tof d b
tof d k
H e
Z l b e
H e
tof e j
tof e h
tof e f
tof e a
tof e b
H f
Z l c f
H f
tof f b
tof f l
tof a i
tof a g
tof a e
tof e a
tof k f
tof c d
tof k c
tof l i
tof l h
tof l g
tof l e
tof e l
tof j i
tof j h
tof j g
tof j f
tof j e
tof e j
tof i g
tof i f
tof i e
tof i c
tof d i
tof c f
tof c b
X b
tof c g
tof c h
tof g i
tof i c
tof i g
tof i h
tof i j
tof i k
tof a j
tof j a
tof j c
tof j d
tof j g
tof k j
tof d l
X d
tof l h
tof j h
tof l d
tof l c
tof l f
tof l g
tof h l
tof l j
tof k a
tof k c
tof k i
tof e a
tof a c
tof a e
tof a g
tof h c
tof h a
H h
Z l c h
H h
tof h l
tof h b
tof h c
tof h k
H h
Z l b h
H h
tof h k
tof h b
tof h c
H h
Z l k h
H h
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H h
Z l k h
H h
tof h c
tof h b
tof h k
H h
Z l b h
H h
tof h k
tof h c
tof h b
tof h l
H h
Z c l h
H h
tof l c
tof l j
tof h l
tof h a
tof a g
tof a e
tof a c
tof e a
tof j a
tof k j
tof i h
tof i c
tof k i
tof l h
tof l g
tof l f
tof l d
tof d l
tof j h
tof j g
tof j d
tof j c
tof a j
tof i k
tof i j
tof i g
tof c g
tof g i
tof i a
X i
tof c h
tof c a
tof f c
tof c b
X c
tof c f
tof c l
tof l c
tof i l
tof i j
tof j b
tof j d
tof j i
tof l a
tof l d
tof l e
tof l h
tof l j
tof a k
tof k a
tof k g
tof k h
tof k i
tof d a
tof b d
tof a b
tof a c
tof a i
tof a j
tof h l
tof c k
tof h c
H h
Z l c h
H h
tof c d
tof c j
tof l j
H j
Z c l j
H j
H c
Z b l c
H c
tof c d
tof k j
tof c k
tof b f
tof b g
tof b i
H b
Z k l b
H b
tof b d
tof b f
tof b g
tof b i
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X e
X h
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof c b
tof c a
tof j a
tof b a
tof a k
tof k j
tof l j
tof a l
H j
Z b l j
H j
H j
Z c l j
H j
tof b i
tof b g
tof b f
tof b d
H b
Z l k b
H b
tof b j
tof b i
tof b g
tof b f
tof b d
tof c k
tof c d
H c
Z l b c
H c
tof c k
tof c j
tof c d
H h
Z c l h
H h
tof l c
tof h l
tof h k
tof a i
tof a d
tof a c
tof a b
tof d a
tof k i
tof k h
tof k g
tof k a
tof a k
tof l j
tof l h
tof l e
tof l d
tof l a
tof j i
tof j d
tof j b
tof i j
tof c l
tof i c
X i
tof i a
tof c f
tof f c
tof f b
tof c a
tof c d
tof g i
tof i c
tof c g
tof c j
tof i l
tof l i
tof i k
tof a j
tof j f
tof l f
tof f a
tof f k
X f
tof k f
tof a j
tof j k
tof l g
tof l h
tof k g
tof k l
tof a c
tof a l
tof a b
tof a d
tof a e
H a
Z l c a
H a
tof a b
tof a d
tof e h
tof e i
tof a e
tof a j
tof e l
tof e b
tof e a
tof a e
tof e c
H e
Z l b e
H e
tof a b
tof a h
tof a i
H a
Z l k a
H a
tof a b
tof a c
tof a e
tof a h
tof i k
tof a i
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof j a
tof b j
tof c k
tof i l
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X f
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a h
tof a e
tof a c
tof a b
H a
Z l k a
H a
tof a i
tof a h
tof a e
tof a c
tof a b
H e
Z l b e
H e
tof e i
tof e h
tof e c
tof a b
tof e a
tof e l
tof a j
tof a i
tof a h
tof a e
tof a d
H a
Z l c a
H a
tof a j
tof a e
tof a d
tof a b
tof a l
tof a f
tof a c
tof k f
tof f a
tof k l
tof l k
tof k g
tof a k
tof l i
tof l h
tof l f
tof j a
tof a j
tof i l
tof i k
tof i j
tof c g
tof i c
tof g i
tof j d
tof c j
tof c b
tof a e
tof a c
X a
tof c a
tof a c
tof c b
tof i c
tof c d
tof j c
tof c h
tof i e
tof j f
tof d k
tof k d
tof k c
tof l k
tof k b
tof k h
tof k i
tof f a
tof a b
tof a f
tof c l
H c
Z b i c
H c
tof b i
tof c l
tof a b
tof a k
H a
Z l c a
H a
tof a b
tof b i
tof a j
tof a k
tof e l
tof e b
tof e a
tof e f
tof e g
tof e j
H e
Z l b e
H e
tof d l
tof d k
tof d c
tof d g
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d c
tof d k
tof d l
H e
Z l b e
H e
tof e j
tof e g
tof e f
tof a b
tof e a
tof e l
tof a k
tof a j
tof a i
H a
Z l c a
H a
tof a k
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a f
tof a b
tof f a
tof i h
tof k i
tof k d
tof k c
tof k b
tof d k
tof c d
tof l c
tof j h
tof j f
tof i j
tof j c
tof c b
X b
tof c g
tof c k
tof a j
tof j a
tof j c
tof j e
tof j g
tof j h
tof d j
tof j k
tof a l
tof l a
tof l e
tof l g
tof l i
tof l j
tof k e
tof k l
tof h a
tof a c
tof a h
tof a l
tof d c
tof d a
H d
Z l c d
H d
tof f b
tof f g
H f
Z l b f
H f
H l
Z j k l
H l
tof k j
H a
Z k l a
H a
tof l j
tof a k
tof c b
H j
Z b l j
H j
tof a l
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H a
Z l k a
H a
H l
Z j k l
H l
H f
Z l b f
H f
tof f g
tof f b
H d
Z l c d
H d
tof d k
tof d j
tof d e
tof a c
tof a l
tof d a
tof a h
tof h a
tof l e
tof k l
tof l j
tof l i
tof l g
tof l a
tof a l
tof j k
tof j h
tof j g
X e
tof c e
tof j c
tof j a
tof a j
tof i j
tof i e
tof c k
tof c h
tof c g
tof c a
X a
tof a c
tof c e
tof i h
tof c i
tof c k
tof i a
tof i c
tof i j
tof j d
tof j e
tof j i
tof j k
tof e l
tof l c
tof l e
tof l k
tof a k
tof k a
tof k g
tof k i
tof e g
tof e a
tof a e
tof a h
tof i k
tof a i
tof a l
H l
Z i j l
H l
H c
Z i j c
H c
tof i j
H i
Z c l i
H i
tof e i
tof k j
tof i k
tof e b
tof e a
tof e c
tof e f
H e
Z l b e
H e
tof e l
tof e b
tof e i
X e
X d
tof e h
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e i
tof e h
tof e b
tof e l
H e
Z l b e
H e
tof i j
tof i k
tof e i
tof e g
tof e f
tof e c
tof e a
tof e b
H i
Z l c i
H i
tof i k
tof i j
H c
Z i j c
H c
H l
Z i j l
H l
tof a l
tof k i
tof a k
tof a h
tof a g
tof a e
tof e a
tof k g
tof k a
tof a k
tof l k
tof l e
tof l c
tof e l
tof j k
tof j i
tof j e
tof j d
tof i j
tof c h
tof i c
tof i a
tof c k
tof c i
tof c e
X c
tof d c
tof c d
tof c e
tof c h
tof c j
tof c k
tof a i
tof i a
tof i c
tof i h
tof i k
tof j i
tof j f
tof i l
tof d l
tof l d
tof l e
tof l h
tof k a
tof k c
tof k d
tof k i
tof a k
tof k l
tof a d
tof a e
tof a h
tof d a
tof a i
tof e l
tof e c
tof d e
tof e f
tof e g
H e
Z l c e
H e
tof d l
tof d b
tof d c
tof k j
tof d k
H d
Z l b d
H d
tof d l
tof d c
tof d e
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d e
tof d c
tof d l
H d
Z l b d
H d
tof d k
tof d j
tof d i
tof d g
tof d f
tof d e
tof d c
tof d a
tof d b
tof d l
H e
Z l c e
H e
tof e g
tof e f
tof e c
tof a e
tof e l
tof k i
tof a k
tof a h
tof k a
tof a d
tof k l
tof k c
tof l h
tof l e
tof l d
tof d l
tof i l
tof j i
tof j f
tof i k
tof c h
tof i c
tof i a
tof a i
tof c k
tof c j
tof c e
tof c d
tof d c
X b
X k
tof f i
tof f c
tof i f
tof c f
tof c k
tof i b
tof i j
tof i k
tof a j
tof j a
tof j k
tof a l
tof l a
tof l b
tof l e
tof l j
tof a k
tof k a
tof k c
tof k f
tof k g
tof k h
tof a k
tof k i
tof k j
tof a b
tof a e
tof a f
tof a g
tof h l
tof a h
tof h c
tof h k
H h
Z l c h
H h
tof f b
tof f a
tof f c
tof f i
tof k j
tof f k
tof f j
X f
H f
Z b l f
H f
tof l j
X j
tof f j
tof a d
tof a h
tof a i
tof a j
H a
Z l k a
H a
tof a d
tof a h
tof a i
tof a j
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a h
tof a d
H a
Z l k a
H a
tof a j
tof a i
tof a h
tof a d
H f
Z l b f
H f
tof f k
tof f j
tof f i
tof f c
tof f a
tof a f
tof f b
H h
Z l c h
H h
tof h k
tof h c
tof a h
tof h l
tof k j
tof k i
tof k g
tof a k
tof a e
tof k h
tof c f
tof k c
tof k a
tof a k
X j
tof l j
tof e b
tof l e
tof l a
tof a l
tof j a
tof j k
tof a j
tof i k
tof i j
tof i f
tof i b
tof f i
tof c k
tof f c
X c
tof c a
tof c b
tof c f
tof g i
tof i c
tof c g
tof c l
tof i b
tof j l
tof l j
tof l i
tof i k
tof a j
tof j a
tof l b
tof l f
tof l g
tof a k
tof k a
tof k f
tof k g
tof k h
tof k j
tof k l
tof a b
tof a c
tof a g
tof a j
tof e l
tof e c
tof e f
tof e h
tof e j
tof l j
H e
Z c l e
H e
tof e c
tof e l
X e
tof e h
H e
Z b l e
H e
tof d k
tof d a
tof d b
tof d g
tof d h
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d h
tof d g
tof d b
tof d a
tof d k
H e
Z l b e
H e
tof e j
tof e h
tof e c
tof e l
H e
Z l c e
H e
tof e j
tof e h
tof e c
tof e l
tof a j
tof a g
tof c b
tof a c
tof l j
tof k l
tof k h
tof k g
tof k f
tof l a
tof k a
tof a k
tof i g
tof l i
tof l f
tof l b
tof a l
tof j a
tof a j
tof i l
tof i k
tof g i
tof i g
tof g c
tof c i
tof c l
tof c f
tof a d
tof a c
X a
tof c a
tof a c
tof c b
tof c f
tof c g
tof c j
tof c l
tof i b
tof j c
tof i j
tof d b
tof j d
tof j f
tof l g
tof j l
tof l c
tof l f
tof l h
tof g k
tof k c
tof k g
tof k h
tof h a
tof a b
tof a h
tof a k
tof d l
tof d c
tof d h
H d
Z l c d
H d
H e
Z l b e
H e
H l
Z j k l
H l
tof k j
H a
Z k l a
H a
tof l j
tof a k
tof c b
H j
Z b l j
H j
tof a l
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H a
Z l k a
H a
H l
Z j k l
H l
H e
Z l b e
H e
tof e f
tof e b
H d
Z c l d
H d
tof l c
tof d l
tof d h
tof d b
tof a k
tof a h
tof a b
tof h a
tof k h
tof k g
tof k c
tof g k
tof l h
tof j l
tof l g
tof l f
X f
tof j d
tof i j
tof j c
tof j b
tof i g
tof c j
tof c d
X d
X e
tof c e
tof c k
tof i e
tof i f
tof e j
tof j b
tof j c
tof j e
tof j f
tof j g
tof j k
tof j l
tof l k
tof l c
tof l e
tof l g
tof l i
tof g k
tof k c
tof k g
tof k h
tof e a
tof a e
tof a f
tof e i
tof e j
tof e k
H e
Z l c e
H e
tof e i
tof e j
tof d e
tof e k
tof f l
tof f a
tof d f
tof f i
tof f j
H f
Z l b f
H f
tof d l
tof d c
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d f
tof d e
tof d c
tof d k
tof d l
H f
Z l b f
H f
tof f j
tof f i
tof f a
tof f l
tof e k
tof e j
tof e i
H e
Z l c e
H e
tof e k
tof e j
tof e i
tof a f
tof a e
tof e a
tof k h
tof k g
tof k c
tof l g
tof j g
tof g k
tof l i
tof j l
tof l e
tof l c
tof c l
tof j f
tof j b
tof e j
tof e f
tof c e
tof i e
X e
tof c k
tof c g
tof a c
tof c a
X a
tof a c
tof a b
tof c g
tof c h
tof c i
tof a i
tof i a
tof i b
tof i c
tof i e
tof i d
tof i g
tof k h
tof j k
tof j l
tof i j
tof j i
tof j c
tof j e
tof e f
tof j d
tof l b
tof l f
tof k b
tof k e
tof k i
tof k j
tof k l
tof h a
tof a b
tof a c
tof a h
tof a i
tof a j
H a
Z l c a
H a
H l
Z c k l
H l
H b
Z c k b
H b
tof a c
tof a k
H a
Z l b a
H a
tof a c
tof a k
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof a k
tof a c
H a
Z l b a
H a
tof a k
tof a c
tof l b
H l
Z c k l
H l
H a
Z l c a
H a
tof j i
tof a j
tof a h
tof a c
tof a b
tof h a
tof k l
tof j h
tof j e
tof k j
tof i j
tof j l
tof l f
tof j k
tof j d
tof j c
tof i h
tof i g
tof i e
tof i b
X i
tof i a
tof c a
tof a i
tof c h
tof c g
X c
tof a b
tof b a
tof b g
tof d c
tof c d
tof c j
tof e i
tof i e
tof i k
tof a j
tof j a
tof j g
tof f l
tof l f
tof l i
tof h k
tof k b
tof k h
tof d a
tof a b
tof a c
tof d e
tof d h
tof d i
tof a d
tof a k
H l
Z j k l
H l
H c
Z j k c
H c
tof j k
H j
Z l c j
H j
tof g j
tof d g
tof g j
tof j k
H d
Z l b d
H d
tof d e
tof d g
tof d h
tof d i
tof d j
tof d k
H l
Z c a l
H l
H k
Z c a k
H k
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
tof d e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
H a
Z l k a
H a
tof a j
tof a c
H k
Z c a k
H k
H l
Z c a l
H l
tof j k
tof d j
tof d i
tof d h
tof d g
H d
Z l b d
H d
tof d j
tof d g
tof a d
tof d i
tof d h
tof d e
H j
Z l c j
H j
tof j k
tof c l
H c
Z j k c
H c
tof c l
tof a k
tof a c
tof a b
tof d a
tof k h
tof k b
tof h k
tof l i
tof j g
tof j a
tof a j
tof i k
tof i e
tof e i
tof c j
tof c d
tof d c
tof b g
tof b a
X a
tof a b
X c
tof i b
tof c i
tof i a
tof i g
tof i k
tof j b
tof l b
tof a j
tof j a
tof l c
tof l g
tof e l
tof l i
tof g k
tof k c
tof e k
tof k g
tof k h
tof a g
H e
Z l c e
H e
tof e g
H e
Z l b e
H e
tof d e
tof d k
X e
tof e g
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
tof e g
X e
X d
X f
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d e
tof d k
H e
Z l b e
H e
tof e g
H e
Z l c e
H e
tof e k
tof e i
tof e h
tof e g
tof e l
tof a g
tof a b
tof k h
tof k g
tof k c
tof g k
tof i g
tof l i
tof l f
tof c b
tof l c
tof f l
tof c j
tof j a
tof i k
tof c i
tof d c
tof d b
tof c d
X d
tof c j
tof i d
tof i g
tof i l
tof j a
tof a l
tof a c
tof l a
tof l f
tof l g
tof l h
tof l k
tof g k
tof k c
tof k g
tof a k
tof k h
tof a d
tof d a
tof a b
tof d c
tof d g
tof d i
tof d k
tof d j
X d
H d
Z c l d
H d
tof l j
X j
tof d j
tof e b
tof e f
H e
Z l b e
H e
tof a b
tof a e
tof a g
tof a i
tof a j
H a
Z l k a
H a
tof a b
tof a e
tof a g
tof a i
tof a j
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
X h
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof j a
tof c b
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a g
tof a e
tof a b
H a
Z l k a
H a
tof a j
tof a i
tof a g
tof a e
tof a b
H e
Z l b e
H e
tof e f
tof e b
H d
Z l c d
H d
tof d k
tof d i
tof d g
tof a b
tof d a
tof a d
tof d c
tof k h
tof a k
tof k g
tof k c
tof l c
tof l g
tof l h
tof l f
tof l a
tof a l
tof i j
tof c j
tof c a
tof i l
tof i d
tof c d
tof c b
tof d c
X d
X e
tof e c
tof c b
tof c e
tof c k
tof i e
tof e l
tof l b
tof l c
tof l e
tof f i
tof l f
tof l j
tof k c
tof k g
tof a k
tof k h
tof h k
tof a f
tof a l
tof h l
tof h i
tof f h
tof h j
H h
Z l c h
H h
tof f l
tof f g
H f
Z l b f
H f
tof d l
tof d k
tof d f
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d f
tof d k
tof d l
H f
Z l b f
H f
tof f j
tof f i
tof f h
tof f g
tof f l
H h
Z l c h
H h
tof h j
tof a h
tof h k
tof l i
tof h l
tof a f
tof k h
tof k g
tof k c
tof g k
tof l j
tof l f
tof l e
tof c b
tof l c
X b
tof i e
tof e l
tof j a
tof a j
tof i b
tof c k
tof c e
tof e c
X c
X d
tof c a
tof c f
tof c h
tof c j
tof i d
tof i e
tof i j
tof i k
tof a j
tof j a
tof j b
tof g h
X g
tof j g
tof g h
tof j f
tof f b
tof l f
tof l e
tof l g
tof f k
tof k f
tof k c
tof k i
tof f l
tof k l
tof f a
tof a f
tof a c
tof a g
tof a j
tof f h
tof f i
tof f j
H f
Z l c f
H f
tof d l
tof d a
tof d c
tof d e
tof d g
tof d j
H d
Z l b d
H d
tof d k
tof d a
tof d b
tof d e
tof d f
tof d g
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d f
tof d e
tof d b
tof d a
tof d k
H d
Z l b d
H d
tof d j
tof d g
tof d e
tof d c
tof d a
tof d l
H f
Z l c f
H f
tof f j
tof f i
tof f h
tof a f
tof l b
tof f l
tof k l
X b
tof j g
tof a j
tof a c
tof f a
tof k i
tof k f
tof k c
tof f k
tof l g
tof l f
tof l e
tof j h
tof c f
tof j f
tof j b
tof i a
tof c a
tof i l
tof i k
tof i e
tof i d
tof c h
tof f c
X f
tof c f
X d
X g
tof c b
tof c l
tof i f
tof a l
tof l a
tof l b
tof g k
tof l g
tof k g
tof k c
tof k h
tof f a
tof a b
tof a c
tof a f
tof a g
tof a h
tof a k
tof a l
tof h l
tof h c
tof e h
tof h b
tof h i
H h
Z l c h
H h
tof e l
tof e a
tof e c
tof e f
tof e k
H e
Z l b e
H e
tof d l
tof d k
tof d f
tof d g
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d f
tof d k
tof d l
H e
Z l b e
H e
tof e k
tof e i
tof e h
tof e f
tof e c
tof a b
tof e a
tof e l
H h
Z l c h
H h
tof h i
tof h b
tof a h
tof h c
tof h l
tof k g
tof a k
tof a f
tof f a
tof k h
tof k c
tof l g
tof g k
tof l b
tof l a
tof i j
tof a l
tof i a
tof i g
tof i f
tof c l
tof c f
X c
tof c b
tof f c
X d
tof c i
tof c e
tof i b
tof i d
tof i f
tof i k
X g
tof l g
tof i l
tof j b
tof f h
X f
tof j f
tof f h
tof j e
tof l b
tof l d
tof l e
tof a k
tof k a
tof k c
tof d h
tof k d
tof e f
tof k e
tof k i
tof k l
tof a d
tof a j
tof d a
tof a l
tof e g
tof d e
H d
Z l c d
H d
tof e b
tof e a
tof e c
tof e h
tof e i
H e
Z l b e
H e
tof d k
tof d a
tof d b
tof d f
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d f
tof d b
tof d a
tof d k
H e
Z l b e
H e
tof e i
tof e h
tof e g
tof e f
tof e c
tof e a
tof e b
H d
Z l c d
H d
tof d h
tof d g
tof d f
tof d e
tof a l
tof d a
tof a d
tof j h
tof a j
tof k l
tof k i
tof k h
tof k f
tof k e
tof c d
tof k c
tof k a
tof a k
tof l g
tof l e
tof j f
tof i j
tof i l
tof c e
tof c g
tof c h
tof j h
tof j d
tof l j
tof l c
tof l f
tof l g
tof l i
tof l k
tof k c
tof k d
tof k g
tof k h
tof a c
tof a e
tof a i
tof a l
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
tof a k
H a
Z l c a
H a
tof a b
tof a i
tof a k
H l
Z b i l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b i l
H l
tof a k
tof a i
tof a b
H a
Z l c a
H a
tof a k
tof a i
tof a b
tof c l
H c
Z b i c
H c
tof c l
tof i b
tof l i
tof l b
tof a l
tof a e
tof a c
tof k h
tof l k
tof d g
tof c d
tof d g
tof k c
tof l j
tof l f
tof l b
tof j h
tof j e
tof j d
tof j b
tof j a
tof a j
tof i k
tof i j
tof i g
tof i f
tof i e
tof c j
tof c i
tof c h
tof c a
X c
X e
tof a c
tof c a
tof c f
tof c h
tof c i
tof c j
tof a i
tof i a
tof i b
tof i c
tof i d
tof i e
tof i g
tof i h
tof i l
tof e j
tof j c
tof j e
tof j g
tof j i
tof a j
tof j l
tof l a
tof l e
tof l f
tof h i
tof l h
tof a k
tof k c
tof k d
tof k f
tof k g
tof a b
tof a h
tof h l
tof h j
tof d h
tof h k
H h
Z l c h
H h
tof d l
tof d a
tof e g
tof d e
tof d i
H d
Z l b d
H d
tof e k
tof e b
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e g
tof e b
tof e k
H d
Z l b d
H d
tof d k
tof d i
tof d h
tof d g
tof d e
tof d a
tof d l
H h
Z l c h
H h
tof h k
tof h l
tof l h
tof a h
tof h j
tof h i
tof k g
tof k f
tof k d
tof k c
tof a k
tof a b
tof l f
tof l e
tof l a
tof a l
tof l g
tof i l
tof j i
tof j e
tof j c
tof e j
tof i h
tof i e
tof i d
tof i c
tof i b
tof i a
tof c a
tof a i
tof c j
tof c h
X c
tof c f
tof a c
X b
tof c a
tof c b
tof c e
tof c h
tof c i
tof c j
tof i d
tof i e
tof j i
tof i f
tof i l
tof i k
tof j b
tof j c
tof j d
tof l a
tof k c
tof k d
tof k e
tof k f
tof f a
tof a b
tof a f
tof a i
tof a j
tof a k
tof e c
tof e f
tof e k
H e
Z l c e
H e
tof d l
tof d b
tof d e
tof f g
tof d f
tof d j
X d
H d
Z b l d
H d
tof l j
X j
tof k j
tof f k
tof d j
tof f c
tof f h
H f
Z l k f
H f
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f j
tof f h
tof f g
tof f c
tof a f
tof f k
H d
Z l b d
H d
tof d g
tof d f
tof d e
tof d b
tof d l
H e
Z l c e
H e
tof e k
tof e f
tof k e
tof e c
tof j i
tof j b
tof a j
tof f a
tof j k
tof i k
tof k f
tof k d
tof l g
tof l a
tof j l
tof j g
tof j c
tof i l
tof i g
tof c i
tof i e
tof c h
tof a c
tof c a
X a
X j
tof c b
tof a c
X f
X d
tof i c
tof c g
tof i b
tof i d
tof i h
tof i j
tof j a
tof j b
tof j c
X j
tof j g
tof l b
tof l c
tof l e
tof l h
tof a k
tof a c
tof k a
tof k d
tof k i
tof k j
tof a b
tof a g
tof a i
tof a j
tof h l
tof h i
tof h j
tof h k
H h
Z l c h
H h
tof f b
tof f g
tof f j
X f
H f
Z b l f
H f
tof l j
tof f j
tof k j
tof d k
tof d c
tof d e
H d
Z l k d
H d
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof l j
tof a l
tof k j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d e
tof d c
tof d k
H f
Z l b f
H f
tof f g
tof f b
H h
Z l c h
H h
tof k j
tof k i
tof h k
tof h l
tof i g
tof i c
tof i b
tof a i
tof k d
tof k c
tof k a
tof a k
tof l h
tof c b
tof l c
tof c g
tof j c
tof j a
tof a j
X a
tof c a
tof a c
tof j h
tof i j
tof c i
tof c d
tof i c
tof c b
tof j k
tof i j
tof j i
tof k i
tof l j
tof j a
tof a j
tof l d
tof d b
tof k d
tof d k
tof k g
tof a b
tof a c
tof a e
tof a h
tof a l
tof d l
tof d c
tof d e
H d
Z l c d
H d
tof e b
X h
tof e g
tof e h
X e
tof e f
H e
Z l b e
H e
tof d l
tof d k
tof d a
tof d b
tof d f
tof h j
tof l j
tof d h
tof h j
X d
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d f
tof d b
tof d a
tof d k
tof d l
H e
Z l b e
H e
tof e h
tof e g
tof e f
tof a e
tof e b
H d
Z l c d
H d
tof k g
tof k b
tof d k
tof d e
tof d c
tof d l
tof l j
tof a l
tof a h
tof a c
tof k i
tof k d
tof l e
tof l d
tof l a
tof i k
tof i h
tof j i
X h
tof j a
tof i j
tof i d
tof c b
tof d i
tof i c
X d
tof c d
tof c i
tof c b
tof c j
tof h i
tof i h
tof i j
tof k i
tof i l
tof e b
tof e a
tof j e
tof j c
X j
tof a h
X h
tof l a
tof k c
tof d k
tof k g
tof f c
tof f a
tof f i
tof f j
H f
Z l c f
H f
tof e c
tof e i
X e
H e
Z b l e
H e
tof e j
tof d a
tof d i
H d
Z l k d
H d
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d g
tof k a
tof d k
H e
Z l b e
H e
tof e j
tof e i
tof e h
tof e c
tof e a
tof e b
H f
Z l c f
H f
tof f j
tof f i
tof f a
tof f c
tof k l
tof l a
tof a h
tof k i
tof k g
tof k c
tof j e
tof c b
tof j c
tof j a
tof i l
tof i j
tof i h
tof h i
tof c j
tof c d
tof d c
X d
X e
tof e c
tof c b
tof c e
tof c k
tof a i
tof a b
tof i a
tof i c
tof k d
tof i k
tof j h
tof i j
tof j b
tof j i
tof j e
tof l j
tof l b
tof l c
tof l d
tof l f
tof l h
tof k f
tof k g
tof e f
tof a e
tof a h
tof a i
tof a l
tof e l
tof e i
tof k j
tof e k
H e
Z l c e
H e
tof f l
tof f a
tof f c
tof d f
tof f i
X f
X e
tof f h
H f
Z l b f
H f
tof d l
tof d b
tof d e
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d f
tof d e
tof d b
tof d l
H f
Z l b f
H f
tof f i
tof f h
tof f c
tof f a
tof f l
H e
Z l c e
H e
tof e k
tof e j
tof a e
tof e i
tof l f
tof e l
tof a h
tof a b
tof k g
tof k f
tof k d
tof j h
tof l j
tof l d
tof l c
tof l b
tof j i
tof j e
tof i j
tof j b
tof i k
tof i h
tof i d
tof i c
tof i a
tof a i
tof c k
tof c e
tof c b
tof e c
tof c d
X c
tof i f
X i
tof c g
tof c h
tof c l
tof i a
tof i b
tof i c
tof i g
tof j h
tof j k
tof i j
tof j i
tof j b
tof j e
tof j f
tof j l
tof a l
tof l a
tof l b
tof l i
tof l k
tof a k
tof f g
tof a f
tof f g
tof k a
tof k b
X j
tof h i
tof k i
tof k h
tof a c
tof d e
tof a d
tof h l
tof a h
tof h j
H h
Z l c h
H h
tof f l
tof f c
X f
H f
Z b l f
H f
tof l j
tof f j
tof d k
tof d c
tof d g
tof d h
H d
Z l k d
H d
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d e
tof d c
tof d k
H f
Z l b f
H f
tof f j
tof f c
tof f l
H h
Z l c h
H h
tof h j
tof a h
tof l i
tof h l
tof a g
tof a f
tof a e
tof a d
tof a c
tof j h
tof k j
tof k g
tof k f
tof k b
tof l a
tof k a
tof a k
tof l b
tof a l
tof j l
tof i k
tof i f
tof j i
tof j e
tof i j
tof j b
tof i h
tof c g
tof i c
tof i a
tof c l
X c
tof c d
tof c h
X i
tof f c
tof c b
tof c f
tof d i
tof i d
tof i c
tof c l
tof j h
tof i j
tof j a
tof j f
tof j i
tof f l
tof l b
tof l c
tof l f
tof l h
tof k j
tof k d
tof l d
tof l k
tof k e
tof k g
tof k h
tof d b
tof a d
tof h i
tof h l
tof a h
tof h c
tof h b
H h
Z l c h
H h
tof d l
tof d a
tof d c
tof d f
tof d h
tof d i
tof d j
H d
Z l b d
H d
tof b d
tof b e
tof b f
tof b h
tof b i
H b
Z l k b
H b
tof b d
tof b e
tof b f
tof b h
tof b i
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof b i
tof b h
tof b f
tof b e
tof b d
H b
Z l k b
H b
tof b i
tof b h
tof b f
tof b e
tof b d
H d
Z l b d
H d
tof d j
tof d i
tof d h
tof d f
tof d c
tof a b
tof d a
tof d l
H h
Z l c h
H h
tof h i
tof h b
tof h c
tof h l
tof l h
tof a l
tof a i
tof a d
tof k h
tof k g
tof k e
tof k d
tof l k
tof j f
tof l j
tof l c
tof l b
tof f l
tof i h
tof j i
tof j a
tof i j
tof i d
tof i c
X d
tof d i
tof c l
tof c f
tof c b
tof f c
X c
tof c d
tof c f
tof c h
tof i j
tof c i
tof i a
tof i d
tof i g
tof j i
tof i k
tof j b
tof j h
tof l h
tof j f
tof l j
tof l b
tof l d
tof l e
tof l k
tof a k
tof k a
tof k c
tof k i
tof d a
tof a c
tof a d
tof a h
tof a l
tof a e
tof a g
tof a i
tof k j
tof a k
H a
Z l c a
H a
tof a b
tof a e
tof a g
tof a i
tof a k
tof d b
tof d a
tof d c
tof d f
tof d j
H d
Z l b d
H d
H l
Z c i l
H l
tof a c
tof a i
H a
Z l k a
H a
tof a c
tof i k
tof a i
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof j a
tof b j
tof c k
tof i l
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a c
H a
Z l k a
H a
tof a i
tof a c
H l
Z c i l
H l
H d
Z l b d
H d
tof d j
tof d f
tof d c
tof a b
tof d a
tof a k
tof a j
tof a i
tof a g
tof a e
H a
Z l c a
H a
tof a k
tof a j
tof a i
tof a g
tof l e
tof l h
tof a l
tof a d
tof a c
tof d a
tof k i
tof k c
tof k a
tof a k
tof j k
tof l j
tof l d
tof j l
tof l b
tof j i
tof j h
tof j f
tof i l
tof i k
tof i j
tof i g
tof i d
tof i a
tof c i
tof c h
tof c f
X g
tof c e
tof i b
tof i d
tof i e
tof i f
tof i g
tof i j
tof i k
tof i l
tof a j
tof j a
tof j c
tof j e
tof j f
tof j i
tof j h
tof j k
tof a l
tof l a
tof c d
tof l c
tof l h
tof l k
tof a k
tof k a
tof k d
tof k e
tof k i
tof a k
tof c k
tof k j
tof a b
tof a e
tof a h
H a
Z l c a
H a
tof a g
tof a j
tof c e
tof c f
tof c g
tof c h
H c
Z l b c
H c
tof c d
tof c e
tof c f
tof c g
tof c h
tof g j
tof g k
tof k j
tof c k
tof g b
tof g i
H g
Z l k g
H g
tof c b
H j
Z b l j
H j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
H j
Z b l j
H j
H j
Z c l j
H j
H g
Z l k g
H g
tof g j
tof g i
tof g b
tof c g
tof g k
tof c j
tof c h
tof c f
tof c e
tof c d
H c
Z l b c
H c
tof k j
tof c k
tof c h
tof c g
tof c f
tof c e
tof c d
tof a g
H a
Z l c a
H a
tof a k
tof a h
tof a e
tof a b
tof k i
tof k e
tof k d
tof l a
tof k a
tof a k
tof l h
tof l d
tof l c
tof a l
tof j k
tof j i
tof j h
tof j f
tof c e
tof j c
tof j a
tof a j
tof e l
tof l e
tof i e
tof i d
tof c d
tof c g
tof c h
tof i a
tof d f
tof j d
tof j b
tof j h
tof j i
tof j k
tof l k
tof l j
tof l b
tof l h
tof e k
tof k b
tof k c
tof k e
tof k f
tof k g
tof k h
tof k i
tof d a
tof a k
tof a e
tof e g
tof a l
H d
Z l c d
H d
tof e f
H e
Z l b e
H e
tof e f
X d
X e
tof e g
tof a c
tof a d
H a
Z k l a
H a
tof c k
tof a c
tof a d
tof a f
tof a g
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof j a
tof b j
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a g
tof a f
tof a d
tof a c
H a
Z l k a
H a
tof a g
tof a f
tof a d
tof a c
tof e g
tof e f
H e
Z l b e
H e
tof e g
tof e f
H d
Z l c d
H d
tof k g
tof d k
tof l e
tof a l
tof d a
tof k f
tof a k
tof k i
tof k h
tof k e
tof k c
tof k b
tof e k
tof j h
tof j b
tof l j
tof e l
tof i k
tof j i
tof j f
tof j d
tof c l
tof c j
tof c h
tof c g
tof d c
X d
tof c d
X f
tof c f
tof c h
tof c j
tof c l
tof i l
tof l i
tof i d
tof e j
tof j c
tof j e
tof j f
tof j g
tof j i
tof l c
tof l h
tof a l
tof l k
tof a b
tof a c
tof k a
tof k f
tof k g
tof k h
tof d g
tof a d
tof a i
tof k j
tof a k
tof d l
tof d c
tof d a
tof d b
H d
Z l c d
H d
tof f l
tof f a
tof f c
tof f i
tof f k
H f
Z l b f
H f
tof b e
tof b f
tof b g
tof b h
tof l j
H j
Z b l j
H j
H b
Z k l b
H b
tof b e
tof b f
tof b g
tof b h
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof c j
tof b c
H j
Z c l j
H j
tof l j
tof c j
tof b c
tof b h
tof b g
tof b f
tof b e
H b
Z l k b
H b
tof b j
tof b h
tof b g
tof b f
tof b e
H f
Z l b f
H f
tof f k
tof j i
tof f j
tof f c
tof f a
tof f l
H d
Z l c d
H d
tof d g
tof a b
tof a c
tof a l
tof d a
tof a d
tof a k
tof j g
tof a j
tof l h
tof k l
tof k g
tof k f
tof k c
tof k b
tof k a
tof a k
tof l k
tof i d
tof l i
tof l c
tof j f
tof j e
tof j c
tof e j
tof i l
tof i j
tof i g
tof i f
tof i b
tof i a
tof c l
tof c j
tof c h
tof c f
tof c d
tof d c
X c
tof c d
tof c f
tof c g
tof c i
tof c k
tof c l
tof a i
tof i a
tof i c
tof i d
tof i f
tof i g
tof i h
tof i j
tof a j
tof j a
tof j b
tof j d
X j
tof l j
tof j g
X j
tof l b
tof k h
tof k f
tof l k
tof a l
tof k a
tof k c
tof k g
tof a d
tof a e
tof a h
tof d a
tof a i
tof h a
tof a k
tof d l
tof d g
tof d j
H d
Z l c d
H d
tof d l
tof d c
tof d f
tof d g
tof k j
tof d k
H d
Z l b d
H d
tof h l
tof h c
tof h j
H h
Z l k h
H h
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H h
Z l k h
H h
tof h j
tof h c
tof h a
tof h k
tof h l
H d
Z l b d
H d
tof d k
tof d j
tof d g
tof d f
tof d c
tof d l
H d
Z l c d
H d
tof d k
tof d j
tof d i
tof d g
tof a l
tof d a
tof a d
tof a k
tof i h
tof a i
tof a e
tof l h
tof l g
tof l f
tof k l
tof k c
tof k a
tof l k
tof j b
tof l j
tof j g
tof j d
tof j a
tof i a
tof a j
tof i g
tof i f
tof i d
tof i c
tof a i
tof i f
tof c i
tof c e
tof c h
tof i b
tof i c
tof i d
tof i j
tof j i
tof i g
tof j a
tof j k
X h
tof j h
tof j l
tof a l
tof a c
tof a e
tof l a
tof l f
tof l j
tof a k
tof a b
tof k a
tof k f
tof k g
tof k h
tof k i
tof a k
tof a j
tof k l
tof a h
tof g c
tof g i
tof g k
H g
Z l c g
H g
tof e l
tof e c
tof e f
tof e g
H e
Z l b e
H e
tof b f
tof b g
H b
Z l k b
H b
tof b f
tof b g
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof b g
tof b f
H b
Z l k b
H b
tof b g
tof b f
H e
Z l b e
H e
tof e g
tof e f
tof e c
tof e l
H g
Z c l g
H g
tof g l
tof l c
tof k l
tof g k
tof g j
tof g i
tof k h
tof k e
tof a k
tof k a
tof a b
tof k j
tof k i
tof k g
tof k f
tof a k
tof l j
tof l f
tof l e
tof l a
tof a l
tof j k
tof i a
tof j i
tof c g
tof c h
tof i c
tof c e
tof c d
X e
tof i c
tof i l
tof j b
tof j c
tof d l
tof j i
tof l b
tof d f
tof l d
tof l g
tof h k
tof a h
tof l h
tof h k
tof k a
tof k b
tof k e
tof k f
tof k g
tof k i
tof d e
tof a d
tof d c
tof d a
tof d g
tof d j
tof d k
H d
Z l c d
H d
tof e b
tof e a
tof e i
tof e k
H e
Z l b e
H e
tof c e
tof c f
tof c h
tof c i
H c
Z l k c
H c
tof c e
tof c f
tof c h
tof c i
tof c b
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
H j
Z b l j
H j
H j
Z c l j
H j
tof c i
tof c h
tof c f
tof c e
H c
Z l k c
H c
tof c i
tof c h
tof c f
tof c e
H e
Z l b e
H e
tof e k
tof e i
tof e a
tof e b
H d
Z l c d
H d
tof d k
tof d j
tof d g
X f
tof a e
tof a f
X e
tof d a
tof d c
tof a h
tof a d
tof k i
tof k h
tof k g
tof k f
tof k e
tof k b
tof k a
tof a k
tof l k
tof l h
tof l g
tof l f
tof l d
tof l b
tof d l
tof i c
tof i d
tof j d
tof j b
tof c l
tof d k
tof d c
tof c d
X d
X h
tof c f
tof l g
tof c l
tof j d
tof j f
tof j e
tof l e
tof l j
tof l b
tof l d
tof l h
tof l k
tof f k
tof f b
tof k f
tof k h
tof k i
tof k l
tof h a
tof a c
tof a h
tof k j
tof a k
tof a l
tof d g
tof d h
tof d k
H d
Z l c d
H d
tof d h
tof f l
tof f c
tof f g
tof f h
tof f j
H f
Z l b f
H f
tof d l
tof d a
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d a
tof d l
H f
Z l b f
H f
tof f j
tof f h
tof f g
tof f c
tof f b
tof f l
tof d h
H d
Z l c d
H d
tof d k
tof d j
tof d h
tof d g
tof k l
tof a k
tof a j
tof a h
tof a c
tof h a
tof k i
tof k h
tof k f
tof l k
tof k b
tof f k
tof j h
tof j g
tof j e
tof j d
tof l j
tof i f
tof i b
tof i a
tof c l
tof j i
tof c k
tof c g
tof c f
tof c d
tof d c
X c
tof c d
tof c e
tof c f
tof i k
tof c i
tof i e
tof i g
tof j c
tof j d
tof j e
tof j h
tof l j
tof j k
tof l a
tof l e
tof l g
tof k l
tof a l
tof l h
tof e b
tof k e
tof a k
tof k f
tof k i
tof a b
tof a c
tof a d
tof a g
tof a j
H l
Z c j l
H l
tof j k
H j
Z l c j
H j
tof j k
tof l j
tof e l
tof e a
tof e c
H e
Z l b e
H e
H k
Z b i k
H k
tof a b
tof a i
tof a j
H a
Z l k a
H a
tof a b
tof a i
tof a j
tof c b
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a b
H a
Z l k a
H a
tof a j
tof a i
tof a b
H k
Z b i k
H k
H e
Z l b e
H e
tof e j
tof e c
tof a b
tof e a
tof e l
tof j k
H j
Z l c j
H j
tof j k
H l
Z c j l
H l
tof k l
tof a k
tof a j
tof a i
tof a g
tof c d
tof a c
tof k i
tof k h
tof k f
tof k e
tof k b
tof l k
tof l j
tof l h
tof l g
tof j l
tof c e
tof j c
tof l d
tof i l
tof l j
tof j b
tof c h
tof c g
tof j f
tof j g
tof a j
tof j i
tof l c
tof l k
tof k b
tof k d
tof k e
tof k h
tof k i
tof k l
tof a c
tof d a
tof a l
tof d c
tof d g
tof k j
tof d k
H d
Z l c d
H d
tof d l
tof d b
tof d c
tof d e
tof d h
tof d i
H d
Z l b d
H d
tof d l
tof d e
tof d g
tof d h
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d h
tof d g
tof d e
tof d l
H d
Z l b d
H d
tof d i
tof d h
tof d e
tof d c
tof d b
tof d l
H d
Z l c d
H d
tof d k
tof d j
tof d g
tof a c
tof a l
tof d a
tof a j
tof a i
tof a h
tof a f
tof l i
tof k l
tof k h
tof k e
tof l k
tof k d
tof k b
tof j g
tof j f
tof j e
tof l j
tof l c
tof l a
tof i k
tof i h
tof j i
tof i j
tof i g
tof i d
tof i a
tof c l
tof c k
tof c j
tof c i
tof c g
tof c f
tof d c
X d
tof c d
tof c i
tof c j
tof c k
tof c l
tof a i
tof i a
tof i c
tof i d
tof i g
tof k h
tof i k
tof j b
tof j d
tof j f
tof j g
tof j h
tof j l
tof l j
tof j i
tof l b
tof k l
tof l c
tof a k
tof k d
tof k f
tof a c
tof a e
tof a b
H a
Z l c a
H a
tof d b
tof a d
tof a g
tof a i
tof a j
tof d l
tof d a
tof d e
tof d f
tof d h
tof d i
H d
Z l b d
H d
tof d l
tof d c
tof d f
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d f
tof d c
tof d l
H d
Z l b d
H d
tof d i
tof d h
tof d f
tof d e
tof a b
tof d a
tof d l
tof j i
tof a j
tof a g
tof a d
H a
Z l c a
H a
tof a d
tof a b
tof k f
tof a k
tof a e
tof a c
tof k l
tof k h
tof k d
tof k c
tof l j
tof l c
tof j l
tof l b
tof j h
tof j g
tof j f
tof j d
tof i k
tof i h
tof i g
tof c d
tof i c
tof i a
tof a i
tof c l
tof i j
tof i k
tof c i
tof j k
X d
tof d c
tof i d
X h
tof c e
tof c g
tof j h
tof c j
tof c l
tof i b
tof i e
tof i f
tof i g
tof i h
tof a b
tof j a
tof j d
tof j f
tof j g
tof j i
tof d l
tof l d
tof l g
tof l h
tof l j
tof l k
tof d k
X d
tof k d
tof k c
tof e h
tof k e
tof a f
tof a j
tof f a
tof a l
tof f b
tof f g
tof f h
tof e f
tof f i
H f
Z l c f
H f
tof e b
tof e a
tof e c
tof e j
H e
Z l b e
H e
tof h l
tof h k
tof h c
H h
Z l k h
H h
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H h
Z l k h
H h
tof h c
tof h k
tof h l
H e
Z l b e
H e
tof h i
tof e h
tof h i
tof e j
tof e f
tof e c
tof a b
tof e a
H f
Z l c f
H f
tof f i
tof f h
tof f g
tof a l
tof f a
tof a f
tof a j
tof k h
tof k e
tof k d
tof k c
tof l d
tof d k
tof j h
tof j g
tof l j
tof d l
tof j k
tof i f
tof i d
tof j i
X d
tof j b
tof j a
tof i j
tof i h
tof i e
tof c l
tof c k
tof c j
tof c g
tof d e
X c
tof d c
tof d h
tof c d
tof c f
tof c j
tof c k
tof c l
tof d c
tof a d
tof i d
tof a j
tof a b
tof a e
tof j a
tof j i
tof j k
tof l j
tof j g
tof l a
tof l f
tof a k
tof k a
tof d k
tof k f
tof k g
tof k i
tof k j
tof a g
tof d l
H d
Z l c d
H d
tof d l
tof d b
tof d a
tof d e
tof d h
tof d k
H d
Z l b d
H d
tof d k
tof d a
tof d b
tof d c
tof d f
tof d g
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d g
tof d f
tof d c
tof d b
tof d a
tof d k
H d
Z l b d
H d
tof d k
tof d h
tof a e
tof a b
tof d a
tof d l
H d
Z l c d
H d
tof k j
tof k i
tof k g
tof k f
tof k c
tof d k
tof d l
tof a g
tof c d
tof l a
tof a c
tof k e
tof k d
tof k b
tof k a
tof a k
tof j g
tof l j
tof l f
tof l e
tof l b
tof i k
tof j i
tof j e
tof j c
tof j b
tof j a
tof a j
tof i c
tof c l
X h
tof h j
tof c h
tof c f
tof c e
tof d c
X d
X f
tof f c
tof c f
tof c g
tof c j
tof c l
tof l c
tof j l
tof i a
tof i d
tof i f
tof j i
tof i h
tof l d
tof l f
tof l g
tof d k
tof k c
tof k d
tof k f
tof k g
tof k l
tof k i
tof h a
tof a c
tof e h
tof a i
tof e a
X h
tof e j
tof e c
tof a e
tof e g
tof e i
H e
Z l c e
H e
tof a c
tof a d
tof a f
tof a k
H a
Z l b a
H a
tof a c
tof a d
tof e f
tof a e
tof a g
tof a h
tof a i
tof a j
tof e a
tof a k
tof e l
tof e b
tof e h
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e h
tof e f
tof e b
tof a k
tof e a
tof e l
tof j i
tof a j
tof a h
tof a g
tof a f
tof a e
tof a d
tof a c
H a
Z l b a
H a
tof a k
tof a j
tof a h
tof a g
tof a f
tof a e
tof a d
tof a c
H e
Z l c e
H e
tof i g
tof e i
tof a c
tof e a
tof a j
tof a h
tof h a
tof l d
tof k l
tof i f
tof k i
tof k c
tof d k
tof l g
tof l f
tof j l
tof l c
tof c l
tof j k
X j
tof j h
tof i h
tof h j
tof i d
tof i b
tof i a
tof a i
X a
tof j k
tof c j
tof c g
tof c f
tof f c
X e
tof e c
X l
tof c e
tof c b
tof j f
tof c j
tof i g
tof c i
tof i a
tof i b
tof i c
tof i e
tof i f
tof i h
tof i l
tof j b
tof j d
tof j g
tof j h
tof k j
tof j i
tof a l
tof l a
tof l b
tof l c
tof l d
tof l f
tof l h
tof l i
tof k a
tof k c
tof k f
tof k g
tof f b
X j
tof l j
tof a f
tof a l
tof a h
H a
Z l c a
H a
tof h i
tof f a
tof h k
tof a h
tof h a
X f
H f
Z b l f
H f
tof f j
tof h j
H h
Z l k h
H h
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H h
Z l k h
H h
tof h j
tof h i
tof h a
tof h k
H f
Z l b f
H f
tof f k
tof f j
tof f i
tof a h
tof f a
tof f b
tof k i
tof a k
H a
Z l c a
H a
tof l h
tof a l
tof j f
tof a j
tof a b
tof j g
tof k j
tof k c
tof k a
tof l i
tof l f
tof l d
tof c b
tof l c
tof l a
tof a l
tof j k
tof i h
tof j i
tof j d
tof j b
tof i l
tof i g
tof i f
tof c e
tof i c
tof i a
tof a i
tof c k
tof c j
tof e i
tof e c
tof e g
tof e f
X l
tof i d
X i
tof c a
tof c h
tof c l
tof i a
tof i c
tof i f
tof i g
tof i h
tof i j
tof l i
tof i k
tof d j
tof j b
tof j c
tof j d
tof j g
tof j h
tof j k
tof k j
tof j i
tof l a
tof l b
tof l c
tof l d
tof l e
tof l f
tof k l
tof l g
tof k a
tof k e
tof d a
tof a b
tof a c
tof a d
tof a h
tof a i
tof a l
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
H a
Z l c a
H a
tof a b
tof a i
tof a k
H l
Z b i l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b i l
H l
tof a k
tof a i
tof a b
H a
Z l c a
H a
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a l
tof a i
tof a h
tof a d
tof a c
tof a b
tof d a
tof l e
tof k l
tof i g
tof j i
tof k j
tof l k
tof k a
tof i f
tof i d
tof l i
tof l c
tof l b
tof j k
tof j h
tof j d
tof j c
tof j b
tof d j
X d
tof i k
tof c h
tof c a
tof i c
tof c i
X a
tof g l
tof c g
X c
tof c h
tof c i
tof c l
tof i b
tof i e
tof i f
tof i j
tof a c
tof j a
tof j d
tof j e
tof j h
tof j i
tof j l
tof l c
tof l g
tof l h
tof l j
tof l k
tof d k
tof k d
tof k e
tof k g
tof a b
tof g h
tof a g
tof g h
X g
H a
Z l c a
H a
tof a d
tof a f
tof a g
tof a i
tof d a
tof a j
tof d l
tof d b
tof d c
tof d e
tof d h
H d
Z l b d
H d
tof d l
tof d k
tof d e
tof d f
tof d g
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d g
tof d f
tof k e
tof d k
tof d l
H d
Z l b d
H d
tof d j
tof d h
tof d e
tof d c
tof d a
tof d b
tof d l
tof a j
tof a i
tof a g
tof a f
tof a d
H a
Z l c a
H a
tof a g
tof a h
tof a c
tof a b
tof k g
tof k d
tof d k
tof l k
tof j h
tof l j
tof l g
tof l c
tof g l
tof j l
X i
tof i e
tof j i
tof j a
tof c d
tof j c
X b
tof j b
X f
tof j f
tof i j
tof c l
tof c i
X h
X c
tof c a
tof a i
tof i a
tof i d
tof i e
tof i f
tof i g
tof i k
tof i l
tof d g
tof j d
tof j a
tof a l
tof l a
tof l b
tof l i
tof l j
tof a k
tof k a
tof k c
tof k f
tof k i
tof k l
tof d a
tof a b
tof a h
tof a k
tof a l
tof a g
tof a i
tof a j
H a
Z l c a
H a
tof d e
tof d f
tof d i
tof a d
tof a j
tof d l
tof d c
tof d h
tof d k
H d
Z l b d
H d
tof d k
tof d a
tof d b
tof d e
tof d f
tof d g
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof d b
tof d a
tof d k
H d
Z l b d
H d
tof d k
tof d i
tof d h
tof d g
tof d f
tof d e
tof d c
tof d l
tof a j
tof a i
tof a g
tof a f
tof a e
tof a d
H a
Z l c a
H a
tof a j
tof a i
tof a g
tof k l
tof a k
tof a h
tof a b
tof d a
tof k i
tof k f
tof k c
tof k a
tof a k
tof l j
tof l i
tof l b
tof l a
tof a l
tof j g
tof j f
tof j d
tof j b
tof j a
tof i l
tof i k
tof i g
tof i f
tof i e
tof i d
tof i a
tof a i
tof c h
tof c f
tof c e
tof c i
tof d i
tof i b
tof i d
tof i g
tof j i
tof i k
tof i l
tof j c
tof f l
tof l b
tof l c
tof l f
tof l i
tof l j
tof a k
tof k a
tof k b
tof k f
tof k g
tof k h
tof f a
tof a b
tof a c
tof e a
tof a f
tof a g
tof d c
tof d b
tof d h
H d
Z l c d
H d
tof d b
tof d f
tof d h
tof d k
H d
Z l b d
H d
tof e l
tof e k
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e j
X g
tof a f
tof a g
tof e a
tof e k
tof e l
H d
Z l b d
H d
tof k j
tof k h
tof k f
tof k b
tof d k
H d
Z l c d
H d
tof d h
tof d b
tof d c
tof a c
tof a b
tof f a
tof k g
tof a k
tof j i
tof l j
tof l f
tof l c
tof l b
tof f l
tof j l
tof j k
tof j c
tof i l
tof i k
tof i g
tof i d
tof i b
tof d i
tof c e
tof c d
X d
X e
tof c g
tof c h
tof a i
tof i a
tof i b
tof i e
tof i k
tof k i
tof i g
tof j a
tof j g
tof j d
tof k j
tof a l
tof l a
tof l f
tof l i
tof l j
tof k a
tof k b
tof k c
tof d a
tof a d
tof a f
tof a h
tof a i
tof a k
tof b e
tof b g
tof b h
tof b k
H b
Z l c b
H b
tof b e
tof b g
tof e b
tof b h
tof b k
tof e l
tof e c
tof e f
H e
Z l b e
H e
tof g l
tof g k
tof g c
tof g i
tof g j
H g
Z l k g
H g
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H g
Z l k g
H g
tof g j
tof g i
tof g c
tof g k
tof g l
H e
Z l b e
H e
tof e k
tof e h
tof e f
tof e c
tof e b
tof e l
tof b k
tof b h
tof b g
tof b e
H b
Z l c b
H b
tof b k
tof b h
tof b g
tof b e
tof k i
tof a k
tof a h
tof a f
tof a d
tof d a
tof k j
tof k g
tof k c
tof k b
tof k a
tof l j
tof l i
tof l f
tof l a
tof a l
tof j g
tof j d
tof j a
tof i k
tof i g
tof i e
tof i b
tof i a
tof c a
tof a i
tof c h
X f
X c
X d
tof c g
tof a c
tof c a
tof c d
tof c f
tof c h
tof c i
tof a i
tof i a
tof i b
tof i d
tof i e
tof i g
tof i l
tof j a
tof j b
tof j e
tof j f
tof d l
tof l b
tof l c
tof l d
tof l f
tof l h
tof l g
tof k i
tof l k
tof k l
tof k b
tof k c
tof k d
tof k f
tof k g
tof k h
tof e a
tof a e
tof a f
tof a g
tof a l
tof f c
tof f j
H f
Z l c f
H f
tof d b
tof d a
tof d c
tof d f
H d
Z l b d
H d
tof d k
tof d a
tof d b
tof d h
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d h
tof d b
tof d a
tof d k
H d
Z l b d
H d
tof d f
tof d c
tof d a
tof k d
tof d b
H f
Z l c f
H f
tof f j
tof f c
tof l g
tof l f
tof a l
tof j e
tof a e
tof e a
tof l i
tof l h
tof k l
tof l k
tof k c
tof l d
tof l b
tof i d
tof d l
tof j f
tof j b
tof i g
tof i e
tof i b
tof i a
tof c a
tof a i
tof c h
tof c f
tof c d
tof a c
X c
tof c a
tof c d
tof c f
tof c g
tof c j
tof c k
tof d i
tof i c
tof i d
tof i e
tof i g
tof j h
tof i j
tof i l
tof j a
tof j b
tof j g
tof j d
X g
tof a l
tof l a
tof l c
tof l e
tof l i
tof l k
tof h k
tof k c
tof k h
tof k l
tof d a
tof a d
tof a e
tof a i
tof a k
tof e l
tof e c
tof e a
tof e g
tof e h
H e
Z l c e
H e
tof e l
tof e a
tof e c
tof e f
H e
Z l b e
H e
tof d l
tof d c
tof d g
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d g
tof d c
tof d l
H e
Z l b e
H e
tof e f
tof e c
tof e a
tof e l
H e
Z l c e
H e
tof e h
tof e g
tof e a
tof e c
tof e l
tof a k
tof i e
tof a i
tof a d
tof d a
tof k l
tof k h
tof k c
tof h k
tof l k
tof i c
tof l i
tof l a
tof a l
tof j h
tof j g
tof j d
tof j b
tof j a
tof i l
tof i j
tof i h
tof i g
tof i d
tof d i
tof c f
tof c e
tof c h
tof c i
tof i a
tof i b
tof i c
tof i d
tof i e
tof l g
tof i l
tof i j
tof d j
tof j b
tof j c
X k
tof j d
tof j k
tof j f
tof k f
tof l b
tof l d
tof l e
tof k h
tof l k
X k
tof k b
tof k e
tof k g
tof d i
tof k i
tof d a
tof a d
tof a g
tof a h
H a
Z l c a
H a
tof a b
tof a e
tof a f
tof a g
tof a h
tof a i
tof a j
tof a k
tof d l
tof d c
tof d f
tof d h
tof d j
H d
Z l b d
H d
tof d l
tof d k
tof d a
tof d b
tof d c
tof d f
tof d h
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d h
tof d f
tof d c
tof d b
tof a k
tof d a
tof d l
H d
Z l b d
H d
tof d j
tof d i
tof d h
tof d f
tof d c
tof d l
tof a j
tof a i
tof a h
tof a g
tof a f
tof a e
tof a b
H a
Z l c a
H a
tof a i
tof a h
tof a g
tof a d
tof d a
tof k i
tof l k
tof k h
tof k g
tof k f
tof k e
tof j k
tof k b
tof l d
tof j f
tof j d
tof j c
tof d j
tof i l
tof c g
tof c h
tof i c
tof i a
tof c e
tof c d
X d
tof i c
tof a j
tof j a
tof j b
tof j c
tof j e
tof j f
tof j g
tof j i
tof a l
tof l a
tof l b
tof l f
tof l g
tof l h
tof l k
tof a k
tof k a
tof k b
tof k c
tof k e
tof k j
tof k g
tof k l
tof d a
tof a c
tof a e
tof a g
tof a k
tof a i
H a
Z l c a
H a
tof a d
tof a i
tof a e
tof a j
H a
Z l b a
H a
tof a e
tof d a
tof a f
tof a h
tof a j
tof d l
tof d b
tof d g
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d f
tof d b
tof d a
tof d l
tof a j
tof a h
tof a f
tof a e
H a
Z l b a
H a
tof a j
tof a e
tof a i
tof a d
H a
Z l c a
H a
tof a i
tof k g
tof k e
tof a k
tof k a
tof a c
tof d a
tof k l
tof j b
tof k j
tof l a
tof a k
tof l h
tof l g
tof l f
tof l b
tof a l
tof j i
tof j g
tof j f
tof j e
tof j c
tof j a
tof a j
tof i h
tof i e
tof i d
tof i c
tof i b
tof i k
tof c i
tof a d
tof a c
X a
tof c a
tof a c
X e
tof c f
tof i g
tof c i
tof i c
tof i b
tof i d
tof i e
tof i f
tof i h
tof i l
tof a j
tof a c
tof j a
tof j f
tof j k
tof j l
tof j i
tof a b
tof l a
tof e g
tof e j
tof l e
tof d k
tof k c
tof k d
tof k l
tof a g
tof a h
tof e c
tof e i
H e
Z l c e
H e
tof g l
tof g a
tof e g
tof g c
tof g i
H g
Z l b g
H g
tof e l
tof e f
tof e h
tof e j
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e j
tof e i
tof e h
tof e g
tof e f
tof e c
tof e l
H g
Z l b g
H g
tof g i
tof g c
tof g a
tof g l
H e
Z l c e
H e
tof e j
tof e i
tof e g
tof e c
tof a h
tof a g
tof a c
tof a b
tof k l
tof k d
tof k c
tof d k
tof l j
tof l g
tof l e
tof l c
tof l b
tof j l
tof l a
tof i k
tof i f
tof j i
tof j c
tof c j
tof i c
tof a j
tof i l
tof i h
tof i g
tof i e
tof i b
tof c i
tof i d
tof c k
tof c g
tof c f
tof c a
tof a c
X c
tof c a
tof c d
tof c e
tof c f
tof c h
tof c k
tof f i
tof i f
tof i g
tof i h
tof i k
tof j i
tof i l
tof j b
tof j c
tof j d
tof j e
tof j f
tof j g
tof j h
tof l a
tof l e
tof l f
tof l j
tof l k
tof d k
tof k c
tof k d
tof k e
tof k j
tof k l
tof d a
tof a b
tof a d
tof a e
tof a f
tof a i
tof b f
H b
Z l c b
H b
H l
Z b j l
H l
tof b f
tof a j
H a
Z l b a
H a
tof a j
tof f l
tof f c
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f c
tof f l
H a
Z l b a
H a
tof a j
H l
Z b j l
H l
tof b f
H b
Z l c b
H b
tof a b
tof b f
tof a i
tof a e
tof a d
tof d a
tof l j
tof l e
tof k l
tof k d
tof k c
tof d k
tof l k
tof l f
tof l a
tof i l
tof i g
tof i f
tof j i
tof j c
tof j b
tof k h
tof i k
tof f i
tof c h
X d
tof d e
tof c d
tof c g
tof a i
tof i a
tof i d
tof i f
tof i g
tof i k
tof j a
tof j f
tof a l
tof l a
tof l b
tof l c
tof l e
tof l g
tof l j
tof a c
tof k a
tof k d
tof f k
tof k g
tof a i
tof a l
tof f c
tof f b
tof f i
tof f j
H f
Z l c f
H f
tof d l
tof d f
tof d h
H d
Z l b d
H d
tof a b
H a
Z l k a
H a
tof a b
tof a e
tof a g
tof a h
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a h
tof a g
tof a e
tof a b
H a
Z l k a
H a
tof a b
H d
Z l b d
H d
tof d h
tof d f
tof d e
tof d l
H f
Z l c f
H f
tof f k
tof f j
tof f i
tof f g
tof f b
tof f c
tof a l
tof a i
tof k a
tof l a
tof a c
tof i k
tof k h
tof k g
tof k e
tof k d
tof l j
tof l g
tof l e
tof l b
tof a l
tof j h
tof j f
tof j d
tof j a
tof i f
tof i a
tof a i
tof c k
tof c g
tof c f
tof a d
tof a c
X a
tof c a
tof a c
tof j c
tof c k
tof a i
tof i a
tof i e
tof i f
tof i g
tof i h
tof j i
tof i l
tof j a
tof j b
tof j g
tof l a
tof l b
tof d f
tof l d
tof l k
tof a k
tof k a
tof k e
tof k f
tof k h
tof k i
tof d a
tof a b
tof d e
tof d g
tof a d
tof d a
tof d i
tof d k
tof d c
tof d j
H d
Z l c d
H d
tof a c
tof a f
H a
Z b l a
H a
tof a j
tof a c
tof f i
tof a f
tof k j
tof a k
H f
Z l k f
H f
tof f i
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
H j
Z b l j
H j
H j
Z c l j
H j
tof f i
H f
Z l k f
H f
tof a f
tof f i
tof a k
tof a c
H a
Z l b a
H a
tof a k
tof a j
tof a i
tof a f
tof a c
H d
Z l c d
H d
tof d j
tof d g
tof d f
tof a e
tof d a
tof d c
tof k i
tof a k
tof a g
tof a f
tof a d
tof a b
tof l d
tof d a
tof k h
tof k f
tof k e
tof k a
tof a k
tof l f
tof l b
tof i l
tof j i
tof j c
tof j a
tof i h
tof i g
tof i f
tof i e
tof i a
tof a i
tof c k
tof a c
X a
tof c a
tof a c
tof a d
X h
tof c e
tof c g
tof c h
tof c i
tof c k
tof d i
tof i b
tof i d
tof i g
tof i h
tof i k
tof j a
tof j d
tof j i
tof d l
tof k j
tof l d
tof k f
tof l k
tof a l
tof k a
tof k b
tof d c
tof d e
tof k d
tof k g
tof a k
tof k i
tof a d
tof d l
tof d b
tof d f
tof d g
tof d i
tof d j
H d
Z l c d
H d
tof h l
tof h b
tof k j
tof h k
H h
Z l b h
H h
tof b f
tof b h
H b
Z l k b
H b
tof b f
tof b h
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof b h
tof b f
H b
Z l k b
H b
tof b h
tof b f
H h
Z l b h
H h
tof h k
tof h j
tof h b
tof h l
H d
Z l c d
H d
tof d j
tof d i
tof d g
tof d f
tof d e
tof d b
tof d c
tof a d
tof d l
tof k i
tof k e
tof a k
tof k a
tof a c
tof l j
tof k l
tof k g
tof k f
tof k d
tof k b
tof l k
tof l f
tof l d
tof d l
tof i g
tof j i
tof j e
tof j d
tof j b
tof j a
tof i k
tof i h
tof i d
tof i b
tof d i
tof i k
tof c i
tof c h
tof c g
tof c e
tof a d
tof a c
X a
tof c a
tof a c
tof c e
tof c f
tof c h
tof c i
tof i c
tof i a
tof i b
tof i d
tof i e
tof i f
tof i l
tof l i
tof k i
tof i g
tof j c
tof j d
tof j f
tof l c
tof l d
tof l e
tof l j
tof k a
tof k b
tof k c
tof k d
tof k e
tof d a
tof a d
tof a f
tof a h
tof a i
tof a j
tof d l
tof d a
tof d i
tof d k
H d
Z l c d
H d
tof d l
tof d b
tof d a
tof c e
tof d c
tof d f
tof d g
tof d i
tof d j
X d
H d
Z b l d
H d
tof l j
X j
tof d j
tof c i
H c
Z l k c
H c
tof c e
tof c i
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof c i
tof c e
H c
Z l k c
H c
tof c i
tof c e
H d
Z l b d
H d
tof d i
tof d g
tof d f
tof d e
tof d c
tof d a
tof d b
tof d l
H d
Z l c d
H d
tof k i
tof d k
tof d a
tof d l
tof a j
tof a i
tof a h
tof a f
tof k d
tof a d
tof d a
tof k g
tof k e
tof k c
tof k b
tof l j
tof i g
tof i e
tof i d
tof l i
X d
tof l c
tof j k
tof j f
tof j c
tof i l
tof i k
tof i f
tof i c
tof a i
tof i b
tof i a
tof a i
tof c h
tof c e
tof c d
X f
X g
tof c g
tof i d
tof i e
tof i g
tof i h
tof j a
tof j b
tof j h
tof a l
tof l a
tof l c
tof l d
tof l e
tof l f
tof l i
tof k j
tof l j
tof k a
tof k l
tof k c
tof k d
tof k e
tof k f
tof f a
tof a c
tof a f
tof a g
tof d l
tof d a
tof d b
tof d k
H d
Z l c d
H d
tof g l
tof g a
tof g h
tof g i
tof g j
tof f g
tof g k
H g
Z l b g
H g
tof f b
tof f i
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f i
tof f g
tof f b
tof f k
H g
Z l b g
H g
tof g k
tof g j
tof g i
tof g h
tof g a
tof g l
H d
Z l c d
H d
tof d k
tof d b
tof d a
tof d l
tof j d
tof l j
tof l e
tof l c
tof l f
tof k l
tof a g
tof a f
tof a c
tof f a
tof l i
tof a l
tof j h
tof j b
X j
tof j a
tof i h
tof i g
tof i e
tof i d
tof i b
tof i a
X i
tof c a
tof c k
tof c g
tof c f
tof a c
X d
X e
X l
tof d c
tof c b
tof c d
tof c f
tof i h
tof c i
tof c j
tof i c
tof c k
tof i a
tof i b
tof i d
tof i f
tof i g
tof a j
tof a c
tof j a
tof j d
tof j e
tof j g
tof j h
tof j k
tof j l
tof j i
tof d l
tof l b
tof l d
tof l e
tof l g
tof k h
tof l k
tof e l
tof a e
tof k a
tof k f
tof a g
tof a i
tof a k
tof e b
tof e g
tof e h
H e
Z l c e
H e
tof e b
tof e a
tof e c
tof e f
tof e i
tof k j
tof e k
H e
Z l b e
H e
tof e l
tof e b
tof e c
tof e f
tof e h
tof e j
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e j
tof e h
tof e f
tof e c
tof e b
tof e l
H e
Z l b e
H e
tof e k
tof e j
tof e i
tof e f
tof e c
tof e a
tof e b
H e
Z l c e
H e
tof e h
tof e g
tof e b
tof a e
tof e l
tof a k
tof i g
tof a i
tof k a
tof a c
tof l h
tof k l
tof k f
tof l k
tof j k
tof k e
tof l g
tof l d
tof l b
tof j d
tof d l
tof c h
tof i c
X a
tof j i
tof j a
tof a j
tof i a
tof i k
tof i f
tof i d
tof i b
tof a i
tof c k
tof c j
tof c i
tof c f
tof c d
tof c b
tof d c
X l
tof c a
tof c d
tof c f
tof g i
X g
tof i g
X h
tof j h
tof c g
tof c j
tof c l
tof i c
tof i j
tof i k
tof j a
tof j d
tof j b
tof l b
tof l j
tof l e
tof l f
tof l g
tof l h
tof l k
H k
Z b i k
H k
tof k b
tof k i
tof k j
tof a c
tof a e
tof a h
tof a l
H c
Z b l c
H c
tof a b
tof a k
H a
Z l c a
H a
tof a b
tof a k
tof f b
tof f h
tof f i
tof d f
tof k j
tof f k
H f
Z l b f
H f
tof d l
tof d a
tof d b
tof d e
tof d g
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d g
tof d f
tof d e
tof d b
tof a k
tof d a
tof d l
H f
Z l b f
H f
tof f k
tof f j
tof f i
tof f h
tof f b
tof a b
H a
Z l c a
H a
tof a k
tof a b
H c
Z b l c
H c
tof l h
tof l e
tof a l
tof a c
tof k j
tof k i
tof k b
H k
Z b i k
H k
tof l k
tof l j
tof l g
tof l f
tof l b
tof j h
tof j d
tof j b
tof j a
tof i k
tof i j
tof i h
tof i g
tof i c
tof g i
tof c i
tof c h
tof c f
tof c e
tof i a
tof i b
tof i c
tof i g
tof i j
tof i k
tof d j
tof j b
tof j c
tof d f
tof d g
tof j h
tof j d
tof j l
tof a l
tof l a
tof l b
tof l f
tof l g
tof l h
tof l i
tof l j
tof d k
tof k b
tof k d
tof k h
tof d k
tof k i
tof h a
tof a b
tof a c
tof a h
tof a i
tof a k
tof d l
tof d a
H d
Z l c d
H d
tof d l
tof d a
tof d e
tof d f
tof d g
tof d i
tof k j
tof d k
H d
Z l b d
H d
tof e l
tof e b
tof e i
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e i
tof e b
tof e l
H d
Z l b d
H d
tof d k
tof d j
tof d i
tof d g
tof d f
tof d e
tof d a
tof d l
H d
Z l c d
H d
tof k i
tof d k
tof d g
tof d f
tof d a
tof d l
tof a k
tof a h
tof a c
tof a b
tof h a
tof k h
tof k g
tof k f
tof k d
tof k b
tof d k
tof l j
tof l i
tof l h
tof l g
tof l f
tof l b
tof l a
tof a l
tof j l
tof j h
tof j g
tof j f
tof j d
tof j c
tof j b
tof d j
tof c g
tof i c
tof i a
tof c e
tof c d
X d
tof i c
tof c h
tof i l
tof j a
tof j d
tof j h
tof l h
tof j f
X h
tof l a
tof l c
tof l e
tof l g
tof l i
tof a k
tof a b
tof k a
tof k c
tof k f
tof k h
tof k j
tof a k
tof k l
tof d j
tof a d
tof d c
H d
Z l c d
H d
tof d b
tof d a
tof d c
tof d e
tof d f
tof d g
tof d i
tof d j
tof d k
H d
Z l b d
H d
tof d k
tof d b
tof d c
tof d f
tof d g
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d g
tof d f
tof d c
tof d b
tof d k
H d
Z l b d
H d
tof k j
tof d k
tof d i
tof d g
tof d f
tof d e
tof d c
tof a b
tof d a
H d
Z l c d
H d
tof d j
tof d c
tof k l
tof a k
tof a d
tof k h
tof k f
tof k c
tof k b
tof k a
tof a k
tof l i
tof l h
tof l g
tof l e
tof l c
tof l a
X f
tof j f
tof j d
tof j a
tof i k
tof c l
tof i c
tof c j
tof c a
tof a c
tof j a
X c
tof c j
X e
tof c d
tof c f
tof c g
tof c l
tof i c
tof i f
tof i g
tof j b
tof j e
tof j d
tof k j
tof a l
tof l a
tof l g
tof l h
tof l i
tof l k
tof k a
tof k b
tof k d
tof k e
tof k h
tof a d
tof a h
tof a g
tof a i
H a
Z l c a
H a
tof a e
tof f g
tof f i
tof f j
tof a f
tof a k
tof f l
H f
Z l b f
H f
tof e l
tof e g
tof e h
tof e i
tof e j
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e j
tof e i
tof e h
tof e g
tof e l
H f
Z l b f
H f
tof l j
tof f l
tof i g
tof a f
tof f i
tof k e
tof a k
H a
Z l c a
H a
tof i h
tof a i
tof k a
tof a d
tof j h
tof j b
tof k j
tof l k
tof l i
tof l a
tof a l
tof j e
tof j d
tof j a
tof c j
tof i c
tof c f
X f
tof i b
tof c l
tof c h
tof c g
tof a c
X a
tof c a
tof c d
tof a c
X e
tof c e
tof i l
tof c i
tof i d
tof i e
tof i g
tof j i
tof i k
tof j b
tof j c
tof k j
tof j f
tof j h
tof a l
tof l a
tof l d
tof l e
tof l f
tof h i
tof l h
tof l j
tof k a
tof e b
tof e g
tof k e
tof f a
tof a c
tof a f
tof a g
tof a h
tof a j
tof a k
tof h c
tof h a
tof h b
H h
Z l c h
H h
tof e l
tof e a
tof e c
tof e f
tof d e
tof e h
tof e k
tof e j
X e
H e
Z b l e
H e
tof l j
X j
tof e j
tof d a
tof d c
tof d g
tof d j
H d
Z l k d
H d
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d e
tof d c
tof d a
tof d k
H e
Z l b e
H e
tof e k
tof e h
tof e g
tof e f
tof e c
tof e a
tof e b
tof e l
H h
Z l c h
H h
tof h i
tof h b
tof h a
tof a h
tof h c
tof k j
tof a k
tof a i
tof a g
tof k f
tof l f
tof a f
tof f a
tof k h
tof k g
tof k e
tof k b
tof j i
tof l j
tof l h
tof l e
tof l d
tof a l
tof l a
tof i l
tof j k
tof j c
tof j b
tof i e
tof i d
tof c e
tof c d
X e
tof c g
tof c h
tof j a
tof j d
tof j e
tof j g
tof l b
tof l c
tof l f
tof l k
tof a k
tof k a
tof c g
tof k c
tof k i
tof c j
tof e a
tof a e
tof a g
tof a h
tof a i
tof a j
H a
Z l c a
H a
tof a b
tof a h
tof a k
tof c d
tof c f
tof c h
H c
Z l b c
H c
tof c d
tof c f
tof c g
tof c h
tof c j
tof a b
tof a c
tof a e
H a
Z l k a
H a
tof a b
tof a c
tof a e
tof a f
tof c k
tof i k
tof a i
tof c b
H j
Z b l j
H j
tof a l
tof j a
tof b j
tof i l
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a l
tof a k
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a f
tof a e
tof a c
tof a b
H a
Z l k a
H a
tof a e
tof a c
tof a b
tof c j
tof c h
tof c g
tof c f
tof c d
H c
Z l b c
H c
tof c j
tof c h
tof c g
tof c f
tof c d
tof a k
tof a h
tof a b
H a
Z l c a
H a
tof a j
tof a i
tof a h
tof a g
tof a e
tof e a
tof i g
tof k i
tof k c
tof l a
tof k a
tof a k
tof c f
tof l c
tof l b
tof j h
tof j g
tof j f
tof j e
tof j a
tof i k
tof i f
tof c i
tof i a
tof c l
tof c h
tof c g
X c
tof a c
tof c a
tof c d
tof c h
tof i l
tof c i
tof i a
tof i d
tof i f
tof i g
tof j a
tof j b
tof j i
tof j c
tof e l
tof l b
tof l e
tof l f
tof l h
tof l i
tof l j
tof l k
tof a k
tof k a
tof k c
tof k d
tof k e
tof k f
tof k g
tof k l
tof d a
X e
tof a b
tof d e
tof a d
tof a g
tof a h
tof a i
tof a l
tof a f
H a
Z l c a
H a
tof a f
tof a e
tof a g
tof a h
tof a j
H a
Z l b a
H a
tof a e
tof a g
tof a h
tof a j
tof d a
tof a k
tof d b
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d e
tof d b
tof a k
tof d a
tof a j
tof a h
tof a g
tof a e
H a
Z l b a
H a
tof a j
tof a h
tof a g
tof a e
tof a f
H a
Z l c a
H a
tof a f
tof a l
tof a i
tof a h
tof a g
tof a e
tof a d
tof a b
tof k d
tof d a
tof k l
tof k g
tof k f
tof k e
tof k c
tof a k
tof l k
tof j i
tof j h
tof l j
tof l f
tof l e
tof l b
tof e l
X d
tof c d
tof j c
tof j b
tof j a
tof i l
tof i g
tof i f
tof i d
tof c i
tof i a
tof c l
tof c h
tof a c
tof c e
X c
tof c a
tof c g
tof c l
tof i b
tof i e
tof i k
tof k i
tof i g
tof a e
tof j a
tof j g
tof d l
tof l b
tof l d
tof l h
tof l i
tof k b
tof l j
tof k c
tof k h
tof a k
tof e k
tof k l
tof a d
tof a f
tof a i
tof e a
tof a j
tof e c
tof d e
tof e b
tof e h
tof e i
H e
Z l c e
H e
tof d l
tof d c
tof d k
H d
Z l b d
H d
tof d l
tof d g
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d g
tof d l
H d
Z l b d
H d
tof d k
tof d i
tof d h
tof d e
tof d c
tof d b
tof d l
H e
Z l c e
H e
tof e k
tof e j
tof e i
tof e h
tof e b
tof e a
tof e c
tof a e
tof e l
tof a k
tof a j
tof a i
tof a f
tof a d
tof l i
tof l h
tof l b
tof k l
tof c g
tof k c
tof l j
tof l d
tof d l
tof j e
tof a d
tof j a
tof i k
tof i e
tof e l
tof c e
tof a f
tof a c
X a
tof c a
tof a c
tof c e
tof i a
tof i c
tof i f
tof j l
tof l j
tof j c
tof j f
tof l e
tof l h
tof l i
tof l k
tof k c
tof k d
tof k g
tof k j
tof d a
tof a b
tof a e
tof a k
tof a l
tof a f
tof a h
H a
Z l c a
H a
tof d h
tof d i
tof a d
tof f g
tof f j
tof a f
tof f a
tof d l
tof d a
tof d e
tof d j
X d
H d
Z b l d
H d
tof l j
X j
tof d j
tof f k
tof f i
H f
Z l k f
H f
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f j
tof f i
tof f g
tof f a
tof f k
H d
Z l b d
H d
tof d i
tof d e
tof a h
tof d a
tof d l
tof a j
tof a i
tof a g
tof a f
tof a d
H a
Z l c a
H a
tof a h
tof l f
tof a l
tof a k
tof a e
tof a b
tof d a
tof k j
tof k g
tof k d
tof l k
tof k c
tof l j
tof l i
tof l h
tof l e
tof e l
tof l f
tof j l
tof j c
tof i f
tof i c
tof c e
tof c d
X d
X e
tof c g
tof c h
tof j b
tof l b
tof j a
tof l c
tof l d
tof l i
tof l k
tof d k
tof k b
tof k c
tof k d
tof k f
tof k l
tof f a
tof a c
tof f b
tof a f
tof a d
tof a e
tof a h
tof a i
tof a k
H a
Z l c a
H a
tof a b
tof a d
tof a e
tof a g
tof a h
tof a i
tof a k
tof f l
tof f a
tof f h
tof f i
tof f j
H f
Z l b f
H f
tof e l
tof e k
tof e f
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e f
tof e k
tof e l
H f
Z l b f
H f
tof f j
tof f i
tof a h
tof a b
tof f a
tof f l
tof a k
tof a i
tof a g
tof a e
tof a d
H a
Z l c a
H a
tof a k
tof a i
tof a h
tof a e
tof a d
tof a b
tof a f
tof a c
tof f a
tof l f
tof l d
tof l c
tof l b
tof k l
tof d k
tof l i
tof j h
tof j g
tof j d
tof j b
tof j a
tof a j
tof i j
tof i g
tof i b
tof c l
tof c h
tof c g
tof c i
X i
tof i c
tof c f
tof a c
X d
X l
tof c b
tof c g
tof c h
tof c k
tof i b
tof i j
tof j i
tof i c
tof i g
tof i h
tof j a
tof j d
tof e f
tof j e
tof j l
tof a l
tof l a
tof l d
tof l h
tof l i
tof d k
tof k b
tof k c
tof k d
tof k f
tof k h
tof k i
tof k l
tof d a
tof a c
tof a d
tof a e
tof a i
tof a j
tof b d
tof b f
tof b g
tof b j
H b
Z l c b
H b
tof b d
tof b f
tof e b
tof b g
tof b j
tof e k
X e
X d
tof e h
H e
Z l b e
H e
H l
Z j k l
H l
tof k j
H a
Z k l a
H a
tof l j
tof a k
tof c b
H j
Z b l j
H j
tof a l
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H a
Z l k a
H a
H l
Z j k l
H l
H e
Z l b e
H e
tof e k
tof e j
tof e h
tof e g
tof b f
tof e b
tof b j
tof b g
tof b d
H b
Z l c b
H b
tof b j
tof b g
tof b f
tof b d
tof a j
tof a i
tof a f
tof a e
tof a d
tof a c
tof d a
tof i h
tof l i
tof k l
tof k f
tof k d
tof k c
tof k b
tof d k
tof l d
tof l a
tof j a
tof a l
tof i g
tof i f
tof j i
tof j e
tof j d
tof j c
tof c j
tof c b
tof i c
tof i a
tof a i
tof c k
tof c i
tof c h
tof c g
X l
tof i c
X i
tof a i
tof c a
tof c e
tof c h
tof c j
tof i c
tof c k
tof c l
tof i g
tof i l
tof d j
tof j b
tof j d
tof j i
tof j h
tof j l
tof f l
tof l b
tof l c
tof l f
tof l g
tof l h
tof l j
tof l k
tof a k
tof k a
tof k b
tof d c
tof k d
tof k g
tof k i
tof d k
tof k j
tof k l
tof a f
tof d a
tof a i
tof f h
tof d f
H d
Z l c d
H d
tof f l
tof f a
tof f c
tof f k
H f
Z l b f
H f
tof f l
tof f k
tof f c
tof f h
tof f i
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f i
tof f h
tof f c
tof f k
tof f l
H f
Z l b f
H f
tof f k
tof f h
tof f c
tof f a
tof f l
H d
Z l c d
H d
tof k j
tof k i
tof d k
tof d h
tof a f
tof d a
tof k d
tof l c
tof d l
tof a i
tof k g
tof k b
tof k a
tof a k
tof l k
tof j h
tof l j
tof l g
tof l f
tof l b
tof f l
tof i l
tof j i
tof j d
tof j b
tof d j
tof i j
tof i h
tof i g
tof i e
tof i a
tof c a
tof a i
tof c l
tof c k
tof c j
tof c h
tof c e
tof a c
tof c b
X c
tof c a
tof c f
tof c h
tof c i
tof c j
tof c k
tof c l
tof a i
tof i a
tof i b
tof i e
tof i g
tof i h
tof i k
tof i l
tof a j
tof j a
tof j c
tof j i
tof l i
tof j f
tof l j
tof l c
tof l d
tof k a
tof k b
tof k c
tof k g
tof k i
tof k l
tof d a
tof a b
tof a d
tof a h
tof a l
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
tof a k
H a
Z l c a
H a
tof a b
tof a i
tof a j
tof f a
tof a k
tof f l
tof f b
tof f c
tof f i
H f
Z l b f
H f
tof a b
tof a d
tof a h
H a
Z l k a
H a
tof a b
tof a d
tof a h
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a h
tof a d
tof a b
H a
Z l k a
H a
tof a h
tof a d
tof a b
H f
Z l b f
H f
tof f k
tof f i
tof f c
tof a b
tof f a
tof f l
tof a k
tof a j
tof a i
H a
Z l c a
H a
tof a k
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a l
tof a h
tof a d
tof a b
tof d a
tof l i
tof k l
tof k g
tof k c
tof k b
tof k a
tof l j
tof l d
tof l c
tof j i
tof c f
tof c a
tof j c
tof a j
tof i l
tof i k
tof i h
tof i g
tof i e
tof i b
tof i a
tof a i
tof c l
tof c k
tof c h
X c
tof c b
X d
tof a c
tof c a
tof c d
tof c g
tof c i
tof c j
tof i c
tof c k
tof c l
tof i a
tof i h
tof j a
tof j b
tof j e
tof j f
tof j g
tof a l
tof l a
tof l c
tof l d
tof l e
tof l f
tof l h
tof l i
tof a l
tof l k
tof k a
tof k c
tof k d
tof k e
tof k g
tof a k
tof k i
X e
tof a d
tof a e
tof a b
tof a j
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
H a
Z l c a
H a
tof a b
tof a i
tof a j
tof d a
tof a k
tof f l
tof f b
tof f c
tof f i
H f
Z l b f
H f
tof d l
tof d b
tof d h
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d h
tof d b
tof a k
tof d a
tof d l
H f
Z l b f
H f
tof f i
tof f c
tof f b
tof f l
tof a j
tof a i
tof a b
H a
Z l c a
H a
tof a k
tof a j
tof a i
tof a b
tof c l
H c
Z b i c
H c
tof c l
tof l i
tof a l
tof a e
tof a d
tof a b
tof k l
tof k g
tof k e
tof k d
tof k c
tof l a
tof k a
tof a k
tof l h
tof l f
tof l e
tof l d
tof l c
tof a l
tof j g
tof j f
tof j e
tof j b
tof j a
tof i l
tof i k
tof i h
tof c a
tof i c
tof c i
tof c l
tof c k
tof c j
tof c g
tof c d
tof a c
tof c b
X c
tof c a
tof c d
tof c e
tof c f
tof c g
tof c i
tof c j
tof c k
tof c l
tof d i
tof i b
tof i d
tof i g
tof i h
tof i k
tof d j
tof j c
tof j d
tof j g
tof j l
tof l j
tof j h
tof j i
tof l b
tof l d
tof l k
tof a k
tof k a
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof a b
tof d f
tof a d
tof a g
tof a k
tof d l
tof d c
tof d e
tof d i
tof d k
H d
Z l c d
H d
tof d l
tof d b
tof d a
tof d c
tof d h
tof d k
H d
Z l b d
H d
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
H d
Z l b d
H d
tof d k
tof d h
tof d c
tof a b
tof d a
tof d l
H d
Z l c d
H d
tof d k
tof d i
tof d f
tof d e
tof d c
tof d l
tof k g
tof k f
tof a k
tof k a
tof a d
tof k h
tof k e
tof k c
tof a k
tof l k
tof i h
tof j i
tof j d
tof l j
tof l b
tof c l
tof j c
tof c j
tof j g
tof d j
tof i k
tof i g
tof i d
tof i b
tof c d
tof d i
X d
tof c k
tof c f
tof c e
tof c b
tof a e
tof a c
X a
tof c a
tof a c
tof c b
tof i j
tof i k
tof c i
tof c l
tof i a
tof i c
tof i e
tof i g
tof j i
tof i h
tof j a
tof j b
tof j f
tof j d
tof j l
tof a l
tof l a
tof l c
tof l d
tof l g
tof l j
tof l k
tof a k
tof k a
tof k b
tof k c
tof k j
tof k l
tof d e
tof d a
tof a d
tof a f
tof a g
tof a i
tof a j
tof a l
tof d l
tof d c
tof d i
tof d j
tof d k
H d
Z l c d
H d
tof e b
tof e g
tof e h
tof e k
H e
Z l b e
H e
tof e l
tof e k
tof e a
tof e b
tof e f
tof e i
tof e j
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e j
tof e i
tof e f
tof e b
tof e a
tof e k
tof e l
H e
Z l b e
H e
tof e k
tof e h
tof e b
tof a e
tof e g
H d
Z l c d
H d
tof k j
tof d k
tof d i
tof d e
tof d c
tof a d
tof d l
tof a j
tof a i
tof a f
tof d a
tof l c
tof k l
tof k b
tof l a
tof k a
tof a k
tof l j
tof l g
tof l d
tof j a
tof a l
tof i h
tof j i
tof j f
tof j d
tof j b
tof i k
tof i j
tof i g
tof c e
tof c a
tof i c
tof c i
tof c l
tof c k
tof c j
tof a c
X c
tof c f
tof c g
tof i h
tof i j
tof c i
tof c k
tof c l
tof i b
tof j i
tof i c
tof i d
tof i g
tof j e
tof j f
tof j l
tof l j
tof j h
tof a c
tof l a
tof l d
tof l e
tof l i
tof k c
tof k d
tof k e
tof k f
tof k i
tof k j
tof a g
tof a h
tof e l
tof e a
tof e g
tof e k
H e
Z l c e
H e
tof d l
tof d a
tof d c
tof d e
tof d f
tof d h
tof d i
tof d j
H d
Z l b d
H d
tof a b
tof a d
tof a h
tof a i
H a
Z l k a
H a
tof a b
tof a d
tof a h
tof a i
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a h
tof a d
tof a b
H a
Z l k a
H a
tof a i
tof a h
tof a d
tof a b
H d
Z l b d
H d
tof j i
tof d j
tof d h
tof d f
tof d e
tof d c
tof d a
tof d l
H e
Z l c e
H e
tof e k
tof a g
tof e a
tof e l
tof a h
tof a c
tof l a
tof a b
tof k j
tof k f
tof k e
tof k d
tof k c
tof j h
tof j e
tof l j
X e
tof l d
tof j l
tof l c
tof j g
tof j f
tof i j
tof j d
X d
tof i h
tof i g
tof i c
tof i b
tof c i
tof c f
X b
tof c a
tof c d
tof a i
tof i a
tof i d
tof i e
tof i f
tof i g
tof k h
tof i k
tof f j
tof j b
tof j c
tof j f
tof j g
tof j k
tof j l
tof a l
tof l a
tof l b
tof l c
tof l f
tof l i
tof k a
tof k b
tof k d
tof k e
tof k j
tof a h
tof a i
tof a k
tof a l
tof e l
tof e c
tof b f
tof e b
tof e g
tof e h
tof e k
H e
Z l c e
H e
tof d l
tof d a
tof d c
tof d h
H d
Z l b d
H d
tof b c
tof b e
tof i j
tof l j
tof b i
tof i j
H b
Z l k b
H b
tof b c
tof b e
tof b f
tof b i
tof c b
H j
Z b l j
H j
tof b j
tof c j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof c j
tof b c
H j
Z c l j
H j
tof l j
tof c j
tof b i
tof b f
tof b e
H b
Z l k b
H b
tof b j
tof b i
tof b f
tof b e
tof b c
H d
Z l b d
H d
tof d h
tof d c
tof d a
tof d l
H e
Z l c e
H e
tof e k
tof e h
tof e g
tof e f
tof c b
tof e c
tof e l
tof a l
tof a k
tof a i
tof k a
tof a h
tof k j
tof k e
tof k d
tof k b
tof l i
tof l f
tof l c
tof l a
tof a l
tof j l
tof j k
tof j h
tof j g
tof j f
tof j c
tof c j
tof f j
tof i k
tof i h
tof i g
tof i f
tof i e
tof i d
tof i a
tof a i
tof c l
tof c k
tof c h
tof c g
tof a c
X a
tof c a
tof a c
tof a d
tof c b
tof c f
tof c h
tof c j
tof c k
tof c l
tof a i
tof i a
tof i e
tof i f
tof i g
tof i h
tof i l
tof d j
tof j b
tof j c
tof j d
tof j e
tof j h
tof j k
tof a j
tof j l
tof l a
tof l c
tof l h
tof l k
tof d k
tof k b
tof k c
tof d i
tof k d
tof k j
tof k l
tof a b
tof a d
tof e g
tof e l
tof a e
X j
tof l j
tof e b
X e
H e
Z c l e
H e
tof e j
H a
Z l b a
H a
tof a f
tof a k
tof d k
tof d b
tof d g
tof d h
tof d j
H d
Z l k d
H d
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d h
tof d g
tof d b
tof d k
tof a k
tof a f
H a
Z l b a
H a
H e
Z l c e
H e
tof a e
tof e j
tof e g
tof e b
tof e l
tof a i
tof a d
tof l j
tof k l
tof k i
tof k d
tof k c
tof k b
tof d k
tof l k
tof l h
tof l c
tof l a
tof a l
tof j l
tof j k
tof j h
tof j e
tof j d
tof c b
tof j c
tof c j
X b
tof d j
tof i l
tof i h
tof i g
tof i f
tof i e
tof i a
tof a i
tof c l
tof c k
tof c h
tof c f
tof c a
tof a c
X c
tof e c
tof c e
tof c g
tof c h
tof j k
tof i j
tof i l
tof c i
tof i d
tof i e
tof j b
tof j c
tof j d
tof j g
tof j h
tof a l
tof l a
tof l e
tof l f
tof l i
tof l j
tof l k
tof a k
tof k a
tof k e
tof k f
tof h i
tof k h
tof k g
tof k j
tof d a
tof a b
tof a c
tof a d
tof a f
tof a h
tof h i
tof a j
tof c l
H c
Z b i c
H c
tof c l
tof c i
tof a b
tof a i
H a
Z l c a
H a
tof a b
tof a i
tof a k
tof c d
tof c e
tof c f
tof c k
H c
Z l b c
H c
tof c d
tof c e
tof c f
tof c i
tof c k
tof a b
tof a d
tof a e
H a
Z l k a
H a
tof a b
tof a d
tof a e
tof a j
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a e
tof a d
tof a b
H a
Z l k a
H a
tof a e
tof a d
tof a b
tof c k
tof c i
tof c f
tof c e
tof c d
H c
Z l b c
H c
tof c k
tof c i
tof c f
tof c e
tof c d
tof a k
tof a i
tof a b
H a
Z l c a
H a
tof a j
tof a i
tof a b
tof c l
H c
Z b i c
H c
tof c l
tof l i
tof a i
tof a h
tof a f
tof a d
tof a c
tof a b
tof d a
tof k j
tof k i
tof k h
tof k g
tof k f
tof k e
tof l a
tof k a
tof a k
tof l j
tof l f
tof l e
tof a l
tof j h
tof j g
tof j d
tof j c
tof j b
tof i l
tof i j
tof i e
tof i d
tof c l
tof c j
tof c i
tof c h
tof c g
tof c e
tof e c
X d
X f
tof a c
tof c a
tof c b
tof c d
tof c g
tof c h
tof c i
tof c j
tof c l
tof i a
tof i b
tof i c
tof i d
tof i g
tof j a
tof j c
tof j h
tof l h
tof j g
tof a b
tof l a
tof l d
tof l e
tof l i
tof l k
tof a k
tof a c
tof k a
tof k d
tof f j
tof k f
tof a e
tof a i
tof a j
tof a l
tof f i
H f
Z l c f
H f
tof f i
tof b f
tof f j
tof d l
tof d a
tof d i
tof d k
H d
Z l b d
H d
tof b c
tof b d
tof b h
H b
Z l k b
H b
tof b c
tof b d
tof b f
tof b h
tof c b
H j
Z b l j
H j
tof l j
tof b j
tof c j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof c j
tof b c
H j
Z c l j
H j
tof l j
tof c j
tof b h
tof b f
tof b d
H b
Z l k b
H b
tof b j
tof b h
tof b f
tof b d
tof b c
H d
Z l b d
H d
tof d k
tof a i
tof d a
tof d l
tof f j
tof f i
H f
Z l c f
H f
tof f j
tof f i
tof a l
tof a j
tof a e
tof k a
tof a c
tof l a
tof a b
tof k j
tof k f
tof k d
tof a k
tof j a
tof l i
tof l h
tof l e
tof l d
tof j h
tof j g
tof j c
tof i g
X d
tof c d
tof c b
tof c a
tof i c
tof c i
tof c l
tof c j
tof c h
tof c g
tof a c
X c
tof c b
tof c g
tof c h
tof c i
tof c j
tof d i
tof i d
tof j g
tof j l
tof i j
tof j b
tof j c
tof j h
tof a l
tof a c
tof l a
tof l d
tof l g
tof l h
tof l k
tof a k
tof a b
tof k a
tof k f
tof k g
tof k i
tof k l
tof d e
tof d h
tof a d
tof a k
H a
Z l c a
H a
tof a b
tof a e
tof a g
tof h i
tof a h
tof h i
tof a j
tof d l
tof d a
tof d c
tof d f
tof d i
H d
Z l b d
H d
tof a b
tof a d
tof a e
tof a f
tof a g
tof a h
H a
Z l k a
H a
tof a b
tof a d
tof a e
tof a f
tof a g
tof a h
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a h
tof a g
tof a f
tof a e
tof a d
tof a b
H a
Z l k a
H a
tof a h
tof a g
tof a f
tof a e
tof a d
tof a b
H d
Z l b d
H d
tof d i
tof d h
tof d f
tof d e
tof d c
tof d a
tof d l
tof a j
tof a i
tof a h
tof a g
tof a e
tof a b
H a
Z l c a
H a
tof a j
tof a h
tof a e
tof k b
tof a k
tof a d
tof k a
tof k l
tof l a
tof a c
tof k j
tof k i
tof k g
tof k f
tof a k
tof l h
tof l g
tof l d
tof a l
tof j l
tof j k
tof j h
X g
tof c g
tof c b
tof j c
tof c j
X b
tof i l
tof i k
tof i j
tof i g
tof i d
tof d i
tof c k
tof i h
tof c i
X c
X f
tof g c
tof i g
tof c i
tof c j
tof c l
tof i b
tof i c
tof i d
tof i f
tof i k
tof a j
tof j a
tof j b
tof j c
tof j d
tof j f
tof j g
tof j h
tof j k
tof j l
tof j i
tof g l
tof l c
tof l g
tof l h
tof l j
tof a f
tof k a
tof k g
tof k h
tof a k
tof k l
tof a b
tof a c
tof a e
tof f a
tof d a
tof a j
tof f l
tof f c
tof f b
tof f g
H f
Z l c f
H f
tof d l
tof d b
tof d c
tof d f
tof d h
tof d k
H d
Z l b d
H d
tof b d
tof b f
tof b g
tof b h
tof b i
tof b j
H b
Z l k b
H b
tof b d
tof b f
tof b g
tof b h
tof b i
tof c b
H j
Z b l j
H j
tof l j
tof b j
tof c j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof c j
tof b c
H j
Z c l j
H j
tof l j
tof c j
tof b c
tof b i
tof b h
tof b g
tof b f
tof b d
H b
Z l k b
H b
tof i h
tof b i
tof b j
tof b g
tof b f
tof b d
H d
Z l b d
H d
tof d k
tof d j
tof d h
tof d f
tof d c
tof a b
tof d a
tof d l
H f
Z l c f
H f
tof f j
tof f g
tof a c
tof a l
tof f a
tof k f
tof a k
tof a j
tof a e
tof l h
tof l g
tof k l
tof k a
tof j c
tof l j
tof j g
tof g l
tof i k
tof i f
tof i d
tof i b
tof j i
X b
tof j a
tof a j
tof i c
tof c i
tof i g
X i
tof c l
X j
tof j h
tof c j
tof g c
tof c e
tof c f
tof i a
tof i d
tof i f
tof i g
tof i k
tof i l
tof j a
tof j b
tof j e
tof j g
tof j k
tof e l
tof l e
tof l g
tof l h
tof l i
tof l j
tof d k
tof k c
tof k d
tof k h
tof k l
tof k i
tof d e
tof d f
tof d a
tof a d
tof a h
tof d a
tof a i
tof a k
tof a l
tof d c
tof d b
tof d g
H d
Z l c d
H d
tof c e
tof c f
tof c g
tof c i
tof c j
tof c k
H c
Z l b c
H c
tof c e
tof c f
tof c g
tof c i
tof c j
tof d c
tof c k
tof d a
tof d b
tof d e
tof d g
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d g
tof c e
tof d c
tof d b
tof d a
tof d k
tof c k
tof c j
tof c i
tof c g
tof c f
H c
Z l b c
H c
tof c k
tof c j
tof c i
tof c g
tof c f
tof c e
H d
Z l c d
H d
tof k i
tof d k
tof d g
tof d f
tof d e
tof d b
tof d a
tof d c
tof a d
tof d l
tof k h
tof a k
tof a f
tof a e
tof d a
tof k l
tof k d
tof k c
tof d k
tof l j
tof l i
tof l h
tof l g
tof l e
tof e l
tof l e
X d
tof l d
tof i l
tof l i
tof i a
tof c e
tof c d
tof c g
tof c h
tof j f
tof j d
tof l j
tof l c
tof k c
tof k g
tof k i
tof k j
tof d a
tof a b
tof a c
tof a d
tof a f
tof a h
tof a l
tof c l
H c
Z b i c
H c
tof b i
tof c l
tof b j
tof a b
H a
Z l c a
H a
tof a b
tof a k
tof f l
tof f i
H f
Z l b f
H f
tof b d
tof b e
tof b h
H b
Z l k b
H b
tof b d
tof b e
tof b h
tof b i
tof c b
H j
Z b l j
H j
tof l j
tof b j
tof c j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof c j
tof b c
H j
Z c l j
H j
tof l j
tof c j
tof b c
tof b i
tof b h
tof b e
tof b d
H b
Z l k b
H b
tof b j
tof b i
tof b h
tof b e
tof b d
H f
Z l b f
H f
tof f i
tof f l
tof a k
tof a i
tof a b
H a
Z l c a
H a
tof a j
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a l
tof a h
tof a f
tof a d
tof a c
tof a b
tof l d
tof d a
X d
tof k i
tof k g
tof k c
tof l j
tof l i
tof l e
tof l c
tof j h
tof j e
tof i k
tof c h
tof c g
X e
tof c d
X c
tof c f
tof i c
tof h c
tof c h
tof i d
tof i l
tof j h
tof a l
tof l a
tof l b
tof l f
tof l g
tof l h
tof l i
tof l j
tof l k
tof a l
tof k a
tof k b
tof k d
tof e h
tof k e
tof d h
tof d k
tof a d
tof d a
tof e c
tof e a
tof d e
tof e f
tof e j
X e
tof a j
H e
Z l c e
H e
tof d l
tof d b
tof d c
tof d g
tof d i
H d
Z l b d
H d
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
H d
Z l b d
H d
tof d k
tof i h
tof d i
tof d j
tof d g
tof d f
tof d e
tof d c
tof d a
tof d b
tof d l
H e
Z l c e
H e
tof e j
tof e h
tof e f
tof e a
tof e c
tof k l
tof k h
tof a k
tof k a
tof a d
tof k e
tof l k
tof k b
tof j g
tof j f
tof l j
tof l i
tof i l
tof j h
tof j d
tof i j
tof i c
tof c h
tof h c
tof c b
X c
tof c h
tof c e
tof c f
tof j c
tof j e
tof e j
tof e b
tof j g
tof l b
tof l d
tof l i
tof l k
tof a k
tof a c
tof k a
tof k g
tof a k
tof k i
tof a l
tof e l
tof e h
tof e i
H e
Z l c e
H e
tof a c
H a
Z l b a
H a
tof a c
tof a d
tof a f
tof a h
tof e a
tof a k
tof e c
tof e f
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e f
tof a c
tof a k
tof e a
tof a h
tof a f
tof a d
H a
Z l b a
H a
tof a k
tof a c
H e
Z l c e
H e
tof e j
tof e i
tof e h
tof e g
tof e l
X e
tof l i
tof e b
tof a l
tof k a
tof a c
tof k i
tof j k
tof k g
tof i k
tof l a
tof a k
tof l d
tof l b
tof a l
tof j e
tof j c
tof c b
tof i j
tof l a
tof l f
tof i l
tof i e
tof i d
tof c h
tof c f
tof c d
tof c i
tof i a
tof i b
tof i k
tof d k
tof j d
X d
tof j f
tof l k
tof l j
tof j h
tof l c
tof c d
tof k c
tof k i
tof h a
tof a h
tof a i
tof a j
tof a k
tof a l
tof b d
tof b h
H b
Z l c b
H b
tof b d
tof b h
tof c f
tof c g
tof c k
H c
Z l b c
H c
tof c d
tof e c
tof c f
tof c g
tof c k
tof e l
tof e a
tof e b
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e g
tof c f
tof e c
tof e b
tof a k
tof e a
tof e l
tof c k
tof c g
tof c d
H c
Z l b c
H c
tof c k
tof c g
tof c f
tof c d
tof b h
tof b d
H b
Z l c b
H b
tof b h
tof b d
tof l j
tof a l
tof a i
tof l h
tof a h
tof h a
tof k i
tof k d
tof l k
tof k c
tof d k
tof l f
tof j f
tof j d
tof j b
tof j a
tof i k
tof i g
tof i b
tof i a
tof c i
tof c g
tof c e
tof e c
X c
tof c e
tof e d
X f
tof c f
tof c i
tof a i
tof i a
tof i b
tof i c
tof i d
tof i e
tof i f
tof l g
tof i l
tof j l
tof j i
tof j c
tof l j
tof l a
tof l b
tof l f
tof k h
tof l k
tof k a
tof k b
tof k c
tof k d
tof k f
tof k g
tof d a
tof a d
tof a h
tof a i
tof a l
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
tof a k
H a
Z l c a
H a
tof a b
tof a i
tof k j
tof a k
tof a d
tof a h
H a
Z l b a
H a
tof a d
tof a h
tof f l
tof f a
tof f c
tof f i
tof f j
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f j
tof f i
tof f c
tof f a
tof f l
tof a h
tof a d
H a
Z l b a
H a
tof a h
tof a d
tof a k
tof a j
tof a i
tof a b
H a
Z l c a
H a
tof a k
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a l
tof a i
tof a h
tof k d
tof a d
tof d a
tof k h
tof k g
tof k f
tof k c
tof l k
tof k b
tof j h
tof j g
tof l j
tof l f
tof l a
tof j l
tof j k
tof i c
tof j i
tof i l
tof i g
tof i f
tof i e
tof i d
tof i b
tof i a
tof a i
tof c i
tof c f
tof c e
tof e c
tof c b
X c
tof c i
tof i a
tof i d
tof i g
tof i j
tof i k
tof i l
tof d j
tof j b
tof j c
tof j d
tof j e
tof j f
tof j g
tof h i
tof j h
tof j l
tof e l
tof l e
tof l i
tof l k
tof d k
tof k d
tof k j
tof d a
tof b j
tof a b
tof b j
tof a l
tof h l
tof h c
tof h b
H h
Z l c h
H h
tof a g
H a
Z l b a
H a
tof a d
tof a e
tof a f
tof a g
tof a i
tof a k
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof a k
tof a i
tof a g
tof a f
tof a e
tof a d
H a
Z l b a
H a
tof a g
H h
Z l c h
H h
tof h i
tof h b
tof h c
tof h l
tof a l
tof a j
tof a b
tof d a
tof k j
tof k d
tof d k
tof l k
tof l i
tof l e
tof j e
tof e l
tof j i
tof j h
tof j g
tof j f
tof j d
tof c b
tof j c
X b
tof i d
tof d j
X d
tof l g
tof l a
tof i l
tof i k
tof c i
X c
X e
tof d c
tof c d
tof c f
tof c g
tof c h
tof c i
tof d i
tof i b
tof i c
tof i d
tof i e
tof i f
tof i h
tof j a
tof j b
tof j c
tof j d
tof j e
tof j g
tof j f
tof j k
tof l b
tof l d
tof l e
tof k h
tof l k
tof k a
tof k c
tof k d
tof k e
tof k f
tof k g
tof k i
tof d a
tof a d
tof a e
tof a f
tof a g
tof a k
tof b f
tof b j
H b
Z l c b
H b
tof b f
tof e b
tof b j
tof e a
tof e c
tof d e
tof e g
H e
Z l b e
H e
tof d k
tof d a
tof d b
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d e
tof d b
tof d a
tof d k
H e
Z l b e
H e
tof e j
tof e g
tof e c
tof e a
tof e b
tof j f
tof b j
H b
Z l c b
H b
tof b j
tof k g
tof k f
tof k e
tof k d
tof a k
tof l d
tof j d
tof d a
tof i h
tof i c
tof k i
tof l k
tof l g
tof j k
tof j g
tof j e
tof j c
tof j b
tof i f
tof i e
tof i d
tof i b
tof c d
tof d i
tof c h
tof c g
X c
tof c f
tof d c
X b
tof c b
tof c d
tof c e
tof c g
tof c h
tof c i
tof i e
tof k g
tof i k
tof i j
tof a j
tof j a
tof j b
tof j c
tof j e
tof k j
tof j i
tof l a
tof l c
tof k d
tof k f
tof a k
tof k h
tof a d
tof a e
tof a f
tof a i
tof a l
tof c l
H c
Z b i c
H c
tof b i
tof c l
tof a b
tof b i
H a
Z l c a
H a
tof a b
tof a i
tof a j
tof a k
tof c d
tof c f
tof c h
H c
Z l b c
H c
tof c d
tof c f
tof c h
tof f k
tof f a
tof f b
tof f i
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f i
tof f b
tof a k
tof f a
tof c h
tof c f
tof c d
H c
Z l b c
H c
tof c h
tof c f
tof c d
tof a j
tof a i
tof a b
H a
Z l c a
H a
tof a k
tof a i
tof a b
tof c l
H c
Z b i c
H c
tof c b
tof c l
X b
tof a l
tof a i
tof a h
tof a f
tof a e
tof a d
tof j i
tof k j
tof k h
tof k g
tof k f
tof k d
tof l h
X e
tof c e
tof l c
tof l a
tof j c
tof j a
tof a j
tof i k
tof i j
tof i g
tof i e
tof i h
tof c i
tof c g
tof c d
tof e c
tof c b
tof e f
tof c e
tof c k
tof i c
tof c l
tof j i
tof i a
tof i d
tof i e
tof j b
tof j c
tof j h
tof j g
tof k j
tof d l
tof l c
tof l d
tof l e
tof l g
tof l i
tof l k
tof a l
tof a c
tof k a
tof k d
tof k f
tof k h
tof a b
tof a e
tof a g
tof a j
tof e l
tof e c
tof e h
tof e k
H e
Z l c e
H e
tof e l
tof e b
tof e a
tof e k
H e
Z l b e
H e
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
H e
Z l b e
H e
tof e k
tof a b
tof e a
tof e l
H e
Z l c e
H e
tof k h
tof k f
tof l c
tof k l
tof e k
tof l j
tof l g
tof l f
tof l e
tof a l
tof k j
tof k d
tof k a
tof l k
tof l i
tof l d
tof d l
tof j i
tof j h
tof j g
tof j f
tof j e
tof j d
tof i c
tof c b
tof j c
tof i j
tof j a
tof i l
tof i f
tof i e
tof i d
tof c l
tof c k
tof c f
tof c e
tof e c
tof c d
tof c f
tof c j
tof c k
tof e c
tof i e
tof a j
tof j a
tof j b
tof j c
tof j d
tof j f
tof j k
tof k j
tof j i
tof l j
tof l a
tof l c
tof l d
tof l g
tof e b
tof k e
tof k l
tof f a
tof a b
tof a f
tof h j
tof a h
tof a l
tof e a
tof e h
X e
tof e g
tof h b
H e
Z l c e
H e
tof h a
tof h c
tof h i
H h
Z l b h
H h
tof f l
tof f k
tof f a
tof f c
tof f g
tof f h
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X f
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f h
tof f g
tof f c
tof f a
tof f k
tof f l
H h
Z l b h
H h
tof h j
tof h i
tof h c
tof a b
tof h a
H e
Z l c e
H e
tof e j
tof e g
tof a h
tof e a
tof k e
tof e c
tof l j
tof a l
tof a f
tof f a
tof k l
tof k i
tof j k
tof k b
tof l g
tof l d
tof l c
tof l a
tof i f
tof j i
tof j d
tof j c
tof j a
tof c j
tof i c
tof c k
tof c f
tof c d
tof g c
tof j g
X c
tof c j
tof c k
tof j i
tof i l
tof l j
tof j a
tof j b
tof j c
X h
X e
tof j e
tof j d
tof l f
tof a k
tof k a
tof k b
tof k d
tof k e
tof k h
tof k i
tof d a
tof a b
tof a c
tof a d
tof a f
tof a g
tof a h
tof a i
tof a l
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
tof k j
tof a k
H a
Z l c a
H a
tof a b
tof a i
tof a k
tof f l
tof f b
tof f i
tof f j
H f
Z l b f
H f
tof f l
tof f a
tof f i
X f
X d
tof f g
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f g
tof a i
tof f a
tof f l
H f
Z l b f
H f
tof f j
tof f i
tof f b
tof f l
tof a k
tof a j
tof a b
H a
Z l c a
H a
tof a k
tof a j
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a l
tof a i
tof a h
tof a g
tof a f
tof a d
tof a c
tof a b
tof k d
tof d a
tof k i
tof k h
tof k e
tof k b
tof a k
tof l j
tof l f
tof j l
tof l e
tof l d
tof l c
tof l b
tof l a
tof j i
tof c j
tof j g
tof i f
tof i e
tof c k
tof g c
tof c b
X c
tof c g
tof c e
tof c f
tof c j
tof c k
tof i c
tof i g
tof j a
tof j b
tof j i
tof j e
tof j l
tof a l
tof a c
tof l a
tof k l
tof l e
tof l i
tof d f
tof a d
tof a g
tof a h
tof k a
tof k j
tof a b
H a
Z l c a
H a
tof d b
tof a d
tof a h
tof a i
tof a k
tof d a
tof d c
tof d e
tof d g
tof d i
H d
Z l b d
H d
tof f l
tof f a
tof f b
tof f c
tof f j
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f j
tof f c
tof f b
tof f a
tof f l
H d
Z l b d
H d
tof d i
tof d g
tof d f
tof d e
tof d c
tof d a
tof a d
tof d b
tof k i
tof k h
tof k f
tof a k
H a
Z l c a
H a
tof a h
tof a f
tof a d
tof a b
tof k a
tof a g
tof k l
tof l a
tof a c
tof j e
tof k j
tof k d
tof l i
tof l e
tof j a
tof a l
tof j i
tof j b
tof a j
tof i l
tof i c
tof c i
tof i h
tof i g
tof c f
X b
tof l c
tof c b
tof c d
tof a i
tof i a
tof i b
tof i c
tof i e
tof i j
tof j a
tof j b
tof j f
tof j d
tof j h
tof k g
tof j k
tof l f
tof l k
tof k l
tof k b
tof k d
tof k h
tof k j
tof a d
tof a f
tof a h
tof a i
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
tof a j
H a
Z l c a
H a
tof a b
tof a i
tof a k
H l
Z b i l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b i l
H l
tof a k
tof a i
tof a b
H a
Z l c a
H a
tof a j
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a i
tof a h
tof a f
tof a d
tof k l
tof j h
tof j g
tof j d
tof j b
tof k j
tof j k
tof l k
tof l g
tof l f
tof l d
tof l c
tof l b
tof j f
tof i j
tof j a
tof c e
tof i c
tof a i
tof i b
tof j k
tof c j
tof i h
tof c i
tof c d
X c
tof e c
tof c e
tof c f
tof c g
tof c i
tof c j
tof i a
tof j i
tof i l
tof j d
tof j e
tof j g
tof j f
tof l j
tof l a
tof l k
tof a l
tof a c
tof k a
tof k e
tof d f
tof a d
tof a g
tof a h
tof a k
tof d l
tof d e
H d
Z l c d
H d
tof d b
tof d a
tof d c
tof d e
tof d h
tof d i
tof k j
tof d k
H d
Z l b d
H d
tof d l
tof d b
tof d c
tof d e
tof d f
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d f
tof d e
tof d c
tof d b
tof d l
H d
Z l b d
H d
tof d k
tof d j
tof d i
tof d h
tof d e
tof d c
tof a b
tof d a
H d
Z l c d
H d
tof d e
tof a d
tof d f
tof d l
tof a k
tof a h
tof a g
tof k a
tof a c
tof k l
tof k e
tof l k
tof k b
tof l j
tof l a
tof j k
tof i l
tof j i
tof j g
tof j f
tof j e
tof j d
tof i h
tof i b
tof i a
tof c k
tof c j
tof c i
tof c h
tof c g
tof c f
tof c e
tof e c
tof c b
X c
tof c g
tof c h
tof c i
tof c j
tof c k
tof a i
tof i a
tof i b
tof i c
tof i g
tof i l
tof e j
tof j e
tof j f
tof j g
tof j i
tof j l
tof d a
tof d e
tof l d
tof d b
X e
tof d f
tof l f
tof d g
tof l g
tof a d
tof l h
tof k b
tof k c
tof k g
tof k l
tof a i
tof d j
tof d k
tof d c
H d
Z l c d
H d
H a
Z l b a
H a
tof a e
tof a f
tof a g
tof a h
tof a j
tof d l
tof d k
tof d e
tof d g
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d g
tof d e
tof d k
tof d l
tof a h
tof a g
tof a f
tof a e
H a
Z l b a
H a
tof a g
tof a f
tof a e
H d
Z l c d
H d
tof d k
tof d j
tof d g
tof d f
tof d e
tof c b
tof d c
X b
tof a i
tof a d
tof a b
tof d a
tof k g
tof k c
tof k l
tof l h
tof l f
tof l e
tof l d
tof l a
tof i l
tof j i
tof j f
tof j e
tof e j
tof i c
tof i a
tof a i
tof c k
tof c j
tof c i
tof c h
tof c g
tof d c
X d
tof c d
X e
tof c f
tof c i
tof c j
tof l c
tof c k
tof e i
tof i b
tof i c
tof i e
tof i f
tof i h
tof j k
tof i j
tof a i
tof j a
tof j g
tof j d
tof k d
tof d j
tof k l
tof d l
tof a l
tof l h
tof k e
tof k f
tof a k
tof k j
tof d a
tof a g
H d
Z l c d
H d
tof a e
H a
Z l b a
H a
tof a e
tof d l
tof d k
tof d b
tof d f
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d f
tof d b
tof d k
tof d l
tof a e
H a
Z l b a
H a
tof a e
H d
Z l c d
H d
tof d j
tof d h
tof a g
tof a l
tof d a
tof k j
tof a k
tof a i
tof a h
tof l h
tof k l
tof k f
tof k e
tof j k
tof k d
tof l g
tof l c
tof j i
tof j g
tof j a
tof i k
tof i j
tof i h
tof i f
tof i e
tof i c
tof i b
tof e i
tof c k
tof c j
tof c i
tof c f
tof c d
tof d c
tof c b
tof d e
tof c d
tof d e
X h
X c
tof c i
tof c j
tof c k
tof h i
tof i b
tof i c
tof i h
tof a j
tof a g
tof j a
tof j i
tof a j
tof l j
tof a i
tof l e
tof l f
tof a k
tof a d
tof k a
tof k l
tof a b
tof a c
tof a e
tof a k
H a
Z l c a
H a
H l
Z c k l
H l
H b
Z c k b
H b
tof a c
tof a k
H a
Z l b a
H a
tof a c
tof a k
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof a k
tof a c
H a
Z l b a
H a
tof a k
tof a c
H b
Z c k b
H b
H l
Z c k l
H l
H a
Z l c a
H a
tof k j
tof k i
tof k g
tof a k
tof a e
tof a d
tof c b
tof a c
X b
tof k l
tof k d
tof k a
tof a k
tof l k
tof l j
tof l f
tof l e
tof j i
tof j g
tof j a
tof a j
tof i h
tof i c
tof c i
tof h i
tof c k
tof c j
tof c e
tof c d
X e
tof d c
tof c b
tof c d
tof c f
tof c g
tof c h
tof c k
tof c l
tof i a
tof i b
tof i d
tof i g
tof i l
tof d a
tof j d
tof j f
tof j i
tof j h
tof k j
tof l a
tof l f
tof l k
tof k l
tof k b
tof k c
tof k e
tof k i
tof a c
tof a d
tof e a
tof a g
tof a j
tof e l
tof h b
tof e h
tof e f
tof e k
H e
Z l c e
H e
tof h a
tof h c
tof d h
tof h i
tof h j
H h
Z l b h
H h
tof d l
tof d b
tof d f
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d h
tof d f
tof d b
tof d l
H h
Z l b h
H h
tof h j
tof h i
tof h c
tof h a
tof h b
H e
Z l c e
H e
tof e k
tof e h
tof e g
tof e f
tof e b
tof e a
tof k e
tof e l
tof a j
tof a g
tof a d
tof a c
tof d a
tof k i
tof c b
tof k c
tof c k
tof l k
tof j f
tof j a
tof l j
tof j i
tof j h
tof j d
tof i d
tof i b
tof c l
tof c h
tof c g
tof c f
tof c d
tof e c
tof d c
tof c e
X e
tof c h
tof i c
tof c k
tof i e
tof i f
tof e j
tof j c
tof j e
tof j h
tof j k
tof d l
tof l b
tof l d
tof l e
tof l f
tof l g
tof l j
tof l k
tof k f
tof g k
tof k h
tof e c
tof e a
tof a e
tof a h
tof a i
tof d e
X j
tof e a
tof e b
tof a j
X e
tof e f
H e
Z l c e
H e
tof d l
tof g c
tof d g
X d
H d
Z b l d
H d
tof l j
tof d j
tof g j
H g
Z l k g
H g
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H g
Z l k g
H g
tof g j
tof g h
tof g c
tof g k
H d
Z l b d
H d
tof d k
tof d h
tof d g
tof d f
tof d e
tof d c
tof d a
tof l b
tof d l
tof l d
tof l j
H e
Z l c e
H e
tof e j
tof e f
tof e b
tof e a
tof a e
tof e c
tof a j
tof a i
tof a h
tof e a
tof k h
tof l k
tof i k
tof k f
tof l g
tof l e
tof d l
tof j k
tof j h
tof j e
tof j c
tof e j
tof i l
tof i g
tof c e
tof i c
X i
tof i a
tof c k
tof c h
tof e c
tof j k
X j
tof d c
tof c b
tof c d
tof i g
tof i l
tof c i
tof i a
tof i h
tof i j
tof j a
tof j l
tof k j
tof l j
tof j c
tof l d
tof l f
tof l g
tof l h
tof l i
tof k d
tof k f
tof k l
tof d a
tof a b
tof a c
tof a d
tof a e
tof a f
tof a i
H a
Z l c a
H a
H l
Z c k l
H l
H b
Z c k b
H b
tof a c
tof a k
H a
Z l b a
H a
tof a c
tof a k
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof a k
tof a c
H a
Z l b a
H a
tof a k
tof a c
H b
Z c k b
H b
H l
Z c k l
H l
H a
Z l c a
H a
tof a i
tof a f
tof a e
tof a d
tof a c
tof a b
tof d a
tof l j
tof l f
tof l d
tof l c
tof k l
tof i h
tof l i
tof l g
tof j l
tof j k
tof j c
tof i j
tof j a
tof i k
tof c i
tof c d
X d
tof d c
tof d b
tof c e
tof c h
tof c l
tof i c
tof i d
tof i f
tof i j
tof a j
tof j a
tof j c
tof j d
tof l e
tof j l
tof j k
tof k j
tof j i
tof l i
tof l a
tof l c
tof l d
tof l f
tof l g
tof k a
tof k b
tof k e
tof k h
tof k l
tof d b
tof d a
tof a d
tof a e
tof a f
tof a g
tof a i
tof d a
tof a k
tof d l
tof d c
tof d f
tof d g
tof d h
H d
Z l c d
H d
tof d l
tof d b
tof d a
tof d e
tof d g
tof d h
tof d j
tof d k
H d
Z l b d
H d
tof d k
tof d e
tof d f
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d f
tof d e
tof d k
H d
Z l b d
H d
tof d k
tof d j
tof d h
tof d g
tof d e
tof a b
tof d a
tof d l
H d
Z l c d
H d
tof d k
tof d h
tof d g
tof a f
tof d a
tof d c
tof d l
tof k i
tof a k
tof a g
tof a e
tof a d
tof d a
tof k l
tof k j
tof k h
tof k e
tof k b
tof k a
tof l i
tof l g
tof l f
tof l e
tof l d
tof l c
tof l a
tof j l
tof j k
tof i d
tof j i
X d
tof j c
tof i c
tof c l
tof c h
tof c e
tof c b
tof d c
tof c f
X c
tof c d
tof c b
tof c e
tof c g
tof c h
tof c l
tof i b
tof i e
tof i h
tof i k
tof j b
tof j c
tof j d
tof j f
tof j i
tof j g
tof k j
tof a l
tof l a
tof l e
tof l g
tof l i
tof l k
tof k b
tof k c
tof d e
tof k d
tof k f
tof k g
tof f a
tof a c
tof a h
tof d l
tof d h
tof a d
tof d i
tof d j
H d
Z l c d
H d
tof a c
tof a e
H a
Z l b a
H a
tof a c
tof a d
tof a e
tof f i
tof a f
tof a j
tof f l
tof f k
tof f a
tof f g
tof f h
H f
Z l k f
H f
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f i
tof f h
tof f g
tof f a
tof f k
tof f l
tof a j
tof a i
tof a f
tof a e
tof a d
tof a c
H a
Z l b a
H a
tof a j
tof a i
tof a e
tof a d
tof a c
H d
Z l c d
H d
tof d j
tof d i
tof d h
tof l e
tof d l
tof a h
tof a c
tof f a
tof j g
tof k j
tof k f
tof k e
tof c d
tof c b
tof k c
tof l k
tof j i
tof l j
tof j l
tof l a
tof j f
tof c e
tof j c
tof a j
tof i k
tof i j
tof i g
tof i f
tof i b
X h
tof l h
tof c g
tof c l
tof c f
tof d c
X k
X g
X a
tof l a
tof g c
tof j g
tof c j
tof c k
tof i c
tof i g
tof j b
tof j c
tof j i
tof j e
tof l e
tof l c
tof l k
tof a k
tof k a
tof k b
tof k c
tof k f
tof k j
tof k l
tof d a
tof a c
tof a d
tof a f
tof a i
tof a j
tof a k
tof d a
tof a l
tof d b
tof d e
tof d g
tof d i
tof d j
tof c d
tof d k
H d
Z l c d
H d
tof c f
tof c g
tof c h
tof c i
H c
Z l b c
H c
tof d f
tof d g
tof c d
tof c h
tof c i
tof c k
tof d l
tof d a
tof d e
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d g
tof d f
tof d e
tof d a
tof d l
tof c k
tof c i
tof c h
tof c g
tof c f
tof c d
H c
Z l b c
H c
tof c k
tof c i
tof c h
tof c g
tof c f
tof c d
H d
Z l c d
H d
tof k j
tof d k
tof d i
tof d g
tof d e
tof d b
tof a l
tof d a
tof a d
tof a k
tof a i
tof a f
tof a c
tof d a
tof k l
tof k f
tof k c
tof k b
tof l a
tof k a
tof a k
tof l h
tof l e
tof l c
tof a l
tof i g
tof i e
tof i c
tof j i
tof j b
tof i l
tof i h
tof c k
tof c j
tof c g
tof g c
tof a c
tof c a
tof c b
tof c d
tof c e
tof j g
tof c j
tof c k
tof a i
tof i a
tof i b
tof i c
tof i e
tof i g
tof i l
tof a c
tof j a
tof j e
tof j h
tof j i
tof e l
tof l b
tof l c
tof l e
tof l f
tof l g
tof k h
tof l k
tof e l
tof a e
tof a g
tof k a
tof k i
tof a b
tof a f
tof e a
tof a j
tof e c
tof e k
H e
Z l c e
H e
H l
Z b j l
H l
H k
Z b l k
H k
tof k j
tof l j
tof e k
tof e a
H e
Z l k e
H e
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z k l e
H e
tof j k
tof e j
tof e a
H j
Z l b j
H j
tof j k
H l
Z b j l
H l
H e
Z l c e
H e
tof e k
tof a j
tof a c
tof a l
tof e a
tof a e
tof a g
tof a f
tof a b
tof k l
tof k i
tof k h
tof k g
tof k e
tof k c
tof k a
tof l k
tof l h
tof l g
tof l f
tof l e
tof l c
tof l b
tof e l
tof j i
tof j h
tof a g
tof j a
tof c e
tof j c
tof i l
tof i a
tof c b
tof i c
tof a i
tof c k
tof c j
tof c g
tof c d
tof c a
X c
tof a c
tof c b
tof c e
tof c j
tof c k
tof c l
tof g i
tof i g
tof i h
tof i j
tof i k
tof i l
tof g j
tof j b
tof j g
tof j i
tof j k
tof a l
tof l a
tof l c
tof l g
tof l k
tof k b
tof l j
tof k c
tof e f
tof k e
tof k i
tof d b
tof d i
tof a d
tof e a
tof d e
tof h l
tof h i
tof h k
H h
Z l c h
H h
tof d l
tof d k
H d
Z l b d
H d
tof e l
tof e i
X e
X d
tof e h
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e i
tof e h
tof e f
tof e a
tof e l
H d
Z l b d
H d
tof k i
tof d k
tof d f
tof d e
tof a b
tof d a
tof d l
H h
Z l c h
H h
tof h k
tof h l
tof a i
tof a d
tof k f
tof k e
tof k c
tof k b
tof j k
tof j g
tof l j
tof l c
tof l a
tof j i
tof j b
tof i g
tof g j
tof i l
tof i k
tof i h
tof g i
tof c l
tof c k
tof c j
tof c g
tof c e
X c
tof c b
tof e c
tof c e
tof c j
tof j c
tof c g
tof e i
tof i b
tof i c
tof i e
tof i f
tof i l
tof l i
tof i g
tof i h
tof i k
tof k i
tof k e
tof j k
tof l j
tof j f
tof l a
tof l b
tof l c
tof l d
tof l e
tof k a
tof k c
tof k d
tof g l
tof k g
tof a b
tof a d
tof a i
tof g h
tof g i
tof e g
tof g j
H g
Z l c g
H g
tof e l
tof e b
tof e c
tof e k
H e
Z l b e
H e
tof d l
tof d a
X g
X d
tof d h
tof d e
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d h
tof d e
tof d a
tof d l
H e
Z l b e
H e
tof e k
tof e j
tof e g
tof e c
tof e b
tof e l
H g
Z l c g
H g
tof g j
tof g i
tof g h
tof g l
tof l g
tof l i
tof l e
tof l d
tof l c
tof k l
tof a i
tof a d
tof a b
tof l k
tof k a
tof l j
tof l h
tof l f
tof l b
tof a l
tof i k
tof i g
tof i f
tof i e
tof i c
tof j i
tof c j
tof i l
tof i h
tof i b
tof e i
tof c g
tof c e
tof e c
tof a c
tof c b
tof c a
X c
tof c e
tof c g
tof c k
tof a i
tof i a
tof i e
tof i h
tof j k
tof j l
tof i j
tof l i
tof j b
tof j c
X j
tof j e
X j
tof l j
tof j d
tof l a
tof l f
tof l g
tof d k
tof k b
tof d c
tof k d
tof k e
tof k g
tof k i
tof k j
tof d f
tof a d
tof a h
tof d a
tof a l
tof d e
tof d i
tof d k
H d
Z l c d
H d
tof d f
tof d h
tof d i
tof d k
H d
Z l b d
H d
tof d f
tof d l
tof d c
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d c
tof d l
tof d f
H d
Z l b d
H d
tof k i
tof d k
tof d h
tof d f
H d
Z l c d
H d
tof d k
tof d f
tof d e
tof a c
tof a l
tof d a
tof a d
tof a h
tof l a
tof a f
tof k j
tof k g
tof k e
tof k d
tof c b
tof k c
tof d k
tof l j
tof l i
tof l g
tof j l
tof l d
X l
tof j k
tof c e
tof j c
X j
tof i l
tof i k
tof i j
tof i h
tof i e
tof i a
tof a i
tof c g
tof c i
tof i a
tof c f
X c
X a
tof c b
tof c d
tof i c
tof c e
tof i f
tof i l
tof f j
tof j b
tof j c
tof j f
tof j g
tof j i
tof j k
tof j l
tof c j
tof l c
tof c j
tof l d
tof l e
tof l f
tof l g
tof l h
tof a k
tof k a
tof k b
tof k c
tof k e
tof k f
tof k g
tof k h
tof k j
tof k l
tof a d
tof a g
tof a k
tof d h
tof b d
tof b i
tof b k
H b
Z l c b
H b
tof b d
tof b i
tof b k
tof d l
tof d f
tof k j
tof d k
H d
Z l b d
H d
tof a c
tof a d
tof a f
H a
Z k l a
H a
tof c k
tof a c
tof a d
tof a f
tof a h
tof a i
tof a j
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof j a
tof b j
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a h
tof a f
tof a d
tof a c
H a
Z l k a
H a
tof a f
tof a d
tof a c
H d
Z l b d
H d
tof d k
tof d j
tof d h
tof l f
tof d l
tof b k
tof b i
tof b h
tof b d
H b
Z l c b
H b
tof b k
tof b i
tof b h
tof b d
tof k g
tof a k
tof a d
tof l j
tof l h
tof l e
tof l c
tof k l
tof k b
tof k a
tof a k
tof l g
tof l d
tof j k
X l
X k
tof i l
tof j i
tof j g
tof j f
tof j c
tof j b
tof f j
tof i f
tof c e
tof i c
X i
tof c i
tof i a
tof a k
tof a c
tof a f
tof a d
X j
tof j h
tof c j
tof d i
tof i b
tof i c
tof i d
tof j g
tof i j
tof i k
tof j e
tof j l
tof l b
tof l d
tof l f
tof l i
tof l k
tof k b
tof d c
tof k d
tof k e
tof a k
tof d k
tof c k
tof k g
tof a h
tof a j
tof d a
tof a l
tof d f
tof d i
H d
Z l c d
H d
tof c e
tof c f
tof c h
tof c i
tof c j
H c
Z l b c
H c
tof c e
tof c f
tof c g
tof c h
tof c i
tof d j
tof d k
tof k j
tof c k
tof d f
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d h
tof d f
tof d k
tof c k
tof c j
tof c i
tof c h
tof c g
tof c f
tof c e
H c
Z l b c
H c
tof c k
tof c j
tof c i
tof c h
tof c g
tof c f
tof c e
H d
Z l c d
H d
tof d k
tof d i
tof d g
tof d f
tof d a
tof d c
tof d l
tof a l
tof a k
tof j h
tof j g
tof a j
tof a b
tof k g
tof k e
tof k d
tof k c
X b
tof i k
tof l i
tof k b
tof l f
tof l d
tof j e
X j
tof j l
tof i j
tof i h
tof i g
tof i d
tof i c
tof d i
tof c k
tof c j
tof c e
tof c g
tof c i
tof c l
tof f i
tof i b
tof f g
tof i f
tof i j
tof i k
tof a k
tof a j
tof j a
tof j b
tof j c
tof j l
tof l b
tof l f
tof k j
tof l j
tof l i
tof a d
tof k a
tof k e
tof f h
tof k f
tof a b
tof a k
tof a l
H a
Z l c a
H a
tof a i
tof f l
tof f b
tof f i
H f
Z l b f
H f
tof a b
tof a c
tof a f
tof a h
H a
Z l k a
H a
tof c b
tof a c
tof a e
tof a f
tof a g
tof a h
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a h
tof a g
tof a f
tof a e
tof a c
tof a b
H a
Z l k a
H a
tof a h
tof a f
tof a c
tof a b
H f
Z l b f
H f
tof f i
tof f h
tof f g
tof f b
tof f l
tof a i
H a
Z l c a
H a
tof a l
tof k d
tof a k
tof a b
tof k j
tof k h
tof k g
tof k f
tof k e
tof k a
tof a k
tof l j
tof i g
tof i f
tof i b
tof l i
X b
tof j l
tof c k
tof j c
tof j b
tof j a
tof a j
tof i k
tof f j
tof f i
tof j f
tof c h
tof c g
tof i c
tof c d
tof i e
tof i h
tof i l
tof j b
tof j e
tof j h
tof j g
tof j l
tof a l
tof l a
tof l c
tof l d
tof l h
tof l i
tof l j
tof a l
tof l k
tof k a
tof k c
tof k f
tof k g
tof k h
tof a k
tof k i
tof k j
tof a b
tof a e
tof a f
tof a g
tof h c
tof h a
H h
Z l c h
H h
tof c d
tof c e
tof c g
tof c h
tof c i
H c
Z l b c
H c
tof c d
tof c e
tof c g
tof c h
tof c i
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
tof a j
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a j
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof c i
tof c h
tof c g
tof c e
tof c d
H c
Z l b c
H c
tof c i
tof c h
tof c g
tof c e
tof c d
H h
Z l c h
H h
tof h a
tof h c
tof l j
tof k l
tof k i
tof k g
tof k f
tof a k
tof a e
tof a b
tof k h
tof k c
tof l a
tof k a
tof a k
tof i h
tof i d
tof l i
tof l c
tof c l
tof i c
tof c e
tof a l
tof j l
tof j h
tof j g
tof j f
tof i j
tof c i
tof i b
tof c k
tof c f
X d
tof i k
tof i c
tof c i
tof c l
tof i b
tof i d
tof i e
tof i h
tof j d
tof j g
tof l h
tof j l
tof l a
tof l b
tof l c
tof l e
tof k l
tof l f
tof d c
tof k d
tof k g
tof k h
tof d a
tof a b
tof d h
tof a d
tof a i
tof d l
tof d a
tof d e
tof d f
tof d k
H d
Z l c d
H d
tof d l
tof d b
tof d c
tof d e
tof d g
tof d h
tof d i
tof d j
H d
Z l b d
H d
tof b e
tof b f
tof b g
tof b h
H b
Z l k b
H b
tof b e
tof b f
tof b g
tof b h
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof b h
tof b g
tof b f
tof b e
H b
Z l k b
H b
tof b h
tof b g
tof b f
H d
Z b l d
H d
tof d l
tof j b
tof d j
tof b e
tof i h
tof d i
tof d g
tof d c
H d
Z l c d
H d
tof k h
tof k f
tof d k
tof d e
tof a c
tof d a
tof d l
tof a i
tof a d
tof a b
tof d a
tof k l
tof k g
tof k d
tof k c
tof l h
tof l f
tof l e
tof l c
tof l b
tof l a
tof i k
tof i e
tof i d
tof i b
tof c l
tof c k
tof c i
tof i c
X d
X f
tof a c
tof c a
tof c b
tof c d
tof i e
tof c i
tof c k
tof c l
tof l c
tof i l
tof d a
tof a i
tof i d
tof j i
tof j k
tof k b
tof k g
tof l h
tof a c
tof a k
tof f a
tof a l
tof f c
tof f b
H f
Z l c f
H f
tof d l
tof d f
tof d i
tof d j
H d
Z l b d
H d
tof d k
tof d a
tof d b
tof d c
tof d e
tof d g
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d g
tof d e
tof d c
tof d b
tof d a
tof d k
H d
Z l b d
H d
tof j i
tof d j
tof d f
tof d l
H f
Z l c f
H f
tof f b
tof l c
tof a l
tof f a
tof a k
tof a i
tof a d
tof d a
tof k g
tof k b
tof l h
tof j k
tof j h
tof j g
tof j d
tof i l
tof i e
X d
tof c d
tof c a
tof i c
tof c i
tof c l
tof c k
tof c e
tof a c
X c
X b
tof c e
tof c i
tof c k
tof d i
tof i b
tof i d
tof i g
tof i h
tof i k
tof j c
tof j d
tof j e
tof j i
tof a l
tof l a
tof l c
tof l e
tof l g
tof l i
tof a l
tof l k
tof k a
tof k d
tof a k
tof k i
tof a c
tof a e
tof a f
tof g h
tof a g
tof g h
tof a j
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
H a
Z l c a
H a
tof a b
tof a i
tof a k
H l
Z b i l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b c l
H l
H k
Z b c k
H k
tof c b
tof a c
H a
Z l k a
H a
tof a c
tof a j
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a c
tof a b
H a
Z l k a
H a
tof a c
tof a b
H k
Z b c k
H k
H l
Z b c l
H l
tof i j
H i
Z l b i
H i
tof i j
H l
Z b i l
H l
tof a k
tof a i
tof a b
H a
Z l c a
H a
tof a k
tof a j
tof a i
tof a b
tof c l
H c
Z b i c
H c
tof c l
tof l i
tof a l
tof a h
tof a g
tof a f
tof a e
tof a c
tof k a
tof k l
tof l a
tof a b
tof k d
tof a k
tof l g
tof l e
tof l c
tof a l
tof j i
tof j e
tof j d
tof j c
tof i k
tof i h
tof i g
tof i d
tof i b
tof d i
tof c k
tof c i
tof c e
tof e c
X b
tof c e
tof e b
tof i l
tof c i
tof i c
tof l c
tof i d
tof i e
tof i f
tof k h
tof i k
tof j a
tof j h
tof j g
tof l a
tof l e
tof l k
tof d a
tof k d
tof d k
tof a d
tof k j
tof a b
tof a c
tof a h
tof a l
tof d l
tof d e
tof d f
tof d g
H d
Z l c d
H d
tof d l
tof d b
tof d a
tof d c
tof d e
tof d f
tof d k
H d
Z l b d
H d
tof d l
tof d k
tof d a
tof d e
tof d f
tof d h
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d h
tof d f
tof d e
tof d a
tof d k
tof d l
H d
Z l b d
H d
tof d k
tof d f
tof d e
tof d c
tof a b
tof d a
tof d l
H d
Z l c d
H d
tof k j
tof d k
tof d g
tof d f
tof d e
tof a d
tof d l
tof k h
tof a k
tof a c
tof k d
tof d a
tof l k
tof l h
tof l e
tof l c
tof j l
tof l a
tof j h
tof j g
tof i l
tof i k
tof i h
tof i f
tof i e
tof i d
tof i c
tof c e
tof e c
tof e l
tof e i
X b
tof c b
tof c d
tof c f
tof c g
tof i c
tof c h
tof c k
tof i j
tof j b
tof j e
tof j g
tof j l
tof a l
tof l a
tof l b
tof l f
tof l h
tof a l
tof l k
tof k a
tof k b
tof k d
tof k e
tof k f
tof k j
tof l j
tof k i
tof a c
H a
Z l c a
H a
tof a b
tof a d
tof a e
tof e a
tof e f
tof a g
tof a j
tof e b
tof e h
tof e k
H e
Z l b e
H e
tof a b
H a
Z l k a
H a
tof a b
tof a f
tof c b
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a f
tof a b
H a
Z l k a
H a
tof a f
tof a b
H e
Z l b e
H e
tof e k
tof e h
tof a g
tof e a
tof a e
tof k e
tof e b
tof a j
tof a f
tof a d
H a
Z l c a
H a
tof a l
tof a c
tof k l
tof k i
tof k f
tof k d
tof l a
tof k a
tof a k
tof l h
tof l f
tof j l
tof l b
tof j g
tof j k
tof j e
tof i j
tof i c
tof c i
tof i h
tof c l
tof c k
tof c g
tof c f
tof c d
tof c b
tof d c
tof c d
tof c e
X c
tof c g
tof c h
tof c i
tof c k
tof c l
tof i b
tof j i
tof i d
tof i e
tof l g
tof i l
tof j c
tof j h
tof j f
tof l f
tof l h
X f
tof l a
tof l b
tof l e
tof l k
tof a k
tof a c
tof a e
tof k a
tof a k
tof k i
tof d b
tof a d
tof a f
tof d a
tof a h
tof a j
tof d l
tof d c
tof d e
H d
Z l c d
H d
tof d l
tof d a
tof d c
tof d f
tof d i
tof d j
H d
Z l b d
H d
tof e l
tof e b
tof e c
tof e f
tof e g
tof e i
tof e j
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e j
tof e i
tof e g
tof e f
tof e c
tof e b
tof e l
H d
Z l b d
H d
tof d j
tof d i
tof d f
tof d c
tof d a
tof d l
H d
Z l c d
H d
tof d j
tof d h
tof d e
tof a b
tof a c
tof d a
tof d l
tof a k
tof a j
tof a i
tof a h
tof a f
tof a e
tof a d
tof i e
tof k i
tof k c
tof l a
tof k a
tof a k
tof l h
tof l g
tof l f
tof l e
tof l b
tof a l
tof j l
tof c k
tof j c
tof i g
tof i d
tof j i
tof i l
tof i b
tof c l
tof c i
tof c h
tof c g
tof c e
tof c d
tof d c
X d
tof a c
tof c a
tof c b
tof c g
tof c h
tof i k
tof c i
tof c l
tof i a
tof i c
tof j i
tof j d
tof l d
tof l i
tof l a
tof l e
tof a l
tof l k
tof a e
tof k a
tof k g
tof a b
tof a f
H l
Z b i l
H l
H c
Z b i c
H c
tof a b
tof a i
H a
Z l c a
H a
tof a b
tof a i
tof a k
tof d l
tof d c
tof d f
tof d h
H d
Z l b d
H d
tof a b
tof a d
tof a f
H a
Z l k a
H a
tof a b
tof a d
tof a f
tof a j
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a f
tof a d
tof a b
H a
Z l k a
H a
tof a f
tof a d
tof a b
H d
Z l b d
H d
tof d h
tof d f
tof d c
tof d l
tof a k
tof a i
tof a b
H a
Z l c a
H a
tof a i
tof a b
H c
Z b i c
H c
H l
Z b i l
H l
tof a l
tof a f
tof a e
tof a b
tof k l
tof k g
tof k e
tof l a
tof k a
tof c a
tof a k
tof l i
tof l e
tof l d
tof j i
tof j d
tof i c
tof c i
tof c l
tof c h
tof c g
tof c b
tof a c
tof c d
X c
tof c b
tof c g
tof c h
tof c i
tof j c
tof c k
tof d i
tof l d
tof l b
tof i l
tof j l
tof l i
tof l a
tof l c
tof a k
tof k a
tof k c
tof d h
tof d i
tof k d
tof k l
tof d a
tof a b
tof a c
tof d g
tof d j
tof a d
tof d k
H d
Z l c d
H d
tof d g
tof d h
tof d i
tof d j
tof d k
tof d c
tof d e
tof a d
H a
Z l b a
H a
tof d i
tof a d
tof d a
tof d k
tof d f
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d f
tof d e
tof a c
tof d a
tof d k
tof a i
tof a e
tof a d
H a
Z l b a
H a
tof a i
tof a e
tof a d
tof a c
tof d k
tof d j
tof d i
tof d h
tof d g
H d
Z l c d
H d
tof d k
tof d j
tof d i
tof d h
tof a d
tof d g
tof j h
tof j c
tof j b
tof a j
tof k d
tof d a
tof l i
tof k l
tof k h
tof k c
tof a k
tof c d
X b
tof c b
tof l c
tof l a
tof j k
tof j d
tof i l
tof i d
tof i b
tof d i
tof c k
tof c h
tof c g
X c
X e
X f
tof d c
tof c d
tof c g
tof c h
tof c i
tof c l
tof d i
tof i d
tof i f
tof i g
tof i l
tof j g
tof j a
tof l a
tof d c
tof l d
tof l k
tof f k
tof k f
tof k j
tof k l
tof e a
tof a b
tof a e
tof a g
tof a h
tof a k
tof d b
tof d f
tof d g
tof d i
tof d j
tof d k
H d
Z l c d
H d
tof d b
tof d a
tof d c
tof d e
tof d f
tof d g
tof d j
H d
Z l b d
H d
tof d l
tof d b
tof d c
tof d e
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d i
tof d e
tof d c
tof d b
tof d l
H d
Z l b d
H d
tof d j
tof d g
tof d f
tof d e
tof d c
tof a b
tof d a
H d
Z l c d
H d
tof d k
tof d j
X g
tof i g
tof d f
tof d i
tof d b
tof d c
tof a k
tof a h
tof a g
tof a e
tof e a
tof k l
tof k j
tof k f
tof f k
tof l k
tof c d
tof l c
tof j l
tof l a
tof j g
tof j f
tof i l
tof i f
tof i d
tof c l
tof c h
tof c g
tof d c
X f
X b
tof c e
tof c f
tof i h
tof c i
tof l k
tof c l
tof i b
tof i c
tof i d
tof i j
tof j c
tof j e
tof j i
tof j h
tof l h
tof l a
tof l e
tof a k
tof k a
tof k b
tof k c
tof d a
tof a b
tof a d
tof a e
tof d a
tof a h
tof a i
tof a j
tof d l
tof d c
tof d g
H d
Z l c d
H d
tof f b
tof f g
H f
Z l b f
H f
tof d l
tof d b
tof d e
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof j h
tof d j
tof d e
tof d b
tof d l
H f
Z l b f
H f
tof f g
tof f b
H d
Z l c d
H d
tof j i
tof d j
tof d g
tof d a
tof d c
tof d l
tof j e
tof a j
tof a d
tof a b
tof d a
tof k c
tof k b
tof l a
tof k a
tof a k
tof l h
tof l e
tof i j
tof j c
X j
tof i h
tof i d
tof i b
tof d i
tof i k
tof c i
X h
tof c f
X c
X e
tof c g
tof c j
tof c k
tof i e
tof i g
tof i j
tof j b
tof j e
tof j f
tof j l
tof l a
tof l c
tof l e
tof l g
tof a k
tof k a
tof k b
tof k c
tof k e
tof a k
tof k h
tof k i
tof k l
tof a c
tof a d
tof a g
H l
Z b c l
H l
tof b i
tof k j
tof l j
tof b k
H b
Z l c b
H b
tof b i
tof b k
H b
Z i l b
H b
H i
Z k l i
H i
H k
Z b l k
H k
H j
Z c l j
H j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H i
Z l k i
H i
tof i k
tof b i
H b
Z i l b
H b
H i
Z b l i
H i
tof i k
tof b j
H b
Z l c b
H b
tof b k
tof b j
tof b i
H l
Z b c l
H l
tof k l
tof k i
tof k h
tof a k
tof a g
tof a d
tof k a
tof a c
tof k e
tof k b
tof a k
tof l g
tof c e
tof l c
tof l a
tof j l
tof j f
tof j e
tof j b
tof i g
tof i e
tof c l
tof c k
tof c j
tof c h
tof c g
X b
X c
X d
X f
tof e c
tof c b
tof c e
tof c g
tof c h
tof c j
tof i b
tof i e
tof i f
tof f j
tof f g
tof j f
tof j c
tof j h
tof j l
tof a l
tof l a
tof l c
tof l d
tof l g
tof l k
tof a k
tof k a
tof k b
tof k d
tof k i
tof k j
tof k l
tof d a
tof b d
tof b e
tof a b
tof f a
tof a h
tof a i
tof a k
tof b g
tof b i
H b
Z l c b
H b
tof b d
tof b e
tof b g
tof b i
tof d l
tof d c
tof d h
tof d j
X d
H d
Z b l d
H d
tof l j
X j
tof d j
tof f j
H f
Z l k f
H f
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H f
Z l k f
H f
tof f j
tof f i
tof f h
tof f g
tof a k
tof f a
H d
Z l b d
H d
tof d h
tof d c
tof d l
tof b i
tof b g
tof b e
tof b d
H b
Z l c b
H b
tof b g
tof a b
tof b i
tof b e
tof b d
tof a h
tof k d
tof d a
tof k l
tof k j
tof i b
tof k i
tof l a
tof a k
tof l g
tof l d
tof l c
tof a l
tof j l
tof j h
tof j g
tof j f
tof j c
tof f j
tof i f
tof i e
tof c j
tof c h
tof c g
tof c e
tof c b
tof e c
X b
tof a c
tof c a
tof c h
X c
tof c e
tof c g
tof c k
tof i a
tof j l
tof l j
tof j a
tof j b
tof l g
tof l k
H k
Z b c k
H k
tof k b
tof k c
tof k i
tof k l
tof d b
tof d a
tof a d
tof a e
tof a g
tof d a
tof a i
tof d l
tof d f
tof d j
H d
Z l c d
H d
tof h l
tof h b
tof d h
tof h c
tof h j
H h
Z l b h
H h
tof d l
tof d e
tof d i
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d h
tof d e
tof d c
tof d l
H h
Z l b h
H h
tof h j
tof h c
tof h b
tof h l
H d
Z l c d
H d
tof d j
tof d i
tof d f
tof a b
tof d a
tof d l
tof a i
tof a g
tof a e
tof a d
tof d a
tof k l
tof k i
X b
tof k c
tof k b
H k
Z b c k
H k
tof l k
tof l j
tof l g
tof j l
tof l b
tof l a
tof i k
tof i j
tof i a
tof c h
tof c g
tof c e
tof c d
X c
tof c g
tof c h
tof c j
tof a i
tof i a
tof i b
tof i c
tof i f
tof i g
tof i k
tof j b
tof j d
tof j e
tof j l
tof d l
tof l b
tof l c
tof l d
tof l h
tof l k
tof a k
tof d a
tof k d
tof k e
tof k f
tof k g
tof k j
tof k i
tof k l
tof e b
tof a e
tof a i
tof a j
tof a k
tof e l
tof e c
tof e f
tof e h
tof e k
H e
Z l c e
H e
tof a c
tof e h
tof a e
H a
Z l b a
H a
tof a c
tof a d
tof a e
tof e a
tof e l
tof e g
tof e i
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e i
tof e g
tof a h
tof e a
tof e l
tof a e
tof a d
tof a c
H a
Z l b a
H a
tof a h
tof a e
tof a c
H e
Z l c e
H e
tof e k
tof e h
tof e f
tof e b
tof e c
tof e l
tof k j
tof k i
tof k e
tof a k
tof a b
tof k d
tof d a
tof k l
tof k g
tof k f
tof a k
tof l k
tof l h
tof l d
tof l c
tof l b
tof j d
tof d l
tof j e
tof j b
tof i k
tof i g
tof i f
tof i c
tof i b
tof i a
tof a i
tof c j
tof c h
tof c g
tof c d
tof c a
tof a c
X b
X a
tof d c
tof c b
tof c d
tof c g
tof c h
tof c k
tof a i
tof i a
tof i d
tof i e
tof i h
tof i j
tof i k
tof d j
tof j d
tof j e
tof l h
tof j l
tof j k
tof l j
tof j i
tof k i
tof l d
tof l e
tof l f
tof k a
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof a k
tof k l
tof a d
tof d c
tof d a
tof d e
tof a d
tof d f
H d
Z l c d
H d
tof a c
tof a g
tof a j
H a
Z l b a
H a
tof a c
tof d f
tof a d
tof a g
tof a j
tof d l
tof d e
tof d h
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d h
tof d f
tof d e
tof d l
tof a g
tof a f
tof a d
tof a c
H a
Z l b a
H a
tof a j
tof a g
tof a f
tof a d
tof a c
H d
Z l c d
H d
tof d f
tof d e
tof d a
tof d c
tof k l
tof a k
tof k a
tof a d
tof i h
tof k i
tof k g
tof k f
tof k e
tof k c
tof j i
tof l j
tof l f
tof j l
tof l e
tof l d
tof j k
tof i d
tof d j
tof i k
tof i e
tof i a
tof a i
tof c k
tof c h
tof c d
tof d g
X d
tof d c
tof d b
X f
tof c a
tof c h
tof c k
tof c l
tof a i
tof i a
tof i e
tof i g
tof i j
tof i k
tof f j
tof j c
tof j f
tof j g
tof g l
tof l b
tof l c
tof l g
tof k a
tof k b
tof k c
tof k e
tof k f
tof k j
tof d h
tof d a
tof a d
tof a l
tof b e
tof b g
tof l j
H b
Z c l b
H b
tof b e
tof b g
tof d b
tof d a
tof g k
tof d g
H d
Z l b d
H d
tof g b
tof g j
H g
Z l k g
H g
H j
Z b l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H g
Z l k g
H g
tof g j
tof g b
tof g k
H d
Z l b d
H d
tof d k
tof d g
tof a h
tof d a
tof d b
tof b j
tof b g
tof b e
H b
Z l c b
H b
tof b j
tof b g
tof k b
tof b e
tof a l
tof a d
tof d a
tof j f
tof j c
tof k j
tof i k
tof k a
tof l g
tof c b
tof l c
tof c g
tof g l
tof j g
tof f j
tof i j
tof i g
X a
tof i e
tof a i
tof c k
tof c h
tof c a
X c
X j
tof d c
tof c d
tof c e
tof c f
tof c g
tof i h
tof i k
tof c i
tof i c
tof i a
tof i b
tof j i
tof i d
tof i f
tof j a
tof j c
tof j g
tof j l
tof e l
tof b e
tof b g
tof l b
tof a l
tof l h
tof l j
tof d e
tof a d
tof d g
tof a i
tof d a
tof b j
tof k j
tof a k
H b
Z l c b
H b
tof b e
tof b g
tof b j
tof d l
tof d b
tof a d
tof d i
tof d j
X d
H d
Z b l d
H d
tof l j
X j
tof d j
tof a c
tof a f
tof a h
H a
Z k l a
H a
tof c k
tof a c
tof a d
tof a f
tof a g
tof a h
tof a i
tof a j
H j
Z c l j
H j
tof a l
tof j a
tof c b
tof b j
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof a i
tof a h
tof a g
tof a f
tof a d
tof a c
H a
Z l k a
H a
tof a j
tof a i
tof a h
tof a g
tof a f
tof a d
tof a c
H d
Z l b d
H d
tof d k
tof d i
tof a e
tof d a
tof d b
tof d l
tof b j
tof b g
tof b e
H b
Z l c b
H b
tof b j
tof b g
tof b e
tof a l
tof a k
tof a j
tof a i
tof a h
tof a g
tof a d
tof l j
tof l h
tof l g
tof l e
tof l b
tof e l
tof i g
tof j i
tof j f
tof c d
tof j c
tof j a
tof i k
tof c f
tof i c
tof i b
tof i a
tof c k
tof c i
tof c e
tof d c
X d
tof a c
tof c a
tof i b
tof c i
tof c f
tof c k
tof i a
tof j i
tof i d
tof a k
tof j a
tof d l
tof l b
tof l d
tof l f
tof k j
tof l j
tof l h
tof a b
tof k a
tof k c
tof k e
tof k f
tof k i
tof a d
tof a i
tof b e
tof b f
tof b k
H b
Z l c b
H b
tof b e
tof b f
tof b k
tof d l
tof d b
tof d a
tof d c
tof d g
H d
Z l b d
H d
tof d l
tof d f
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d f
tof d l
H d
Z l b d
H d
tof d g
tof d c
tof d a
tof d b
tof d l
tof b k
tof b j
tof b f
tof b e
H b
Z l c b
H b
tof b k
tof b j
tof b f
tof b e
tof a i
tof a d
tof k a
tof a b
tof k i
tof k f
tof k e
tof k c
tof a k
tof l j
tof l h
tof l f
tof l d
tof l b
tof d l
tof i d
tof j i
X d
tof j a
tof c i
tof i h
tof i g
tof i b
tof i a
tof c k
tof a f
tof a c
X c
tof c b
tof c d
tof c g
tof c h
tof c i
tof c l
tof l c
tof c k
tof i a
tof i b
tof j a
tof j g
tof j i
tof l i
tof j h
tof l j
tof l a
tof l b
tof d e
tof l d
tof l f
tof l g
tof a k
tof k a
tof k b
tof k c
tof k d
tof k f
tof k g
tof k h
tof k i
tof f a
tof a b
tof f c
tof a f
tof a g
tof f a
tof d a
tof a h
tof f l
tof f i
tof f j
H f
Z l c f
H f
tof d b
tof d g
tof d i
tof k j
tof d k
H d
Z l b d
H d
tof d l
tof d e
tof d f
tof d g
tof d h
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof j i
tof d j
tof d h
tof d g
tof d f
tof d e
tof d l
H d
Z l b d
H d
tof d k
tof d j
tof d h
tof d g
tof d e
tof d a
tof k d
tof d b
H f
Z l c f
H f
tof f j
tof a h
tof a c
tof f a
tof f l
tof a g
tof a f
tof a b
tof k f
tof l f
tof f a
tof k i
tof k h
tof k g
tof k e
tof k c
tof a k
tof j g
tof l j
tof l e
tof c d
tof c b
tof l c
tof c l
X b
tof j a
tof i b
tof i a
tof c k
tof c i
tof c h
tof c g
tof c f
X c
X e
tof d c
tof c d
tof c f
tof c g
tof c h
tof c i
tof a i
tof i a
tof i c
tof i d
tof i h
tof j a
tof j c
tof j d
tof j e
tof j i
tof k b
tof l k
tof a d
tof a f
tof k a
tof k g
tof k i
tof a b
tof d a
tof a i
tof f l
tof f c
tof f g
tof f k
H f
Z l c f
H f
tof d l
tof d c
tof d h
H d
Z l b d
H d
tof e l
tof e a
tof e b
tof e f
tof e g
tof e h
tof e j
H e
Z l k e
H e
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H e
Z l k e
H e
tof e j
tof e h
tof e g
tof e f
tof e b
tof e a
tof e l
H d
Z l b d
H d
tof d i
tof d h
tof d c
tof d a
tof d l
H f
Z l c f
H f
tof k g
tof f k
tof f c
tof f l
tof k a
tof a i
tof a f
tof a d
tof a b
tof l b
tof j l
X b
tof i h
tof j i
tof j e
tof c d
tof j c
tof j a
tof i c
tof i a
tof a i
tof c i
tof c h
tof c g
tof d c
X d
tof c d
tof d f
tof c a
tof c b
tof c h
tof c i
tof c k
tof f i
tof i c
tof j f
tof i j
tof j b
tof j g
tof k j
tof j l
tof l d
X e
tof k a
tof k c
tof k f
tof k i
tof f a
tof a d
tof a g
tof a i
tof a j
H a
Z l c a
H a
tof a d
tof a f
tof a g
tof a h
tof a i
tof a j
tof d b
tof d c
tof d h
H d
Z l b d
H d
tof d l
tof d k
tof d a
tof d b
tof d c
tof d e
tof d g
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d g
tof d e
tof d c
tof d b
tof d a
tof d k
tof d l
H d
Z l b d
H d
tof d h
tof d c
tof d b
tof a j
tof a i
tof a h
tof a g
tof a f
tof a d
H a
Z l c a
H a
tof a j
tof a i
tof a g
tof a d
tof k f
tof f a
tof k l
tof k j
tof k i
tof k d
tof k c
tof l k
tof l d
tof j l
tof j k
tof j g
tof j f
tof j b
tof i j
tof i f
tof i c
tof f i
tof i k
tof c i
tof c h
tof c d
tof c b
tof h c
tof c h
tof h a
X d
tof i b
tof c i
tof c l
tof i a
tof i f
tof i g
tof i j
tof a j
tof j a
tof j i
tof j l
tof a l
tof l a
tof l c
tof l e
tof l g
tof l h
tof l i
tof l k
tof d k
tof k b
tof k d
tof k e
tof k g
tof k l
tof a g
tof a k
tof a b
X f
tof a e
tof a h
H a
Z l c a
H a
tof a b
tof a e
tof d g
tof a d
tof a j
H a
Z l b a
H a
tof d f
tof a d
tof a h
tof a i
tof a j
tof d l
tof d e
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof k j
tof a k
tof a l
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d g
tof d f
tof l e
tof d l
tof a i
tof a h
tof a g
tof a f
tof a d
H a
Z l b a
H a
tof a j
tof a g
tof a d
tof a e
tof a b
H a
Z l c a
H a
tof a h
tof a e
tof k b
tof k g
tof a k
tof k l
tof k d
tof d k
tof l k
tof l i
tof l h
tof l g
tof l c
tof l a
tof j a
tof a l
tof j i
tof i a
tof a j
tof i k
tof i g
tof i f
tof c i
tof i b
X b
tof c l
tof c k
tof c h
tof h c
X c
tof c h
tof c i
tof a i
tof i a
tof i c
tof i h
tof i j
tof i k
tof a j
tof j a
tof j c
tof j d
tof j h
tof l i
tof j l
tof k l
tof k j
tof l a
tof l b
tof a l
tof l c
tof k d
tof k f
tof k g
tof a f
tof h i
tof a h
tof a j
tof b i
tof b j
H b
Z l c b
H b
tof b i
tof b j
tof h l
tof h a
tof h c
H h
Z l b h
H h
tof d l
tof d k
tof d a
tof d b
tof d c
tof d e
tof d g
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X h
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d g
tof d e
tof d c
tof d b
tof d a
tof d k
tof d l
H h
Z l b h
H h
tof h i
tof h c
tof h a
tof h l
tof b j
tof b i
H b
Z l c b
H b
tof b j
tof b i
tof a l
tof a j
tof a i
tof a h
tof k a
tof a f
tof a c
tof k l
tof k j
tof k g
tof k d
tof k b
tof l i
tof l c
tof l b
tof j l
tof l a
X l
tof i h
tof j i
tof j d
tof j c
X j
tof i a
tof a j
tof i c
X i
tof i k
tof c i
tof a i
tof c h
X c
X b
X e
tof f c
tof c b
tof c f
tof c g
tof c i
tof c j
tof d i
tof i d
tof i f
tof i g
tof i l
tof e g
X d
tof j d
tof j e
tof k i
tof j k
tof a l
tof l a
tof l b
tof l d
tof l e
tof l j
tof k b
tof k c
tof k d
tof k h
tof f a
tof a b
tof a c
tof a f
tof a g
tof h i
tof a h
tof a k
tof a l
tof e l
tof e c
tof e b
tof e f
H e
Z l c e
H e
tof h b
X j
tof h a
X h
tof c h
H h
Z b l h
H h
tof l j
tof h j
tof c d
tof c g
tof c i
H c
Z l k c
H c
tof c d
tof c g
tof c h
tof c i
tof c j
H j
Z c l j
H j
tof k j
tof a l
tof a k
tof j a
tof c b
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X e
X f
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X h
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
tof c j
tof c i
tof c h
tof c g
tof c d
H c
Z l k c
H c
tof c j
tof c i
tof c h
tof c g
tof c d
H h
Z l b h
H h
tof h j
tof a i
tof h a
X h
tof k h
tof h b
tof a k
X b
H e
Z l c e
H e
tof e g
tof e f
tof e b
tof e c
tof e l
tof a l
tof a g
tof a f
tof a c
tof f a
tof k i
tof c d
tof k c
tof j g
tof j e
tof j d
tof l j
tof l b
tof l a
tof a l
tof j k
tof j i
tof i l
tof i g
tof i f
tof c i
tof c j
tof c g
X f
X g
X j
tof c l
tof i b
tof i l
tof k j
tof l b
tof j l
tof j k
tof l g
tof e k
tof e g
tof k e
tof k l
tof f a
tof a c
tof a f
tof e c
tof e j
tof e k
H e
Z l c e
H e
tof g b
tof g h
H g
Z l b g
H g
tof d l
tof d k
tof d i
tof d j
H d
Z l k d
H d
tof c b
H j
Z b l j
H j
tof l j
tof k j
tof a l
tof a k
tof j a
tof b j
tof c k
tof i l
tof i k
H c
Z b k c
H c
tof i b
tof b c
H i
Z b j i
H i
tof a b
tof a c
tof a i
X d
X e
X f
X g
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H l
Z 0 j l
H l
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H j
Z l k j
H j
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
H 3
Z b c 3
H 3
H 2
Z 3 d 2
H 2
H 1
Z 2 e 1
H 1
H 0
Z 1 f 0
H 0
H a
Z 0 g a
H a
H 0
Z 1 f 0
H 0
H 1
Z 2 e 1
H 1
H 2
Z 3 d 2
H 2
H 3
Z b c 3
H 3
H 1
Z a h 1
H 1
H 0
Z 1 i 0
H 0
H k
Z 0 j k
H k
H 0
Z 1 i 0
H 0
H 1
Z a h 1
H 1
X g
X f
X e
X d
tof a i
tof b c
tof a b
H i
Z b j i
H i
tof i b
H c
Z b k c
H c
tof i k
tof i l
tof c k
tof b j
tof c b
tof j a
tof a k
tof a l
tof k j
tof l j
H j
Z b l j
H j
H j
Z c l j
H j
H d
Z l k d
H d
tof d j
tof d i
tof d k
tof d l
H g
Z l b g
H g
tof g h
tof g b
H e
Z l c e
H e
tof e k
tof e j
tof e g
tof e c
tof a f
tof a c
tof f a
tof l g
tof k l
tof k e
tof e k
tof j l
tof i l
X c
tof c l
tof l b
tof j k
tof k j
tof i d
tof d i
X k
tof c f
X i
tof b a
tof f b
tof b c
tof b d
tof b e
tof b i
tof a b
tof f d
tof f g
tof f h
tof f i
tof f l
tof a j
tof a k
tof b f
tof b g
tof b h
tof i k
tof k f
tof k i
tof k j
tof c a
tof c d
tof c e
tof c g
tof c h
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c j
tof c h
tof c g
tof c e
tof a d
tof c a
tof a c
tof k j
tof k i
tof k f
tof i k
tof b i
tof f g
tof f h
tof b f
tof b e
tof f b
tof b d
tof b c
tof a k
tof a j
tof a i
tof a e
tof a b
tof b a
X l
tof a i
tof a l
X f
tof a f
tof a b
tof f a
tof f c
tof f g
tof f j
tof a e
tof a f
tof g k
tof k g
tof a g
tof c b
tof b c
tof b d
tof b l
tof k f
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof k l
tof c a
tof a l
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof a g
tof g k
tof b l
tof b d
tof b c
tof c b
tof a e
tof e b
tof f a
tof a b
tof f j
tof a i
tof a f
tof a g
tof a c
tof f a
tof f d
tof f h
tof a f
tof f j
tof b f
tof b l
tof b j
tof b a
tof a e
tof a g
tof a h
tof a k
tof c k
tof k b
tof k c
tof k d
tof k e
tof k g
tof k h
tof k i
tof k j
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X h
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof k i
tof k b
tof c k
tof c a
tof i c
tof k h
tof k g
tof k e
tof k d
tof c k
tof b k
tof b j
tof b h
tof f g
tof b f
tof a e
tof b a
tof e b
tof a l
tof a k
tof f h
tof a f
tof f a
X l
tof a j
X f
X c
tof f i
tof a b
tof f a
X b
tof f e
tof h k
tof f h
tof a d
tof a g
tof a i
tof a j
tof a k
tof d b
tof b d
tof b e
tof b l
tof k f
tof k h
tof k i
tof d c
tof c b
tof c d
tof c f
tof c g
tof c h
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c f
tof f l
tof c j
tof c h
tof c g
tof c d
tof c b
tof d c
tof k i
tof k h
tof k f
tof h k
tof b l
tof b e
tof b d
tof a d
tof d b
tof a k
tof a j
tof a i
tof a g
tof f e
tof f c
X c
tof f g
tof f i
tof b a
tof a b
tof a c
tof a d
tof a e
tof a g
tof a i
tof a j
tof d b
tof b a
tof b d
tof b e
tof b g
tof b i
tof b j
tof b l
tof k d
tof k h
tof k i
tof k f
tof f l
tof d c
tof c a
tof c b
tof c d
tof c h
tof c i
tof c j
tof c l
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X d
X e
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c l
tof c j
tof c i
tof c h
tof c d
tof b a
tof c b
tof d c
tof k l
tof k i
tof k h
tof k d
tof b l
tof b j
tof b i
tof b g
tof b e
tof b d
tof a d
tof d b
tof a j
tof a i
tof a g
X a
tof a c
tof a e
tof b a
tof a g
tof f a
tof f c
tof f e
tof f l
tof a b
tof a d
tof a e
tof a j
tof a k
tof c b
tof b a
tof d c
tof b d
tof c d
tof b e
tof b f
tof b g
tof b h
tof c b
tof b i
tof b j
tof e k
tof k e
tof k f
tof k h
tof k i
tof k j
tof c e
tof c g
tof c k
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof k j
tof k i
tof c k
tof c g
tof c e
tof b d
tof c b
tof d c
tof k h
tof k f
tof k e
tof e k
tof b j
tof b i
tof b h
tof b g
tof f e
tof b f
X e
tof b a
tof a e
tof c b
tof a k
tof a j
tof a g
tof a d
tof f l
tof f k
tof f i
tof f h
tof f d
tof a f
X a
tof a d
tof f a
tof f e
tof f g
tof f h
tof f j
tof f k
tof a g
tof a i
tof a j
tof b c
tof b l
tof k a
tof k b
tof k e
tof k g
tof k h
tof k i
tof e c
tof c e
tof c g
tof c h
tof c i
tof c j
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c j
tof c i
tof c h
tof c g
tof c e
tof e c
tof k i
tof k h
tof k g
tof k e
tof k a
tof b l
tof b c
tof a j
tof a i
tof a g
tof a d
tof a c
tof f k
tof f j
tof f h
tof f g
tof f e
tof f d
tof b f
tof a f
tof f b
X b
tof b a
X c
tof f c
tof f d
tof f h
tof f j
tof f k
tof a f
tof f l
tof a c
tof b a
tof a g
tof a h
tof b d
tof b e
tof b f
tof e k
tof k e
tof k f
tof k g
tof k h
tof c k
tof k i
tof c a
tof c d
tof c e
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k i
tof k e
tof c k
tof c d
tof c a
tof k h
tof k g
tof k f
tof e k
tof b h
tof b g
tof b f
tof b e
tof b d
tof b a
tof a l
tof a h
tof a g
tof f c
tof a f
tof a b
tof k j
tof f k
tof f l
tof f h
tof f d
tof a f
X a
tof f b
tof b f
tof f c
tof k i
tof f k
tof f l
tof a c
tof a e
tof a f
tof a g
tof a j
tof c b
tof b a
tof b c
tof b e
tof b f
tof b g
tof b j
tof b l
tof k b
tof k c
tof k e
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof k i
tof c k
tof c b
tof c a
tof i c
tof b e
tof k b
tof b l
tof b j
tof f g
tof b f
tof b c
tof b a
tof c b
tof a f
tof f c
X c
tof f d
tof a f
tof f h
tof a k
tof a l
tof c b
tof b a
tof b c
tof b e
tof b f
tof b h
tof b j
tof b k
tof c k
tof k a
tof k c
tof k d
tof k f
tof k g
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof k i
tof i c
tof k g
tof k f
tof k d
tof k a
tof b c
tof a c
tof c k
tof b j
tof b h
tof b f
tof b e
tof c b
X c
tof a l
tof a j
tof a h
tof a f
tof f a
tof a e
X a
tof a f
tof f g
X d
tof f c
tof a b
tof a h
tof a i
tof a j
tof a l
tof d b
tof b a
tof b d
tof b h
tof k l
tof b k
tof k b
tof k a
tof k c
tof c b
tof c f
tof c g
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c f
tof f l
tof c g
tof c b
tof k c
tof b k
tof a l
tof k a
tof b h
tof b d
tof d b
tof a j
tof a i
tof a h
tof a g
tof f c
tof a f
X a
tof a b
tof f l
tof f k
tof f j
X i
tof f d
tof f e
X f
tof b a
tof c b
tof a c
tof f c
tof b c
tof f g
tof a d
tof a e
tof a h
tof a i
tof a j
tof a k
tof a l
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof a h
tof c a
tof a f
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof a c
tof c b
tof a k
tof a j
tof a i
tof a e
tof a d
tof f b
tof b a
X b
tof f i
tof f h
tof f g
tof c f
tof c a
tof f c
tof a f
tof c a
tof f d
tof f g
tof f i
tof a e
tof a h
tof a i
tof b a
tof a k
tof b d
tof b e
tof b f
tof b g
tof b h
tof b l
tof c k
tof k c
tof k d
tof k e
tof k g
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof k i
tof i c
tof k g
tof k e
tof k d
tof c k
tof b l
tof b k
tof b h
tof f g
tof b f
tof b e
tof f b
tof b d
tof a k
tof a i
tof a h
tof a e
tof f c
tof a c
tof c a
tof f i
X f
tof a c
tof f a
tof f e
tof f g
tof f h
tof f j
tof a d
tof a h
tof a i
tof a j
tof a k
tof a l
tof c b
tof b c
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof a h
tof c a
tof a f
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof c b
tof a k
tof a j
tof a i
tof a d
tof f a
tof a c
tof f j
tof f h
tof f g
tof f e
tof f b
tof a f
X b
tof f a
tof f c
tof f d
tof f e
tof f g
tof f j
tof b a
tof a b
tof a d
tof a e
tof a f
tof a g
tof a h
tof a i
tof a j
tof a k
tof k b
tof b l
tof k a
tof k c
tof k e
tof k f
tof k h
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof k i
tof i c
tof k l
tof k h
tof f e
tof k f
tof k b
tof k a
tof b l
tof a k
tof a j
tof a i
tof a h
tof f g
tof f d
tof a f
tof a b
tof b a
tof f j
tof f c
tof f a
X c
tof a f
tof a b
X b
tof f a
tof f h
tof f i
tof f j
tof a d
tof a e
tof a f
tof a l
tof b c
tof b l
tof d k
tof k a
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof k j
tof k l
tof d c
tof c b
tof c d
tof c e
tof c f
tof c g
tof c h
tof c i
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof a f
tof c f
tof f l
tof c i
tof c h
tof c g
tof c e
tof c d
tof c b
tof d c
tof k j
tof k i
tof k h
tof k g
tof k e
tof k d
tof k a
tof d k
tof b l
tof b c
tof a l
tof a f
tof a e
tof a d
tof f a
tof a b
tof f j
tof f i
tof f h
tof a f
X a
X c
tof b f
tof c e
tof f c
tof f b
tof f g
tof f h
tof f i
tof f j
tof a b
tof a d
tof a f
tof a g
tof a i
tof a k
tof a l
tof b a
tof b e
tof b h
tof b j
tof b k
tof k a
tof k b
tof c h
tof k c
tof k i
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof k c
tof c h
tof c e
X c
tof k i
tof b k
tof k a
tof a k
tof b j
tof b h
tof b e
tof a l
tof f g
tof f h
tof a f
tof f c
tof f d
tof a f
tof c b
tof b c
tof b d
tof b e
tof b f
tof b i
tof b j
tof b l
tof c k
tof k b
tof c f
tof c g
tof c l
tof k c
tof c a
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof b f
tof l a
tof c a
tof a f
tof f l
tof c j
tof k c
tof c g
tof c k
tof b j
tof b i
tof b e
tof b d
tof b c
tof c b
tof a i
tof a h
tof f d
tof f b
tof a f
X a
tof f j
tof f i
tof f e
tof b f
tof f c
X f
tof f b
tof c b
tof f a
tof f e
tof f h
tof f k
tof b d
tof a b
tof a g
tof a h
tof a i
tof a j
tof a k
tof a l
tof b c
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof a h
tof c a
tof a f
tof c g
tof c b
tof g c
tof k h
tof k g
tof a g
tof g k
tof b l
tof b d
tof b c
tof c b
tof a j
tof a i
tof a d
tof f a
tof a b
X b
tof f k
tof f h
tof f e
tof c f
tof c a
tof f c
tof a f
tof c a
tof f d
tof f e
tof f k
tof a d
tof a e
tof a f
tof b a
tof a g
tof a h
tof a i
tof b k
tof b l
tof k c
tof k d
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof a i
tof i c
tof k d
tof k c
tof b l
tof b k
tof b i
tof b h
tof b g
tof a h
tof a g
tof f e
tof a f
tof f a
tof a d
tof c a
tof f c
tof a f
tof a k
tof b a
tof a b
tof a c
X a
tof f b
tof f g
tof f h
tof f i
tof a d
tof a e
tof a g
tof a h
tof a i
tof a j
tof a l
tof d b
tof b a
tof b d
tof b e
tof b g
tof b h
tof b i
tof k b
tof b j
tof k a
tof k d
tof k e
tof k g
tof d c
tof c d
tof c e
tof c g
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c g
tof c e
tof c d
tof d c
tof k j
tof k g
tof k e
tof a d
tof k a
tof b j
tof b i
tof b h
tof b g
tof a e
tof b a
tof d b
tof a l
tof a j
tof a i
tof a h
tof a g
X a
tof a c
tof b a
tof a g
tof f a
tof f c
tof f e
tof a b
tof a d
tof a e
tof a h
tof a j
tof a k
tof a l
tof c b
tof b a
tof b c
tof b e
tof b g
tof b h
tof b j
tof b k
tof c g
tof k c
tof k i
tof c a
tof c b
tof c j
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c l
tof c j
tof b g
tof b a
tof c b
tof b c
tof k i
tof k g
tof k c
tof b k
tof b j
tof b h
tof b e
tof c b
tof k l
tof k d
tof k c
tof a k
X c
tof f h
tof f c
tof f d
tof f g
tof c l
tof b c
tof k b
tof k e
tof k i
tof c a
tof c d
tof c e
tof c i
tof c j
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof c i
tof c e
tof c d
tof c a
tof k l
tof k i
tof k e
X d
tof k d
tof k c
tof a c
tof a j
tof a h
tof a g
tof f k
X g
tof a f
tof f a
tof f g
X i
X a
tof f h
tof f j
tof f k
tof a c
tof a h
tof a j
tof a l
tof k a
tof k b
tof k d
tof k e
tof k g
tof k i
tof d c
tof c d
tof c e
tof c g
tof c i
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c j
tof c i
tof c g
tof c e
tof c d
tof d c
tof k i
tof k g
tof k e
tof a d
tof k a
tof b l
tof a l
tof a j
tof a i
tof a h
tof a g
tof a c
tof k j
tof f k
tof f h
tof f g
tof f e
tof b f
tof a f
X b
tof f b
tof b a
tof a c
tof f h
tof f k
tof a d
tof a f
tof a g
tof a l
tof b a
tof b g
tof b h
tof b k
tof k a
tof k d
tof k e
tof k f
tof k l
tof d c
tof c b
tof c d
tof c e
tof c f
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c i
tof c f
tof c e
tof c d
tof c b
tof d c
tof k d
tof k l
tof k j
tof k f
tof k e
tof b k
tof k l
tof k a
tof a k
tof b j
tof b h
tof b g
tof b c
tof f g
tof f h
tof a f
tof f c
tof f d
tof a f
tof c b
tof b c
tof b d
tof b f
tof b g
tof b j
tof b k
tof k b
tof k a
tof k d
tof k g
tof k h
tof d c
tof c d
tof c g
tof c h
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof c h
tof c g
tof c d
tof d c
tof k l
tof k h
tof k g
tof k a
tof a k
tof b k
tof k d
tof b l
tof b j
tof b g
tof b f
tof b c
tof a c
tof c b
tof a h
tof a f
tof f k
tof f j
tof f g
tof f d
tof a f
X a
tof f b
tof b f
tof f g
tof f h
tof f i
tof a f
tof f j
tof f k
tof a c
tof a d
tof a e
tof a l
tof c b
tof b a
tof b c
tof b d
tof b e
tof b f
tof b j
tof b k
tof c k
tof k a
tof k c
tof k d
tof k f
tof k g
tof k h
tof k i
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof k i
tof i c
tof k l
tof k h
tof k a
tof a k
tof k g
tof k f
tof k d
tof b c
tof c k
tof b j
tof b f
tof b e
tof b d
tof a c
tof c b
X c
tof a l
tof a j
tof f a
tof a e
X a
tof a f
tof f c
tof a b
tof a d
tof a i
tof a j
tof a l
tof c b
tof b c
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof c a
tof f l
tof f h
tof k f
tof c h
tof c g
tof c b
tof g c
tof k g
tof g k
tof b d
tof a c
X c
tof b c
tof a j
tof a i
tof a g
tof a d
tof f k
tof f j
tof f i
tof f g
tof f e
X f
X a
tof f b
tof c a
tof a c
tof b a
tof a j
tof a k
tof a l
tof b d
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof c a
tof a f
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof a c
tof c b
tof a k
tof a j
tof b a
tof f l
tof f g
tof f c
tof c f
tof f c
tof c b
X c
tof i c
X b
tof f d
tof f g
tof f h
tof f l
tof g a
tof a f
tof a g
tof a h
tof a k
tof a l
tof b a
tof b f
tof b g
tof b h
tof b k
X d
tof k d
tof c a
tof k c
tof k e
tof k f
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof i c
tof k f
tof k e
tof k d
tof k c
tof k a
tof b k
tof b h
tof b g
tof b f
tof a l
tof a k
tof a h
tof a g
tof a f
tof g a
tof f l
tof f h
tof f g
tof f d
tof c f
tof f b
tof b c
tof c f
X b
tof f e
tof f g
tof f i
tof f j
tof f l
tof a b
tof a f
tof a g
tof a i
tof a k
tof b c
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof c a
tof a f
tof f l
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof k f
tof g k
tof b l
tof b d
tof b c
tof c b
tof f b
tof a f
tof f l
tof f j
tof b i
X i
tof b f
tof b g
tof b e
tof b c
X b
tof f d
tof a f
tof f h
tof f j
tof f l
tof a b
tof g b
tof b a
tof b f
tof b g
tof b h
tof b i
tof b j
tof b k
tof k a
tof k b
tof k c
tof k d
tof f l
tof k f
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
X g
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof k c
tof c a
tof c b
tof i c
tof k l
tof k f
tof k d
tof a k
tof a j
tof a i
tof a h
tof a g
tof b a
tof b f
tof g b
X b
tof f l
tof a f
tof f j
tof f i
tof f h
tof f g
tof f e
tof f d
tof f c
tof b f
tof f b
tof f j
tof f l
tof b a
tof a b
tof a f
tof c b
tof b c
tof b f
tof b j
tof g k
tof k a
tof k f
tof k g
tof k j
tof k l
tof g c
tof c b
tof c f
tof c g
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof a f
tof c f
tof f l
tof c g
tof c b
tof g c
tof k j
tof k g
tof k a
tof g k
tof b j
tof b f
tof b c
tof c b
tof a f
tof a b
tof b a
tof f l
tof f j
tof f b
tof b f
tof a f
tof a c
tof f a
X f
tof f b
tof f e
tof f g
tof f j
tof f l
tof a i
tof k j
tof a k
tof a l
tof d b
tof b d
tof b e
tof b f
tof b g
tof b j
tof k a
tof k b
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof d c
tof c d
tof c e
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c f
tof f l
tof c h
tof c g
tof c e
tof c d
tof d c
tof k j
tof k i
tof k h
tof f g
tof k f
tof k e
tof b d
tof k b
tof k a
tof b j
tof b f
tof b e
tof d b
tof a l
tof a k
tof a c
tof f l
tof f c
X c
tof f d
tof f h
tof a d
tof b c
tof b l
tof c k
tof k a
tof k b
tof c e
tof c g
tof c h
tof c i
tof k c
tof c j
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c j
tof c i
tof k c
tof c h
tof c g
tof c e
tof a i
tof k a
tof c k
tof b l
tof b c
tof f a
X j
tof a d
X a
tof f h
tof a f
X c
tof f c
tof f i
tof f k
tof f l
tof g k
tof k g
tof a g
tof a l
tof c b
tof b c
tof b d
tof b l
tof k f
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof c a
tof a f
tof k l
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof c b
tof a l
tof a j
tof a b
tof f k
tof f i
tof f e
tof f c
tof f b
X b
X i
tof c f
tof f c
tof f d
tof f e
tof f h
tof f i
tof f k
tof b a
tof a d
tof b e
tof b g
tof k l
tof b k
tof k c
tof k d
tof k h
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c k
tof c j
tof c i
tof b a
tof c b
tof k i
tof f i
tof i c
tof k h
tof b k
tof k l
tof a k
tof f k
tof k d
tof b e
X b
tof b g
tof a g
tof a e
tof f h
tof f e
tof c f
X c
tof f b
tof f g
tof f k
tof b a
tof a b
tof a c
tof a g
tof a j
tof a l
tof g b
tof b a
tof b g
tof b j
tof k b
tof k c
tof c a
tof c j
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c j
tof c a
tof k c
tof b j
tof a g
tof b a
tof g b
tof a l
tof a j
X a
tof a c
tof b a
tof a g
tof f a
tof f c
tof f e
tof a b
tof a i
tof a j
tof a k
tof a l
tof c b
tof b a
tof b c
tof b d
tof b g
tof b i
tof b j
tof b k
tof k b
tof k d
tof k g
tof k h
tof d c
tof c a
tof c d
tof c g
tof c h
tof c i
tof c j
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c l
tof c j
tof c i
tof c h
tof c g
tof c d
tof c a
tof d c
tof k h
tof b k
tof k g
tof k d
tof b j
tof b i
tof b c
tof b a
tof c b
tof k l
tof k c
tof a k
X c
tof f c
tof f d
tof k f
tof f g
tof f h
tof a d
tof c l
tof b c
tof c b
tof k a
tof k e
tof k i
tof k j
tof c e
tof c g
tof c h
tof c i
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c l
tof c i
tof c h
tof c g
tof c e
tof c b
tof k l
tof k j
tof k i
tof k h
tof k g
tof k e
tof a c
tof k a
tof b l
tof b c
tof a j
tof a i
tof f a
tof a g
tof a d
tof a b
X a
tof f k
tof f h
tof f e
X f
tof b f
tof f b
tof f e
tof f g
tof f i
tof f j
tof f k
tof f l
tof c b
tof b c
tof b f
tof c f
tof a c
tof a i
tof a k
tof b e
tof b g
tof b i
tof b j
tof b k
tof c k
tof k b
tof c g
tof c l
tof k c
tof c a
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof b g
tof k b
tof l a
tof c a
tof a f
tof f l
tof c j
tof c g
tof k c
tof b c
tof a c
tof c k
tof b j
tof f i
tof b f
tof b e
tof c b
X c
tof a f
X a
tof f l
tof k j
tof f k
tof f g
tof f e
tof f a
tof a b
tof b a
tof b f
tof f c
tof k i
tof f k
tof f l
tof a c
tof a e
tof a f
tof a g
tof d b
tof b d
tof k f
tof b k
tof k a
tof k h
tof k l
tof h c
tof c b
tof c f
tof c h
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
X d
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c h
tof b f
tof c b
tof h c
tof k l
tof k j
tof k i
tof k h
tof k a
tof a k
tof k f
tof b k
tof b j
tof b i
tof b d
tof d b
tof a g
tof f c
tof f d
tof f g
tof a f
tof f h
tof a l
tof b c
tof b l
tof c k
tof k a
tof c d
tof c e
tof c f
tof c i
tof k c
tof k j
tof c b
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c i
tof f e
tof c f
tof c d
tof c b
tof k j
tof f i
X d
tof k d
tof k f
tof a c
tof k a
tof c k
tof b l
tof a b
tof f h
tof a f
tof f l
tof f d
tof a g
tof a j
tof k b
tof b l
tof k a
tof k e
tof k g
tof k i
tof e c
tof c e
tof c g
tof c i
tof c j
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c l
tof c j
tof c i
tof c g
tof c e
tof e c
tof k l
tof k i
tof k g
tof k e
tof k a
tof b l
tof b c
tof a l
tof a j
tof a i
tof a g
tof a c
tof k j
tof f k
tof f g
tof f e
tof f b
tof f a
tof a f
X b
tof f a
tof f d
tof f e
tof f g
tof f h
tof k l
tof f k
tof b a
tof a b
tof a c
tof a e
tof a f
tof a h
tof a i
tof a k
tof k a
tof e b
tof b a
tof b e
tof b h
tof b i
tof b l
tof k c
tof k d
tof k e
tof k f
tof k h
H c
Z f l c
H c
tof f l
tof a f
tof c a
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k c
tof c f
tof l a
tof a f
tof f l
tof c a
H c
Z l f c
H c
tof k l
tof k j
tof f h
tof k f
tof k e
tof k d
tof b l
tof b i
tof b h
tof a e
tof b a
tof e b
tof a l
tof a k
tof a j
tof a i
tof a f
tof a c
X b
tof b a
tof f l
tof f k
tof f j
tof f g
tof f e
X d
tof f a
X f
tof f b
tof f e
tof f i
tof a b
tof a e
tof a h
tof a j
tof c l
tof b c
tof c k
tof k b
tof c d
tof c e
tof c g
tof c i
tof k c
tof c a
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof c i
tof c g
tof c d
tof a e
tof c a
tof k l
tof k i
tof k g
tof k e
tof k d
tof k c
tof k b
tof c k
tof b l
tof b c
tof a j
tof a h
tof a b
tof f e
X a
X c
tof f a
tof f c
tof f g
tof b a
tof a b
tof a c
tof a e
tof b a
tof a h
tof a i
tof a j
tof a k
tof b d
tof b l
tof e k
tof k e
tof k f
tof k g
tof k h
tof c k
tof k i
tof c a
tof c d
tof c e
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k i
tof k e
tof c k
tof c d
tof c a
tof k h
tof f g
tof k f
tof e k
tof b l
tof b k
tof b j
tof b i
tof b h
tof b d
tof b a
tof a k
tof a j
tof a i
tof a h
tof a e
tof a c
X b
tof a b
tof f b
tof b a
tof f i
tof f d
tof f c
X i
tof c f
tof f c
tof f g
tof f h
tof d a
tof a d
tof a f
tof a g
tof a k
tof a l
tof b a
tof b d
tof b f
tof b g
tof b k
tof c k
tof k c
tof k e
tof k g
tof k h
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof i c
tof k h
tof k g
tof k e
tof k c
tof c k
tof b k
tof f g
X f
tof b f
tof b d
tof a l
tof a k
tof a f
tof a d
tof d a
tof f c
tof f h
tof c f
X d
tof d f
tof f d
tof h a
tof b a
tof a h
tof b l
tof d k
tof k d
tof k e
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof b f
tof l a
tof b a
tof a f
tof c k
tof c j
tof c i
tof c b
X c
tof i c
tof k e
tof k d
tof d k
tof b h
tof a h
tof f a
tof h a
tof a c
tof d a
tof c e
tof f c
tof f g
tof a h
tof a i
tof a k
tof b d
tof b e
tof d k
tof k d
tof k h
tof k i
tof c i
tof k j
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof k h
tof c k
tof c e
tof k d
tof c d
tof d c
tof k i
tof c k
tof b l
tof b e
tof b d
tof b c
tof a k
tof a i
tof a h
tof f g
tof f e
tof f d
tof a f
X d
tof d a
tof a c
tof f i
tof a f
X i
tof f e
tof f g
tof f h
tof a f
tof f j
tof d b
tof a d
tof b d
tof a g
tof a k
tof a l
tof b a
tof b f
tof b g
tof b i
tof b j
tof b k
tof c k
tof k c
tof k g
tof k h
tof k i
tof k j
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof k i
tof c k
tof b a
tof c b
tof i c
tof k h
tof k g
tof c k
tof b k
tof b j
tof b i
tof f g
tof b f
tof b d
tof d b
tof a l
tof a k
tof f h
tof a f
X h
tof f c
X c
X d
tof f d
tof a f
tof d b
tof b a
tof b d
tof b f
tof b h
tof b i
tof b j
tof h k
tof k h
tof k b
X h
tof b l
tof k a
tof k f
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof i c
tof k l
tof k h
tof b f
tof k b
tof h k
tof b l
tof b j
tof b i
tof b h
tof b d
tof a d
tof d b
tof a j
tof a i
tof a h
tof a f
X a
tof a e
tof f a
X c
tof f c
tof a f
tof f g
tof b d
tof a b
tof a h
tof a j
tof a k
tof b c
tof b e
tof k b
tof b l
tof k a
tof k d
tof c k
tof k f
tof k g
tof c h
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c h
tof c g
tof c f
tof k l
tof k g
tof k f
tof b d
tof k b
tof k a
tof b l
tof b e
tof b c
tof a k
tof a j
tof a h
tof a g
tof f e
tof f d
tof a f
tof a b
tof f i
tof f h
tof b a
tof a b
tof a d
tof a e
tof a f
tof a g
tof a i
tof a j
tof a k
tof a l
tof c b
tof b c
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof c a
tof a f
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof a g
tof g k
tof b l
tof b d
tof b c
tof c b
tof a j
tof a i
tof f e
tof a f
tof a d
tof a b
X b
tof b a
tof f j
X h
X f
tof f a
tof a g
X a
tof b c
tof a b
tof f b
tof f e
tof k i
tof f k
tof a d
tof a e
tof a h
tof a j
tof a l
tof k b
tof b l
tof c e
tof c h
tof k c
tof c a
tof c i
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c l
tof c j
tof c i
tof c h
tof a e
tof c a
X k
tof k c
tof a l
X k
tof a c
tof k i
tof k h
tof k e
tof b l
tof b c
tof a j
tof a h
tof a g
tof b d
tof a b
tof b a
X a
tof a g
tof a e
tof f a
tof f c
tof a b
tof a h
tof a i
tof a j
tof a k
tof b c
tof b l
tof k b
tof k d
tof k e
tof k g
tof k i
tof d c
tof c a
tof c d
tof c e
tof c g
tof c j
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c j
tof c g
tof c e
tof a d
tof c a
tof d c
tof k l
tof k i
tof k g
tof k e
tof k d
tof b l
tof b d
tof b c
tof a l
tof a k
tof f h
tof f c
tof f g
tof k g
tof k f
tof f d
tof e b
tof b a
tof b e
tof b g
tof b h
tof b i
tof k b
tof b j
tof b l
tof k a
tof k e
tof k h
tof d c
tof c d
tof c e
tof c g
tof c h
tof c l
tof a f
tof l a
tof k l
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c l
tof c h
tof c g
tof c e
tof c d
tof d c
tof k h
tof a e
tof k a
tof b l
tof e j
tof e b
tof e i
tof e h
tof e g
tof e a
tof a b
tof a c
tof f i
tof f d
tof f e
tof f h
tof a d
tof a l
tof b l
tof a f
tof k a
tof c e
tof c i
tof k c
tof c b
tof c d
tof c g
tof c l
tof l a
tof b k
tof k l
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c i
tof c g
tof c e
tof c d
tof c b
tof k l
tof k j
tof k i
tof k g
tof k e
tof k d
tof a c
tof k a
tof b l
tof b c
tof a l
tof a j
tof a i
tof a h
tof a g
tof a d
tof f a
tof a b
X b
tof f h
tof a f
tof a k
tof a g
tof a e
tof f a
tof f d
tof c a
tof a c
tof a d
tof a e
tof a f
tof a h
tof a i
tof a k
tof b a
tof b c
tof b d
tof b e
tof b g
tof b h
tof b i
tof b l
tof c k
tof k a
tof c f
tof k c
tof k g
tof c k
tof k j
tof c h
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c i
tof c h
tof k c
tof c f
tof k g
tof k a
tof c k
tof b l
tof b i
tof b h
tof b g
tof b e
tof b d
tof a c
tof b a
tof a k
tof a i
tof a h
tof f e
tof a f
tof f a
tof a d
tof c a
tof f k
X f
tof a f
tof a c
X c
tof f a
tof f h
tof f i
tof f j
tof f k
tof a b
tof a d
tof a e
tof a f
tof a j
tof a l
tof c b
tof b c
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof c a
tof a f
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof a c
tof c b
X b
tof a j
tof f g
tof a f
tof a e
tof a d
tof f i
tof f c
tof f a
X a
tof b a
tof a b
tof a c
tof a d
tof a k
tof k a
tof a j
tof d b
tof b d
tof b e
tof b g
tof b h
tof b i
tof b j
tof b l
tof k b
tof k d
tof k e
tof k g
tof d c
tof c a
tof c d
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c i
tof c d
tof c a
tof d c
tof k g
tof k e
tof b d
tof k b
tof k a
tof b l
tof b j
tof b i
tof b h
tof b g
tof b e
tof a d
tof d b
tof a k
tof a j
X c
tof b a
tof a c
tof f k
tof f j
tof f h
tof f g
tof a f
tof f a
tof f d
tof f e
tof f h
tof f l
tof e a
tof a e
tof a f
tof a h
tof a i
tof a l
tof b l
tof d k
tof k d
tof k e
tof k g
tof k h
tof k f
tof f l
tof d c
tof c a
tof c b
tof c d
tof c e
tof c g
tof c h
tof c j
tof c l
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X d
X e
X g
X h
X i
X j
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X e
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof c h
tof c g
tof c e
tof c d
tof c b
tof c a
tof d c
tof k l
tof k h
tof k g
tof k e
tof k d
tof d k
tof b l
tof b c
tof a l
tof a i
tof f h
tof f e
tof a f
tof e a
tof f l
tof f d
tof a f
X a
X c
tof c f
tof f c
tof f d
tof f g
tof f h
tof f l
tof g a
tof a f
tof a g
tof k h
tof k l
tof a k
tof k a
tof e b
tof b e
tof b f
tof b g
tof b h
tof k b
tof k f
tof k g
tof k i
tof g c
tof c b
tof c f
tof c g
tof c h
tof c i
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof f l
tof a f
tof k i
tof k h
tof c k
tof c g
tof b f
tof c b
tof g c
tof k a
tof b g
tof k b
tof b h
tof b e
tof e b
tof a k
tof a h
tof a g
tof a f
tof g a
tof f l
tof f h
tof f g
tof f d
tof f c
tof c f
tof b a
tof f b
tof a b
X b
tof f c
tof f g
tof f i
tof a c
tof a e
tof a i
tof a j
tof a k
tof a l
tof b l
tof c k
tof k b
tof k c
tof k e
tof k g
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c k
tof c j
tof c i
tof c b
tof c a
tof k i
tof i c
tof k g
tof k e
tof k b
tof a c
tof c k
X c
tof a l
tof f g
tof f c
tof f d
tof f h
tof a d
tof d k
tof k b
tof k d
tof k e
tof k h
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k i
tof k h
tof k e
tof k d
tof k b
tof d k
tof b l
tof a j
tof a i
tof a e
tof b c
tof a b
tof b a
X a
tof a d
tof a e
tof f a
tof f g
tof f l
tof b j
tof b k
tof a b
tof b a
tof b e
tof b f
tof b h
tof b i
tof c k
tof c a
tof k c
tof k b
tof k e
tof k f
tof k g
tof k h
tof k i
tof k l
tof c d
tof c f
tof c g
tof c h
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c h
tof c g
tof c f
tof c d
tof k c
tof c a
tof k l
tof k i
tof k h
tof k g
tof f e
tof k f
tof c k
tof b k
tof b i
tof a j
tof b a
tof f h
tof f d
tof b f
tof a k
tof a e
tof a d
X a
tof a b
tof a c
tof f l
tof f i
tof f c
tof f b
X f
tof f a
tof f d
tof f e
tof f h
tof f j
tof f k
tof f l
tof b a
tof a b
tof a c
tof a e
tof a f
tof a h
tof a i
tof a j
tof a k
tof a l
tof e b
tof b a
tof b e
tof b f
tof b h
tof b i
tof b k
tof k b
tof b j
tof c d
tof c e
tof c h
tof k c
tof c a
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof k h
tof c h
tof a e
tof c a
tof k j
tof k e
tof k c
tof b k
tof b j
tof b i
tof b f
tof a h
tof b a
tof a f
tof e b
tof a l
tof a k
tof a j
tof a i
X a
tof a g
tof f a
tof f e
tof b f
tof b h
tof b j
tof a b
tof a l
tof b a
tof b d
tof b e
tof b g
tof e k
tof k e
tof k f
tof k g
tof k h
tof c k
tof k i
tof c a
tof c e
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k i
tof k e
tof c k
tof c d
tof c a
tof k h
tof k g
tof k f
tof e k
tof b j
tof b h
tof b g
tof b f
tof b e
tof b d
tof b a
tof a l
tof a j
tof a h
tof a g
tof f c
tof a f
X b
tof c a
tof a b
tof a c
tof b a
tof f l
tof k j
tof f k
tof f h
tof f d
tof a f
tof f a
tof k i
tof f k
tof f l
tof a e
tof a f
tof a g
tof k f
tof b k
tof k a
tof k g
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c i
tof c b
tof c a
tof i c
tof k l
tof k i
tof k a
tof a k
tof k g
tof b k
tof k f
tof b j
tof b i
tof b c
tof c b
tof f c
X c
tof f d
tof f g
tof a f
tof f h
tof a l
tof d b
tof b d
tof b f
tof b g
tof b h
tof b i
tof b j
tof b k
tof k a
tof k b
tof k c
tof k h
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k h
tof k c
tof k b
tof k a
tof b k
tof b j
tof b i
tof b h
tof b g
tof b f
tof b d
tof d b
tof k l
tof f h
tof f k
tof a f
tof a e
tof f c
tof f a
tof a b
tof f j
tof f i
tof f g
tof f d
tof a f
X a
tof b f
tof f b
tof f c
tof f d
tof f e
tof f h
tof f i
tof f j
tof f k
tof a b
tof a f
tof a g
tof a h
tof a i
tof a l
tof d b
tof b a
tof b d
tof b e
tof b f
tof b g
tof b h
tof b i
tof d c
tof c k
tof k d
tof k g
tof c b
tof c e
tof c i
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k l
tof c k
tof c i
tof c g
tof c d
X e
tof b e
tof c b
tof k d
tof d c
tof k g
tof b i
tof b h
tof b g
tof b f
tof b d
tof b a
tof d b
tof a l
tof a i
tof a h
tof a g
tof f c
tof f b
tof a f
X a
tof f l
tof f k
tof f j
tof f i
tof f h
tof f e
tof f d
tof b f
X f
X g
tof a b
tof f a
tof f c
tof f e
tof f k
tof a g
tof a i
tof a j
tof a k
tof a l
tof g b
tof b a
tof b g
tof b i
tof b j
tof b k
tof k b
tof k c
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k c
tof k b
tof b k
tof b j
tof b i
tof b g
tof b a
tof g b
tof a l
tof a k
tof f c
X c
tof f d
tof f g
tof f h
tof a c
tof a d
tof c b
tof b a
tof b c
tof b d
tof b g
tof b i
tof b j
tof b l
tof k b
tof k d
tof k g
tof k h
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X h
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k h
tof k g
tof b d
tof k b
tof b l
tof b j
tof b i
tof b g
tof a c
tof b a
tof c b
X c
tof a j
tof a i
tof a g
X a
tof a d
tof f g
tof f e
tof f a
tof f c
tof f l
tof d b
tof d a
tof a d
tof b a
tof a g
tof a j
tof a k
tof b e
tof b l
tof h k
tof k f
tof k h
tof k i
tof d c
tof c b
tof c d
tof c f
tof c g
tof c h
tof c i
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c f
tof f l
tof c j
tof c i
tof c h
tof c g
tof c d
tof c b
tof d c
tof k i
tof k h
tof k f
tof h k
tof b l
tof b e
tof b d
tof a d
tof d b
tof a k
tof a j
tof b a
tof a b
tof a g
tof f c
X c
tof f e
tof f g
tof b f
tof f i
tof a c
tof a d
tof a e
tof b a
tof a j
tof b d
tof b k
tof k b
tof b e
tof k a
tof k f
tof k g
tof k i
H c
Z f l c
H c
tof f l
tof a f
tof c a
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof c a
tof a f
tof f l
H c
Z l f c
H c
tof k i
tof f g
tof f e
tof b k
tof k f
tof k a
tof b j
tof f b
tof b i
tof a b
tof b d
X b
tof a j
tof a g
tof c e
tof a c
X e
tof f a
tof f l
tof f k
X f
tof f h
tof f d
tof f e
tof f j
tof b a
tof a b
tof a d
tof a e
tof c b
tof b a
tof a f
tof a h
tof a i
tof a j
tof c d
tof b c
tof b l
tof c k
tof k b
tof c g
tof k c
tof k j
tof k l
tof c a
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c l
tof c g
tof c e
tof c d
tof c a
tof k l
tof k j
tof k g
tof k e
tof k d
tof k c
tof c k
tof b l
tof b j
tof b i
tof b h
tof f e
tof b f
tof b d
tof b c
tof b a
tof c b
tof a j
tof a i
tof a h
tof a f
tof a d
tof b c
X a
tof f a
X b
tof f b
tof a f
tof f g
tof a d
tof b a
tof a h
tof a j
tof a k
tof b e
tof b f
tof b g
tof b l
tof e k
tof k e
tof k f
tof k g
tof k h
tof c k
tof k i
tof c a
tof c d
tof c e
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof k f
tof b k
tof l a
tof a f
tof f l
tof k i
tof k e
tof c k
tof c d
tof b c
tof c a
tof k h
tof k g
tof k f
tof b e
tof e k
tof a b
tof b j
tof b h
tof b g
tof a k
tof f d
tof a f
tof c b
tof c a
tof a c
tof a g
X b
tof b a
tof f j
tof f g
tof a f
tof f a
tof f h
tof f i
tof f j
tof a d
tof a e
tof a f
tof a k
tof a l
tof b f
tof b h
tof b i
tof b j
tof b l
tof k a
tof k b
tof k d
tof k g
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k g
tof k d
tof k b
tof k a
tof b l
tof b j
tof b i
tof f g
tof f h
tof b f
X h
tof b c
tof c b
tof a l
tof a k
tof a f
tof f c
X c
tof f d
tof a f
tof d b
tof b d
tof b f
tof b i
tof b j
tof b l
tof h k
tof k a
tof k f
tof k h
tof k i
tof k j
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c a
tof c i
tof c b
tof i c
tof k i
tof k h
tof a f
tof k a
tof h k
tof b l
tof b j
tof f i
tof f d
tof b f
tof a d
tof d b
tof a h
tof a e
tof f j
X f
tof f a
tof a b
tof b f
tof c b
tof f c
tof f d
tof f e
tof f g
tof f i
tof f j
tof a d
tof a f
tof b a
tof a g
tof a h
tof a i
tof a k
tof b c
tof b e
tof f l
tof b f
tof d k
tof d c
tof k d
tof c k
tof k h
tof c b
tof c e
tof c i
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c i
tof c e
tof c d
tof c b
tof k d
tof d c
tof k h
tof b c
tof c k
tof b l
tof b i
tof b h
tof f g
tof b f
tof b e
tof b a
tof c b
tof a k
tof a i
tof a h
tof f d
tof f b
tof a f
X a
tof f j
tof f i
tof f e
tof f c
tof b f
tof a b
X f
tof a c
tof f a
tof f e
tof f g
tof f h
tof a d
tof a h
tof a i
tof k j
tof a k
tof a l
tof c b
tof b a
tof b c
tof b d
tof b h
tof k i
tof b k
tof k a
tof k d
tof k g
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof k j
tof c k
tof c i
tof b a
tof c b
tof b i
tof i c
tof k l
tof k i
tof k g
tof k a
tof a k
tof b k
tof k d
tof b j
tof b h
tof c b
tof a l
tof a c
tof f h
tof f g
tof f c
X c
X h
tof f d
tof h b
tof b a
tof b h
tof b i
tof b j
tof d k
tof k d
tof k b
X d
tof b l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c a
tof c i
tof c b
tof i c
tof k l
tof k d
tof k b
tof d k
tof b l
tof b j
tof b i
tof a h
tof b a
tof h b
tof a j
tof a i
tof f e
tof f a
X a
tof f c
tof f g
tof b a
tof a b
tof a c
tof h k
X h
tof k h
tof a j
tof a h
tof d b
tof b d
tof b e
tof b l
tof k f
tof k i
tof c d
tof c e
tof c h
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c h
tof c e
tof c d
tof k i
tof k h
tof k f
tof a h
tof h k
tof b l
tof b d
tof d b
X d
tof a e
tof d e
tof a b
tof a j
tof a c
tof b a
tof f g
tof f c
X c
tof k f
tof f e
tof f i
tof b h
tof b j
tof a b
tof b a
tof b f
tof b g
tof b i
tof k b
tof c b
tof b l
tof k a
tof k d
tof k g
tof c e
tof c h
tof c i
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
X h
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k l
tof k i
tof c k
tof c h
tof c e
tof c b
tof k g
tof k f
tof k e
tof k d
tof b a
tof k b
tof b l
tof b j
tof b i
tof b h
tof b g
tof b f
X j
tof a f
tof f a
X a
X c
tof b e
tof f b
tof c b
tof b c
tof c k
tof f c
tof a g
tof k l
tof a k
tof b e
tof b f
tof b h
tof b j
tof b k
tof k a
tof k c
tof k d
tof k g
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c i
tof b j
tof c b
tof c a
tof k i
tof i c
tof k l
tof k g
tof k a
tof a k
tof k d
tof b c
tof c k
tof b l
tof f h
tof b f
tof b e
tof c b
tof a l
tof f c
X c
tof f d
tof f g
tof a c
tof d b
tof b d
tof b e
tof b f
tof b g
tof b j
tof b k
tof b l
tof k a
tof k c
tof k d
tof k h
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
X d
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c i
tof b j
tof c b
tof c a
tof k a
tof k i
tof a i
tof i c
tof k h
tof k d
tof b l
tof b k
tof f g
tof f e
tof f d
tof b f
tof d b
tof a j
tof a h
tof a g
tof f k
tof f j
tof f a
tof a f
X a
X h
tof b f
tof f b
tof f c
tof f d
tof f j
tof f k
tof b a
tof a b
tof a c
tof a d
tof a f
tof a g
tof a h
tof d b
tof b d
tof b e
tof c b
tof b l
tof h k
tof k f
tof k h
tof k i
tof c d
tof c g
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof a l
tof c l
tof c i
tof c g
tof b d
tof c b
X c
tof k i
tof k h
tof h k
tof b l
tof b e
tof a d
tof d b
tof a h
X g
tof b a
tof a b
tof a c
tof e c
tof f e
tof c e
tof f g
tof a f
tof b f
tof c f
tof f i
tof a d
tof a h
tof a k
tof b j
tof b k
tof b l
tof g k
tof k f
tof k g
tof k h
tof k i
tof k j
tof c h
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k i
tof k h
tof k f
tof c k
tof c e
tof e c
tof k j
tof k g
tof b g
tof g k
tof b l
tof b j
tof b f
tof a b
tof b i
tof b c
tof a k
tof a h
tof f d
tof a f
tof f k
tof f j
tof f i
tof f g
tof f e
tof f b
tof b f
X f
tof f b
tof f d
tof k g
tof f k
tof b c
tof b a
tof a b
tof a g
tof a h
tof c a
tof a j
tof k b
tof b e
tof b l
tof k h
tof k i
tof c d
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c l
tof c j
tof c d
tof c a
tof k l
tof k i
tof k h
tof k g
tof k e
tof b l
tof b e
X c
tof a b
tof b c
tof a j
tof a h
tof a g
tof b a
tof f k
tof f d
tof a c
tof f a
tof f e
tof a b
tof a i
tof a j
tof a k
tof a l
tof c b
tof b c
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof c a
tof a f
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof a c
tof f c
tof c b
tof a k
tof a j
tof f i
tof f a
X a
tof f l
tof f g
X f
tof b e
tof b f
tof f c
tof f b
tof f i
tof f j
tof f k
tof a f
tof a l
tof a b
tof a c
tof b a
tof a g
tof b e
tof b j
tof b k
tof c k
tof k a
tof k b
tof k c
tof k e
tof k g
tof k i
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof k i
tof i c
tof k l
tof k g
tof k e
tof k b
tof k a
tof a k
tof b a
tof c k
tof f g
tof a f
tof f c
X c
tof f d
tof a f
tof f h
tof b a
tof a l
tof b c
tof b d
tof k a
tof k b
tof k c
tof k e
tof k h
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
X h
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof k i
tof c b
tof i c
tof k h
tof b e
tof k b
tof a k
tof b l
tof b j
tof b g
tof b d
tof a b
tof b c
tof a l
tof f h
tof f i
tof a f
X a
tof f l
tof f k
tof f j
tof f g
tof f e
tof f d
tof f b
tof b f
X d
tof a f
tof a b
tof a c
tof f a
tof f d
tof f h
tof f i
tof f j
tof f k
tof a f
tof f l
tof a e
tof a g
tof a h
tof d b
tof b d
tof b e
tof b l
tof h k
tof c k
tof k f
tof k h
tof k i
tof c a
tof c b
tof c d
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof a c
tof a k
tof a b
tof c l
H k
Z c l k
H k
tof l a
tof k c
H b
Z f k b
H b
tof b k
tof k f
tof f l
tof a f
tof c k
tof c j
tof c i
tof c h
tof b d
tof c b
tof k i
tof k h
tof k f
tof h k
tof b l
tof b e
tof a d
tof d b
tof b d
tof a h
tof f e
tof f i
tof a f
tof f c
X c
X g
tof f g
tof a j
tof b a
tof b f
tof b h
tof b i
tof b k
tof g k
tof k f
tof k g
tof k h
tof k i
tof k j
tof d c
tof c a
tof c b
tof c d
tof c e
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c i
tof c e
tof c d
tof b a
tof c b
tof a d
tof d c
tof k j
tof k i
tof k h
tof k g
tof k f
tof g k
tof b k
tof b i
tof f h
tof b f
tof f b
tof b d
tof a j
tof a i
tof f a
tof a g
tof f l
tof f k
tof f j
tof f e
tof a f
X f
tof b a
tof a b
tof f b
tof f d
tof f g
tof f h
tof f i
tof f k
tof a c
tof a d
tof a e
tof a g
tof a i
tof a j
tof b c
tof b e
tof k b
tof c b
tof b l
tof k d
tof k g
tof c g
tof c h
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c l
tof c h
tof c g
tof c b
tof k l
tof k g
tof k d
tof b l
tof b e
X c
tof a b
tof b c
tof a j
tof a i
X g
tof a e
tof a g
X a
tof a d
tof f b
tof b a
tof f k
tof f i
tof f h
tof f g
tof f d
tof b f
tof f i
X f
tof f b
tof f c
tof f e
tof f g
tof f h
tof f j
tof b d
tof a b
tof a f
tof a g
tof a i
tof a k
tof a l
tof b a
tof b c
tof b e
tof b h
tof b j
tof b k
tof k a
tof k b
tof k d
tof k e
tof k g
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k i
tof k g
tof k e
tof b d
tof k b
tof k a
tof a k
tof b c
tof a l
tof b a
X c
tof f g
tof f h
tof a f
tof f c
tof f d
tof a f
tof b a
tof d k
tof k a
tof k b
tof k d
tof k e
tof k h
tof k i
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
X d
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof i c
tof k i
tof c b
tof i b
tof k l
tof k h
tof k e
tof k d
tof d k
tof b l
tof b j
tof b h
tof b e
tof a i
tof a h
tof f d
tof f b
tof a f
X a
tof f j
tof f i
tof f e
tof b f
X h
tof a f
tof a b
tof f a
tof f c
tof f d
tof f g
tof f i
tof f j
tof a d
tof a e
tof a f
tof a g
tof h k
tof k h
tof a h
tof d b
tof b d
tof b e
tof c b
tof b l
tof c k
tof k f
tof k i
tof c a
tof c d
tof c g
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof c k
tof k f
tof l a
tof a f
tof f l
tof c j
tof c i
tof c g
tof b d
tof c b
tof c a
tof k i
tof k h
tof k f
tof h k
tof b l
tof b e
tof a d
tof d b
tof a k
tof f g
tof f e
tof f i
tof a f
tof b f
tof f c
X c
tof a j
tof b a
tof b h
tof b i
tof b l
tof g k
tof k f
tof k g
tof k h
tof k i
tof k j
tof d c
tof c a
tof c b
tof c d
tof c e
tof c g
tof c h
tof c i
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c i
tof c h
tof c g
tof c e
tof c d
tof c b
tof c a
tof b c
tof d c
tof k j
tof k i
tof k h
tof k g
tof k f
tof g k
tof f j
tof b l
tof f b
X d
tof b d
X b
tof b f
tof a f
tof f d
tof f i
tof a e
tof b c
tof k b
tof b l
tof k c
tof k h
tof c d
tof c g
tof c k
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k l
tof c k
tof c d
tof c g
X c
tof b c
tof k h
tof k b
tof b l
tof a b
tof b e
tof a j
tof a i
tof a h
tof f b
tof b a
tof f i
tof a f
X f
tof f a
tof c b
tof f c
tof b c
tof f h
tof f i
tof f j
tof f k
tof a c
tof a e
tof a f
tof a g
tof a l
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof c a
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof a c
tof c b
X b
tof a g
tof a e
tof a d
tof f k
tof f j
tof f i
tof f h
tof f c
tof f a
tof a b
tof a f
tof b a
X a
tof a b
X i
tof f g
tof f h
tof f k
tof a c
tof a d
tof a f
tof a g
tof a h
tof a j
tof c b
tof b a
tof b c
tof b d
tof b e
tof k j
tof k l
tof b k
tof k b
tof k a
tof k c
tof k d
tof k e
tof k f
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c i
tof c b
tof c a
tof a c
tof b a
tof i c
tof k l
tof k f
tof k b
tof b k
tof k e
tof k d
tof b l
tof b j
tof c b
tof a j
tof a h
tof f g
tof a f
X g
tof a d
tof b a
tof f k
tof f b
tof d h
tof d f
X f
tof f d
tof f g
tof f k
tof f l
tof h c
tof h a
tof a h
tof c a
tof a k
tof g b
tof b a
tof b f
tof b g
tof f l
tof c l
tof c k
tof a f
tof l a
tof k l
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c h
tof c f
tof h c
tof k l
tof k f
tof b g
tof b f
tof b a
tof g b
tof a k
tof a h
tof a c
tof c a
tof f l
tof f k
tof f h
tof f g
tof f d
tof d f
tof b f
tof f b
tof f g
tof f h
tof f j
tof f k
tof c d
tof b c
tof b a
tof a b
tof a k
tof b a
tof b f
tof b g
tof b h
tof b j
tof b l
tof i k
tof k f
tof k i
tof c k
tof k j
tof c b
tof c e
tof c f
tof c g
tof c h
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c h
tof c g
tof c f
tof c e
tof b d
tof c b
tof b c
tof k i
tof k f
tof i k
tof b l
tof b j
tof b h
tof f g
tof b f
X g
tof b a
tof a k
tof a d
tof a c
tof a b
tof b a
tof f k
tof f j
tof f h
tof f b
tof b f
tof f b
X f
X k
tof f a
tof f e
tof f l
tof a b
tof a i
tof a j
tof a l
tof c b
tof b c
tof b d
tof b l
tof g k
tof k f
tof k g
tof k h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X h
X j
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof c a
tof a f
tof k l
tof c h
tof c g
tof c b
tof g c
tof k h
tof k g
tof g k
tof b l
tof b d
tof b c
tof c b
tof a l
tof a j
tof a i
tof f a
tof a b
X b
tof e f
tof e a
tof f e
tof a f
tof e a
tof f d
tof a f
tof f h
tof f l
tof b a
tof a i
tof b d
tof b l
tof d k
tof k a
tof k d
tof k e
tof k f
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof i c
tof k i
tof k f
tof k e
tof k d
tof k a
tof d k
tof b l
tof b d
tof a l
tof f h
tof a f
tof f a
X a
X i
tof f d
tof a l
tof b f
tof e k
tof k e
tof k i
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k l
tof k i
tof k e
tof e k
tof b i
tof b f
tof a l
tof a i
tof a e
tof e a
X c
tof f c
tof f d
tof b f
tof f g
tof f h
tof c a
tof a c
tof a d
tof a e
tof a i
tof b a
tof a k
tof b e
tof c k
tof k c
tof k d
tof k e
tof k g
tof k h
tof k i
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof k i
tof i c
tof k l
tof k h
tof k g
tof k e
tof k d
tof c k
tof b k
tof f g
tof f h
tof b f
tof b e
tof a k
tof a i
X a
tof a e
tof a c
tof a d
tof f c
tof c a
tof f l
tof f i
tof f d
tof a f
X a
tof d f
tof f d
tof f e
tof a f
tof f h
tof f i
tof f l
tof d b
tof b a
tof b d
tof b e
tof b f
tof b h
tof b i
tof e k
tof k e
tof k f
tof k h
tof k i
tof k j
tof d c
tof c a
tof c d
tof c f
tof c h
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c j
tof f h
tof c f
tof c d
tof c a
tof d c
tof k j
tof f i
tof k f
tof k e
tof e k
tof b f
tof b e
tof b d
tof b a
tof d b
tof f l
tof a f
tof f d
X f
tof f e
tof d f
X b
tof b f
tof f b
tof f j
tof f l
tof b a
tof a b
tof a f
tof b a
tof b c
tof b d
tof b j
tof e k
tof k a
tof k e
tof k f
tof k g
tof k h
tof k j
tof k l
tof e c
tof c b
tof c e
tof c f
tof c g
tof c h
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c i
tof c h
tof c g
tof c f
tof c e
tof c b
tof e c
tof k l
tof k j
tof k h
tof k g
tof k f
tof k e
tof k a
tof e k
tof b j
tof b d
tof b c
tof b a
tof a f
X c
tof f c
tof f d
tof a f
tof f g
tof f h
tof a k
tof a l
tof d b
tof b d
tof b f
tof b g
tof b h
tof b j
tof k a
tof k b
tof c h
tof k c
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c j
tof k c
tof c h
tof k a
tof b j
tof b h
tof f g
tof b f
X g
tof b d
tof d b
tof a l
tof a k
tof f h
tof a f
tof a b
tof b a
tof f l
tof f j
tof f b
tof b d
tof b f
tof b c
X b
tof f e
tof f g
tof f h
tof a f
tof f i
tof f j
tof f l
tof g b
tof b a
tof a g
tof a h
tof a k
tof b l
tof k c
tof k d
H c
Z f l c
H c
tof f l
tof a f
tof c a
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof c a
tof a f
tof f l
H c
Z l f c
H c
tof k d
X k
tof k c
tof b l
tof b k
tof b h
tof a g
tof b a
tof g b
tof a l
tof a j
X d
X a
tof f i
X f
tof f h
tof a f
tof f l
tof f j
tof f g
tof f b
X f
tof f a
tof a b
tof a g
tof a h
tof a i
tof a j
tof b c
tof b l
tof c k
tof k a
tof c d
tof c e
tof c h
tof c i
tof k c
tof k j
tof c b
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c i
tof c h
tof c e
tof c d
tof c b
tof k j
tof k i
tof k h
tof k e
tof k d
tof k c
tof k a
tof c k
tof b l
tof b c
tof a k
tof a j
tof a i
tof a h
tof a g
tof a b
tof f e
tof f c
tof f a
tof b a
tof a c
X a
tof a b
tof f g
tof a g
tof a h
tof k a
tof a j
tof b d
tof b e
tof b l
tof c d
tof c e
tof k c
tof c k
tof k i
tof c g
tof c h
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c k
tof c i
tof c h
tof c g
tof k c
tof c e
tof c d
tof k a
tof a b
tof b a
tof b j
tof b h
tof b g
tof b c
tof a b
tof f d
tof f e
tof f h
tof f i
tof e b
tof b a
tof b e
tof b g
tof b h
tof b j
tof k a
tof k b
tof k e
tof k g
tof k h
tof e c
tof c e
tof c g
tof c h
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c l
tof c h
tof c g
tof c e
tof e c
tof k j
tof k i
tof k h
tof k g
tof k e
tof k a
tof b j
tof b h
tof b g
tof b e
tof b a
tof e b
tof a l
tof a d
tof a c
tof f h
tof f g
X c
tof f c
tof f d
tof a k
tof b c
tof k b
tof b l
tof k d
tof k e
tof k g
tof k i
tof d c
tof c a
tof c d
tof c e
tof c g
tof c i
tof c j
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof c i
tof c g
tof c e
tof c d
tof c a
tof d c
tof k l
tof k i
tof k g
tof k e
tof k d
tof k b
tof b l
X b
tof b c
tof a k
tof a j
tof a h
tof a g
X e
tof a b
tof b a
tof f b
tof b e
tof a b
tof f k
tof f i
tof f d
tof f c
X f
tof f e
tof f g
tof f h
tof a f
tof f j
tof f k
tof a c
tof a d
tof a i
tof a l
tof b l
tof c k
tof k a
tof k b
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof k i
tof i c
tof k h
tof f g
tof k f
tof k e
tof k d
tof k b
tof k a
tof c k
tof k l
tof a k
tof f h
tof a f
X c
tof f c
tof f d
tof k a
tof a f
tof k b
tof k e
tof k g
tof k h
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k l
tof k i
tof k h
tof f g
tof f e
tof k f
tof k b
tof k a
tof b l
tof a j
tof a i
tof a h
tof a f
tof a d
tof a b
X a
tof f a
tof a f
tof a b
tof a d
tof a h
tof a j
tof a k
tof c b
tof b c
tof b e
tof b l
tof g k
tof k f
tof k g
tof k i
tof c b
tof c d
tof c f
tof c h
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof f l
tof a l
tof c k
tof c j
tof c h
tof c f
tof c d
tof c b
tof k i
tof f g
tof k f
tof g k
tof b l
tof b e
tof b c
tof a c
tof c b
tof a k
tof a j
tof b a
tof a h
tof b d
tof f j
tof a f
X a
tof d a
tof a d
tof f d
tof f e
tof f h
tof a e
tof a f
tof a i
tof a l
tof b e
tof b f
tof b l
tof d k
tof k a
tof k d
tof k e
tof k f
tof k h
tof k i
tof k l
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof c b
tof c a
tof i c
tof k l
tof k i
tof k h
tof k f
tof k e
tof k d
tof k a
tof d k
tof b f
tof b e
tof a l
tof a i
tof a f
tof a e
tof a d
tof d a
tof f h
X c
X d
tof f c
tof f d
tof f g
tof d a
tof a d
tof a e
tof a f
tof a g
tof a h
tof b a
tof a i
tof a k
tof b c
tof c k
tof k c
tof k d
tof k g
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof b i
tof i c
tof k g
tof k d
tof k c
tof c k
tof b l
tof b h
tof a k
tof a i
tof a h
tof f g
tof f e
tof a f
X g
tof f d
tof a d
tof d a
tof f c
tof a f
X c
tof h a
tof d f
tof f d
tof a h
X d
tof c b
tof b c
tof b e
tof b l
tof g k
tof k f
tof k g
tof k i
tof g c
tof c b
tof c f
tof c g
tof c h
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c i
tof c h
tof c g
tof c f
tof c b
tof g c
tof k i
tof k g
tof k f
tof g k
tof b l
tof b e
tof b c
tof c b
tof a h
tof h a
tof d f
tof d c
tof f d
X d
tof d f
tof f g
tof f j
tof b a
tof a b
tof a d
tof a f
tof a g
tof a h
tof a j
tof a k
tof b c
tof c k
tof k c
tof k b
tof b e
tof b l
tof k d
tof k f
tof k g
tof k h
tof k i
tof g c
tof c f
tof c g
tof c h
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof b k
tof k b
tof b a
tof l a
tof a f
tof c f
tof f l
tof c j
tof c h
tof k g
tof c g
tof g c
tof k i
tof k h
tof k e
tof k d
tof c k
tof b e
tof b c
tof a k
tof a j
tof a h
tof f g
tof f d
tof a f
tof a b
tof b a
tof f j
tof f c
tof a f
X f
tof e a
tof a e
tof f e
tof c d
tof f c
tof a f
tof f g
tof f h
tof i k
tof k i
tof k f
X i
tof k l
tof a i
tof c b
tof b a
tof b c
tof b e
tof b i
tof b l
tof k j
tof c b
tof c i
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k i
tof c k
tof b d
tof c b
tof b c
tof k j
tof k f
tof b i
tof i k
tof b l
tof a e
X c
tof b a
tof c b
tof a l
tof a k
tof a i
tof f g
tof f h
tof a f
X a
tof f e
tof e a
tof f l
tof f d
tof f c
tof a f
tof f d
tof f j
tof b d
tof b a
tof a b
tof a h
tof a j
tof a l
tof b a
tof b e
tof b f
tof b g
tof k a
tof k e
tof k h
tof k i
tof k j
tof c k
tof k f
tof f l
tof c a
tof c e
tof c g
tof c i
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof b c
tof a b
tof b c
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k l
tof k i
tof c k
tof c g
tof c e
tof c a
tof k j
tof k h
tof k e
tof k a
tof b g
tof b f
tof b e
tof a d
tof b a
X b
tof b l
tof a b
tof a j
X a
tof f j
tof c f
tof c d
X c
tof f c
X i
tof f e
tof f i
tof f k
tof a e
tof a g
tof a k
tof k c
tof k d
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c i
tof b a
tof c b
tof k i
tof f i
tof i c
tof k d
tof b l
tof b k
tof b h
tof b g
tof b e
tof a k
tof a h
tof a g
tof a e
tof f k
tof f e
tof f d
tof c a
tof f c
tof a f
tof f d
X f
X h
tof a g
tof f a
tof a h
tof f i
tof f k
tof a e
tof a i
tof g b
tof b a
tof b g
tof b h
tof b i
tof b l
tof h k
tof k a
tof k b
tof k h
tof f l
tof d c
tof c a
tof c b
tof c d
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X d
X g
X h
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof l a
tof a f
tof f l
tof c d
tof b a
tof c b
tof d c
tof k h
tof k a
tof h k
tof b l
tof b i
tof b h
tof b g
tof g b
tof a i
tof a h
tof a g
tof a e
tof a c
tof c a
tof f k
tof f i
tof f g
tof a f
tof a d
X a
tof f c
X c
tof f a
tof a f
tof f i
tof f j
tof f k
tof a b
tof a e
tof a f
tof a g
tof a h
tof a j
tof d b
tof b a
tof b d
tof b f
tof b g
tof b h
tof b j
tof b l
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof c e
tof c f
tof c h
tof c i
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c f
tof f l
tof c j
tof k c
tof c i
tof c h
tof c e
tof k g
tof k f
tof k d
tof b l
tof b j
tof b h
tof b g
tof b f
tof a d
tof b a
tof d b
tof a j
tof a h
tof a g
tof a f
tof a e
tof f a
tof a c
tof f k
tof f j
tof f i
tof f d
tof a f
X f
tof c a
tof a c
tof f c
tof f d
tof f g
tof f i
tof a e
tof a h
tof a i
tof a k
tof b d
tof b e
tof b f
tof b g
tof b i
tof b l
tof d k
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof k j
tof c b
tof c f
tof c g
tof c h
tof c i
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c j
tof c i
tof c h
tof c g
tof b f
tof c b
tof k j
tof k i
tof k h
tof f g
tof k f
tof k e
tof k d
tof d k
tof b l
tof b i
tof b g
tof b e
tof b d
tof a k
tof a i
tof a h
tof a e
X a
tof f c
tof a c
tof c a
tof f i
tof a f
tof f a
tof a d
tof f h
X f
X b
tof f e
tof f j
tof d b
tof d a
tof a d
tof a e
tof b a
tof a i
tof a j
tof b l
tof d k
tof k a
tof k d
tof k e
tof k f
tof k i
tof k j
tof k l
tof h c
tof c a
tof c b
tof c h
tof c i
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
X d
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k i
tof k a
tof c k
tof c h
tof c b
tof h c
tof k l
tof k j
tof f e
tof k f
tof k d
tof d k
tof b e
tof a d
tof a j
tof a i
tof a e
tof a c
tof f a
tof f k
tof a d
tof b a
tof a g
tof a j
tof k f
tof k j
tof c a
tof c b
tof c g
tof c h
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c h
tof a g
tof b a
tof c b
X c
tof a c
tof k j
tof k f
tof b l
tof b j
tof b d
tof a d
tof d b
tof a j
tof b a
tof f k
tof f c
X a
tof f a
tof f i
tof a b
tof a d
tof a e
tof a j
tof b c
tof b e
tof b h
tof b i
tof b j
tof b l
tof c k
tof c a
tof k c
tof k b
tof k e
tof k f
tof k g
tof k i
tof c d
tof c f
tof c g
tof c h
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof f l
tof c h
tof c g
tof c f
tof c d
tof k c
tof c a
tof k i
tof k g
tof k f
tof c e
tof c k
tof b e
tof b l
tof b j
X i
tof a h
tof a i
X h
tof a b
tof a c
tof a j
X a
tof a e
tof a d
tof f j
tof f i
tof a h
tof f a
tof d f
tof f d
tof f e
tof f i
tof a e
tof b f
tof b l
tof f l
tof a f
tof b d
tof b g
tof k a
tof k d
tof k g
tof k j
tof e c
tof c e
tof c f
tof a f
tof l a
tof b k
tof k l
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X j
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof b f
tof l a
tof a f
tof c f
tof f l
tof c e
tof e c
tof k j
tof k g
tof k e
tof k d
tof k a
tof b i
tof b h
tof b g
tof d c
tof b d
tof a l
tof a h
tof f e
tof a f
X a
tof f i
tof d f
tof f d
X d
tof d f
tof f j
tof f k
tof b a
tof a b
tof a c
tof a d
tof a f
tof a g
tof a h
tof a j
tof d b
tof b a
tof b d
tof b f
tof b g
tof b h
tof b j
tof k b
tof b l
tof k a
tof c f
tof c h
tof k c
tof c j
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof b f
tof l a
tof a f
tof c f
tof f l
tof c j
tof k c
tof c h
tof k a
tof b j
tof b h
tof b g
tof a d
tof b a
tof d b
tof a j
tof a h
tof a g
tof f c
tof a f
tof b a
X b
tof b f
tof c j
tof b c
tof b k
tof f d
tof f b
tof f e
tof b f
tof a b
tof f i
tof a g
tof a h
tof b j
tof b k
tof b l
tof i k
tof k f
tof k i
tof k j
tof c d
tof c e
tof c g
tof c h
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof c h
tof c g
tof c e
tof b c
tof a c
tof c d
tof k j
tof k i
tof k f
tof b i
tof i k
tof b l
tof b j
tof b f
tof f b
tof f h
tof a f
tof f h
tof f i
X a
X g
tof f k
tof f j
tof f e
tof f d
tof c f
tof f c
tof c f
tof b f
X b
tof f e
tof f g
tof f h
tof f i
tof a d
tof a k
tof k a
tof b k
tof b d
tof b e
tof b i
tof b l
tof k c
tof k f
tof k h
tof k j
H c
Z f l c
H c
tof f l
tof a f
tof c a
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k c
tof c f
tof l a
tof a f
tof f l
tof b c
tof c a
H c
Z l f c
H c
tof k j
tof f h
tof k f
tof b l
tof b k
tof b i
tof b e
tof b d
tof a k
tof a i
tof f i
tof f g
tof f e
tof f c
tof c f
tof f c
X f
tof f a
tof f i
tof a f
tof f j
tof a b
tof a e
tof a h
tof a k
tof c b
tof b c
tof b l
tof k a
tof g c
tof c b
tof c f
tof c g
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c g
tof c f
tof c b
tof g c
tof k a
tof b l
tof b c
tof c b
tof a k
tof a j
tof a h
tof f g
tof a f
tof a e
tof a d
tof a b
tof f j
tof f i
tof a f
tof f a
X a
tof a f
tof a d
tof a c
X h
tof f h
tof f i
tof d a
tof a d
tof a e
tof a f
tof a h
tof a i
tof h b
tof b a
tof b f
tof b h
tof b i
tof b l
H k
Z f a k
H k
tof k a
tof k b
tof k f
H c
Z f l c
H c
tof f l
tof k f
tof c k
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X d
X e
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X h
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof c k
tof k f
tof l a
tof a f
tof f l
H c
Z l f c
H c
tof k f
tof k b
tof k a
H k
Z f a k
H k
tof b l
tof b i
tof b h
tof a f
tof b a
tof h b
tof a i
tof a h
tof a e
tof a d
tof d a
tof f i
tof a h
tof f a
tof a f
X c
tof c f
tof c e
tof c h
tof c i
tof f c
tof a f
tof f k
tof k f
tof b k
tof a d
tof a e
tof c a
tof a g
tof b e
tof b h
tof b i
tof b l
tof k j
tof c b
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c j
tof c i
tof c h
tof a g
tof c a
tof b e
tof c b
tof k j
tof b k
tof a k
tof k f
tof f k
tof b l
tof b i
tof b h
tof a h
tof a e
X a
tof a d
tof f i
tof f h
tof f e
tof f c
tof c f
X c
X g
tof a f
tof f a
tof f e
tof f h
tof d a
tof a d
tof a e
tof a i
tof c b
tof b c
tof b e
tof b f
tof b i
tof b l
tof k a
tof k f
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c k
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof c b
tof b k
tof k f
tof l a
tof a f
tof f l
tof c h
tof c g
tof c a
tof g c
tof k f
tof k a
tof b l
tof b i
tof f e
tof b f
X e
tof b c
tof c b
tof a i
tof a e
tof a d
tof d a
tof f h
tof b f
tof b d
tof a b
tof f b
tof b a
tof b h
X b
X a
tof b d
tof a h
tof f j
tof a l
tof b a
tof i k
tof k f
tof k i
tof k j
tof e c
tof c b
tof c e
tof c f
tof c h
tof c j
tof c k
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c f
tof f l
tof k j
tof c k
tof c h
tof c e
tof c b
tof e c
tof k i
tof k f
tof i k
tof b j
tof b h
tof b f
tof b a
tof a l
tof a h
tof a b
X a
tof a d
tof b a
tof f j
tof d b
tof f d
X f
tof b d
tof a d
tof d f
tof a c
X i
tof f i
tof f a
tof c d
X c
tof f j
tof f k
tof a e
tof a f
tof a g
tof a h
tof b e
tof b f
tof b i
tof b j
tof b k
tof b l
tof c k
tof k a
tof k c
tof k l
tof f l
tof c b
tof c h
tof c j
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X g
X h
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c j
tof c h
tof b d
tof c b
tof k f
tof k d
tof k c
tof k a
tof c k
tof b l
tof b k
tof b j
tof b i
tof f e
tof b f
X b
tof a d
tof d b
tof f g
tof f h
tof a f
X a
tof a c
tof f k
tof f j
tof f i
tof f d
tof f b
tof d a
tof a d
tof a e
tof a g
tof a i
tof a k
tof c b
tof b c
tof b e
tof k b
tof b l
tof k g
tof k h
tof g c
tof c a
tof c b
tof c g
tof c i
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c i
tof c g
tof c b
tof c a
tof g c
tof k l
tof k h
tof k g
tof k b
tof b l
tof b e
tof b c
tof c b
tof a k
tof a i
tof a g
tof a e
tof a d
tof d a
tof f h
tof f g
tof f e
tof f c
tof b f
tof f b
tof a b
X f
tof b a
tof b f
X i
tof f g
tof c h
tof f c
X g
tof b f
tof f j
tof a d
tof a g
tof b a
tof a k
tof c d
tof b c
tof b l
tof i k
tof k f
tof k i
tof k j
tof c b
tof c e
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c i
tof c h
tof c e
tof b d
tof c b
tof b c
tof k j
tof k i
tof k f
tof i k
tof b l
tof b j
tof a k
tof b a
tof f h
tof b f
tof a g
tof a d
tof a b
tof b a
tof f j
tof f g
tof f c
tof f b
tof b f
tof f b
X f
tof c b
tof f a
tof f e
tof a f
tof f h
tof k a
tof a b
tof a d
tof a i
tof a j
tof b c
tof b e
tof b l
tof k h
tof g c
tof c a
tof c b
tof c g
tof c i
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k i
tof c k
tof c g
tof c b
tof c a
tof g c
tof k l
tof k j
tof k h
tof k e
tof a d
tof k a
tof b c
tof k b
tof b l
tof b e
tof c b
tof a j
tof a i
tof a h
tof a f
X b
tof b a
tof a b
tof b a
tof f b
tof f e
X i
tof f j
tof a d
tof a j
tof b l
tof i k
tof k f
tof k i
tof k j
tof e c
tof c a
tof c b
tof c e
tof c f
tof c h
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c h
tof c f
tof c e
tof c b
tof c a
tof e c
tof k i
tof k f
tof i k
tof b l
tof a j
tof a d
tof a b
tof b a
tof f j
tof f h
X c
X b
tof a f
X f
tof c e
tof c a
tof a c
tof c h
tof f c
tof f k
tof b a
tof a d
tof a g
tof a i
tof b e
tof f l
tof b l
tof k l
tof k j
tof c a
tof c b
tof c g
tof c j
tof a f
tof l a
tof k l
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c j
tof c h
tof c g
tof a e
tof b a
tof c b
tof a c
tof k f
tof f k
tof f c
tof f j
tof b i
tof b g
tof a i
tof a g
tof a d
tof c a
X c
tof f h
tof f e
tof a f
X a
tof e f
tof f e
tof f h
tof f i
tof a d
tof a i
tof b a
tof b c
tof b f
tof b h
tof k a
tof k d
tof k f
tof e c
tof c a
tof c b
tof c e
tof c g
tof c i
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c i
tof c g
tof c e
tof b a
tof c b
X c
tof e c
tof k j
tof k f
X d
tof a d
tof k a
tof f h
tof b f
tof b d
tof a i
tof f i
tof f e
tof e f
tof a f
tof f a
tof f c
tof f h
tof f i
tof f k
tof d a
tof a d
tof a e
tof a f
tof a g
tof a h
tof a i
tof a k
tof k f
tof k j
tof c b
tof c d
tof c e
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X d
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a l
tof f l
tof c k
tof c e
tof c d
tof c b
tof k j
tof k f
tof b l
tof b c
tof a k
tof a i
tof a h
tof a g
tof a e
tof a d
tof d a
tof f k
tof f i
tof f h
tof f c
tof f a
tof a f
tof f a
X f
X l
X k
tof f b
tof f e
tof a b
tof a i
tof a j
tof a l
tof b c
tof b l
tof e k
tof k a
tof k e
tof k g
tof k i
tof k j
tof e c
tof c b
tof c e
tof c g
tof c i
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X d
X e
X g
X i
X j
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c i
tof c g
tof c e
tof c b
tof e c
tof k j
tof k i
tof k g
tof k e
tof k a
tof e k
X c
tof a c
tof a b
tof a j
tof a i
tof f e
tof f a
X a
tof f c
tof f g
tof b a
tof a b
tof k j
tof a k
tof b e
tof k a
tof k e
tof k i
tof e c
tof c e
tof c i
tof c k
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof k i
tof c k
tof c e
tof e c
tof k j
tof k e
tof k a
tof b l
tof b e
X c
tof a b
tof b c
tof a l
tof a k
tof b j
tof b a
tof a b
tof f g
tof f c
tof f e
tof f i
tof a e
tof a l
tof b c
tof b l
tof c k
tof k b
tof c e
tof c g
tof c i
tof k c
tof c a
tof c j
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c j
tof c i
tof c g
tof a e
tof c a
tof k i
tof k g
tof k e
tof k c
tof c k
tof b l
tof b c
tof a l
tof a j
X a
tof a b
tof f i
X e
tof f b
X f
tof f a
tof f j
tof f l
tof b a
tof a b
tof a e
tof a f
tof a i
tof a j
tof b l
tof e k
tof k a
tof k b
tof k e
tof k f
tof k i
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
X e
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c k
tof c j
tof c a
tof c i
tof c b
tof i c
tof k i
tof k f
tof k e
tof k b
tof k a
tof e k
tof b l
tof a j
tof a i
tof f e
tof a f
tof a b
tof f a
X a
tof c g
tof f c
tof c f
tof a b
tof a f
tof a g
tof a j
tof b a
tof a k
tof b g
tof k e
tof k f
tof k g
tof c k
tof k j
tof c b
tof c i
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c i
tof c g
tof c f
tof c b
tof k g
tof k f
tof k e
tof b k
tof a g
tof b a
tof a b
tof a k
tof b f
tof a b
tof b f
tof f a
tof f l
tof a l
X f
tof k c
tof f k
tof k f
X g
tof a c
tof a g
tof g b
tof b a
tof b g
tof b j
tof k b
tof c a
tof c j
tof a f
tof l a
tof k l
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k b
tof k f
tof l a
tof a f
tof c j
tof c a
tof k c
tof b j
tof a g
tof b a
tof g b
tof a l
tof a j
tof b c
tof b a
X a
X f
tof f b
X k
tof a b
tof a k
tof g b
tof b g
tof f e
tof f i
tof f j
tof f l
tof a i
tof a j
tof a l
tof b i
tof b l
tof e k
tof e c
tof k e
tof k f
tof c k
tof c g
tof c j
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof c f
tof c j
tof f i
tof f j
tof a f
tof c g
tof k e
tof c e
tof e c
tof a c
tof c k
tof b l
tof b i
tof b g
tof g b
tof a b
tof f l
tof f k
X f
tof f e
tof b g
tof b f
tof f j
tof b k
tof f b
tof k j
tof f l
tof c b
tof c a
tof a c
tof a l
tof b e
tof b f
tof b g
tof b j
tof k a
tof k c
tof k g
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c i
tof b a
tof c b
tof i c
tof k g
tof k a
tof a k
tof k c
tof c k
tof b l
tof b j
tof f g
tof b f
X g
tof b e
tof b c
tof c b
X c
tof f b
tof a j
tof f a
X f
tof b f
tof f c
tof f g
tof f j
tof a b
tof a g
tof c b
tof b a
tof g c
tof b g
tof c g
tof k j
tof k l
tof b l
tof c j
tof c l
tof a f
tof l a
X l
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c j
tof c g
tof b g
tof g c
tof k j
tof k f
tof b k
tof a j
tof b a
tof a b
tof c b
tof a l
tof a k
tof a g
tof b a
tof f l
tof a c
X a
tof f i
tof a k
tof f a
tof b e
tof a b
tof a j
tof a l
tof b a
tof b c
tof b g
tof b k
tof k b
tof b i
tof k c
tof k e
tof c b
tof c j
tof c k
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X g
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c l
tof c k
tof c j
tof k c
tof c b
tof b c
X i
tof b e
tof k e
tof k i
X k
X g
tof b a
tof a l
tof a k
X a
tof f a
X f
tof f c
tof a g
tof f l
tof a f
tof b f
tof c k
tof k a
tof k c
tof k e
tof k g
tof k j
tof i c
tof c a
tof c b
tof c i
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k j
tof c k
tof c i
tof c b
tof c a
tof i c
tof k g
tof c e
tof a c
tof k a
tof c k
tof b k
tof b i
tof b f
tof f b
tof f g
tof a f
tof a j
tof f k
tof c f
tof c l
tof c i
tof c g
X c
tof f c
tof a i
tof c a
tof a l
tof c b
tof b e
tof b f
tof b i
tof k f
tof k j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof c b
tof b k
tof k f
tof l a
tof a f
tof f l
tof c e
tof c a
tof k j
tof k f
tof f g
tof b f
tof a f
tof f l
tof a k
tof a i
tof a g
X i
tof f a
tof a e
X a
tof c f
tof f e
tof a f
tof f g
tof f k
tof f l
tof a k
tof a l
tof k f
tof b k
tof k a
tof k j
tof c k
tof k f
tof f l
tof c b
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof k l
tof c k
tof b i
tof c b
tof k j
tof k f
tof k a
tof b k
tof f e
tof b f
X e
tof a l
tof a k
tof a i
tof a e
tof a c
tof c a
tof f g
tof f c
tof f i
tof e a
tof a e
tof a f
tof a g
tof a i
tof a k
tof e b
tof b e
tof b g
tof b l
tof k b
tof k e
tof k g
tof g c
tof c b
tof c f
tof c g
tof c j
tof c k
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
X g
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X g
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof c b
tof b k
tof k f
tof l a
tof a l
tof c l
tof c j
tof c g
tof g c
tof k g
tof b e
tof k b
tof b l
tof b g
tof e b
X k
tof a g
tof i k
tof a i
tof a e
tof e a
tof f i
X a
tof f c
tof f a
tof a f
X b
tof f g
tof k j
tof f k
tof b l
tof f l
tof b a
tof a b
tof a c
tof a k
tof k f
tof k i
tof e c
tof c a
tof c b
tof c e
tof c g
tof c i
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X e
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof f l
tof c l
tof c i
tof c g
tof c e
tof c a
tof a c
tof c b
tof e c
tof k j
tof k i
tof k f
tof i k
tof b l
tof a k
tof a j
tof b a
tof f l
tof f k
tof f j
tof f g
tof a f
X e
tof e b
tof f e
X f
tof f a
tof b e
tof f g
tof f j
tof f k
tof f l
tof a c
tof a f
tof a g
tof a i
tof a j
tof b f
tof b g
tof b j
tof b k
tof i k
tof k f
tof k i
tof k j
tof c e
tof c g
tof c l
tof f l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof l a
tof f l
tof k l
tof c l
tof c g
tof c e
tof k j
tof k i
tof i k
tof b k
tof b j
tof f g
tof f e
tof b f
tof e b
tof a j
tof a i
tof a g
tof a c
tof f l
X k
X f
X j
tof f b
tof f g
tof f i
tof c b
tof a c
tof b c
tof a e
tof a k
tof b a
tof b e
tof b i
tof b j
tof c k
tof c a
tof k c
tof c b
tof c j
tof c l
tof a f
tof l a
tof k l
tof k f
tof b l
tof b k
tof k c
H b
Z f k b
H b
tof c k
H k
Z c l k
H k
tof a b
tof a c
tof a k
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof l a
tof a f
tof c l
tof b j
tof b a
tof c b
tof a c
tof k a
tof c k
tof b i
tof b e
tof b c
tof c b
tof a l
tof a e
tof f k
tof f j
tof f i
tof f g
tof a f
X f
tof f a
tof a f
X k
tof f i
tof f j
tof f l
tof a e
tof a j
tof a l
tof b e
tof b l
H k
Z f a k
H k
tof k a
tof k b
tof k f
H c
Z f l c
H c
tof f l
tof k f
tof c k
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X e
X i
X j
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof c k
tof k f
tof l a
tof a f
tof f l
H c
Z l f c
H c
tof k f
tof a b
tof k a
H k
Z f a k
H k
tof b l
tof b e
tof a j
tof f i
X a
tof f e
tof b a
tof a b
tof a e
tof a i
tof a j
tof b a
tof a l
tof b f
tof i k
tof k a
tof k i
tof k j
tof f l
tof e c
tof c e
tof c j
tof c l
tof a f
tof l a
X l
tof b k
tof k l
tof k c
H b
Z f k b
H b
H k
Z c l k
H k
X l
tof a b
tof a c
tof a k
X e
X i
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
X i
X e
tof c k
tof a c
tof a b
H k
Z c l k
H k
tof k c
H b
Z f k b
H b
tof k l
tof b k
tof k f
tof k a
tof l a
tof a f
tof c l
tof c j
tof c e
tof e c
tof k j
tof k i
tof i k
tof b f
tof b a
tof a l
tof a j
tof a i
tof a e
tof a b
tof b a
tof f a
tof a k
tof k a
tof k b
tof k i
tof k j
tof k l
tof f i
tof k f
tof l k
X a
X b
X c
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 3
Z a b 3
H 3
H 2
Z 3 c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z 3 c 2
H 2
H 3
Z a b 3
H 3
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H f
Z 0 l f
H f
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 3
Z a b 3
H 3
H 2
Z 3 c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H l
Z 0 f l
H l
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z 3 c 2
H 2
H 3
Z a b 3
H 3
tof f j
X j
tof l k
tof f i
tof f e
X f
tof k e
X b
tof b l
tof b a
X d
tof b d
tof k d
tof a c
tof a b
tof c a
tof a l
tof k h
tof k l
tof f l
tof l b
tof l c
tof l f
tof l h
tof l k
H j
Z d b j
H j
tof j b
tof j d
tof j l
tof g c
tof g d
tof g b
tof g k
X g
X f
tof g h
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H g
Z c d g
H g
tof k h
tof g k
tof g b
tof g d
tof g c
tof j l
tof j d
tof j b
H j
Z d b j
H j
tof k f
tof l k
tof c b
tof l c
tof f l
tof a k
X k
tof k b
X l
tof a l
tof b l
tof c k
tof c a
tof a c
X a
tof b d
tof c a
tof c l
tof k b
tof k c
tof k a
tof a k
tof a d
tof k a
tof a l
tof k e
tof k f
tof k g
tof e l
tof l d
tof l e
tof l f
tof l h
tof l i
tof l j
tof l k
tof j b
tof j c
tof j d
tof j f
tof j g
tof j h
tof j l
H j
Z c d j
H j
tof j a
tof j f
tof j g
tof j h
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
tof l h
tof j l
tof j g
tof j f
tof j a
H j
Z c d j
H j
tof j l
tof j g
tof j f
tof j d
tof j c
tof j b
tof l k
tof l j
tof l i
tof l f
tof l e
tof l d
tof k e
tof e l
X e
tof k g
tof k f
tof k a
tof a k
tof k c
tof k b
tof a l
tof a d
tof k a
tof c l
tof c a
tof a k
tof a b
tof b a
tof a b
tof c d
tof b c
X d
tof b e
tof c b
tof c k
tof c l
tof a b
tof a e
tof e k
tof k c
tof k e
tof k f
tof k h
tof k l
tof e l
tof l d
tof j l
tof l e
tof l f
tof l g
tof l i
tof l k
tof j a
tof j b
tof f d
tof f a
tof f j
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof j a
tof f j
tof f d
tof l k
tof l i
tof l g
tof l f
tof l e
tof j l
tof j b
tof l d
tof k e
tof e l
tof k h
tof k f
tof k c
tof a e
tof e k
tof a b
tof c l
tof c k
tof b d
X d
tof c b
tof b c
tof b k
X e
tof a b
tof b a
tof b e
X a
tof b g
tof b h
tof k j
tof b k
tof e c
tof c e
tof c k
tof a d
tof a e
tof k b
tof k d
tof j k
tof k f
tof h l
tof l b
tof j l
tof l h
tof l i
tof c d
tof j c
tof b d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof c d
tof k c
tof b d
tof l b
tof l i
tof l h
tof h l
tof j l
tof j f
tof j c
tof k j
tof k f
tof a k
tof k b
tof a j
tof a h
tof a g
tof a e
tof a d
tof c k
tof c j
tof c e
tof e c
tof b g
tof c a
X c
tof b c
tof a b
tof b i
tof c e
tof c k
tof c l
tof a f
tof a h
tof a j
tof a k
tof f k
tof k b
tof k f
tof k h
tof j i
tof k j
tof h l
tof l b
tof l d
tof j h
tof l j
tof j l
tof j b
tof j d
tof j e
tof j f
tof g j
tof j k
tof g c
tof g b
tof g l
X g
X e
tof g h
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X i
X h
X g
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H g
Z c d g
H g
tof g l
tof j h
tof g j
tof g c
tof l i
tof j l
tof j f
tof j e
tof l j
tof j d
tof l h
tof l b
tof h l
tof k j
tof k i
tof k h
tof b f
tof a b
tof k b
tof f k
tof a j
tof a i
tof a h
tof c l
tof c e
tof c a
tof b j
tof b e
X a
X d
tof b a
tof b d
tof b g
tof b l
tof c b
tof c g
tof c h
tof c i
tof c j
tof g a
tof a c
tof a g
tof a h
tof a i
tof a j
tof a k
tof e k
tof k b
tof k d
tof k e
tof k h
tof k l
tof i l
tof l b
tof l i
tof l j
tof e j
tof a e
tof j a
tof j d
tof j g
tof j k
tof j l
tof a f
tof a i
H a
Z c d a
H a
tof a b
tof a e
tof a f
tof a i
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X i
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof a i
tof a f
tof a e
tof a b
H a
Z c d a
H a
tof a i
tof a f
tof a e
tof a b
tof j l
tof j g
tof j e
tof j d
tof j a
tof e j
tof l j
tof l i
tof l b
tof i l
tof k l
tof k h
tof k e
tof k d
tof a k
tof k b
tof a j
tof a i
tof a h
tof a g
tof a c
tof g a
tof c k
tof c j
tof c i
tof c h
tof b g
tof c b
tof b c
tof b l
tof b h
tof a b
tof b f
X a
tof b a
tof b i
tof a b
tof b c
tof b g
tof b j
tof b l
tof f c
tof c f
tof c j
tof c l
tof k b
tof k c
tof j k
tof k e
tof g l
tof l b
tof l g
tof l h
tof j b
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
X h
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof d k
tof b d
tof l d
tof d k
tof b k
tof c d
tof j d
tof j e
tof l h
tof l g
tof g l
tof k e
tof e k
tof a e
tof c l
tof c j
tof c f
tof b f
tof f c
tof b l
tof b j
tof b i
tof b g
tof b a
tof a b
tof g a
X b
tof b g
tof b f
tof b h
tof b k
tof b l
tof a d
tof c a
tof c e
tof c k
tof k c
tof c f
tof a c
tof c j
tof a b
tof a g
tof a h
tof a l
tof k a
tof k h
tof j k
tof k i
tof h l
tof l b
tof l h
tof l i
tof j a
tof j f
tof j h
tof e c
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof k f
tof e k
tof e b
tof e d
tof e c
tof j i
tof j h
tof j f
tof k j
tof j a
tof a j
tof l i
tof l h
tof l b
tof h l
tof k i
tof k h
tof k c
tof a l
tof a h
tof b g
tof a b
tof c d
tof a c
X a
tof g a
tof c k
tof c j
tof c f
tof c e
tof c a
X c
tof b c
tof a b
tof b i
tof e c
tof c d
tof c e
tof c f
tof k l
tof c k
tof a c
tof a h
tof k b
tof k d
tof k g
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
H j
Z d b j
H j
tof j a
tof j d
H d
Z c a d
H d
tof j a
H j
Z c d j
H j
tof j a
tof j b
tof j k
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j l
tof j a
H j
Z c d j
H j
tof j a
H d
Z c a d
H d
tof j d
tof j a
H j
Z d b j
H j
tof l j
tof l i
tof l h
tof l g
tof l b
tof k g
tof g l
tof k d
tof k b
tof a i
tof a h
tof a c
tof a b
tof c l
tof k f
tof c k
tof c e
X c
tof c d
tof e c
tof b i
tof b d
tof b c
tof b j
tof c a
tof c e
tof c k
tof a b
tof a c
tof a d
tof a h
tof a j
tof a l
tof k b
tof k g
tof j i
tof k j
tof k l
tof h l
tof l b
tof l h
tof l i
tof j b
tof j c
tof j f
tof j g
tof j k
tof e c
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof k f
tof k b
tof e k
tof e d
tof e c
tof j i
tof j g
tof j f
tof j c
tof l i
tof l h
tof l b
tof h l
tof k l
tof k j
tof k i
tof k g
tof a l
tof a j
tof a h
tof a d
tof a c
tof a b
tof c k
X f
X c
X e
tof k l
tof b k
tof b j
tof b f
tof e a
tof a e
tof b e
tof c b
tof b d
tof b g
tof c i
tof c j
tof c k
tof k c
tof a f
tof a g
tof k d
tof k e
tof k f
tof k h
tof k i
tof e l
tof l d
tof l e
tof l f
tof g h
tof g i
tof l g
tof l j
tof j l
tof l k
tof j a
tof j c
tof g d
tof g b
tof g j
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H g
Z c d g
H g
tof g j
tof g i
tof g h
tof g b
tof g d
tof l k
tof j l
tof j c
tof j a
tof l j
tof l i
tof l h
tof l g
tof l f
tof l e
tof l d
tof k e
tof e l
tof k i
tof k h
tof k c
tof c k
tof k f
tof k d
tof a g
tof a f
tof c e
tof a e
tof e a
X e
tof c l
tof c j
tof c i
tof c g
tof c b
tof g c
X g
tof c g
tof c d
tof b c
tof b a
tof b j
tof c b
tof c h
tof c k
tof g a
tof a k
tof k a
tof a c
tof a j
tof j a
tof a g
tof k b
tof k d
tof k f
tof k h
tof h l
tof l b
tof l h
tof l i
tof j b
tof j d
tof j f
tof j h
tof j k
tof e c
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof k f
tof k b
tof k d
tof k c
tof e k
tof j h
tof j g
tof j f
tof j d
tof k j
tof j a
tof a j
tof l i
tof l h
tof l b
tof h l
tof k h
tof a k
tof k g
tof a c
tof g a
tof c k
tof c h
tof c g
tof c d
tof c b
X c
tof b g
tof g c
X a
tof a i
tof b a
tof a b
tof h c
tof c b
tof c d
tof c h
tof c i
tof c j
tof a c
tof k l
tof c k
tof k c
tof l c
tof a d
tof a e
tof a h
tof k a
tof a j
tof l k
tof k h
tof l a
tof l b
tof l g
tof l i
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof f c
tof f d
tof f a
tof f i
X f
X e
tof f g
tof f h
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H f
Z c d f
H f
tof f i
tof f h
tof f g
tof f a
tof f d
tof f c
tof j l
tof j a
H j
Z a k j
H j
tof l k
tof l i
tof l h
tof l g
tof l c
tof l b
tof k l
tof l a
tof a l
tof a k
tof k c
tof c k
tof k j
tof k h
tof a i
tof a e
tof a d
X d
tof a b
tof c l
tof c d
tof b i
tof c b
tof b h
tof h c
tof b j
tof c b
X b
tof b c
tof b d
tof b e
tof b i
tof b k
tof c e
tof c j
tof c l
tof g a
tof a b
tof a c
tof a g
tof a i
tof k j
tof a k
tof a l
tof k b
tof k e
tof k f
tof k g
tof k h
tof k i
tof l a
tof l b
tof l c
tof l e
tof l f
tof l g
tof l k
tof e j
tof j b
tof j c
tof j e
tof j k
H j
Z c d j
H j
tof j f
tof j g
tof j h
tof j i
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
tof j i
tof j h
tof j g
tof j f
H j
Z c d j
H j
tof j k
tof j e
tof j c
tof j b
tof e j
tof k g
tof k f
tof k e
tof l k
tof l c
tof l a
tof a l
tof l b
tof k j
tof k i
tof k h
tof k b
tof a k
tof a j
tof a i
tof c g
tof a c
tof g a
tof c l
tof c j
tof b c
tof c e
tof b k
tof b i
tof b d
tof c b
X d
X c
tof e b
tof b e
tof b j
tof b k
tof k b
tof k g
tof a k
tof e c
tof c d
tof c e
tof c g
tof c j
tof k a
tof a c
tof k h
tof k j
tof g l
tof l b
tof l g
tof l h
H j
Z a k j
H j
tof j k
tof a l
tof j a
H a
Z c d a
H a
tof a l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof k b
tof a k
tof l k
tof k c
tof j b
tof c d
tof b d
H a
Z c d a
H a
tof j a
tof a l
tof k a
H j
Z a k j
H j
tof l h
tof l g
tof l b
tof g l
tof k h
tof c g
tof a k
tof k c
X a
tof k b
tof b k
tof c j
tof c e
tof c d
tof e c
tof b j
tof b e
tof e b
X c
tof a b
tof c a
tof c e
tof c g
tof b c
tof b k
tof k b
tof b i
tof b j
tof c d
tof k c
tof c l
tof a d
tof k f
tof k g
tof k h
tof f l
tof l d
tof l f
tof l i
tof f j
tof f a
tof f b
tof f h
tof j f
tof j i
tof j l
tof f d
tof f g
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof c d
tof k d
tof b d
H f
Z c d f
H f
tof f h
tof f g
tof f b
tof f a
tof f d
tof l i
tof j l
tof j h
tof j f
tof j b
tof b j
tof j a
tof f j
X a
tof l f
tof l d
tof k f
tof f l
tof k j
tof k i
tof k h
tof c g
tof k c
tof c a
tof b d
tof c l
tof b c
tof c e
X c
tof b k
tof b i
tof a b
tof b g
tof b d
tof b f
tof c b
tof b h
tof b l
tof a j
tof c a
tof c k
tof k c
tof a k
tof a f
tof k a
tof k b
tof k h
tof k i
tof k l
tof h l
tof l b
tof l h
tof l i
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof e c
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e k
tof e f
tof e b
tof e d
tof e c
tof j l
tof j a
H j
Z a k j
H j
tof l i
tof l h
tof l b
tof k h
tof h l
tof k i
tof k c
tof k b
tof k a
tof a k
tof a j
tof a g
tof a f
tof c d
tof a c
tof c a
X a
tof c l
tof c k
tof c j
tof c h
tof c b
X c
tof b c
tof c g
X f
tof c b
tof b a
tof b i
tof c d
tof c h
tof c k
tof f a
tof a b
tof a d
tof a f
tof a g
tof a h
tof a i
tof a l
tof f k
tof k a
tof k f
tof k i
tof k j
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof f j
tof j a
tof j c
tof j d
tof j l
tof j b
tof j e
tof j g
tof j k
H j
Z c d j
H j
tof j b
tof j e
tof j f
tof j g
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j g
tof j f
tof j e
H j
Z c d j
H j
tof j k
tof j g
tof j e
tof l b
tof j l
tof j d
tof j c
tof j a
tof f j
tof l j
tof l i
tof l h
tof l g
tof g l
tof k j
tof k i
tof k f
tof k a
tof f k
tof a l
tof a i
tof a h
tof a g
tof a f
tof b d
tof a b
X d
tof f a
tof c k
tof c h
tof b i
tof c b
tof c a
X c
tof b c
tof c b
tof b j
tof c d
tof c h
tof c k
tof k c
tof c l
tof a l
tof a k
tof a f
tof a g
tof k a
tof k b
tof k h
tof k i
tof h l
tof l b
tof l h
tof l i
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof e c
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof k b
tof e k
tof e f
tof e d
tof e c
tof j l
tof j a
H j
Z a k j
H j
tof l i
tof l h
tof l b
tof k i
tof k h
tof h l
tof k c
tof k a
tof a k
tof a g
X f
tof a c
X a
tof c l
tof c k
X j
tof b d
tof c b
X c
tof b j
tof b l
tof b f
tof b e
tof b i
tof c f
tof c g
tof c i
tof c k
tof k c
tof k b
tof a k
tof a d
tof a j
tof k e
tof l k
tof k g
tof k h
tof k i
tof l a
tof l b
tof l c
tof l f
tof e j
tof j a
tof e h
tof j e
tof j i
tof j k
tof e c
tof e d
tof e b
tof e g
tof e j
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof j h
tof e j
tof e g
tof e b
tof e d
tof e c
tof k i
tof j k
tof j e
tof j a
tof e j
tof k h
tof k g
tof l k
tof l f
tof l c
tof a b
tof l a
tof k e
tof k c
tof k b
tof a k
tof a j
tof a c
X a
tof a f
tof a d
tof c k
tof j i
tof c j
tof c h
X g
tof c e
X c
tof b i
tof b f
tof b k
tof a b
tof b l
tof c k
tof k a
tof a c
tof a h
tof j f
tof k j
tof j k
tof h l
tof l b
tof l h
tof l i
tof j a
tof j h
tof e c
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof k f
tof e k
tof e b
tof e d
tof e c
tof j i
tof j h
tof j f
tof k j
tof j a
tof l i
tof l h
tof l b
tof h l
tof k i
tof k h
tof k c
tof a l
tof a h
tof a c
tof a b
tof b e
tof e a
X e
tof c k
X g
X c
tof b l
tof b k
tof b g
tof b d
tof b i
tof a c
tof c d
tof c h
tof c i
tof l j
tof c l
tof a e
tof a f
tof a g
tof e k
tof k a
tof k c
tof k e
tof k f
tof k g
tof l i
tof k l
tof j k
tof l a
tof l b
tof l c
tof l d
tof l g
tof j l
tof l h
tof j b
tof j c
tof j d
tof j e
tof j f
tof f c
tof f k
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H f
Z c d f
H f
tof f l
tof f k
tof j f
tof k f
tof f c
tof l h
tof j l
tof j e
tof l j
tof j d
tof l i
tof l g
tof l c
tof l b
tof k l
tof l a
tof k j
tof l j
tof a l
tof k i
tof k g
tof k e
tof e k
tof a i
tof a h
tof a g
tof a f
tof a e
tof c d
tof a c
X d
tof e a
tof c h
tof b i
tof b h
tof b f
tof b a
X b
X g
tof a b
tof b a
tof b h
tof b i
tof a b
tof c a
tof c k
tof a e
tof a f
tof a g
tof a i
tof g k
tof k a
tof k b
tof k c
tof k d
tof k g
tof k h
tof k i
tof k l
tof l b
tof l c
tof l g
tof l h
tof f j
tof j b
tof j c
tof j d
tof j f
tof j g
tof j h
tof j k
tof j l
tof e d
tof e g
tof e h
tof e i
tof e j
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e j
tof e i
tof e h
tof e g
tof e d
tof l h
tof l g
tof j l
tof j f
tof j d
tof j c
tof j b
tof f j
tof k l
tof c j
tof l c
tof l b
tof k i
tof k h
tof k g
tof k d
tof k a
tof g k
tof a i
tof a g
tof a f
tof a e
tof c a
tof a b
tof b a
tof c l
tof c k
tof c i
tof c g
tof c f
X c
tof c e
tof b i
tof b h
X b
tof b a
tof b g
tof b j
tof a c
tof a b
tof c e
tof a g
tof c a
tof c h
tof c k
tof a d
tof a j
tof e k
tof k b
tof c d
tof k c
tof k e
tof k f
tof h l
tof l b
tof l h
tof l i
tof e j
tof j d
tof j e
tof j f
tof j h
tof j i
tof j k
tof j l
tof b d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof b d
tof l b
tof l i
tof l h
tof h l
tof j l
tof c d
tof j f
tof j e
tof e j
tof k f
tof k e
tof k b
tof c e
tof e k
tof a j
tof a g
tof a d
tof c a
tof a b
tof c g
tof a c
tof c a
tof c h
tof a c
tof b j
tof b g
tof a b
tof b i
tof b j
tof b a
X a
tof c e
tof c k
tof c l
tof a e
tof e k
tof k a
tof k b
tof k c
tof k d
tof k e
tof k h
tof k i
tof k j
tof k l
tof l a
tof l c
tof l d
tof l e
tof l g
tof l h
tof l k
tof e j
tof j b
tof j e
tof j h
tof j i
tof f c
tof f b
tof f g
tof f k
X f
X e
tof f h
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof k h
tof f k
tof f g
tof f b
tof f c
tof j i
tof j h
tof j e
tof j b
tof e j
tof l k
tof l g
tof k l
tof l e
tof c d
tof c a
tof l c
tof c l
tof k j
tof b i
tof k b
tof e k
tof b j
tof a b
X a
tof a e
tof c k
X c
X h
tof b c
tof c b
tof b a
tof b e
tof b g
tof b i
tof b k
tof e c
tof c b
tof c e
tof c g
tof c i
tof c j
tof c k
tof c l
tof e a
tof a b
tof a e
tof a g
tof a h
tof a i
tof a k
tof e k
tof k b
tof k c
tof k d
tof k e
tof k f
tof k g
tof k i
tof k j
tof k l
tof g l
tof l b
tof l g
tof l h
tof e j
tof j b
tof j d
tof j e
tof j f
tof g i
tof g k
tof j g
tof g j
tof g c
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H g
Z c d g
H g
tof j i
tof g j
tof g c
tof j g
tof j f
tof j e
tof j d
tof j b
tof k e
tof e j
tof l h
tof l g
tof l b
tof k g
tof g l
tof k i
tof k f
tof k d
tof c b
tof k c
tof c k
tof a e
tof e k
tof a i
tof a h
tof a g
tof a b
tof e a
tof c l
tof c j
tof c i
tof c g
tof c e
tof e c
tof b i
tof b d
tof b c
X d
X c
tof b j
tof a c
tof c a
tof c b
tof c e
tof c g
tof c k
tof e a
tof a b
tof a d
tof a e
tof a k
tof k a
tof a g
tof a h
tof a j
tof k c
tof k d
tof g l
tof l b
tof l g
tof l h
H j
Z d b j
H j
tof j a
tof j d
H d
Z c a d
H d
tof j a
H j
Z c d j
H j
tof j a
tof j b
tof j k
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X i
X f
X g
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j l
tof j a
H j
Z c d j
H j
tof j a
H d
Z c a d
H d
tof j d
tof k j
tof j a
tof a j
H j
Z d b j
H j
tof l h
tof l g
tof l b
tof g l
tof k h
tof k g
tof k d
tof k c
tof a k
tof a h
tof a g
tof a e
tof a d
tof a b
tof c a
tof b a
tof e a
tof b g
tof a b
tof b i
tof c j
tof c l
tof a d
tof a k
tof k a
tof a e
tof a h
tof a j
tof k b
tof k c
tof f l
tof l f
tof k f
tof l d
tof l g
tof l h
tof l j
tof j a
tof j b
tof j c
tof j d
tof j g
tof j i
tof j k
tof i j
tof j l
tof i d
tof i a
tof i b
H i
Z c d i
H i
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X g
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X i
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H i
Z c d i
H i
tof j l
tof j b
tof j a
tof i j
tof j i
tof i d
tof j k
tof j g
tof j c
tof l j
tof l h
tof l g
tof l f
tof l d
tof k f
tof f l
tof k j
tof a h
tof k a
tof c e
tof c b
tof k c
tof a k
tof a j
tof a i
tof a e
tof a b
X a
tof a d
tof c l
tof c k
tof c j
tof c i
tof c a
tof a c
tof b k
tof b j
tof b i
tof b h
tof c e
tof b c
X b
X h
tof a b
tof b a
tof b d
tof b f
tof b g
tof b l
tof c a
tof c d
tof c f
tof c h
tof c j
tof c k
tof e a
tof a b
tof a c
tof e d
tof a e
tof a g
tof a h
tof a j
tof a k
tof e k
tof k e
tof k a
tof a l
tof k b
tof k c
tof k g
tof j i
tof k j
tof h l
tof l b
tof l h
tof l i
tof j a
tof j b
tof j e
tof j g
tof j k
tof e c
tof e f
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X h
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof e l
tof e f
tof e d
tof e c
tof k j
tof j i
tof j g
tof j e
tof j d
tof j a
tof a j
tof l i
tof l h
tof l b
tof h l
tof k l
tof k c
tof k b
tof a e
tof e k
tof a l
tof a h
tof b g
tof a b
tof c d
tof a c
tof c e
tof e a
tof c k
tof c j
tof c h
tof c f
tof b l
tof b f
tof b d
tof c b
X c
tof b c
tof c a
tof a b
tof b d
tof b f
tof b i
tof b l
tof c b
tof c e
tof c h
tof c i
tof c k
tof e k
tof k b
tof k c
tof k e
tof k f
tof k g
tof g l
tof l b
tof l g
tof l h
tof j i
tof l j
tof j a
tof j c
tof j f
tof j g
tof j h
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
tof j i
tof j h
tof j g
tof j f
tof a c
tof j a
tof l j
tof l i
tof l h
tof l g
tof l b
tof g l
tof k g
tof k f
tof k e
tof c b
tof k c
tof c e
tof e k
tof a i
X h
tof a b
tof c i
tof c h
tof b l
tof b i
tof c f
X b
tof b c
tof b d
tof f b
tof k b
tof b f
tof b j
tof b l
tof c a
tof a c
tof a b
tof a d
tof a j
tof a l
tof k g
tof k h
tof k i
tof h l
tof l b
tof l h
tof l i
tof j c
tof j f
tof j g
tof j k
tof j l
tof e d
tof e b
tof e f
tof e g
tof e h
tof e i
tof e j
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e j
tof e i
tof e h
tof e g
tof e f
tof e b
tof a e
tof e d
tof j l
tof k g
tof k f
tof j k
tof j c
tof l i
tof l h
tof l b
tof k h
tof a h
tof h l
tof k j
tof k i
tof a k
tof k b
tof a j
tof a c
tof c k
X h
tof c f
tof c h
X c
tof c e
tof c a
tof b l
tof b f
tof f b
tof f j
tof a d
tof b a
tof b e
tof a c
tof a b
tof c a
tof c e
tof c f
tof c i
tof c k
tof a j
H k
Z b c k
H k
tof k a
tof k b
tof l k
tof k c
tof l d
tof l f
tof g h
tof l g
tof l j
tof j b
tof j c
tof j d
tof j h
tof j i
tof g d
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H g
Z c d g
H g
tof g h
tof g d
tof j i
tof j h
tof j d
tof j c
tof j b
tof l k
tof l j
tof l h
tof l g
tof l f
tof l d
tof l c
tof c b
tof k c
tof k a
H k
Z b c k
H k
tof b j
X b
X a
tof b d
tof a b
tof c i
tof c f
tof c e
tof c a
tof a c
tof b e
tof e b
tof b e
tof a e
X h
tof b d
tof b f
tof b k
tof a b
tof b l
tof c f
tof c k
tof k a
tof a c
tof c h
tof k b
tof k i
tof k l
tof h l
tof l b
tof l h
tof l i
H j
Z a k j
H j
tof j k
tof a l
tof j a
H a
Z c d a
H a
tof a l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof k b
tof a k
tof l k
tof k c
tof j b
tof c d
tof b d
H a
Z c d a
H a
tof j a
tof a l
H j
Z a k j
H j
tof l i
tof l h
tof l b
tof k h
tof h l
tof k i
tof k c
tof a b
tof k a
tof b k
tof a l
tof a h
tof a e
tof c d
tof a c
X a
tof e a
tof c k
tof c h
X c
tof c f
tof b l
tof b f
tof b e
tof b d
tof e b
tof b f
tof a g
tof b a
tof b j
tof a c
tof a b
tof a d
tof a e
tof a i
tof a l
tof c a
tof a c
tof e k
tof k b
tof k c
tof k e
tof k l
tof l k
tof k h
tof j l
tof f c
tof l f
tof f l
tof j b
tof j e
tof f k
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f l
tof f k
tof j f
tof f c
tof j l
tof j e
tof j b
tof k h
tof l k
tof l f
tof k l
tof a l
tof l c
tof c l
tof k e
tof k b
tof e k
tof a i
X d
tof c a
tof a d
tof a g
tof a e
tof a b
tof c i
tof a c
tof b j
tof b g
tof b f
tof g b
tof b a
X b
tof b g
tof b j
tof a b
tof e c
tof c e
tof c f
tof c j
tof a c
tof c k
tof c l
tof e k
tof k a
tof k b
tof k c
tof k d
tof k e
tof k h
tof k j
tof k l
tof l a
tof l b
tof l c
tof l e
tof l f
tof l g
tof l h
tof l i
tof j c
tof j a
tof j l
H j
Z c d j
H j
tof j a
tof j k
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
tof l a
tof j l
H j
Z c d j
H j
tof l c
tof j l
tof l i
tof l h
tof l g
tof l f
tof k l
tof l e
tof l b
tof k j
tof k h
tof k d
tof k a
tof a k
tof k c
tof c e
tof e k
tof a l
tof a j
tof a g
tof g a
tof c l
tof c j
tof c f
tof e c
tof b j
X e
X d
tof b c
tof b d
tof b i
tof a c
tof c a
tof c b
tof c d
tof c e
tof c h
tof c i
tof c k
tof e k
tof k e
tof k c
X e
tof c l
tof k g
tof k j
tof g l
tof l b
tof l g
tof l h
tof j i
tof l j
tof j l
tof j a
tof j b
tof j c
tof j g
tof j k
tof f g
tof f h
tof f i
tof f l
H f
Z c d f
H f
tof f g
tof f h
tof f i
tof f l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
tof f g
X e
X f
tof f h
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof l i
tof f l
H f
Z c d f
H f
tof f l
tof f h
tof f g
tof l g
tof j l
tof j c
tof j a
tof l j
tof l h
tof l b
tof k g
tof g l
tof k j
tof c e
tof k c
tof e k
tof c l
tof c i
tof c h
tof b d
X d
tof c b
tof c a
tof b i
tof b c
tof c h
X c
tof b j
tof c a
tof a d
tof c e
tof c g
tof c k
tof a b
tof a g
tof a j
tof e k
tof k b
tof k c
tof k e
tof k f
tof h l
tof l b
tof l h
tof l i
tof e j
tof j d
tof j e
tof j f
tof j h
tof j i
tof j k
tof j l
tof b d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof b d
tof l b
tof l i
tof l h
tof h l
tof j l
tof j f
tof j e
tof e j
tof k f
tof k e
tof k b
tof c e
tof e k
tof a j
tof a g
tof a d
tof a b
tof c h
tof c g
tof b c
tof c a
tof a j
tof a b
tof a g
tof c a
X a
tof b c
tof b d
tof b e
tof b f
tof b h
tof b i
tof c g
tof c i
tof c j
tof c k
tof a b
tof a d
tof a f
tof a g
tof a h
tof a i
tof a j
tof e k
tof k a
tof k c
tof k d
tof k e
tof k i
tof f l
tof l a
tof l b
tof l c
tof l d
tof l f
H j
Z a k j
H j
tof j b
tof j e
H j
Z c d j
H j
tof j a
tof j b
tof j e
tof j k
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j l
tof j e
tof j a
H j
Z c d j
H j
tof j e
tof j b
H j
Z a k j
H j
tof l f
tof l d
tof l c
tof l b
tof l a
tof f l
tof k i
tof k e
tof k d
tof k c
tof k a
tof e k
tof a j
tof a i
tof a h
tof b f
X b
X a
tof b d
tof a b
X f
tof c k
tof c j
tof c i
tof c a
tof a c
tof b a
tof a g
tof b j
tof b i
tof b h
tof b e
X e
X h
tof a b
tof b a
tof b d
tof b e
tof b g
tof a b
tof b k
tof g c
tof c g
tof c h
tof c k
tof k a
tof a e
tof a g
tof j f
tof k j
tof j k
tof h l
tof j l
tof l b
tof l h
tof l i
tof j a
tof e c
tof j e
tof j g
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof k f
tof e k
tof e b
tof e d
tof j e
tof e c
tof l i
tof l h
tof j l
tof j g
tof j f
tof k j
tof j a
tof l b
tof h l
tof a k
tof k g
tof k e
tof a b
tof c k
tof c h
tof c g
tof g c
tof c g
tof b c
tof b k
tof b e
tof b d
tof b a
tof a b
X a
tof c a
tof b a
tof b h
tof b i
tof b j
tof a c
tof c d
tof c e
tof c i
tof c j
tof c l
tof a g
tof e k
tof k c
tof k e
tof k f
tof k l
tof l k
tof k j
tof j l
tof l b
tof l c
tof j e
tof j f
tof f c
tof f k
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f l
tof f k
tof j f
tof f c
tof j l
tof j e
tof l j
tof j b
tof k c
tof l k
tof k l
tof k j
tof k f
tof k e
tof e k
tof a l
X d
tof a c
tof c a
tof a j
tof a d
tof a i
tof a g
tof a e
tof c l
tof a c
tof b j
tof b i
tof b h
tof b a
X b
tof a b
tof b a
tof b f
tof b h
tof b i
tof b j
tof a c
tof c a
tof c e
tof c g
tof a c
tof c j
tof c k
tof e c
tof c l
tof a f
tof k a
tof a g
tof k b
tof k d
tof e d
tof e i
tof l e
tof l k
tof f j
tof j b
tof j d
tof j f
tof j g
tof j i
tof e b
tof e f
tof e j
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof j i
tof j f
tof j b
tof j d
tof e j
tof l e
tof e c
tof j g
tof f j
tof l k
tof l i
tof l d
tof e l
tof d g
tof b d
tof d g
tof k b
tof k a
tof a l
tof a k
tof a j
tof a g
tof a f
tof a c
tof c l
tof c k
tof c j
tof c a
X c
tof c g
tof a e
tof a c
tof e a
tof a h
tof a d
X a
tof a k
tof c a
tof j i
tof b j
tof b h
tof c b
tof b l
tof a c
tof a e
tof a f
tof a g
tof e k
tof k a
tof k b
tof k c
tof k d
tof k e
tof k g
tof k j
tof k l
tof h l
tof l b
tof l h
tof l i
tof j a
tof j b
tof j d
tof j e
tof g k
tof j g
tof g j
tof g c
tof g a
tof g b
tof g h
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H g
Z c d g
H g
tof g j
tof g h
tof g b
tof g a
tof g c
tof j i
tof j g
tof j e
tof j d
tof k j
tof j b
tof j a
tof l i
tof l h
tof l b
tof h l
tof k l
tof k i
tof k g
tof c d
tof c e
tof a c
tof k c
tof e k
tof a h
tof a g
tof a f
tof e a
tof c h
tof b l
tof c b
X h
tof b g
tof b f
tof b d
tof b a
tof a b
X a
tof b f
tof f c
X f
tof c f
tof b a
tof b e
tof b g
tof b i
tof b j
tof c d
tof c g
tof c i
tof c j
tof f a
tof a c
tof a d
tof a f
tof a g
tof a i
tof a j
tof e k
tof k a
tof k d
tof k e
tof k f
tof k i
tof f l
tof l a
tof l b
tof l c
tof l f
tof l g
tof l j
tof l k
tof e j
tof j d
tof j g
tof j i
tof j l
tof j k
H j
Z c d j
H j
tof j b
tof j e
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l c
tof k c
tof j d
tof b d
tof c d
tof j e
H j
Z c d j
H j
tof j l
tof j i
tof j g
tof j d
tof e j
tof l j
tof l g
tof l f
tof l c
tof l b
tof l a
tof f l
tof k i
tof k f
tof k e
tof a d
tof k a
tof e k
tof j i
tof a j
tof a g
tof a f
tof a c
tof f a
tof c j
tof c g
tof c f
tof c d
tof f c
tof b j
tof b g
tof b f
tof b e
tof b a
X d
X b
tof a b
tof b a
tof b e
tof b g
tof b j
tof a c
tof a b
tof c a
tof c e
tof c f
tof c i
tof c k
tof a g
tof a j
tof k b
tof k c
tof k e
tof j k
tof k f
tof e l
tof l b
tof l d
tof l e
tof l f
tof l g
tof j b
tof j e
tof e c
tof e d
tof e a
tof e f
tof e i
tof e j
tof e k
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof j i
tof j f
tof e j
tof e a
tof e d
tof e c
tof j e
tof j b
tof l g
tof l f
tof l e
tof l d
tof l b
tof e l
tof k f
tof k e
tof c b
tof k c
tof c k
tof a j
tof a b
tof c f
tof b g
tof b e
X d
X e
X f
tof b d
tof b f
tof c b
tof c g
tof a c
tof c l
tof a b
tof a e
tof e k
tof k a
tof k b
tof k c
tof k d
tof k e
tof k l
tof l k
tof k g
tof l a
tof l c
tof l d
tof j l
tof l f
tof f l
tof j b
tof j c
tof j e
tof f c
tof f k
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f l
tof f k
tof j f
tof f c
tof j l
tof j e
tof j b
tof k g
tof l k
tof l f
tof k l
tof l d
tof l c
tof l a
tof a l
tof k e
tof k b
tof e k
tof a i
tof a g
tof c e
tof a c
tof c a
tof a b
tof c l
tof c g
tof a c
X g
tof b a
tof a i
tof b j
tof b f
tof b d
tof a b
tof g b
tof b d
tof b g
X b
tof b h
tof b k
tof b l
tof c b
tof c d
tof c e
tof c g
tof c h
tof c j
tof e a
tof a b
tof a d
tof a e
tof a f
tof a i
tof a k
tof a l
tof e k
tof k b
tof k c
tof k e
tof k i
tof k j
tof k l
tof l b
tof e d
tof l e
tof l f
tof l g
tof l h
tof l i
tof j a
tof e g
tof j e
tof j h
tof j k
tof j l
tof e c
tof e f
tof e i
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof e i
tof e g
tof e f
tof e d
tof e c
tof l h
tof l g
tof l e
tof l d
tof j l
tof j a
tof l i
tof l f
tof k l
tof a l
tof l b
tof k j
tof k i
tof k e
tof k c
tof a e
tof e k
tof a i
tof a f
tof a d
tof e a
tof c j
tof c i
tof c h
tof c g
tof c e
tof b d
tof c b
X c
tof b l
tof b k
tof b g
tof g b
tof g h
tof b g
X e
tof c a
tof b c
tof b i
tof b j
tof c b
tof c f
tof c g
tof c k
tof k c
tof c h
tof a b
tof a d
tof a g
tof a h
tof a i
tof a j
tof k a
tof k b
tof k i
tof k l
tof h l
tof l b
tof l h
tof l i
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof e c
tof e d
tof e b
tof e f
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e k
tof e f
tof e b
tof e d
tof e c
tof j l
tof j a
H j
Z a k j
H j
tof l i
tof l h
tof l b
tof k h
tof h l
tof a i
tof k a
tof c b
tof k c
tof a j
tof a h
tof a g
tof a d
tof a b
tof c k
tof c h
tof c g
tof c f
X c
tof c i
tof b c
tof b g
tof c b
tof f h
tof c f
tof c j
tof c k
tof c l
tof e a
tof a b
tof a c
tof a e
tof k f
tof a k
tof j i
tof a j
tof a l
tof k c
tof e l
tof l e
tof l d
tof k l
X e
tof l b
tof l c
tof f g
tof l f
tof j k
tof l j
tof j a
tof j c
tof j d
tof j h
tof f c
tof f b
tof f k
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l c
tof k c
tof j b
tof c d
tof b d
H f
Z c d f
H f
tof f k
tof f h
tof f g
tof f b
tof f c
tof j i
tof j h
tof j d
tof j c
tof j a
tof l j
tof l i
tof l h
tof l g
tof l f
tof l e
tof l d
tof l c
tof l b
tof e l
tof k h
tof k f
tof k e
tof k d
tof a k
tof k c
tof c k
tof a l
tof a j
tof a i
tof a h
tof a f
tof a e
X e
tof a b
tof c e
tof e a
tof b h
tof c b
tof b j
tof a b
tof b d
X b
tof b a
tof b e
tof b k
tof k b
tof b g
tof a d
tof k c
tof c a
tof k h
tof k j
tof g l
tof l b
tof l g
tof l h
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof e c
tof e b
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof k b
tof k c
tof e k
tof c e
tof j l
tof k a
tof j a
H j
Z a k j
H j
tof l h
tof l g
tof l b
tof g l
tof k h
tof k g
X d
tof c a
tof a d
tof c l
tof c j
tof c i
tof c f
tof b d
X c
tof b c
tof b i
tof b j
tof c a
tof c b
tof c f
tof c g
tof c k
tof a d
tof e k
tof k a
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof k j
tof k l
tof g l
tof l b
tof l g
tof l h
tof e j
tof j a
tof j d
tof j f
tof j g
tof j h
tof j b
H j
Z c d j
H j
tof j b
tof j e
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j e
H j
Z c d j
H j
tof j b
tof j h
tof j g
tof j f
tof j d
tof j a
tof k e
tof e j
tof l h
tof l g
tof l b
tof k g
tof g l
tof k h
tof k f
tof k d
tof k c
tof k a
tof e k
tof a d
tof c k
tof c g
tof c f
tof b a
tof c b
X c
tof b c
tof b k
tof b j
tof b i
tof b g
tof b e
tof a b
X a
tof e b
tof b e
tof b j
tof b k
tof a e
tof c a
tof c f
tof c i
tof c l
tof k b
tof a k
tof j d
tof a j
tof k d
tof k e
tof k f
tof k i
tof e l
tof l b
tof l e
tof l g
tof l k
tof j a
tof j c
tof j g
tof j h
tof j l
tof a b
tof a g
tof a h
H a
Z c d a
H a
tof a b
tof a g
tof a h
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
tof a h
tof a g
tof a b
H a
Z c d a
H a
tof a h
tof a g
tof a b
tof j l
tof j h
tof j g
tof j d
tof j c
tof j a
tof l k
tof l g
tof l e
tof l b
tof e l
tof k i
tof k f
tof k e
tof k d
tof a k
tof k b
tof b k
tof a j
tof a e
X a
tof a d
tof c l
tof c i
tof c f
tof c e
tof c a
tof b j
tof e c
X e
tof b e
tof e b
tof b a
tof b d
tof b f
tof b g
tof b h
tof b i
tof b l
tof f c
tof c b
tof c f
tof c g
tof c h
tof c j
tof c k
tof c l
tof a c
tof a i
tof a j
tof a k
tof f k
tof k b
tof k d
tof k f
tof k g
tof k h
tof k i
tof h l
tof l b
tof l h
tof l i
tof f j
tof j b
tof j c
tof j d
tof j f
tof j g
tof j h
tof j i
tof j k
tof e f
tof e h
tof e l
H e
Z c d e
H e
tof e f
tof e h
tof e l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
tof e f
X e
X h
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof l h
tof e l
H e
Z c d e
H e
tof e l
tof e f
tof j i
tof j h
tof j g
tof j f
tof j d
tof j c
tof f j
tof l i
tof l b
tof h l
tof k i
tof k h
tof k g
tof k f
tof k d
tof k b
tof f k
tof a k
tof a j
tof a i
tof a c
tof c l
tof c k
tof c j
tof c h
tof c f
tof b g
tof c b
X c
tof c i
tof b c
tof b a
X a
tof c b
tof c f
tof c h
tof c k
tof a b
tof a d
tof a f
tof a h
tof a l
tof k c
tof k d
tof k f
tof k g
tof k i
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof e c
tof e d
X g
X e
tof e h
tof e f
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e h
tof e f
tof e c
tof j l
tof j a
H j
Z a k j
H j
tof l j
tof l i
tof l h
tof l g
tof l b
tof g l
tof k i
tof k g
tof k f
tof k d
tof k c
tof a l
tof a h
tof a f
tof a d
tof a b
tof c k
tof c i
tof c h
tof c f
tof c b
tof f c
tof b d
X d
X c
tof b c
tof b i
tof b j
tof a c
tof c a
tof c b
tof c f
tof c h
tof k j
tof c k
tof c l
tof f a
tof a b
tof a d
tof a f
tof a h
tof a i
tof a j
tof a l
tof k a
tof k b
tof k c
tof k d
tof k f
tof k g
tof k h
tof h l
tof l b
tof l h
tof l i
tof j a
tof j b
tof j d
tof j f
tof j g
tof j h
tof j k
tof e c
tof e b
tof e f
tof e g
tof e i
tof e j
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e j
tof e i
tof e g
tof e f
tof e b
tof e d
tof e c
tof j k
tof j h
tof j g
tof j f
tof j d
tof j b
tof k j
tof j a
tof a j
tof l i
tof l h
tof l b
tof h l
tof k h
tof k g
tof k f
tof k d
tof c b
tof k c
tof c k
tof a l
tof a i
tof a h
tof a f
tof b d
tof a b
tof c f
tof f a
tof c l
tof c j
tof c h
tof a c
tof c a
tof b c
X c
tof b l
tof b j
tof b f
tof b e
tof b k
tof c b
tof c e
tof c f
tof c i
tof c j
tof e a
tof a c
tof a d
tof a e
tof a f
tof a h
tof a j
tof a k
tof e k
tof k a
tof k d
tof k e
tof k f
tof k h
tof k l
tof e l
tof l b
tof l c
tof l d
tof l e
tof l f
tof l g
tof l h
tof l j
tof j l
tof l k
tof j a
tof j b
tof j g
tof j i
tof a e
tof a f
tof a i
tof a l
H a
Z c d a
H a
tof a e
tof a f
tof a i
tof a l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof k b
tof a k
tof l k
tof k c
tof j d
tof b d
tof c d
tof a i
tof a f
tof a e
H a
Z c d a
H a
tof a l
tof a i
tof a f
tof a e
tof j l
tof j i
tof j g
tof j a
tof l k
tof l j
tof l h
tof l g
tof l f
tof l e
tof l d
tof l c
tof l b
tof k e
tof e l
tof k a
tof a k
tof k h
tof k f
tof k d
tof e k
tof a j
tof c e
tof a c
X e
tof e a
tof c j
tof c i
tof b f
tof c b
X c
tof b c
tof b a
X d
tof b l
tof c d
tof c e
tof k i
tof c k
tof e a
tof a b
tof a e
tof a f
tof a h
tof k l
tof a k
tof k a
tof k c
tof k d
tof k h
tof h l
tof l b
tof l h
tof l i
H j
Z d b j
H j
tof j a
tof j d
H d
Z c a d
H d
tof j a
H j
Z c d j
H j
tof j a
tof j b
tof j k
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j l
tof j a
H j
Z c d j
H j
tof j a
H d
Z c a d
H d
tof j d
tof j a
H j
Z d b j
H j
tof l i
tof l h
tof l b
tof k h
tof h l
tof a i
tof k a
tof c d
tof k c
tof a l
tof a k
tof a h
tof a f
tof b e
tof a b
X a
tof e a
tof c k
tof c i
tof c e
tof b l
tof b d
tof b c
X c
X f
tof c b
tof b g
tof a e
tof a i
tof a j
tof a k
tof a l
tof c a
tof a c
tof a b
tof a g
tof k a
tof k b
tof k c
tof j k
tof k d
tof e l
tof l e
tof k e
tof l b
tof l f
tof j a
tof j b
tof f c
tof f k
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H f
Z c d f
H f
tof f l
tof k c
tof f k
tof j e
tof j d
tof j a
tof l f
tof l e
tof l b
tof k e
tof e l
tof k d
tof k a
tof a k
tof k b
tof a l
tof a j
tof a i
tof a e
tof a c
tof b a
tof c b
tof b k
tof b i
tof b h
tof b d
tof a b
tof b a
X a
X b
tof a d
tof b h
tof b i
tof b k
tof c d
tof c f
tof c h
tof a e
tof e k
tof k b
tof k c
tof k d
tof k e
tof k f
tof k g
tof k i
tof g l
tof l b
tof l c
tof l d
tof l g
tof l h
tof l i
tof l k
tof j d
tof e k
tof j e
tof e c
tof e a
tof e f
tof e g
tof e h
tof e i
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof k i
tof e k
tof e h
tof e g
tof a f
tof e a
tof e c
tof j e
tof j d
tof l k
tof l h
tof l g
tof c d
tof l c
tof l b
tof g l
tof k g
tof k f
tof k e
tof k c
tof k b
tof e k
X g
tof a e
tof c l
tof c k
tof c j
tof c i
tof c h
tof c f
X c
tof c e
tof b k
tof b i
tof b h
tof b a
tof a b
tof c b
tof b c
tof b i
tof b j
tof f c
tof c d
tof c f
tof c g
tof c i
tof c j
tof a b
tof a c
tof a f
tof e k
tof k a
tof k b
tof k c
tof k e
tof k f
tof k g
tof k i
tof k j
tof k l
tof g l
tof l b
tof l g
tof l h
tof e j
tof j a
tof j f
tof j g
tof j i
H j
Z c d j
H j
tof j b
tof j e
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j e
H j
Z c d j
H j
tof j i
tof j g
tof j f
tof j a
tof e j
tof l h
tof l g
tof l b
tof k g
tof g l
tof k j
tof c f
tof k c
tof a b
tof k a
tof c g
tof a c
X a
tof c j
tof c i
tof c d
tof f c
tof b j
tof b i
tof b c
tof c b
X c
tof a b
tof b a
tof b g
tof b j
tof j b
tof j d
tof j f
tof c j
tof c i
tof c l
tof a d
tof k a
tof k b
tof k h
tof e l
tof l d
tof l e
tof l f
tof l g
tof j c
tof j e
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof b d
tof c d
tof j f
tof j e
tof j c
tof l g
tof l f
tof l e
tof l d
tof e l
tof k i
tof k h
tof k e
tof k b
tof k a
tof e k
tof a d
tof c l
tof c j
tof c i
tof c f
tof c b
X c
tof b j
X b
tof b a
tof b g
tof a b
X e
tof c b
tof b c
tof b e
tof b i
tof c b
tof b k
tof c a
tof c f
tof c g
tof c j
tof e a
tof a c
tof a d
tof a e
tof a f
tof a g
tof a i
tof a j
tof e k
tof k a
tof k c
tof k e
tof k f
tof k h
tof k l
tof g l
tof l b
tof l g
tof l h
tof j a
tof e b
tof j e
tof j f
tof j g
tof j k
tof j l
tof e d
tof e g
tof e h
tof e i
tof e j
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e j
tof e i
tof e h
tof e g
tof e b
tof e d
tof l g
tof j l
tof j k
tof j f
tof j e
tof j b
tof j a
tof l h
tof l b
tof g l
tof k l
tof k h
tof k f
tof k e
tof a c
tof k a
tof c k
tof e k
tof a j
tof a i
tof a g
tof a f
tof a e
tof a d
tof e a
tof c j
tof c g
tof c f
tof b d
tof c b
tof c a
tof b k
tof b i
tof b e
tof a b
X a
tof b a
tof a c
tof b d
tof c b
tof b e
tof b g
tof b k
tof k b
tof k f
tof k i
tof c k
tof c l
tof a d
tof k a
tof k h
tof k j
tof f l
tof l a
tof l b
tof l f
tof l h
tof l i
tof l j
tof l k
H j
Z b c j
H j
tof j a
tof j b
tof j c
tof j k
tof j l
tof a e
tof a g
tof a h
tof a l
H a
Z c d a
H a
tof a e
tof a g
tof a h
tof a l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof k b
tof a k
tof l k
tof k c
tof j d
tof b d
tof c d
tof a h
tof a g
tof a e
H a
Z c d a
H a
tof a l
tof a h
tof a g
tof a e
tof j l
tof j c
tof l j
tof j a
H j
Z b c j
H j
tof k i
tof k h
tof l k
tof l f
tof l b
tof f l
tof k j
tof c k
tof k f
tof k b
tof k a
X a
tof a d
tof c l
tof c i
tof b k
tof b g
tof b e
tof a b
X c
tof c d
tof b c
tof b a
tof a b
tof c a
X e
tof b e
tof b f
tof b k
tof c e
tof c g
tof k h
tof c k
tof c l
tof f a
tof a b
tof a c
tof f d
tof f g
tof f h
tof a f
tof a l
tof k a
tof k b
tof k d
tof k e
tof k g
tof j i
tof k j
tof e l
tof l b
tof l d
tof l e
tof j c
tof f b
tof f j
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f j
tof f h
tof f g
tof f b
tof f d
tof j i
tof j c
tof l e
tof l d
tof l b
tof e l
tof k j
tof k i
tof k h
tof k g
tof k e
tof k d
tof a b
tof k a
tof b k
tof a l
tof a h
tof a g
tof a f
tof c d
tof a c
X d
tof c a
tof b f
tof f a
tof c l
tof c k
tof c h
tof c g
tof c e
tof a c
tof b d
tof c e
X b
tof c b
tof b e
X g
tof b d
tof b f
tof b i
tof a b
tof b c
tof b l
tof c d
tof a f
tof c a
tof c g
tof c j
tof a i
tof e k
tof k b
tof k c
tof j k
tof k e
tof g l
tof l b
tof l g
tof l h
tof j b
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l d
tof b d
tof j d
tof j e
tof l h
tof l g
tof g l
tof k e
tof e k
tof a l
tof a i
X f
tof c a
tof b f
tof a b
tof c l
tof c j
tof c g
tof a c
tof b l
tof b i
tof b d
tof b c
tof c b
X a
X c
tof a d
tof a b
tof b a
tof b f
tof b g
tof b l
tof g c
tof c g
tof c l
tof l c
tof c i
tof h k
tof k a
tof k b
tof k c
tof k h
tof k j
tof l e
tof l f
tof l h
tof f j
tof b f
tof j b
tof j c
tof j d
tof j g
tof j k
tof b e
tof b g
tof b h
tof b i
tof b l
H b
Z c d b
H b
tof b e
tof b f
tof b g
tof b h
tof b i
tof b l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
tof l i
tof l h
tof b l
tof b g
tof b f
tof b e
H b
Z c d b
H b
tof b l
tof b g
tof b f
tof b e
tof j g
tof j f
tof j d
tof j c
tof j b
tof f j
tof l f
tof l e
tof l c
tof k j
tof k h
tof k c
tof b a
tof k b
tof h k
X d
tof a d
tof c l
tof c i
tof c g
tof g c
tof b l
tof b g
tof b f
tof a b
tof b a
tof b c
X b
tof b d
tof a b
tof b g
tof b h
tof b k
tof f c
tof c d
tof c f
tof c g
tof e k
tof c k
tof k c
tof c h
tof e a
tof k e
tof k b
tof j i
tof k j
tof h l
tof l a
tof l c
tof l d
tof l h
tof l j
tof l k
tof j c
tof e d
tof e f
tof e g
tof e j
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e j
tof e g
tof e f
tof e a
tof e d
tof j i
tof l j
tof j c
tof k i
tof l k
tof l h
tof l d
tof l a
tof h l
tof k j
tof k h
tof k e
tof k c
tof a b
tof k a
tof e k
tof a h
tof c k
tof c h
tof c g
tof c f
tof c d
tof f c
tof b g
tof b d
X d
X e
tof b e
tof k b
tof b f
tof e c
tof c e
tof c f
tof c g
tof c h
tof c l
tof l c
tof l b
tof l d
tof a l
tof k a
tof k d
tof j i
tof k j
tof l f
tof l g
tof l h
tof j c
tof e c
tof e d
tof e k
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof l c
tof e l
tof k d
tof e k
tof j i
tof j c
tof l h
tof l g
tof l f
tof l d
tof l b
tof k j
tof k i
tof k f
tof k a
tof a k
tof k b
tof b k
tof a l
tof a g
tof a d
tof a c
tof c l
tof c h
tof c g
tof c f
tof c e
tof b e
tof e c
tof b h
tof a b
X a
tof b a
tof a b
tof a f
X d
X g
tof b c
tof b e
tof b h
tof b k
tof a b
tof a d
tof c a
tof c f
tof c g
tof c i
tof c l
tof a e
tof a h
tof a k
tof g k
tof k a
tof k g
tof k h
tof k i
tof k l
tof f l
tof l f
tof l g
tof l h
tof j l
tof l k
tof j a
tof j b
tof j d
tof j f
tof e j
tof j g
tof j h
tof e c
tof e d
tof e a
tof e b
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof j h
tof j g
tof j a
tof j d
tof e j
tof e c
tof l f
tof j l
tof k h
tof k g
tof l k
tof k l
tof c f
tof f l
tof k i
tof k a
tof g k
tof a k
tof a h
tof a e
tof c a
tof a d
tof a b
tof b a
tof c i
tof c g
tof b k
tof b h
X e
tof e c
tof b e
tof a b
X g
tof b a
tof b c
tof b g
tof b h
tof b i
tof b j
tof c e
tof c f
tof c h
tof c i
tof c j
tof e a
tof a b
tof a c
tof a d
tof a e
tof a f
tof a g
tof k a
tof k b
tof k d
tof e j
tof k e
tof e a
tof e c
tof e d
tof j e
tof k l
tof g l
tof l b
tof j l
tof l g
tof l h
tof j k
tof e b
tof e f
tof e g
tof e i
tof e j
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof j l
tof e j
tof e i
tof e g
tof e f
tof e b
tof j e
tof e a
tof e d
tof e c
tof j k
tof j h
tof j g
tof k e
tof e j
tof l h
tof l g
tof l b
tof g l
tof k l
tof k d
tof a b
tof k a
tof a g
tof a f
tof a e
tof a d
tof a c
tof e a
tof c j
tof c i
tof c h
tof c f
tof c e
tof e c
tof b i
tof b g
tof c a
X c
tof b c
tof a b
tof c e
tof c f
tof c h
tof c i
tof c l
tof a d
tof a h
tof a j
tof e k
tof k b
tof e l
tof l e
tof l d
tof k l
X e
tof l f
tof l h
tof l i
tof l j
tof f j
tof j d
tof j f
tof j i
tof j l
tof j a
tof j g
H j
Z c d j
H j
tof j a
tof j b
tof j g
tof j h
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j h
tof j g
tof j a
H j
Z c d j
H j
tof j g
tof j a
tof l i
tof l f
tof l d
tof j l
tof f j
tof l h
tof l e
tof e l
tof k e
tof k d
tof k b
tof e k
tof a j
tof a h
tof a b
X a
tof b a
tof a d
tof c l
tof c i
tof c h
tof c f
tof c a
X c
tof c j
tof c g
tof b c
tof b i
tof c b
tof b k
tof c f
tof f a
tof a c
tof a f
tof a h
tof a i
tof k a
tof a j
tof k c
tof k d
tof k f
tof k h
tof k l
tof g l
tof l b
tof l g
tof l h
tof f j
tof j a
tof j b
tof j d
tof j f
tof j g
tof j k
tof j l
tof e c
tof e b
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof e k
tof e b
tof e c
tof l g
tof j l
tof j f
tof j d
tof j a
tof k f
tof f j
tof l h
tof l b
tof g l
tof k l
tof k h
tof k d
tof a c
tof k a
tof c k
tof a j
tof a i
tof a h
tof a f
tof f a
tof c j
tof c g
tof c f
tof c e
tof c b
X c
tof c i
tof b c
tof b g
tof b a
X a
tof c b
tof c e
tof c f
tof c k
tof c l
tof a b
tof a e
tof a h
tof a k
tof b d
tof k f
tof k j
tof f l
tof j l
tof l b
tof l f
tof l g
tof l h
tof l i
tof l k
tof j e
tof c d
tof j k
tof k c
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof c d
tof k c
tof b d
tof l i
tof l h
tof l g
tof l f
tof j l
tof j e
tof k b
tof l k
tof f l
tof k j
tof c k
tof k f
tof a b
X a
tof a k
tof a h
tof a e
tof c l
tof c i
X c
tof c b
tof c e
tof b c
tof b a
tof b f
tof b g
tof j i
tof b j
tof f c
tof c b
tof c f
tof c g
tof c h
tof c j
tof a c
tof c l
tof a k
tof k a
tof a e
tof k b
tof k d
tof k g
tof k i
tof e l
tof e b
tof e d
tof l e
tof e l
tof e j
tof j c
tof e f
tof e g
tof e h
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof e k
tof e j
tof e h
tof e g
tof e f
tof e b
tof e d
tof e c
tof j i
tof j c
tof l e
tof l d
tof l b
tof e l
tof k i
tof k g
tof k e
tof k d
tof k b
tof k a
tof a l
tof a k
tof a c
tof c l
X a
tof c j
tof c i
tof c h
tof c g
tof b f
tof c b
tof f c
tof b k
tof b j
tof b i
tof b e
X b
tof b c
tof b f
tof b i
tof b l
tof a d
tof c a
tof c h
tof c i
tof a c
tof k c
tof c j
tof a b
tof a f
tof a g
tof a l
tof k a
tof k b
tof k g
tof k h
tof g l
tof l b
tof l g
tof l h
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof e c
tof e b
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof k b
tof k c
tof e k
tof j l
tof j a
H j
Z a k j
H j
tof a j
tof k a
tof l h
tof l g
tof l b
tof g l
tof k h
tof k g
tof a l
tof a g
tof a f
tof c d
tof c e
tof a c
tof a b
tof c j
tof c i
tof c h
X c
tof c a
tof e c
tof b i
tof b g
tof b c
tof b a
X f
tof c d
tof c e
tof c h
tof c i
tof c l
tof a b
tof a f
tof a h
tof a l
tof g k
tof k b
tof k d
tof k g
tof k j
tof k l
tof f l
tof l b
tof l c
tof l f
tof l g
tof l h
tof l k
tof j c
tof j f
tof j l
tof j b
tof j e
tof j h
tof j i
H j
Z c d j
H j
tof j a
tof j b
tof j e
tof j g
tof j h
tof j i
tof j k
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof j i
tof j h
tof j g
tof j e
tof j a
H j
Z c d j
H j
tof j i
tof j h
tof j e
tof l b
tof l f
tof l c
tof j l
tof l k
tof l h
tof l g
tof f l
tof k l
tof k j
tof k g
tof k d
tof k b
tof g k
tof a l
tof b f
tof b h
tof a b
X a
tof c l
tof c i
tof c h
tof c e
tof c d
X c
tof e c
tof b l
tof a c
X b
tof b a
tof f a
tof a f
tof c f
tof b i
tof b j
tof b k
tof c b
tof c j
tof j c
tof c i
tof a c
tof a k
tof e k
tof k b
tof k c
tof k d
tof k e
tof k g
tof k h
tof k i
tof g l
tof l c
tof l g
tof l h
tof l i
tof l k
tof f c
tof f j
tof f k
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f k
tof j c
tof f j
tof j i
tof k i
tof k h
tof l k
tof l g
tof l c
tof g l
tof k g
tof k e
tof k d
tof k c
tof k b
tof e k
tof a k
tof a f
tof a c
tof f a
tof b f
tof c b
tof b d
X d
X e
tof b e
tof c b
tof b g
tof c k
tof c l
tof e a
tof a c
tof a d
tof a e
tof a l
tof l a
tof k a
tof a f
tof k b
tof k d
tof k h
tof k i
tof l b
tof l c
tof j c
tof j b
tof j e
tof j g
tof j h
H j
Z c d j
H j
tof j b
tof j e
tof j g
tof j h
tof j i
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof c d
tof k d
tof b d
tof j i
tof j h
tof j g
tof j e
tof j b
H j
Z c d j
H j
tof j h
tof j g
tof j e
tof j b
tof j c
tof l f
tof l c
tof l b
tof l a
tof k i
tof k h
tof k f
tof k d
tof k a
tof a l
tof a f
tof a e
tof a d
tof a c
tof e a
tof c l
tof c k
tof c j
tof c i
tof a g
tof b a
tof c b
tof a c
tof b k
tof b j
tof b i
tof b e
X b
tof b f
X d
tof a i
tof a j
tof a k
tof a b
tof b a
tof c e
tof b c
tof c d
tof f k
X f
tof k f
tof c i
tof c f
tof k i
tof c l
tof a b
tof a d
tof a e
tof k a
tof k g
tof e k
tof k l
tof e f
tof e h
tof l e
tof j c
tof j k
tof e c
tof e g
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l c
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e k
tof e h
tof e g
tof e f
tof e c
tof j c
tof l h
tof l f
tof l e
tof e l
tof k l
tof k i
tof k g
tof k f
tof k a
tof f k
tof a k
tof a j
tof a i
tof a g
tof a e
tof a d
tof a b
tof c l
tof c k
tof c i
tof c f
tof c d
tof b c
tof c d
tof c e
X e
tof b k
tof b j
tof b i
tof b g
tof b a
tof a b
tof c a
tof b f
X b
tof c g
tof b c
X g
tof b h
tof b j
tof b k
tof c k
tof a b
tof a f
tof a g
tof a h
tof a j
tof a k
tof k a
tof k b
tof k d
tof k e
tof k f
tof f k
tof k h
tof e l
tof l b
tof l d
tof l e
tof f j
tof j c
tof j i
tof f d
tof f a
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f k
tof f j
tof f i
tof f h
tof f a
tof f d
tof f c
tof j c
tof l e
tof l d
tof l b
tof e l
tof k h
tof k f
X d
tof k e
X e
tof a b
tof k a
tof a g
tof a f
tof c k
tof b g
tof b f
tof b d
tof b e
tof c e
tof c l
tof a b
tof e d
tof a e
tof k a
tof k b
tof k f
tof k g
tof k h
tof e l
tof l b
tof l e
tof e l
tof e j
tof j c
tof e f
tof e i
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof j i
tof e j
tof e f
tof e d
tof e c
tof j c
tof l e
tof l d
tof l b
tof c e
tof e l
tof k h
tof k g
tof k f
tof k a
tof a k
tof k d
X d
tof k b
tof b k
tof a j
tof a h
tof a e
tof c g
tof b c
tof c a
tof b j
tof b h
tof b e
X b
X g
tof a b
tof a e
tof c a
tof b c
tof b f
tof b h
tof b j
tof b k
tof c d
tof c g
tof c i
tof c k
tof c l
tof a b
tof a d
tof a f
tof a h
tof a j
tof a k
tof e k
tof k a
tof k e
tof k f
tof k i
tof k l
tof e l
tof l d
tof l e
tof l h
tof l k
tof e j
tof j a
tof j b
tof j c
tof j e
tof j f
tof g l
tof j g
tof g c
tof g d
tof g a
tof g k
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H g
Z c d g
H g
tof g l
tof g k
tof g a
tof g d
tof j g
tof g c
tof j l
tof j f
tof j e
tof j b
tof j a
tof e j
tof l k
tof l h
tof l e
tof l d
tof k e
tof e l
tof k i
tof k a
tof a k
tof k f
tof e k
tof a j
tof a h
tof a e
X d
tof a b
tof b d
tof c l
tof c k
tof c i
tof c g
tof c a
X c
tof a c
tof c e
tof b h
tof b c
tof a k
tof k a
tof a i
X i
tof c a
tof a c
tof b g
tof c b
tof k f
tof k j
tof e l
tof l b
tof l e
tof l f
tof f j
tof j a
tof j b
tof j f
tof j i
tof j k
tof i c
tof i a
tof i b
tof i j
tof i l
H i
Z c d i
H i
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X i
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H i
Z c d i
H i
tof i l
tof j b
tof j a
tof i j
tof i c
tof k i
tof k f
tof j k
tof f j
tof l f
tof l e
tof l b
tof e l
tof k c
tof k a
tof a k
tof k b
tof a i
tof a e
tof c d
tof a c
X d
tof c a
tof c k
tof c i
tof b e
tof c b
tof a c
tof b k
tof b j
tof b g
tof b f
tof b d
tof b a
tof a b
tof c b
tof b h
X b
tof b c
tof b d
tof b e
tof k i
tof b k
tof b l
tof e c
tof c b
tof c d
tof c e
tof c h
tof c i
tof h a
tof a b
tof a c
tof a d
tof a h
tof a i
tof k a
tof k c
tof k d
tof e l
tof l a
tof l b
tof l e
tof j c
tof j i
tof e c
tof e d
tof e i
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof e i
tof e d
tof e c
tof j i
tof j c
tof l e
tof l b
tof l a
tof e l
tof k i
tof k d
tof a c
tof k a
tof a i
tof a h
tof b d
tof a b
tof h a
tof c i
tof c h
tof b e
tof c b
tof e c
X e
tof b l
tof b k
tof b i
tof b h
tof c b
X c
X g
tof a b
tof b a
tof b c
tof b d
tof a b
tof b h
tof b i
tof b k
tof b l
tof e c
tof c e
tof c h
tof c j
tof c k
tof c l
tof k b
tof k h
tof l c
tof l d
tof l e
tof l i
tof l j
tof g j
tof e j
tof j c
tof j g
tof j h
tof e a
tof e b
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k d
tof b d
tof c d
H e
Z c d e
H e
tof l c
tof e l
tof j h
tof j g
tof e j
tof a b
tof e a
tof j c
tof g j
tof l j
tof l i
tof l e
tof l d
tof b a
tof a k
tof c k
tof k h
tof a l
tof a i
tof c l
X c
tof c e
tof c j
tof e c
tof b d
tof b c
tof a b
X a
tof b a
tof b d
tof b g
tof a b
tof b h
tof g c
tof c b
tof c g
tof c h
tof c k
tof k c
tof c j
tof a g
tof j k
tof e k
tof k d
tof k f
tof h l
tof j l
tof l b
tof l h
tof l i
tof e c
tof e b
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof k f
tof e k
tof e b
tof e d
tof e c
tof l i
tof l h
tof j l
tof j f
tof k j
tof j d
tof l b
tof h l
tof k c
tof c a
tof a h
tof a g
tof a b
tof c k
tof c j
tof g c
tof a g
X c
tof c a
tof b h
tof b e
tof b f
tof b i
tof b j
tof b l
tof c e
tof a c
tof c h
tof c i
tof c k
tof e k
tof k a
tof k b
tof k d
tof k e
tof k f
tof k h
tof k i
tof k j
tof k l
tof e l
tof l d
tof l e
tof l j
tof l k
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof g c
tof g d
tof g b
tof g h
tof g k
tof g l
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H g
Z c d g
H g
tof g l
tof g k
tof g h
tof g b
tof g d
tof g c
tof j l
tof j a
H j
Z a k j
H j
tof k j
tof k e
tof k d
tof l k
tof e l
tof k i
tof a h
tof k a
tof b f
tof k b
tof e k
tof a k
tof c g
tof c i
tof a c
X a
tof b g
tof g a
tof c k
tof c h
tof c e
tof b l
tof b j
tof b i
tof b e
X b
tof b d
tof a c
tof a b
tof b a
tof c a
tof b e
tof b g
tof b i
tof b j
tof c b
tof b k
tof c g
tof c i
tof c l
tof g a
tof a b
tof a c
tof a d
tof a g
tof a i
tof k l
tof a k
tof k a
tof k c
tof k d
tof k f
tof k g
tof k h
tof l i
tof l j
tof j b
tof j c
tof j d
tof j e
tof j f
tof g k
tof j g
tof g d
tof g a
tof g l
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H g
Z c d g
H g
tof g l
tof k a
tof g k
tof k g
tof j g
tof a g
tof g d
tof j f
tof j e
tof j c
tof l j
tof l i
tof k l
tof k h
tof k f
tof a k
tof k c
tof c k
tof a l
tof b i
tof a b
tof c g
tof g a
tof c l
tof c b
X c
tof b a
tof a c
tof b k
tof b j
tof b g
tof a e
tof a b
tof b a
tof b d
X b
tof b c
tof b f
tof b i
tof b j
tof b l
tof a c
tof c a
tof c g
tof c h
tof c i
tof c j
tof c k
tof c l
tof e a
tof a b
tof a c
tof a e
tof a f
tof a g
tof a h
tof a k
tof f k
tof k c
tof k d
tof k f
tof k i
tof k l
tof f l
tof l a
tof l c
tof l d
tof l f
tof l g
tof l h
tof e j
tof j c
tof j i
tof e d
tof e a
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof j i
tof e j
X d
tof e d
tof a c
tof e a
tof j c
tof l h
tof l g
tof l f
tof l d
tof l a
tof k f
tof f l
tof k i
tof k d
tof k c
tof a f
tof f k
tof a h
tof a g
tof a e
tof a b
tof e a
tof c l
tof c k
tof c j
tof c i
tof c h
tof c g
tof c a
tof a c
tof b i
tof b e
tof b d
tof b c
X e
tof c a
tof f a
tof a f
tof c b
tof b g
tof b h
tof c k
tof c l
tof a c
tof a d
H j
Z a k j
H j
tof a k
tof j a
tof k j
tof k b
tof k c
tof k h
tof k i
tof k l
tof h l
tof l b
tof l h
tof l i
tof e j
tof j k
tof j l
tof e c
tof e a
tof e h
tof e i
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof j l
tof e j
tof e i
tof e h
tof e a
tof e c
tof j a
H j
Z a k j
H j
tof l i
tof k h
tof k b
tof l b
tof l h
tof h l
tof k i
tof k c
tof k a
tof a k
tof a j
tof a f
tof a d
tof a c
tof f a
tof c l
tof c k
tof c b
X c
tof c a
tof b e
tof b i
tof c d
tof c e
tof c f
tof c i
tof e a
tof a c
tof a d
tof a e
tof a f
tof a g
tof a h
tof a i
tof k d
tof k e
tof k f
tof k h
tof k j
tof g l
tof l a
tof l b
tof l c
tof l d
tof l g
tof l h
tof l i
tof e j
tof j c
tof j d
tof j e
tof j f
tof j h
tof j k
tof f c
tof f k
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H f
Z c d f
H f
tof f l
tof f k
tof j f
tof f c
tof j h
tof j e
tof j d
tof k e
tof e j
tof l i
tof l h
tof l g
X d
tof c d
tof l c
tof l b
tof l a
tof g l
tof k h
tof k f
tof k d
tof a i
tof a h
tof a g
tof a f
tof a e
tof a c
tof e a
tof c h
tof c g
tof c e
tof b l
tof b j
tof b i
tof b h
tof b g
tof b f
tof b e
tof b a
X b
tof a b
tof b a
tof b e
tof b g
tof b h
tof b i
tof c b
tof b j
tof b l
tof c a
tof c k
tof f a
tof a c
tof a f
tof a g
tof a h
tof a k
tof f k
tof k a
tof k c
tof k f
tof k g
tof k j
tof e l
tof l b
tof l d
tof l e
tof l f
tof l g
tof j h
tof l j
tof l k
tof j a
tof j b
tof j d
tof e i
tof j e
tof j l
tof e h
H e
Z c d e
H e
tof e h
tof e i
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
tof e i
tof e h
H e
Z c d e
H e
tof j e
tof e i
tof e h
tof l d
tof l b
tof j l
tof j a
tof k j
tof l k
tof l h
tof l g
tof l f
tof l e
tof e l
tof k g
tof k f
tof k a
tof a k
tof k c
tof c k
tof f k
tof a h
tof a g
tof a f
tof f a
tof c l
tof b f
tof b g
X g
tof c b
tof b e
X d
X e
tof b d
tof c b
tof a b
tof a d
tof a f
tof a h
tof a i
tof l j
tof a l
tof g k
tof k a
tof k g
tof k i
tof k l
tof j k
tof l a
tof l f
tof l g
tof j l
tof l h
tof j b
tof e i
tof j e
tof e d
tof e g
tof e h
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof e i
tof e h
tof e g
tof e d
tof j l
tof j i
tof j h
tof j e
tof l j
tof l h
tof l g
tof l f
tof k l
tof l a
tof a l
tof k j
tof k i
tof k g
tof g k
tof a j
tof a i
tof a h
tof a f
tof a d
tof c a
tof a b
tof b a
tof c j
tof c i
tof c g
tof b l
tof b j
tof b i
tof b h
tof b f
tof a b
X g
tof a d
tof e a
tof a e
X d
tof a d
tof c h
tof b c
tof b i
tof c e
tof c g
tof c j
tof c l
tof l c
tof l g
tof k l
tof a b
tof a h
tof a i
tof k h
tof l b
tof l i
tof l j
tof f l
tof l k
tof g j
tof j a
tof j b
tof j g
tof j i
tof j l
tof f c
tof f b
tof f j
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f l
tof k c
tof f k
tof j b
tof f j
tof l i
tof l g
tof j l
tof j a
tof g j
tof l k
tof l b
tof k l
tof k h
tof k g
tof a i
tof a h
tof a e
tof b d
tof a b
X d
tof c e
tof e a
X e
tof c l
tof c j
tof c h
tof c g
tof b e
tof a b
tof b j
tof b k
tof e c
tof c b
tof c d
tof c e
tof c g
tof k i
tof k l
tof c k
tof k c
tof a d
tof a e
tof a h
tof a i
tof k d
tof k e
tof k f
tof k g
tof l g
tof l h
tof g j
tof j d
tof j g
tof j h
tof j i
tof j l
tof f c
tof f d
tof f a
tof f h
tof f i
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f i
tof f h
tof f a
tof f d
tof k f
tof f c
tof j l
tof j i
tof j h
tof j g
tof j d
tof g j
tof l h
tof k l
tof c l
tof l g
tof a k
tof k i
tof k e
tof c k
tof k d
X d
tof a j
tof a h
tof a b
tof c i
tof b e
tof c b
X c
tof e c
tof b k
tof j i
tof b j
tof b a
X b
X h
tof b c
tof e d
tof b e
tof b f
tof b g
tof b l
tof e c
tof c b
tof c e
tof c f
tof c g
tof c h
tof a c
tof c j
tof c k
tof a d
tof a l
tof f k
tof k a
tof k c
tof k f
tof k h
tof k l
tof f l
tof l c
tof l f
tof l g
tof l h
tof l j
tof j c
tof e c
tof e k
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof e k
tof e d
tof e c
tof l j
tof j i
tof j c
tof l h
tof l g
tof l f
tof k f
tof f l
tof k h
tof k a
tof a k
tof k c
tof c f
tof f k
tof a l
tof a j
tof a i
tof c d
X a
tof a d
tof c j
tof c i
tof c h
tof c g
tof b e
tof e c
tof c e
tof e b
X e
tof b l
tof b h
tof b g
tof b f
tof b d
tof b a
X f
X h
tof f b
tof b f
tof b j
tof b l
tof c d
tof c f
tof c g
tof c h
tof c j
tof c k
tof e a
tof a b
tof a c
tof a e
tof a g
tof h l
X h
tof l h
tof a k
tof a h
tof e k
tof k a
tof k c
tof k d
tof e f
tof k e
tof k g
tof k i
tof l b
tof l i
tof e j
tof j a
tof j b
tof j d
tof j e
tof j g
tof j h
tof j k
tof j l
tof e c
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H e
Z c d e
H e
tof e l
tof e f
tof e c
tof l h
tof j l
tof j g
tof j f
tof j e
tof j d
tof j a
tof e j
tof l i
tof l b
tof h l
tof k i
tof k g
tof k f
tof k e
tof k d
tof k a
tof a k
tof k c
tof c k
tof e k
tof a l
tof a h
tof a g
tof a e
tof a b
tof e a
tof c j
tof c h
tof c g
tof c f
tof c e
X d
tof a c
tof c a
X a
tof b l
tof b j
tof b f
tof f b
tof b c
tof b e
tof b f
tof c b
tof a b
tof k b
tof b l
tof c d
tof a c
tof c i
tof k c
tof k e
tof k f
tof k g
tof k h
tof k j
tof e l
tof l b
tof l e
tof l f
tof e j
tof j b
tof j e
tof j f
tof j g
tof j h
tof j k
tof f c
tof f k
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
H f
Z c d f
H f
tof f l
tof f k
tof k f
tof f c
tof j h
tof j g
tof j f
tof j e
tof e j
tof l f
tof l e
tof l b
tof k e
tof e l
tof k j
tof k h
tof k g
tof k b
tof a l
X d
tof a c
tof c a
tof a i
tof a d
tof a b
tof c l
tof a c
tof b l
tof b f
X e
tof a b
tof b a
tof b e
X a
X h
tof b l
tof e c
tof a c
tof c e
tof c f
tof c k
tof e k
tof k a
tof k b
tof k c
tof k e
tof k f
tof k g
tof k l
tof l k
tof k h
tof k i
tof k j
tof l a
tof l d
tof l e
tof l f
tof e j
tof j a
tof j b
tof j e
tof j f
tof j g
tof j h
tof j k
tof h d
tof h a
tof h b
tof h j
tof h l
H h
Z c d h
H h
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H h
Z c d h
H h
tof l d
tof h l
tof j b
tof j a
tof h j
tof k h
tof j k
tof j g
tof j f
tof l e
tof j e
tof e j
tof k i
tof k f
tof l k
tof k l
tof l a
tof a l
tof k j
tof k g
tof k e
tof k c
tof k b
tof a e
tof e k
tof c f
tof a c
X f
tof a b
tof c k
tof c e
tof e c
tof b e
X d
X e
tof b d
tof b f
tof a b
tof b g
tof f c
tof c d
tof c f
tof c l
tof a c
tof g k
tof k a
tof k c
tof k d
tof k g
tof k h
tof k i
tof k j
tof l c
tof l d
tof l e
tof l g
tof l h
tof l i
tof l k
tof e j
tof j d
tof j e
tof j g
tof j i
tof f c
tof f h
tof f i
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof l i
tof l h
tof l c
tof f l
tof j i
tof j g
X j
tof l j
tof j e
tof j d
tof e j
tof k g
tof l k
tof k j
tof k i
tof k h
tof k d
tof a c
tof k a
tof g k
X g
tof a b
tof b d
tof c l
tof c f
tof c d
tof f c
tof b e
tof b h
tof b i
tof a c
tof c e
tof c a
tof c k
tof a b
tof a f
tof a h
tof a i
tof a l
tof e k
tof k c
tof e f
tof k e
tof j i
tof k j
tof g l
tof l b
tof l c
tof l d
tof l g
tof l j
tof l k
tof j b
tof j c
tof e d
tof e g
tof e l
tof j e
tof e a
tof e b
tof e h
tof e i
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof e k
tof e i
tof e h
tof e g
tof e f
tof e b
tof e a
tof j e
tof e d
tof l i
tof l g
tof j l
tof j f
tof l j
tof j c
tof j b
tof l k
tof l d
tof a g
tof g l
tof k j
tof k i
tof k f
tof c e
tof k c
tof e k
X e
tof a i
tof a h
tof b f
tof a b
tof b g
tof b e
X d
tof b d
tof c d
tof c l
tof g a
tof a b
tof a c
tof a g
tof a h
tof a i
tof e k
tof k a
tof k e
tof f h
tof f i
tof k f
tof k j
tof k l
tof e l
tof l a
tof l b
tof l c
tof l d
tof l e
tof l k
tof j a
tof j d
tof j h
tof j k
tof f d
tof f g
tof f j
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof f l
tof f j
tof f i
tof f h
tof f g
tof f d
tof j k
tof j h
tof j d
tof j a
tof k e
tof l k
tof l d
tof l c
tof l b
tof l a
tof e l
tof k j
tof k i
tof k h
tof k f
tof k a
tof e k
tof b h
tof b i
tof a b
tof c g
tof a c
tof g a
tof c l
tof a d
tof a c
tof b l
tof b a
X b
tof b d
tof a b
tof c e
tof c b
X e
tof c g
tof b c
tof b j
tof b k
tof b l
tof c b
tof c i
tof e a
tof a e
tof k b
tof k g
tof k h
tof k i
tof g l
tof l a
tof l c
tof l d
tof l g
tof g l
tof l i
tof j c
tof j i
tof g c
tof g b
tof g h
tof g j
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof c d
tof k d
tof b d
H g
Z c d g
H g
tof g l
tof j i
tof g j
tof g h
tof g b
tof g c
tof j c
tof l i
tof l g
tof c d
tof l c
tof l a
tof g l
tof k i
tof k h
tof k g
tof a e
tof e a
tof c i
tof c g
tof b e
X e
tof c b
tof b c
tof b l
tof b k
tof b j
tof b g
tof b d
tof a c
tof c b
X c
tof c a
tof b a
tof b d
tof b g
tof b j
tof b k
tof b l
tof c b
tof c d
tof c e
tof c g
tof c h
tof c i
tof c j
tof e a
tof a c
tof a d
tof e h
tof e l
tof l h
tof l e
tof a e
tof k i
tof a k
tof k b
tof k g
tof k h
tof l c
tof l g
tof e l
tof l k
tof g j
tof j c
tof j g
tof j h
tof e d
tof e a
tof e b
tof e g
tof e i
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof l k
tof e l
tof e i
tof e h
tof e g
tof e b
tof a d
tof e a
tof j h
tof j g
tof j c
tof g j
tof l g
tof l e
tof l c
tof a e
tof e l
tof k i
tof k h
tof k g
tof k b
tof a k
tof c h
tof c i
tof a c
X i
tof c e
tof e a
tof c j
tof c g
tof b d
X d
tof c b
tof b a
tof a c
tof b l
tof b g
tof a b
tof a k
tof a j
X a
tof e c
tof b e
tof c e
tof b h
tof b i
tof c d
tof c f
tof c g
tof c i
tof c j
tof c k
tof f a
tof a b
tof a c
tof a f
tof a g
tof a h
tof e k
tof k a
tof k e
tof k f
tof k h
tof k i
tof k j
tof k l
tof h l
tof l b
tof l h
tof l i
tof a b
tof j a
tof j c
tof j e
tof j f
tof j k
tof j l
tof a e
tof a f
tof a g
tof a h
H a
Z c d a
H a
tof a b
tof a e
tof a f
tof a g
tof a h
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof b d
tof c d
tof a h
tof a g
tof a f
tof a e
tof a b
H a
Z c d a
H a
tof a h
tof a g
tof a f
tof a e
tof a b
tof j l
tof j f
tof j e
tof j c
tof k j
tof j a
tof l i
tof l h
tof l b
tof k h
tof h l
tof k i
tof k f
tof k e
tof e k
tof a h
tof a g
tof a f
tof a c
tof a b
tof f a
tof c k
tof c j
tof c i
tof c g
tof c f
tof c e
tof c d
tof e c
tof b k
tof b e
X e
X f
tof b f
tof b l
tof f c
tof c b
tof c d
tof c f
tof c g
tof c h
tof c k
tof c l
tof g a
tof a c
tof a g
tof a i
tof a k
tof k a
tof a j
tof j a
tof k b
tof k c
tof k d
tof k f
tof k g
tof k h
tof h l
tof l b
tof l h
tof l i
tof j b
tof j d
tof j f
tof j g
tof j h
tof j k
tof e c
tof e d
tof e b
tof e f
tof e g
tof e i
tof e j
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e j
tof e i
tof e g
tof e f
tof e b
tof e d
tof e c
tof j k
tof j h
tof j g
tof k j
tof j f
tof j d
tof j b
tof j a
tof a j
tof l i
tof l h
tof l b
tof h l
tof k h
tof a k
tof k g
tof k c
tof c k
tof a i
tof g a
tof c l
tof c h
tof c g
tof c f
tof c d
tof c b
tof f c
tof a e
X a
tof a g
tof b a
tof c b
tof b k
tof a i
tof c a
tof b d
tof a b
tof a f
tof a h
tof a j
tof a k
tof f k
tof k f
tof k a
X f
tof a l
tof k h
tof k j
tof e l
tof l e
tof j c
tof j i
tof c d
tof j k
tof k c
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof b d
tof k c
tof j k
tof c d
tof j i
tof j c
tof l e
tof e l
tof k l
tof k j
tof k h
tof a f
tof k a
tof f k
tof a l
tof a j
tof a i
tof a h
tof a g
tof a e
tof a d
tof c a
tof a b
tof b a
tof b c
tof c k
tof c i
tof c g
tof c e
X c
tof b l
tof b j
tof b h
tof b f
X d
tof e b
tof b d
tof b e
tof b f
tof b g
tof b h
tof b i
tof b j
tof b k
tof b l
tof a c
tof c a
tof c b
tof c d
tof c f
tof c i
tof c j
tof c l
tof e a
tof a b
tof a d
tof a e
tof a h
tof a i
tof a j
tof a k
tof a l
tof k a
tof k d
tof k e
tof k f
tof k g
tof k h
tof j k
tof k i
tof e l
tof e b
tof l e
tof l c
tof l g
tof l h
tof l k
tof j b
tof j d
tof j g
tof e j
tof j h
tof e d
tof e f
tof e i
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c b
tof b d
H e
Z c d e
H e
tof e l
tof h i
tof b h
tof h i
tof j b
tof j d
tof e j
tof e f
tof k g
tof j k
tof k h
tof l k
tof l e
tof l c
tof c l
tof e l
tof k i
tof k f
tof k a
tof a k
tof k e
tof k d
tof b j
tof b l
tof a b
tof e a
tof c d
tof b k
tof b g
tof b f
tof b e
tof b d
tof e b
tof h b
tof b h
tof b i
tof b j
tof b k
tof b l
tof k b
tof c k
tof c e
tof e a
tof a d
tof a e
tof a f
tof k f
tof k g
tof k i
tof e l
tof l b
tof l c
tof l d
tof l e
tof j g
tof j k
tof l j
tof f c
tof f b
tof j f
tof j i
tof f d
tof f a
tof f k
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l c
tof k c
tof j d
tof b d
tof c d
H f
Z c d f
H f
tof k b
tof f k
tof a d
tof f a
tof j f
tof f c
tof j i
tof l j
tof j g
tof l e
tof l d
tof c b
tof l c
tof e l
tof k i
tof k g
tof k f
tof a f
tof a e
tof e a
tof c j
tof c f
tof b h
tof h b
tof h l
tof h k
tof h j
tof h i
tof b h
X d
tof b f
tof a c
tof c d
tof c h
tof c l
tof a e
tof k i
tof a k
tof k b
tof k f
tof k g
tof e l
tof e c
tof e f
tof l e
tof l d
tof l j
tof h j
tof j c
tof j h
tof e j
tof j i
tof e a
tof e b
tof e g
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof c d
tof k d
tof b d
H e
Z c d e
H e
tof e l
tof j i
tof e j
tof e g
tof e f
tof e b
tof e a
tof e c
tof j h
tof l j
tof j c
tof h j
tof l f
tof l e
tof l d
tof a e
tof e l
tof k i
tof k g
tof b k
tof k f
X f
tof a k
tof a i
tof a h
tof a d
tof a c
tof c k
tof c h
tof b l
X i
tof b d
X b
X j
X g
tof b f
tof b k
tof c b
tof c f
tof c g
tof c j
tof g a
tof a b
tof a g
tof a i
tof a j
tof a k
tof k b
tof k e
tof k i
tof k l
tof l b
tof l d
tof l e
tof l f
tof j b
tof j e
tof j k
tof j l
tof f d
tof f i
tof f j
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k d
tof b d
tof c d
H f
Z c d f
H f
tof f j
tof f d
tof c f
tof f i
tof j l
tof k e
tof j k
tof l f
tof l e
tof l d
tof l b
tof k l
tof a k
tof k i
tof a j
tof a g
tof a b
tof c g
tof g a
X g
tof c l
tof c j
tof c e
tof b d
tof c b
tof a c
tof b k
tof b j
tof b i
tof b h
tof b f
X b
tof c b
tof b c
tof b d
tof b g
tof b i
tof b j
tof b k
tof b l
tof g c
tof c g
tof c j
tof c k
tof e a
tof a e
tof k a
tof k b
tof k f
tof k i
tof f l
tof f a
tof l f
tof l c
tof l g
tof j i
tof l j
tof l k
tof j c
tof f d
tof f g
tof f i
tof f j
tof f l
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H f
Z c d f
H f
tof l g
tof l a
tof f l
tof j i
tof f j
tof f d
tof l j
tof j c
tof c j
tof k i
tof l k
tof l f
tof f l
tof k f
tof k b
tof k a
tof a e
tof e a
tof c k
tof c g
tof b g
tof g c
tof b l
tof b k
tof b j
tof b i
tof b d
tof c b
X c
X h
tof a b
tof b a
tof b c
tof b d
tof b e
tof b g
tof b i
tof b j
tof b k
tof b l
tof c e
tof c g
tof c h
tof c k
tof a e
tof a j
tof a k
tof h l
tof l h
tof a l
tof k b
tof k e
tof k f
tof k i
tof l c
tof l d
tof j i
tof l j
tof j l
tof j d
tof j g
tof a f
tof a l
H a
Z c d a
H a
tof a b
tof a f
tof a g
tof a h
tof a i
tof a l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof c d
tof k d
tof b d
tof a l
tof a i
tof a h
tof a g
tof a f
tof a b
H a
Z c d a
H a
tof a l
tof a h
tof a f
tof l i
tof j l
tof j g
tof l j
tof j d
tof l h
tof l c
tof h l
tof k i
tof k f
tof b a
tof a k
tof c k
tof k e
X e
tof a l
tof a j
tof c h
tof b c
tof b i
X c
tof c g
tof a d
X d
tof a b
tof b f
tof b i
tof b j
tof k l
tof b k
tof k b
tof e c
tof c d
tof c e
tof c f
tof c i
tof c l
tof e a
tof a c
tof a d
tof a e
tof a f
tof a i
tof a l
tof k c
tof l k
tof k f
tof l a
tof l b
tof l e
tof l j
tof h j
tof h c
tof j h
tof j i
tof h a
tof h b
tof h j
H h
Z c d h
H h
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H h
Z c d h
H h
tof h j
tof h b
tof h a
tof j h
tof h c
X j
tof j i
tof h j
tof l k
tof l j
tof l f
tof l e
tof l b
tof l a
tof k l
tof c f
tof k c
tof k b
tof a l
tof a c
tof c d
tof b l
tof b k
X b
tof b d
tof c b
tof a b
tof b k
tof c g
tof c j
tof a j
tof f k
tof k f
tof k j
tof k l
tof l c
tof e d
tof l e
tof l f
tof l g
tof l i
tof l k
tof e j
tof e h
tof e i
tof j e
tof j l
tof e c
tof e a
tof e j
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof j i
tof j h
tof e j
tof e a
tof e d
tof e c
tof j l
tof j e
tof j d
tof e j
tof l k
tof l i
tof l g
tof l f
tof l e
tof l d
tof l c
tof k l
tof k j
tof k f
tof f k
tof a k
tof a j
tof a i
tof a e
tof a d
tof a b
tof e a
tof c l
tof c k
tof c j
tof c i
tof c g
tof b e
tof e c
tof c e
tof e b
X e
tof b f
tof c b
tof b d
tof c g
tof c i
tof c l
tof k a
tof e a
tof a e
tof k b
tof k i
tof k l
tof l b
tof l d
tof l e
tof l j
tof l k
tof j c
tof j i
tof e c
tof e a
tof e b
tof e g
tof e j
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof e j
tof e g
tof e b
tof e a
tof e c
tof c i
tof j c
tof l k
tof l j
tof l e
tof l d
tof k l
tof c l
tof l b
tof k i
X a
tof a e
tof k a
tof e a
tof c g
tof b c
tof c e
tof c d
tof b k
tof b j
tof b i
X b
tof e b
tof b d
tof b e
tof b f
tof b k
tof b l
tof c b
tof c e
tof c f
tof a b
tof a d
tof a e
tof a g
tof a i
tof a j
tof a l
H k
Z b c k
H k
tof k a
tof k b
tof k c
tof l b
tof l d
tof l h
tof l i
tof l k
H j
Z d c j
H j
tof j a
tof j c
tof j d
H d
Z c a d
H d
tof a b
tof a l
H a
Z c d a
H a
tof a b
tof a l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
tof d j
tof a j
tof a d
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
tof l b
tof a l
H a
Z c d a
H a
tof a l
H d
Z c a d
H d
tof j d
tof j c
tof j a
H j
Z d c j
H j
tof l k
tof l i
tof l h
tof l d
tof k c
tof k b
tof k a
H k
Z b c k
H k
tof a l
tof a j
tof a i
tof a g
tof b e
tof a b
X a
tof a d
tof b f
tof c b
tof e l
tof e b
tof e k
X k
tof e d
tof b e
X j
X h
tof b c
tof b f
tof b h
tof b i
tof e c
tof c d
tof c e
tof c f
tof k l
tof c k
tof k c
tof h a
tof a d
tof a h
tof a i
tof k b
tof k d
H l
Z d c l
H l
tof l a
tof l c
tof l d
H j
Z b c j
H j
tof j b
tof j c
tof j k
H c
Z b a c
H c
H d
Z b a d
H d
tof a l
H a
Z c d a
H a
tof a l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof k b
tof a k
tof l k
tof k c
tof j b
tof c d
tof b d
H a
Z c d a
H a
tof a l
H d
Z b a d
H d
H c
Z b a c
H c
tof j c
tof j b
H j
Z b c j
H j
tof l d
tof l c
tof l a
H l
Z d c l
H l
tof b l
tof k b
tof c d
tof k c
tof a i
tof a h
X a
tof a d
tof h a
tof c l
tof c k
tof c f
tof c e
tof e c
tof c e
X e
tof b c
tof b k
tof b i
tof b h
tof b f
tof b d
X b
tof l b
tof b l
tof c a
tof c b
tof c d
tof c f
tof c h
tof k j
tof c k
tof e a
tof a d
tof a e
tof a f
tof k b
tof k f
tof k g
tof k h
tof k i
tof e l
tof l b
tof l c
tof l e
tof g i
tof l g
tof l k
tof f j
tof j b
tof j c
tof j f
tof g h
tof j g
tof j k
tof g d
tof g a
tof g j
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c b
tof b d
H g
Z c d g
H g
tof j i
tof j h
tof g j
tof a d
tof g a
tof k g
tof j k
tof j f
tof j c
tof f j
tof k i
tof l k
tof l e
tof l c
tof e l
tof k b
tof c k
tof c j
tof c h
tof a f
tof a e
tof e a
tof c d
tof b l
tof l b
X d
tof b f
tof b l
tof a c
tof c i
tof c l
tof a e
tof a h
tof a j
tof k b
tof k g
tof k i
tof e l
tof l a
tof l c
tof l e
tof l f
tof l h
tof l i
tof l j
tof h j
tof j c
tof j h
tof j i
tof e d
tof e h
tof e i
tof e k
tof e l
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H e
Z c d e
H e
tof e l
tof e k
tof e i
tof e h
tof e d
tof j i
tof j h
tof j c
tof l h
tof h j
tof l i
tof l f
tof c e
tof a c
X e
tof l a
X l
tof e l
tof k h
tof k g
tof k b
tof a j
tof a i
tof c j
tof c a
tof a h
tof c i
tof b l
tof b f
X d
tof h c
tof h b
tof b h
tof c b
X c
tof g d
tof b g
tof c b
tof b l
tof e a
tof a e
tof k a
tof l c
tof k l
tof l h
tof j c
tof j i
tof g b
tof g k
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H g
Z c d g
H g
tof g k
tof g b
tof g d
tof j i
tof j c
tof l h
tof k l
tof l c
tof c l
tof k f
tof k a
tof a e
tof e a
tof b h
tof c b
tof h c
tof b l
tof b g
tof b d
tof c b
X c
X e
X f
tof a b
tof b a
tof b c
tof b d
tof b e
tof b g
tof b h
tof b l
tof e c
tof c d
tof c e
tof c g
tof j h
tof c j
tof f a
tof k a
tof a d
tof a f
tof a g
tof k b
tof k h
tof g l
tof l b
tof l c
tof l g
tof l j
tof j a
tof j b
tof j c
tof j d
tof f g
tof f i
tof j f
tof j k
tof f c
tof f j
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k d
tof b d
tof c d
H f
Z c d f
H f
tof j i
tof j g
tof f j
tof j f
tof f c
tof k h
tof k d
tof j k
tof k j
tof j a
tof l j
tof l h
tof l g
tof l c
tof l b
tof b g
tof g l
tof k i
tof k g
tof k f
tof a g
tof a f
tof a d
tof f a
tof c j
tof c h
tof c g
tof c e
tof b d
tof b e
tof e c
tof e d
tof b h
tof b a
X g
tof a b
X a
tof i a
tof f b
tof b f
tof b j
tof b l
tof c a
tof c j
tof c l
tof a d
tof a i
tof a j
tof j k
tof k a
tof k b
tof k j
tof l a
tof l b
tof l c
tof l d
tof g l
tof l i
H j
Z a k j
H j
tof j a
tof j k
tof j l
H g
Z c d g
H g
tof g i
tof g l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X i
X g
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
tof g l
tof g i
H g
Z c d g
H g
tof g l
tof g i
tof j l
tof k a
tof j a
H j
Z a k j
H j
tof l i
tof l d
tof l c
tof l b
tof l a
tof k b
tof j k
tof a j
tof a i
tof a d
tof i a
tof c j
tof c a
tof b l
tof b j
tof b f
tof f b
X e
X j
tof b d
tof b f
tof b h
tof b l
tof c h
tof j c
tof c k
tof g a
tof a d
tof a g
tof a h
tof h k
tof k h
tof k i
tof k l
tof l a
tof l f
tof l g
tof e c
tof e b
tof e k
H e
Z c d e
H e
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
X h
X i
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H e
Z c d e
H e
tof e k
tof e b
tof e c
tof j l
tof j i
tof j h
tof j g
tof c f
tof j c
tof j a
tof l g
tof l f
tof l a
tof k l
tof k i
tof k h
tof h k
tof a h
tof a g
tof a d
tof g a
tof c l
tof c d
tof b l
tof b h
tof e f
X e
tof e b
tof e d
tof b e
tof b k
tof b l
tof c b
tof f a
tof a b
tof a d
tof k f
tof a k
tof a l
tof k b
tof k i
tof f l
tof l f
tof l i
tof l j
tof l k
tof g j
tof j c
tof j b
tof j e
tof j f
tof j k
tof j l
H j
Z c d j
H j
tof j b
tof j e
tof j f
tof j g
tof j h
tof j k
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j d
tof c b
tof b d
tof j l
tof j h
tof j g
tof j f
tof j e
H j
Z c d j
H j
tof l k
tof l f
tof j l
tof j e
tof j c
tof g j
tof l j
tof l i
tof f l
tof k i
tof a k
tof k f
tof k b
tof b k
tof a l
tof a d
tof f a
tof c k
tof b e
tof e b
tof e l
tof e f
tof e d
tof b h
tof c b
tof c e
tof a b
tof f h
tof a f
tof a l
tof f k
tof k b
tof f i
tof k f
tof k j
tof g l
tof l b
tof l g
tof l h
tof e j
tof j c
tof j d
tof j e
tof f c
tof f d
H f
Z c d f
H f
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X f
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X f
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof c d
tof k d
tof b d
H f
Z c d f
H f
tof f i
tof f h
tof f d
tof f c
tof j e
tof j d
tof j c
tof e j
tof l h
tof l g
tof l b
tof g l
tof k j
tof k i
tof k h
tof k f
tof f k
tof a l
tof a h
tof a f
tof a b
tof c h
tof c e
X f
tof b f
tof c b
tof b l
tof b h
tof b d
tof j k
X j
X b
X h
X l
tof e b
tof b e
tof b j
tof a c
tof c a
tof c b
tof c d
tof c e
tof h a
tof a d
tof a h
H j
Z a k j
H j
tof a k
tof k a
tof k b
tof e l
tof l d
tof l e
tof l j
tof j a
tof j k
tof g j
tof j l
tof g c
tof g d
tof g a
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X h
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof l k
tof l b
tof k c
tof j k
tof k b
tof c d
tof b d
H g
Z c d g
H g
tof j l
tof j a
tof g j
tof c d
tof g c
tof j k
tof k a
H j
Z a k j
H j
tof l j
tof l e
tof l d
tof e l
tof k b
tof j k
tof a j
tof a h
tof a d
tof h a
tof b e
tof c b
tof c a
tof a c
tof b k
tof b j
tof e b
X g
X j
tof a b
tof b a
tof b d
tof b e
tof b g
tof b k
tof a c
tof c a
tof c b
tof c e
tof c j
tof g a
tof a g
tof e k
tof k b
tof k e
tof k h
tof e l
tof l a
tof l d
tof l e
tof l j
tof j c
tof j k
tof j l
H j
Z c d j
H j
tof j a
tof j k
tof j l
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
X h
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
tof j l
tof j a
H j
Z c d j
H j
tof j l
tof j k
tof j c
tof l j
tof l e
tof l d
tof l a
tof e l
tof k h
tof b e
X b
tof k b
tof e k
tof c b
tof b k
tof a g
tof g a
tof c j
X d
tof b e
tof e a
tof a b
tof a e
tof a j
tof j k
tof k a
tof j l
tof l j
tof l d
tof k l
tof l k
tof l a
H j
Z a k j
H j
tof j a
tof j k
tof j l
tof g c
tof g d
tof g a
tof g b
tof g h
H g
Z c d g
H g
tof b d
tof c d
tof k b
tof j k
tof k c
tof l b
tof l k
tof a l
tof a j
tof k a
H k
Z j l k
H k
H j
Z b k j
H j
H l
Z c k l
H l
tof d l
tof d k
tof d j
tof a d
X e
X g
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 1
Z a d 1
H 1
H 0
Z 1 e 0
H 0
H c
Z 0 f c
H c
H 0
Z 1 e 0
H 0
H 1
Z a d 1
H 1
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
H 3
Z g h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z g h 3
H 3
H 2
Z a c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H b
Z 0 f b
H b
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z a c 2
H 2
X g
X e
tof a d
tof d j
tof d k
tof d l
H l
Z c k l
H l
H j
Z b k j
H j
H k
Z j l k
H k
tof k a
tof a j
tof a l
tof k b
tof l k
tof k c
tof j b
tof c d
tof b d
H g
Z c d g
H g
tof g h
tof g b
tof g a
tof g d
tof g c
tof j l
tof k j
tof j a
tof l j
H j
Z a k j
H j
tof l k
tof l d
tof j l
tof k j
tof k d
tof j k
tof a j
tof a e
tof a b
tof e a
tof c k
tof c a
tof a c
tof b k
tof b g
tof b e
tof b d
tof d b
tof a b
tof b c
X b
tof b d
tof a l
tof d a
tof l d
X l
tof a k
tof a c
tof c l
H c
Z a b c
H c
X f
X h
X i
X k
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l d
tof d l
tof b d
tof d b
tof l k
tof a l
X a
tof a d
tof a k
tof l c
tof l b
tof a c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof a k
X a
tof a d
tof b a
tof a b
tof b a
tof e l
X e
tof l e
tof a k
tof a e
tof l a
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
X d
H c
Z a b c
H c
tof c l
tof b c
tof a k
X a
tof a c
tof l k
tof l e
tof d b
tof b d
X b
tof b a
tof l b
tof b e
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof a c
tof l k
tof l e
tof l a
tof e l
tof b d
tof a l
tof b a
tof d b
tof a c
tof d a
X a
tof b d
tof l d
tof a l
tof l a
tof b f
tof l f
tof l k
tof a c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof a c
tof l k
tof l f
tof l d
tof l a
tof b f
tof b e
tof b d
tof d b
tof a l
tof a e
tof b c
tof b f
X b
tof b d
tof a f
tof b a
tof a k
tof l b
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof b k
tof b f
tof a d
tof b a
tof a k
tof d f
tof d a
X b
tof a b
tof f b
tof b f
tof b c
tof b a
tof a k
tof l b
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l b
tof b k
tof b f
tof b a
tof f b
tof b c
tof b d
tof a b
X d
X e
tof b a
tof a e
tof b f
tof b k
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof b k
tof l b
tof b f
tof b e
tof a d
tof b a
tof a k
tof e l
X e
tof l e
tof a g
tof a e
X g
tof l b
tof l f
tof l k
tof b c
tof c l
H c
Z a b c
H c
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof b c
tof l k
tof l f
tof l e
tof l b
tof e l
tof a l
tof a g
tof a f
X c
tof e a
X e
tof b a
tof a e
tof a g
tof a k
tof l b
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof b k
tof b g
tof a e
tof b a
tof e k
tof e a
tof e g
tof a e
tof a b
tof a c
tof a d
tof d b
tof b a
tof b d
tof b e
tof b g
tof b k
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l b
tof b k
tof b g
tof b e
tof a d
tof b a
tof d b
tof a e
tof b a
tof b g
tof b k
tof l b
tof b c
tof c l
H c
Z a b c
H c
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a l
tof a c
tof a d
tof a e
X e
tof a f
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof b k
tof l b
tof b g
tof b f
tof b e
tof a d
tof b a
X b
tof a k
tof a g
tof a f
tof a e
tof a c
X c
tof d b
tof d a
tof a d
tof a e
tof a f
tof a h
tof b a
tof a i
tof a j
tof a l
tof l a
tof a k
tof l b
tof b g
tof l d
tof l e
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l g
tof l e
tof b d
tof l b
tof l a
tof b h
tof b g
tof b f
tof b e
tof a d
tof d b
tof a l
tof a j
tof a i
X a
tof a h
tof a e
tof a f
X b
X a
tof f a
tof a f
tof a h
tof a k
tof l c
tof l b
tof a c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof b k
tof b h
tof a f
tof b a
tof f k
tof f a
tof f h
tof a f
tof a b
tof a c
tof a d
tof d b
tof b a
tof b d
tof b f
tof b h
tof b k
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l b
tof b k
tof b h
tof b f
tof a d
tof d b
tof d a
X e
tof a e
tof b f
tof b h
tof b k
tof l b
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a l
tof a c
tof a f
X f
tof a e
X e
tof a d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof b k
tof l b
tof b h
tof b d
tof b a
tof a h
X c
X b
tof a e
tof a f
tof a g
tof a i
tof a j
tof a l
tof d b
tof b d
tof b e
tof b f
tof l b
tof b g
tof l d
tof l e
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l g
tof l e
tof b d
tof l b
tof b g
tof b f
tof b e
tof d b
tof l k
tof a l
tof a j
tof a i
tof a g
X a
tof a d
tof a f
tof d a
tof d e
tof a d
tof a i
tof a j
tof a k
tof e b
tof b c
tof b e
tof b f
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X e
X d
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l k
tof b f
tof b e
tof e b
tof a k
tof a j
tof a i
tof a e
tof a d
tof d a
X d
tof e a
tof a e
tof a f
tof i l
X i
tof l i
tof a k
tof a i
tof d b
tof b d
tof l b
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X e
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l b
tof a i
tof i l
tof b d
tof d b
tof a k
tof a f
tof a e
tof e a
X b
X g
tof b a
tof a b
tof a d
tof a e
tof a f
tof a h
tof a i
tof a j
tof a k
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
X c
tof b c
tof l b
tof a c
tof l h
tof l g
tof a g
tof g l
tof a j
X i
tof a h
tof a f
X f
tof a d
tof a b
tof l b
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l c
tof b k
tof l b
tof a c
tof b i
tof b g
tof a e
tof b a
X b
tof a k
tof a i
tof b a
tof a g
X a
tof a b
tof a c
tof a d
X f
tof b a
tof a f
tof a i
tof a l
tof b e
tof d l
tof l b
tof l d
tof l h
tof l i
tof l j
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof l b
tof b c
tof a i
tof a g
tof a f
tof b a
tof l k
tof l j
tof l i
tof l h
tof l d
tof d l
tof b l
tof b e
X b
tof a b
tof b a
tof b l
X c
tof a f
tof a g
tof a i
tof a j
tof b e
tof h l
tof l a
tof l b
tof l h
tof l j
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
H c
Z a b c
H c
tof c l
tof l b
tof a c
tof l k
tof l j
tof l h
tof l a
tof h l
tof b e
tof b d
tof j l
tof l j
tof a j
X j
tof a i
tof a g
X a
tof a d
tof a f
tof d a
tof d b
tof a d
tof b a
tof a f
tof a h
tof a j
tof b c
tof b e
tof l b
tof l k
tof b c
tof c l
H c
Z a b c
H c
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l k
tof l j
tof b j
tof j l
tof a e
tof b a
tof a i
tof a k
tof b f
tof b h
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X h
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof b h
tof l b
tof h l
tof b k
tof b j
tof b i
tof b f
tof b e
tof a d
tof b a
tof d b
tof a l
tof a k
tof a j
tof a i
tof a h
tof a f
tof a e
tof b a
tof a c
X a
tof d b
tof a d
tof b d
tof a e
tof a f
tof a g
tof a h
tof a j
tof a l
tof l a
tof a k
tof b c
tof b e
tof b f
tof b g
tof b h
tof l b
tof l d
tof l g
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
tof a k
tof l a
tof l i
tof l g
tof l d
tof b h
tof b g
tof b f
tof b e
tof b d
tof d b
tof a b
tof a l
X a
X j
tof a h
tof a f
tof a k
tof e b
tof b c
tof b e
tof b f
tof l b
tof l k
tof b c
tof c l
H c
Z a b c
H c
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof l k
X b
tof b e
tof b f
tof e b
tof a j
tof a d
X i
tof a f
tof a l
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X i
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof l j
tof l i
tof i l
tof a d
tof b a
tof a h
tof a j
tof b e
tof b f
tof g l
X g
tof l g
tof b k
tof b g
tof l b
tof l h
tof b c
tof c l
H c
Z a b c
H c
X d
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X j
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof b g
tof l b
tof g l
tof b k
tof b j
tof b h
tof b f
tof a e
X e
tof b a
tof a b
tof a d
tof a l
tof a k
tof a h
tof a f
X d
tof j l
tof l a
tof l b
tof l j
tof a c
tof c l
H c
Z a b c
H c
X f
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X j
H c
Z a b c
H c
tof c l
tof l b
tof l c
tof l a
tof l j
tof j l
tof a b
tof a j
tof a g
tof e a
tof a e
tof a k
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X e
X i
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X e
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof d b
tof a k
tof a e
tof e b
tof b a
tof a e
tof e b
X a
X g
tof a d
tof a h
tof a j
tof a k
tof b c
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof l h
tof l g
tof g l
tof a k
tof a j
tof a h
tof a e
tof d b
tof a d
tof b d
X b
tof d a
X i
tof f a
tof a f
tof a l
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X e
X f
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X f
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof d b
tof a l
tof a f
tof f b
tof b a
tof a f
tof f b
X a
X g
tof a d
tof a h
tof a j
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l h
tof l g
tof g l
tof a l
tof a j
tof a f
X a
tof a h
tof a b
tof a d
tof b a
tof e a
tof a e
tof a f
tof a i
tof a k
tof a l
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X e
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a i
tof a f
tof a e
tof e a
tof b a
tof a c
tof a g
tof a e
X a
tof a f
tof a k
tof a l
tof b d
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l j
tof l i
tof l h
tof l g
tof b g
tof h l
tof g l
tof l h
tof b k
tof b f
tof b e
X d
tof b a
tof a i
tof a j
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l i
tof l h
tof h l
tof a l
tof a k
tof a j
tof a i
tof a g
tof a f
tof a e
tof b d
tof b f
tof b h
tof b j
tof b l
tof b a
tof a b
tof b a
tof b e
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X i
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
X c
tof b c
tof l b
tof a j
tof a h
tof a f
tof b a
tof l k
tof l j
tof l i
tof l g
tof g l
tof b l
tof b e
tof a l
X a
X e
tof a d
tof a e
tof e b
tof b e
tof a h
tof a i
tof a k
tof b c
tof b f
tof l b
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X e
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof l k
X b
tof b e
tof b f
tof e b
tof a d
tof a f
tof a j
tof a l
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l b
tof a i
tof i l
tof b d
tof a d
tof d b
tof a k
tof a j
tof a h
tof a f
tof e f
X g
X b
tof e a
tof a e
tof e a
X i
tof a i
tof a k
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X e
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l h
tof l g
tof g l
tof b l
tof b k
tof b i
tof b f
tof a e
tof b a
X b
tof a l
tof a k
tof a i
tof a f
tof e a
tof a g
tof a c
X a
tof a e
tof b d
tof b h
tof b j
tof b k
tof a b
tof b a
tof b g
tof g l
tof l a
tof l b
tof l g
tof l i
tof l k
tof a c
tof c l
H c
Z a b c
H c
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof b k
tof l b
tof a c
tof l i
tof l g
tof l a
tof g l
tof b j
tof b h
tof b g
tof a d
X d
tof b a
tof a b
tof d b
tof a k
tof a j
tof a h
tof a e
X j
tof a f
X a
tof a i
tof a l
tof b c
tof b d
tof b e
tof j l
tof l b
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof l j
tof h l
tof j l
tof l h
X b
tof b d
tof b e
tof d b
tof a i
tof a e
tof a k
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a g
tof e a
tof a f
X a
tof a e
tof e a
X c
X d
tof a i
tof a k
tof a l
tof e b
tof b e
tof b f
tof b g
tof d l
tof l a
tof b c
tof l b
tof l d
tof l f
tof l i
tof l j
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
X e
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
X d
X j
X e
H c
Z a b c
H c
tof c l
tof l b
tof b c
tof a c
tof l k
tof l j
tof l i
tof l f
tof l d
tof l a
tof d l
tof b g
tof b f
tof b e
tof e b
tof a l
tof a k
tof a i
tof a f
tof a e
tof e a
tof i a
tof a i
tof d b
tof b c
tof b d
tof b e
tof j l
tof l b
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
X i
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof l j
tof h l
tof j l
tof l h
tof b e
tof b d
tof d b
tof a i
tof i a
tof e a
tof a e
tof a k
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X e
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a k
tof a e
tof e a
tof a c
X a
tof a e
X d
tof a g
tof a i
tof a k
tof d b
tof b a
tof b d
tof b f
tof b g
tof b i
tof l b
tof b k
tof l g
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l c
tof b k
tof l b
tof a c
tof l j
tof l g
tof b i
tof b g
tof b f
tof b d
tof b a
tof d b
tof a k
tof a i
tof a g
X a
tof a e
tof h l
X c
X l
tof f a
tof a f
tof a l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X f
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a f
tof f a
X c
tof a g
X d
X a
tof a f
tof a i
tof a l
tof d b
tof b a
tof b d
tof b e
tof b f
tof g l
X g
tof l g
tof b i
tof b g
tof l b
tof l i
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X f
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l k
tof l j
tof l i
tof b g
tof l b
tof g l
tof b i
tof b f
tof b e
tof b d
tof b a
tof d b
tof a l
tof a i
tof a g
tof b f
tof b a
tof a b
X b
tof a d
tof a e
tof a h
tof a i
tof a j
tof a k
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X l
tof a c
tof a l
X c
tof a j
tof a i
tof a d
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l h
tof l g
tof g l
tof a l
tof a k
tof a h
tof a f
tof b a
tof e b
tof a e
X b
tof b e
tof e a
X d
tof a f
tof a g
tof a h
tof a i
tof a k
tof a l
tof b f
tof b g
tof b h
tof b i
tof d l
tof l c
tof l d
tof l e
tof l h
tof l j
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
X d
H c
Z a b c
H c
tof c l
tof a c
tof l k
tof l j
tof l h
tof l e
tof l d
tof l c
tof d l
tof b i
tof b h
tof b g
X f
X b
tof a e
tof l k
tof a l
X a
tof a i
tof a f
tof a e
tof a k
tof l c
tof l b
tof c l
H c
Z a b c
H c
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof l k
X b
tof b e
tof b f
tof e b
X i
tof a d
tof a f
tof a j
tof a l
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a d
tof d b
X b
tof a j
tof a h
tof b c
tof b a
tof b e
tof b f
tof g l
X g
tof l g
tof b k
tof b g
tof l b
tof l h
tof b c
tof c l
H c
Z a b c
H c
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof b g
tof l b
tof g l
tof b k
tof b e
X f
X e
tof a f
tof b a
tof a b
tof a l
tof a c
tof a h
tof a i
tof h l
tof l a
tof l b
tof l h
tof a c
tof c l
H c
Z a b c
H c
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof l b
X b
tof a c
tof l h
tof l a
tof h l
tof a k
tof a i
tof a h
tof a g
tof a b
tof b a
tof b e
tof a b
X i
tof a d
tof a h
tof a j
tof a k
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X h
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a d
X b
tof d b
tof b e
tof a k
tof a j
tof a h
tof a e
tof e a
tof a e
X g
tof b c
tof b a
tof a k
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X e
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b k
tof a e
tof b a
X b
tof a k
tof a c
tof e a
X i
tof d b
tof d a
tof a d
tof b a
X d
tof a f
tof a h
tof a j
tof a l
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X f
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a d
tof d b
tof a l
tof a j
tof a h
tof b f
tof a f
X f
tof f a
tof a f
tof g l
tof b l
X b
tof a c
tof a l
tof b a
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b l
tof a f
tof b a
X b
tof a l
tof a c
tof f a
X c
tof d b
tof d a
tof a d
tof a e
tof a f
tof a h
tof a i
tof a j
tof a k
tof a l
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof b h
tof l b
tof h l
tof b k
tof b j
tof b i
tof b f
tof b e
tof a d
tof b a
tof d b
tof a l
tof a k
tof a j
tof a i
tof a h
tof a f
tof b e
tof b a
tof e b
X a
tof b c
tof a b
X c
tof b e
X e
X g
tof a d
tof b a
tof a f
tof a g
tof a h
tof a j
tof a k
tof a l
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X e
H c
Z a b c
H c
tof c l
tof l c
tof b j
tof l b
tof a c
tof l i
tof l h
tof l g
tof b g
tof g l
tof b k
tof b h
tof b f
tof b e
tof b a
tof e b
tof a j
tof a d
X c
tof a i
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
X b
tof a b
tof b c
tof l i
tof l h
tof l b
tof a h
tof h l
X l
tof j l
tof l j
tof a k
tof a i
X a
tof a e
tof a f
tof d b
tof b d
tof b c
tof b e
tof l b
tof l k
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l k
tof l j
tof h l
tof j l
tof l h
X b
tof b d
tof b e
tof d b
tof a e
tof a i
tof a k
tof l b
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a k
tof a i
tof a g
tof a e
tof e a
tof a e
tof d b
tof b c
X b
tof b d
tof a k
tof b e
tof b f
tof l b
tof l g
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l k
tof l j
tof l g
tof b f
tof b e
tof b d
tof d b
tof a k
tof a e
tof e a
X h
tof a f
X a
tof a g
tof a i
tof a l
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
X b
tof b c
tof l b
tof a c
tof l i
tof l h
tof h l
tof a l
tof a i
tof a g
tof a f
tof f a
tof a f
tof d b
tof b d
tof b a
tof a l
tof b e
tof b f
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
X g
H c
Z a b c
H c
tof c l
tof b c
tof l b
tof a f
tof b a
tof l k
tof l j
tof l i
tof l g
tof g l
tof b l
tof b e
tof b d
tof d b
tof a l
tof f a
X a
tof a b
tof a c
tof a d
tof a e
tof a f
tof a g
tof a h
tof a j
tof a k
tof a l
tof d b
tof b a
tof b d
tof b e
tof b f
tof b g
tof b h
tof b j
tof b k
tof b l
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X f
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof b g
tof l b
tof g l
tof b k
tof b j
tof b h
tof b f
tof b e
tof b d
tof b a
tof d b
tof a j
tof a d
tof a c
tof e b
tof b c
X b
tof b e
tof b a
tof a i
tof b f
tof b g
tof b h
tof b k
tof b l
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X e
H c
Z a b c
H c
tof c l
tof l c
tof b h
tof b g
tof l b
tof g l
tof a c
tof b k
tof b i
tof b f
tof a e
tof b a
tof e b
tof a l
tof a k
tof a i
tof a h
tof a g
tof a f
tof b a
tof a c
tof a e
X a
tof a b
tof b e
tof a f
tof a h
tof a k
tof a l
tof b f
tof b g
tof l a
tof l d
tof l f
tof l j
tof a c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof l a
X c
tof l c
tof l j
tof l f
tof l d
tof b g
tof a b
tof b f
tof b e
tof a l
tof a k
X a
tof a h
tof b a
X b
tof d a
tof a d
tof a e
tof a i
tof a j
tof a k
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a k
tof a j
tof a i
tof a e
tof a d
tof d a
tof a c
tof a g
tof a d
X a
tof b a
tof a e
tof a j
tof a k
tof b c
tof b g
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l j
tof l i
tof l h
tof l g
tof g l
tof b k
tof b j
tof b g
tof b e
tof b a
tof a j
tof a d
X h
tof a i
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof a k
tof a i
tof a g
X a
tof a e
tof d a
tof a d
tof a f
tof a i
tof a j
tof a l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a j
tof a i
tof a f
tof a d
tof d a
tof a c
tof a g
tof a d
X a
tof b a
tof a f
tof a j
tof a l
tof b c
tof b g
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l j
tof l i
tof l h
tof l g
tof h l
tof b g
tof g l
tof l h
tof b f
tof a j
tof b a
tof a d
tof a i
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof l b
tof b a
tof b c
tof l i
tof l h
tof h l
tof b l
tof b i
tof b f
tof a b
X b
tof b g
tof a d
tof a e
tof a h
tof a j
tof a k
tof b c
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l h
tof l g
tof g l
tof a l
tof a k
tof a j
tof a i
tof a h
tof a f
tof a e
tof d b
tof d a
tof a d
X a
tof b a
tof d a
X i
tof a e
tof a f
tof a g
tof a h
tof a j
tof a k
tof a l
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
tof a d
H c
Z a b c
H c
tof c j
tof l j
tof c l
tof b c
tof l b
tof l i
tof i l
tof b d
tof d b
tof a l
tof a k
tof a e
X a
tof a b
tof d l
X d
tof l d
tof a i
tof a d
tof l a
tof l i
tof f b
tof b c
tof b f
tof b g
tof l b
tof l f
tof l g
tof l h
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X f
X k
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X f
X d
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l j
tof l i
tof l h
tof l g
tof l f
tof a d
tof l a
tof d l
tof b g
tof b f
tof a f
tof f b
tof a j
tof a i
tof a h
tof a g
tof d b
tof d a
tof a d
tof a e
X e
tof b a
tof a f
tof a h
tof a i
tof j l
X j
tof l j
tof a k
tof a j
tof l k
tof b c
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X f
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
H c
Z a b c
H c
tof c l
tof b c
tof l k
tof b j
tof l b
tof j l
tof b e
tof a k
tof a i
tof a e
X c
tof b a
tof b f
tof b h
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X h
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
X c
tof b c
tof l b
tof a h
tof a j
tof a f
tof a d
tof d b
tof d a
X a
tof b d
tof a b
tof l i
tof l h
tof h l
tof a f
tof a g
tof a h
tof b a
tof a i
tof a j
tof a l
tof b c
tof d l
tof l a
tof l b
tof l d
tof l f
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l a
tof a c
tof b j
tof b i
tof l b
tof l h
tof l f
tof l d
tof b d
tof d l
tof b a
tof a l
X i
X a
tof a h
X f
tof a b
tof d b
tof b c
tof b d
tof a e
tof a k
tof a l
tof b e
tof j l
tof l b
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof l j
tof h l
tof j l
tof l h
X b
tof b d
tof b e
tof d b
tof a k
tof a i
tof a e
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a j
tof a g
tof d a
tof a f
X a
tof a d
tof d a
X c
tof i l
X i
tof l i
tof a j
tof a i
tof d b
tof b d
tof b f
tof b g
tof a c
tof l a
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
X j
H c
Z a b c
H c
tof c l
tof l a
X c
tof a c
tof l i
tof a i
tof i l
X b
tof b d
tof b g
tof b f
tof d b
tof a f
X a
tof h l
tof l h
X d
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a j
tof a d
tof d a
tof a c
X e
tof a d
X a
tof a g
tof a i
tof a j
tof e b
tof b a
tof b e
tof b f
tof b g
tof b i
tof l b
tof b j
tof l g
tof l k
tof b c
tof c l
H c
Z a b c
H c
X e
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l k
tof l j
tof l g
tof b j
tof b i
tof b g
tof b f
tof b e
tof b a
tof e b
tof a j
tof a i
tof a g
tof d a
tof a d
tof d a
tof h l
X c
X l
tof a e
tof a f
tof a j
tof a k
tof a l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a j
tof a f
tof a e
tof a d
tof d a
tof a f
tof a g
X c
X a
tof a d
tof a e
tof a i
tof a j
tof a k
tof a l
tof f b
tof b a
tof b f
tof b g
tof b i
tof b j
tof b k
tof b l
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l k
tof l j
tof l i
tof b g
tof l b
tof g l
tof b k
tof b j
tof b f
tof a i
tof b a
tof f b
tof a l
tof a k
tof a j
tof a g
tof b a
X b
tof b f
tof a b
tof b e
tof b d
tof a h
tof a i
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X l
tof a c
tof a l
X c
tof a i
tof a d
tof a j
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l h
tof l g
tof g l
tof a l
tof a j
tof a h
tof a f
tof b a
tof d b
tof a d
X b
tof b d
tof d a
tof a f
tof a g
tof a h
tof a i
tof a j
tof a l
tof b c
tof b f
tof b g
tof b h
tof b i
tof l a
tof l b
tof l d
tof l e
tof l g
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l k
tof l g
tof l e
tof l a
tof a l
tof l d
tof b i
tof b h
tof b g
tof b f
tof b d
tof e b
tof d b
X j
tof a d
X a
tof a i
tof b f
tof a b
tof b c
tof b e
tof l b
tof l k
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof l k
X b
tof b e
tof b f
tof e b
tof a j
tof a d
X i
tof a f
tof a l
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a d
tof d b
X b
tof b d
tof a h
tof b c
tof b a
tof a j
tof b f
tof g l
tof l b
X g
tof b g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof b g
tof l b
tof g l
tof b j
tof b f
tof b d
tof b a
tof a b
tof a c
tof a e
tof a h
tof a i
tof a k
tof h l
tof l a
tof l b
tof l h
tof a c
tof c l
H c
Z a b c
H c
X d
X f
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof l b
X b
tof a c
tof a h
tof l a
tof h l
tof a k
tof a j
tof a i
tof a g
tof a f
tof a e
tof d b
tof d a
tof a d
tof d a
X d
X c
tof a h
tof a i
tof a j
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof b j
tof b i
tof b h
tof a d
tof b a
tof d b
tof a j
tof a i
tof b a
tof a h
tof a c
tof a d
tof b g
tof b j
tof a b
tof b a
X b
tof b e
tof b f
tof l b
tof l g
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l k
tof l j
tof b g
tof l b
tof b j
tof b h
tof b f
tof b e
tof b a
tof a j
tof a h
tof a g
tof a b
X a
tof b a
tof b d
tof a b
tof b c
tof a e
tof a f
tof a h
tof a i
tof a j
tof a k
tof a l
tof d b
tof b a
tof b d
tof b e
tof b f
tof b h
tof b i
tof b j
tof b k
tof b l
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X f
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof b h
tof l b
tof h l
tof b k
tof b j
tof b i
tof b f
tof b e
tof a d
tof b a
tof d b
tof a l
tof a k
tof a j
tof a i
tof a h
tof a f
tof a e
tof a c
X a
tof b a
tof a b
tof a c
X g
tof a d
tof a e
tof b a
tof a f
tof a g
tof a h
tof a j
tof a k
tof a l
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a g
H c
Z a b c
H c
tof c l
tof l c
tof b k
tof b j
tof l b
tof b c
tof a h
tof a f
X f
tof b a
X b
tof a b
tof l i
tof l g
tof a k
tof a j
X a
tof a e
tof a d
tof f a
tof a c
X f
tof b a
tof a f
tof a l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof a f
tof b a
tof a l
tof a c
tof f a
X c
tof d a
tof a d
tof a f
tof a i
tof a j
tof a l
tof a c
tof b a
tof b d
tof b f
tof b i
tof b j
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X d
X f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
tof a d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b f
tof a i
tof b a
tof l j
tof d f
tof d l
tof l f
tof d a
tof l d
tof a d
tof b c
X g
X c
tof a g
tof b a
tof b h
tof l c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
X c
tof a j
tof b a
tof l j
tof l f
tof l d
tof l c
tof h l
X b
tof a l
X a
tof l b
tof b h
X d
tof a f
tof a i
tof a j
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a j
tof a i
tof a g
tof a d
tof d a
X d
tof a d
X c
tof a j
tof d b
tof b c
tof b d
tof b e
tof b f
tof l b
tof l g
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l k
tof l j
tof l g
tof b f
tof b e
tof b d
tof d b
X d
tof d a
tof a d
tof a j
tof d a
X h
tof a e
tof a f
tof a g
tof a i
tof a k
tof a l
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X f
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a j
tof a i
tof a g
tof a f
tof d a
tof a e
X a
tof a d
tof d a
X c
tof a f
tof a j
tof a k
tof a l
tof d b
tof b d
tof b e
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof d e
tof b d
tof d e
X d
H c
Z a b c
H c
tof c l
tof b c
tof l k
tof l j
tof l i
tof l e
tof l g
tof d b
tof a l
tof l d
tof a k
tof a j
tof a f
X a
tof a e
tof d a
tof f b
tof b a
tof a f
tof b c
tof l g
tof a h
tof a g
tof l h
tof l b
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof b g
tof l b
tof g l
tof b h
tof b f
tof b a
tof f b
tof a d
X c
tof a i
tof a j
tof d b
tof b a
tof b d
tof b f
tof b g
tof b h
tof b i
tof b j
tof b l
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X d
X f
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l c
tof b h
tof b g
tof l b
tof g l
tof a c
tof b j
tof b i
tof b f
tof a d
tof b a
tof d b
tof a l
tof a j
tof a i
tof a h
tof a g
tof b a
tof a f
tof a c
tof b d
X a
tof a b
tof a h
tof a l
tof l a
tof a j
tof b g
tof l c
tof l d
tof l e
tof l f
tof l i
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
H c
Z a b c
H c
tof c l
tof l a
tof l k
tof l j
tof l i
tof l f
tof l e
tof l d
tof b g
tof b f
tof a b
tof b d
tof a l
X j
X a
X h
tof a f
tof b c
tof a b
X c
tof a d
tof a i
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l h
tof l g
tof g l
tof a j
tof a i
tof a h
tof a d
tof b a
tof e b
X e
tof a b
tof b e
tof e a
tof a c
tof a d
tof a g
tof a h
tof b a
tof a j
tof b c
tof b f
tof l b
tof b g
X g
tof b h
tof l i
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof b c
tof l b
tof a j
tof a h
tof a g
X g
tof b a
tof l k
tof l j
tof l i
tof l h
tof l g
tof b f
tof b e
tof e b
tof a b
X a
tof b a
tof a b
tof b d
tof a e
tof a f
tof a h
tof a k
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X f
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X l
tof a c
tof a l
X c
tof a d
tof a i
tof a j
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof b c
tof a b
tof l b
X c
tof l h
tof l g
tof g l
tof a l
tof a k
tof a j
tof a i
tof a h
tof a f
tof a e
tof a d
X a
tof b a
tof a b
tof a d
tof a e
tof b a
tof a f
tof a g
tof a h
tof a j
tof a k
tof a l
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l c
tof b k
tof b j
tof l b
tof a c
tof l i
tof l g
tof b g
tof g l
tof b f
tof a h
tof b a
tof a b
tof a k
tof a j
tof a e
tof a d
tof h l
tof l b
X l
tof l h
X c
tof a i
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a d
H c
Z a b c
H c
tof c l
tof a b
tof b c
X b
tof l i
tof l h
tof l b
tof f l
tof h l
tof a h
tof a j
tof d b
tof b a
tof b d
tof b l
tof l a
tof b c
tof l b
tof l f
tof l j
tof a c
tof c l
H c
Z a b c
H c
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
H c
Z a b c
H c
tof c l
tof l b
X c
tof b a
tof a c
tof l j
tof a f
tof l a
tof f l
tof b l
tof b e
tof a b
tof a j
X a
tof a f
tof a k
tof a l
tof b c
tof j l
tof l b
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X f
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof l j
tof j l
X b
tof b d
tof b e
tof d b
tof a k
tof a i
tof a e
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X h
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof l i
tof l h
tof a h
tof h l
tof a g
tof a f
tof b a
X b
tof b f
tof a b
X h
tof a h
tof l i
tof a l
tof b g
tof l f
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
H c
Z a b c
H c
tof c l
tof b a
tof a c
tof l i
tof l f
tof b l
tof b i
tof b h
tof b g
tof a l
tof a i
tof a h
tof i a
tof a i
X i
tof i f
tof i b
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l h
tof l g
tof g l
tof a i
tof i a
tof a b
X a
tof a i
tof a d
tof a e
tof a f
tof a h
tof a j
tof a k
tof a l
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X f
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X e
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l b
tof a i
tof i l
tof b d
tof a d
tof d b
tof a k
tof a j
tof a h
tof a f
X g
tof a e
tof e a
tof a e
X a
X b
tof a f
X i
tof a i
tof a k
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X e
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l h
tof l g
tof g l
tof b l
tof b k
tof b i
tof b f
tof a e
tof b a
X b
tof a l
tof a k
tof a i
tof a f
tof e a
X c
tof d b
tof d a
tof a d
tof a f
tof h l
X h
tof l h
tof a j
tof a h
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
X c
tof b c
tof l b
tof a h
tof a j
tof b a
tof l i
tof l h
tof h l
tof b f
tof b d
tof a d
tof d b
tof b f
tof b a
tof f b
X a
tof a b
tof b f
X g
tof a d
tof b a
tof a g
tof a h
tof a i
tof a j
tof a l
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l h
tof b g
tof l b
tof g l
tof b j
tof b i
tof b h
tof b f
tof b a
tof f b
tof a j
tof a i
tof a d
X c
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a h
H c
Z a b c
H c
tof a l
X a
H c
Z a b c
H c
tof a b
X i
tof a f
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a g
X c
X a
X d
tof i a
tof a i
tof d b
tof a c
tof b a
tof b d
tof b e
tof b f
tof b i
tof l b
tof l g
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X h
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
X h
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof l j
tof l g
tof b i
tof b f
tof b e
tof b d
tof b a
tof d b
tof a i
tof i a
tof a e
tof a f
tof a g
tof a k
tof a l
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X f
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X e
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a g
tof a f
tof a e
tof e a
tof a c
X a
tof a e
X d
tof a f
tof a i
tof a k
tof a l
tof d b
tof b d
tof b e
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l k
tof l j
tof l i
tof l g
tof l b
tof g l
tof b e
tof a l
tof a k
tof a i
tof a f
tof a e
tof e a
tof a d
X a
tof b a
tof a f
tof a g
tof a h
tof a i
tof a j
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l c
tof g h
tof b g
tof l g
tof g h
X g
tof l b
tof b c
tof a j
tof b a
X c
tof b i
tof b f
tof b d
tof d b
tof a i
tof a d
X b
tof f b
tof b a
tof b f
tof b h
tof b g
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof b g
tof l b
tof g l
tof b h
tof a f
tof b a
tof a l
tof a h
tof a g
X a
tof a c
tof f a
tof a f
tof b a
tof a h
tof a i
tof a l
tof b c
tof b g
tof f l
tof l a
tof l b
tof l f
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X f
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l i
tof l h
tof a f
tof l a
tof f l
tof b g
tof b f
tof f b
tof a i
X a
tof a h
tof b a
X b
X c
tof d a
tof a d
tof a e
tof a f
tof a j
tof a k
tof a l
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X f
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a j
tof a f
tof a e
tof a d
tof d a
tof a g
X c
X a
tof a d
tof b a
tof a e
tof a f
tof a i
tof a j
tof a k
tof a l
tof b g
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l h
tof b g
tof l b
tof g l
tof b k
tof b j
tof b i
tof b f
tof b e
tof b a
tof a j
tof a i
tof a d
tof h l
X l
tof l h
X c
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a g
tof b f
tof b a
tof a b
X b
tof b e
X g
tof a d
tof a h
tof a j
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l h
tof l g
tof g l
tof a l
tof a j
tof a h
tof a f
tof d b
tof a d
X d
tof b d
tof d a
tof a d
tof a f
tof a g
tof a h
tof i l
X i
tof l i
tof a j
tof a i
tof l j
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l b
tof a i
tof i l
tof b d
tof a d
tof d b
tof a j
X a
tof a h
X g
tof a f
tof b c
tof b a
tof b g
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof b c
tof l b
tof b a
tof b c
tof l h
tof l g
tof g l
tof b g
X d
tof d b
tof b d
X i
tof a d
tof a e
tof a f
tof a h
tof a j
tof a k
tof a l
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X e
X f
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a d
tof d b
X b
tof a j
tof a h
tof b c
tof b a
tof b e
tof b f
tof g l
X g
tof l g
tof b k
tof b g
tof l b
tof l h
tof b c
tof c l
H c
Z a b c
H c
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof b g
tof l b
tof g l
tof b k
tof b f
tof b a
X b
tof a b
tof b e
tof a k
X c
tof a d
tof a h
tof a i
tof a j
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
X c
tof a b
tof b c
tof l i
tof l h
tof l b
tof a h
tof h l
tof a j
tof a i
tof a g
tof a f
tof b a
tof a d
X a
tof a b
tof a f
tof a h
tof a j
tof a l
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof h g
H c
Z a b c
H c
tof c l
X b
tof b c
tof l b
tof l j
tof l i
tof l h
tof g l
tof h g
tof a d
tof b d
tof a j
tof f b
tof b f
tof b a
tof a i
tof l b
tof b h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X f
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof b h
tof l b
tof h l
tof b i
tof a f
tof b a
tof f b
tof a l
X h
tof a e
X a
X i
tof d b
tof a d
tof b d
X f
tof b a
tof a f
tof a j
tof a k
tof a l
tof b e
tof b h
tof b i
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X e
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof b h
tof l b
tof h l
tof b k
tof b j
tof b i
tof b f
tof b e
tof a d
tof b a
tof d b
tof a l
tof a k
tof a j
tof a i
tof a h
tof a f
tof a e
X a
tof b a
tof e b
tof b e
tof a e
X c
X g
tof a c
tof a d
tof b a
tof a f
tof a g
tof a h
tof a j
tof a k
tof a l
tof b c
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X e
H c
Z a b c
H c
tof c l
tof l c
tof b j
tof l b
tof a c
tof l i
tof l h
tof l g
tof b g
tof g l
tof b k
tof b h
tof b f
tof b e
tof b a
tof e b
tof a j
tof a d
X c
tof a i
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof a b
tof b c
X b
tof l i
tof l h
tof l b
tof a h
tof h l
tof a k
tof a i
tof a g
tof a f
tof a e
X d
tof d a
tof a d
X g
tof b a
tof a f
tof a i
tof a j
tof a l
tof b c
tof b d
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l h
tof l g
tof g l
tof b l
tof b j
tof b i
tof b f
tof a d
tof b a
tof a l
tof a j
tof a f
X a
tof a i
tof d a
X c
tof a d
tof a f
tof a g
tof a j
tof a l
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a i
X i
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
X f
tof b d
tof d b
tof a j
tof a c
tof a e
X a
tof a j
tof a k
tof a l
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X h
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a j
tof a i
tof a g
tof a f
tof d a
tof a d
tof a e
tof d a
X c
tof a f
tof a j
tof a k
tof a l
tof b d
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof d e
tof a d
tof a k
X d
tof d e
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l h
tof l g
tof l b
tof b d
tof g l
tof a l
tof a j
tof a f
tof d a
tof h l
X c
tof e a
tof a e
tof a f
tof a i
tof a k
tof a l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X e
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a l
tof a k
tof a i
tof a f
tof a e
tof e a
tof a b
X a
tof a d
tof a f
tof a g
tof a h
tof a i
tof a j
tof a l
tof d b
tof a c
tof b a
tof b d
tof b f
tof b g
tof b h
tof b i
tof b j
tof b l
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
tof a d
H c
Z a b c
H c
tof c l
tof l c
tof b h
tof b g
tof l b
tof g l
tof a c
tof b j
X i
tof a f
tof a i
tof b a
tof a l
tof a j
tof a h
tof a g
X c
tof d a
tof a d
tof b a
tof a f
tof a h
tof a j
tof a l
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a d
tof d b
tof a l
tof a j
tof a h
tof f a
tof a f
X b
tof b f
tof f a
tof a i
tof a l
tof l a
tof b l
tof b d
tof b e
tof l b
tof b i
X i
tof l c
tof l h
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X f
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X f
H c
Z a b c
H c
tof c l
tof l b
X c
tof b a
tof a c
tof l k
tof l j
tof l i
tof l h
tof l a
tof b l
tof b i
tof b e
tof b d
tof a l
tof a i
tof a f
tof f a
X h
tof a e
tof a d
X a
tof a f
tof a g
tof a i
tof a j
tof a k
tof a l
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a j
tof d b
tof a d
tof b d
X b
X j
tof a h
tof b c
tof b e
tof j l
tof l b
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X h
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof l j
tof j l
tof b e
tof b d
tof d b
tof a l
tof a k
tof a i
tof a h
tof a g
tof a f
tof a e
tof g a
tof a b
tof a g
tof b l
tof b a
tof a b
tof b h
tof b i
tof b j
tof b k
tof d l
tof l a
tof l d
tof l e
tof l g
tof l h
tof l i
tof l j
tof l k
tof c l
H c
Z a b c
H c
X d
X e
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l a
tof a c
tof l k
tof l j
tof l i
tof l h
tof l g
tof l e
tof l d
tof d l
tof b l
tof b k
tof b j
tof b i
tof b h
tof b g
tof g b
tof a l
X l
tof a d
tof a h
tof a i
tof a j
tof d b
tof b c
tof b d
tof b e
tof j l
tof l b
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
X i
X j
X k
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
H c
Z a b c
H c
tof c l
tof b c
tof l k
tof l j
tof l b
tof j l
tof a i
X c
tof a e
tof b a
tof a k
tof b h
tof b j
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X h
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
X c
tof b c
tof l b
tof a k
tof a j
tof a e
tof a d
tof b a
tof l i
tof l h
tof h l
tof b h
tof d b
tof b d
X a
tof b a
tof b h
tof a b
tof a e
tof a g
tof b a
tof a i
tof a j
tof a k
tof b c
tof d l
tof l a
tof l b
tof l d
tof l e
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof b j
X d
tof b i
H c
Z a b c
H c
tof c l
tof l a
tof a c
tof l b
tof l h
tof l e
tof l d
tof d l
tof b k
tof b d
tof b a
tof d b
tof a d
X b
tof b d
X k
tof a j
X a
tof a h
X e
tof i l
tof l b
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
X d
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l j
tof l i
tof i l
tof a d
tof b a
tof a h
tof a j
tof b e
tof b g
tof b i
tof b k
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X g
X i
H c
Z a b c
H c
tof c l
tof l c
tof b h
tof l b
tof a c
tof l g
tof g l
tof b k
tof b j
tof b i
tof b e
tof a g
tof b a
tof a d
tof a k
tof a j
tof a i
tof a h
tof i a
tof a i
X i
tof i e
tof j l
tof l a
tof l b
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l b
tof l a
tof j l
tof b d
tof d b
tof a i
tof b i
tof i a
tof a b
tof b i
X a
X g
tof a d
tof a h
tof a j
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l h
tof l g
tof g l
tof a j
tof a i
X a
tof a h
tof a b
tof a d
tof b a
tof e a
tof a e
tof a k
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X e
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a k
tof a e
tof e a
X c
tof b a
tof a g
tof a e
X a
tof a i
tof a k
tof b d
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
tof a d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l h
tof l g
tof l b
tof g l
tof b g
tof b k
tof b e
tof a i
tof b a
tof h l
tof l h
X c
tof a j
tof l b
tof l i
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a k
X a
tof j l
X l
tof l j
X c
tof a e
tof a b
tof a h
tof d b
tof b c
tof b d
tof b e
tof l b
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l k
tof l j
tof j l
X b
tof b d
tof b e
tof d b
tof a e
tof a i
tof a k
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X h
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
X c
tof a b
tof l c
tof l b
tof l i
tof l h
tof h l
tof a k
tof a j
tof a i
tof a h
tof a g
tof a e
tof b d
tof b a
X a
tof a b
tof a e
X h
tof b a
tof a h
tof a j
tof a k
tof b g
tof d l
tof l c
tof l d
tof l e
tof l j
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof a k
tof a j
tof a h
tof b a
tof l k
tof l j
tof l e
tof l d
tof l c
tof d l
tof b g
X a
X c
tof a e
tof d b
tof b d
tof b a
tof a h
tof a i
tof a j
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof b j
tof b i
tof b h
tof a d
tof b a
tof d b
tof a j
tof a i
tof b a
tof a h
tof a c
X a
tof a b
tof b c
X g
tof a d
tof b a
tof a g
tof a j
tof b e
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof b c
tof l b
tof a j
tof a h
tof b a
tof l k
tof l j
tof l i
tof l g
tof g l
tof b g
tof b e
tof a g
X a
tof a b
tof a d
tof e a
tof a c
X e
tof b a
tof a e
tof a k
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a e
X d
tof d e
H c
Z a b c
H c
tof c l
X c
tof e k
tof e a
tof a d
tof d e
tof a i
tof a j
tof a c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b i
tof b e
tof a d
tof b a
tof a k
tof a j
tof a i
tof a e
tof d a
tof a c
X a
tof a d
tof a e
tof a g
tof a j
tof a k
tof b a
tof b h
tof d l
tof l c
tof l d
tof l e
tof l j
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof a k
tof a j
tof b h
X b
tof b a
tof l k
tof l j
tof l e
tof l d
tof l c
tof d l
tof a e
X c
tof a i
tof a j
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a j
tof a i
tof a g
tof a d
tof d a
X d
tof a d
X c
tof a j
tof d b
tof b d
tof b e
tof g l
tof l b
tof l g
tof l i
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof l k
tof l j
tof l i
tof l g
tof l b
tof g l
tof b e
tof b d
tof d b
tof a j
tof a d
tof d a
tof a b
X a
tof a c
tof a e
tof a g
tof a h
tof a k
tof e b
tof b a
tof b e
tof b g
tof b h
tof b k
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X e
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b k
tof b h
tof b g
tof b e
tof b a
tof e b
tof a d
X c
tof a i
tof a j
tof d b
tof b a
tof b d
tof b e
tof b g
tof b h
tof b i
tof b j
tof b k
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l c
tof b h
tof l b
tof a c
tof l g
tof g l
tof b k
tof b j
tof b i
tof b g
tof b e
tof a d
tof b a
tof d b
tof a k
tof a j
tof a i
tof a h
tof a g
X a
tof a e
X c
tof b a
tof a b
tof a c
tof a d
tof a e
tof b a
tof a h
tof a j
tof a k
tof b d
tof b g
tof e l
tof l e
tof l i
tof l k
tof a c
tof c l
H c
Z a b c
H c
X d
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof b c
tof a k
tof a j
tof a h
X h
tof b a
tof l k
tof l i
tof l e
tof e l
tof b g
tof a b
tof b d
tof a e
tof b a
X b
X c
tof a d
tof a g
tof a i
tof a j
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof a j
tof b i
tof b a
tof a b
X b
tof b d
tof b g
tof a e
tof a h
tof a k
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l h
tof l g
tof g l
tof a k
tof a i
tof a h
tof a e
tof a b
tof b a
X a
X i
tof a b
tof a e
tof a g
tof a h
tof a k
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a b
tof a k
tof b e
X a
tof b c
tof a b
tof a i
tof b d
tof j l
tof l b
tof l j
tof l k
tof b c
tof c l
H c
Z a b c
H c
X d
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X j
X h
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l k
tof l j
tof j l
X b
tof b d
tof b e
tof d b
tof a i
tof a e
tof a k
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X h
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof b k
tof b a
X b
tof b h
tof a b
X g
tof a e
X c
tof a i
tof e l
tof l e
tof l i
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X e
H c
Z a b c
H c
tof c l
tof b a
tof a c
tof l k
tof l i
tof l e
tof e l
tof b k
tof b i
tof b h
tof b g
tof a k
tof a i
tof a h
tof a e
tof i a
tof a i
X i
tof i b
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X h
X g
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof l h
tof l g
tof g l
tof a i
tof i a
tof a b
X a
tof a d
tof a e
tof a h
tof a j
tof a k
tof d b
tof b a
tof b d
tof b e
tof b h
tof b j
tof b k
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
X c
tof b c
tof l b
tof a k
tof a j
tof b a
tof l i
tof l h
tof h l
tof b h
tof b e
tof b d
tof a d
tof d b
tof a h
tof b e
tof b a
tof e b
X a
tof a b
tof b e
X g
tof a d
tof b a
tof a g
tof a h
tof a i
tof a j
tof a k
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
X e
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l h
tof l g
tof l b
tof g l
tof b k
tof b j
tof b i
tof b h
tof b g
tof b e
tof b a
tof e b
tof a j
tof a i
tof a d
X c
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
tof a k
tof b l
X b
X a
tof b c
tof b l
tof a c
tof a l
tof a i
tof a e
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof a g
X c
X a
X d
tof i a
tof a i
tof d b
tof b a
tof b d
tof b e
tof b i
tof g l
tof l a
tof l b
tof l g
tof l j
tof l k
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X i
H c
Z a b c
H c
tof c l
tof b a
tof a c
tof l k
tof l j
tof l g
tof l b
tof g l
tof i a
tof a i
tof b i
X e
X a
tof i a
X d
tof a d
tof a e
tof b a
tof a g
tof a h
tof a j
tof a k
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l c
tof b h
tof l b
tof b c
tof b a
X c
tof l g
tof g l
tof b k
tof b j
tof b i
tof b g
tof b e
tof b d
tof d b
tof a j
tof a i
tof a d
X b
tof e b
tof b a
tof b e
tof b g
tof b h
tof b k
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X e
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b k
tof b h
tof a e
tof b a
tof a k
tof a h
tof a g
X a
tof a c
tof e a
tof a e
tof b a
tof a h
tof a i
tof a k
tof b c
tof e l
tof l a
tof l b
tof l e
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X e
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X e
H c
Z a b c
H c
tof c l
tof l b
tof l a
tof a c
X c
tof l i
tof l h
tof l e
tof e l
tof b g
tof b e
tof e b
tof a b
tof a k
tof a i
X h
tof a d
X a
tof a b
tof a j
tof a k
tof b c
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof l h
tof l g
tof g l
tof a k
tof a j
tof a h
tof a e
tof d b
tof a d
X d
tof b d
tof d a
tof a d
tof a e
tof a g
tof a h
tof a i
tof a j
tof a k
tof i l
tof l b
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l j
tof l i
tof l b
tof i l
tof b d
tof a d
tof d b
tof a k
tof a j
tof a i
X a
tof a h
X g
tof a e
tof b c
tof b a
tof b g
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b g
tof b a
X b
X c
tof a b
tof a d
tof a e
tof a h
tof a i
tof a j
tof a k
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X d
X e
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
X c
tof a b
tof b c
tof l i
tof l h
tof l b
tof h l
tof a k
tof a j
tof a i
tof a h
tof a g
tof a e
tof b a
tof a d
X a
tof a b
tof a e
tof a h
tof a j
tof a k
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
X b
tof b c
tof l b
tof l j
tof l i
tof l h
tof l g
tof g l
tof a d
tof b d
tof a j
tof e b
tof b e
tof b a
tof a i
tof b h
tof b k
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
tof a e
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof b k
tof b i
tof b h
tof b a
tof e b
tof a k
tof a i
tof a h
tof d a
tof a d
tof a e
tof a i
tof a j
tof a k
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l h
tof l g
tof g l
tof b k
tof b j
tof b i
tof b e
tof a d
tof b a
tof a k
tof a j
tof a e
X a
tof a i
tof d a
X c
tof a d
tof a e
tof a g
tof a j
tof a k
tof d b
tof b d
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
X b
X e
tof b d
tof a k
X g
X j
tof a c
tof b h
tof b i
tof b k
tof a b
tof b a
tof b d
X b
tof b e
tof b g
tof b j
tof g l
tof l b
tof l g
tof l h
tof b c
tof c l
H c
Z a b c
H c
X g
X h
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
tof b h
H c
Z a b c
H c
tof c l
tof l c
tof l b
tof a c
tof l g
tof g l
tof b k
tof b j
tof b i
tof b g
tof b e
tof a d
tof b a
tof a k
tof a j
tof a i
tof a h
tof a g
tof a e
X c
tof d a
tof a d
X i
tof b a
tof a e
tof a h
tof a j
tof a k
tof i l
tof l b
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
tof a d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l b
tof i l
tof b d
tof d b
tof a j
tof a b
tof b e
X b
tof a c
tof b d
tof g l
tof l a
tof b c
tof l b
tof l g
tof l h
tof l i
tof l j
tof l k
tof a c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
H c
Z a b c
H c
tof c l
tof b c
tof l b
tof a k
tof l a
tof l j
tof l i
tof l h
tof l g
tof g l
tof b d
tof a b
X d
tof b e
X e
tof a h
tof b a
tof a k
tof d b
tof b d
tof b g
tof b h
tof b i
tof b j
tof b k
tof d l
tof l b
tof l d
tof l j
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
X c
tof l j
tof l d
tof d l
tof b k
tof b j
tof b h
X b
tof b i
tof b d
tof b g
tof a d
tof d b
tof a k
tof a g
tof a h
tof a j
tof h l
tof l b
tof l h
tof l i
tof b c
tof c l
H c
Z a b c
H c
X h
X j
X k
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
H c
Z a b c
H c
tof c l
tof b c
tof l i
tof l h
tof l b
tof h l
tof b j
tof b a
X b
tof b h
tof a b
X g
tof a d
X c
tof a i
tof d l
tof l d
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b a
tof a c
tof l j
tof l i
tof l d
tof d l
tof b j
tof b i
tof b h
tof b g
tof a j
tof a i
tof a h
tof a d
tof i a
tof a i
X i
tof i b
tof b c
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
H c
Z a b c
H c
tof c l
tof l b
X c
tof l c
tof a c
tof a i
tof i a
tof b a
X i
tof d a
tof a c
X d
tof b a
tof a d
tof a j
tof l b
tof a c
tof b c
tof c l
H c
Z a b c
H c
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof a d
tof b a
tof a j
X a
tof a c
tof d a
tof a d
tof a g
tof a i
tof a j
tof b a
tof b h
tof b i
tof d l
tof l d
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X d
H c
Z a b c
H c
tof c l
tof b a
tof a c
tof l j
tof l i
tof l d
tof d l
tof b j
tof b i
tof b h
tof a j
tof a i
X g
tof a d
tof a h
X a
tof a b
tof a i
tof g b
tof b a
tof b g
tof b h
tof b i
tof i l
tof a c
tof l a
tof l i
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X g
H c
Z a b c
H c
tof c l
tof l a
tof b c
tof b a
X c
tof l i
tof i l
tof b i
tof b h
tof b g
tof g b
tof a i
tof a d
tof a j
tof d b
tof b a
tof b d
tof b g
tof b h
tof b j
tof g l
tof l b
tof l g
tof l h
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l h
tof l g
tof l b
tof g l
tof b j
tof b h
tof a d
tof b a
tof a j
tof a h
tof a g
X a
tof a c
tof d a
tof a d
tof b a
tof a h
tof a i
tof a j
tof b c
tof d l
tof l a
tof l b
tof l d
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof l b
tof l a
tof a c
X c
tof l i
tof l h
tof l d
tof d l
tof b g
tof b d
tof a d
tof d b
tof a j
tof a i
tof b h
tof b c
tof b a
tof a b
tof a d
tof a g
tof b a
tof a j
tof b i
tof d l
tof l a
tof l b
tof l d
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof b a
tof l b
tof b c
X c
tof l i
tof l h
tof l d
tof d l
tof b j
tof b i
tof a j
tof a h
tof a g
tof b h
tof b a
tof a b
X a
tof b a
tof g l
tof l b
tof l g
tof l h
tof l i
tof l j
tof b c
tof c l
H c
Z a b c
H c
X g
X i
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X g
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l i
tof l h
tof l g
tof l b
tof g l
tof b d
X c
tof a d
tof a i
tof a j
tof d b
tof b a
tof b d
tof b h
tof b i
tof b j
tof h l
tof l b
tof l h
tof l i
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X g
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X h
X d
H c
Z a b c
H c
tof c l
tof b c
tof a c
tof l i
tof l h
tof l b
tof h l
tof b j
tof b i
tof b h
tof a d
tof b a
tof d b
tof a j
tof a i
tof a h
tof b a
X g
tof a d
tof a g
tof g b
tof b g
tof a i
tof a j
tof b c
tof b h
tof d l
tof l a
tof l b
tof l d
tof l g
tof l i
tof l j
tof a c
tof b c
tof c l
H c
Z a b c
H c
X d
X h
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X g
X d
H c
Z a b c
H c
tof c l
tof l b
tof a i
X a
tof l a
tof a c
tof g j
tof l g
tof l d
tof d l
tof b g
X b
tof g b
tof g h
tof b g
tof b d
tof b i
tof d l
tof l c
tof l d
tof l j
tof b c
tof c l
H c
Z a b c
H c
X d
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X d
H c
Z a b c
H c
tof c l
tof b c
tof l j
tof l d
tof l c
tof d l
tof b j
tof b i
tof b h
tof b g
tof b d
tof a j
tof a d
X a
tof a g
X c
tof b a
tof a b
tof a c
tof a h
tof h b
tof b a
tof b h
tof i l
tof a c
tof l a
tof l i
tof c l
H c
Z a b c
H c
X h
X i
X j
H 7
Z c d 7
H 7
H 6
Z 7 e 6
H 6
H 5
Z 6 f 5
H 5
H 4
Z 5 g 4
H 4
H 3
Z 4 h 3
H 3
H 2
Z 3 i 2
H 2
H 1
Z 2 j 1
H 1
H 0
Z 1 k 0
H 0
H a
Z 0 l a
H a
H 0
Z 1 k 0
H 0
H 1
Z 2 j 1
H 1
H 2
Z 3 i 2
H 2
H 3
Z 4 h 3
H 3
H 4
Z 5 g 4
H 4
H 5
Z 6 f 5
H 5
H 6
Z 7 e 6
H 6
H 7
Z c d 7
H 7
X i
X h
X g
H c
Z a b c
H c
tof c l
tof l a
tof b c
tof b a
X c
tof l i
tof i l
tof b h
tof a h
tof h b
tof b a
X b
X l
tof l a
tof l b
tof l c
tof l d
tof l e
tof l f
tof l g
tof l h
tof l i
tof l j
tof l k
tof k l
tof l k
tof j k
tof k j
tof i j
tof j i
tof h i
tof i h
tof g h
tof h g
tof f g
tof g f
tof e f
tof f e
tof d e
tof e d
tof c d
tof d c
tof b c
tof c b
tof a b
tof b a
END
