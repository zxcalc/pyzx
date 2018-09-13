# Synthesized by applying the method "Reversible Circuit Synthesis Using a Cycle-Based Approach" (http://arxiv.org/abs/1004.4320)
# (c) Copyright 2007-2010 Mehdi Saeedi  Morteza Saheb Zamani  Mehdi Sedighi  and Zahra Sasanian (http://ceit.aut.ac.ir/QDA/)
# Distributing this file without an express written permission or erasing this note is prohibited.
.v a b c d e f g h i j k 0 1 2 3
.i a b c d e f g h i j k
.o a b c d e f g h i j k
BEGIN
X a
tof a c
tof c a
tof c d
tof c e
tof d h
tof h c
tof h d
tof j h
tof h f
tof e i
tof i e
tof i h
tof i g
X g
tof d k
tof k c
tof k d
tof k e
tof j e
tof d a
tof a c
tof a k
tof a b
H a
Z k c a
H a
tof d b
tof d g
tof a d
tof a h
tof d a
tof a i
tof a j
X d
tof d f
H d
Z k b d
H d
tof e j
tof e h
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e h
tof e j
H d
Z k b d
H d
tof d j
tof i g
tof d i
tof d f
tof d a
tof a d
tof a j
tof i h
tof a i
H a
Z c k a
H a
tof k c
tof a k
tof d a
tof h f
tof j h
tof j e
tof k e
tof k d
tof d k
tof i e
tof e i
tof h d
tof h c
tof d h
tof c e
tof c d
tof a c
X a
tof c a
tof a c
tof c d
tof c f
tof d h
tof d c
tof h d
tof h e
tof h f
tof h g
tof d i
tof i d
tof f k
tof k f
tof k j
tof j d
tof k i
tof j e
tof j f
tof j g
tof j h
tof a j
tof j k
tof d f
tof a d
tof d k
tof d b
tof d e
tof d g
tof d h
tof j i
tof d j
H d
Z k c d
H d
tof d k
tof d b
tof d a
tof d g
tof d h
tof d i
H d
Z k b d
H d
tof d k
tof d a
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d a
tof d k
H d
Z k b d
H d
tof d i
tof h g
tof d h
tof d a
tof d b
tof d k
H d
Z k c d
H d
tof d j
tof d i
tof d h
tof d f
tof d e
tof d b
tof d c
tof a d
tof d k
tof j f
tof j c
tof a j
tof j k
tof h e
tof j h
tof j d
tof k j
tof k i
tof k f
tof f k
tof i d
tof i c
tof d i
tof d f
tof c d
X f
tof h c
tof d h
tof c g
X b
tof i b
tof c i
tof h c
tof h g
tof h j
tof h k
tof i a
tof i j
tof j i
tof i h
tof k a
tof d b
tof d e
tof k d
tof d k
tof k i
tof a b
tof j a
tof j c
tof a j
tof j f
tof a g
tof a h
tof a i
tof d c
tof d a
tof d g
tof d h
tof d j
H d
Z k c d
H d
tof d k
tof d a
tof d c
tof d e
tof d f
tof d h
tof d i
tof d j
H d
Z k b d
H d
tof d j
tof d b
tof d c
tof d e
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d e
tof d c
tof d b
tof d j
H d
Z k b d
H d
tof j i
tof j h
tof d j
tof d f
tof d e
tof d c
tof d a
tof d k
H d
Z k c d
H d
tof d j
tof d g
tof d f
tof d e
tof a b
tof d a
tof d c
tof d k
tof a j
tof a g
tof j a
tof k a
tof a f
tof j c
tof j b
tof k i
tof k e
tof k d
tof k b
tof h j
tof i h
tof a b
tof i a
tof h k
tof h c
tof c h
tof c i
tof a c
X a
tof c a
tof a c
X d
tof c g
tof h c
tof h d
tof k h
tof h e
tof e k
tof i c
tof i d
tof i f
tof e g
tof i g
tof e i
tof e b
tof f j
tof j b
tof j c
tof j f
tof j g
tof g j
tof j i
tof d a
tof a d
tof a f
tof a i
tof e a
tof a j
X e
tof e f
H e
Z k c e
H e
tof d k
tof d b
tof d c
tof d g
H d
Z k b d
H d
tof g k
tof g a
tof g b
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g i
tof g b
tof g a
tof g j
tof g k
H d
Z k b d
H d
tof j i
tof d j
tof d g
tof d c
tof d b
tof d k
H e
Z k c e
H e
tof e j
tof e g
tof e f
tof e b
tof e a
tof e k
tof h e
tof k h
tof j f
tof a j
tof a d
tof d a
tof j g
tof j c
tof j b
tof f j
tof i g
tof i f
tof i d
tof i c
tof h g
tof d h
tof h d
tof d h
tof d c
tof c d
tof c b
X b
tof c j
tof h i
tof h j
tof a c
tof i a
tof i d
tof i g
tof i h
tof i k
tof d k
tof k c
tof k d
tof j e
tof k j
tof j k
tof j f
tof j h
tof a k
tof a f
H a
Z k c a
H a
tof e f
tof a e
tof a h
tof e a
tof a i
tof e b
tof e c
tof e g
tof d e
tof e j
tof e i
X e
H e
Z b k e
H e
tof k i
X i
tof e i
tof d f
H d
Z k j d
H d
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d f
tof d e
tof d j
H e
Z k b e
H e
tof e j
tof e i
tof e g
tof e f
tof e c
tof e a
tof e b
tof i h
tof a i
tof a f
tof a e
H a
Z k c a
H a
tof a f
tof a k
tof i a
tof a c
tof j k
tof j h
tof j f
tof k j
tof j e
tof k d
tof k c
tof i d
tof d k
tof i g
tof h j
tof h i
tof h d
tof c d
tof d h
tof c j
tof c g
tof a c
tof a b
X a
tof c a
tof a c
tof c d
tof c g
tof c i
tof c j
tof a h
tof h a
tof h c
tof h g
tof h j
tof h k
tof d i
tof i c
tof i d
tof i g
tof i h
tof i j
tof d k
tof k c
tof k d
tof k f
tof k j
tof j a
tof j c
tof j d
tof j h
tof j k
tof d a
tof a c
tof d f
tof d g
tof a d
tof a h
tof j i
tof a j
X i
tof k i
tof d a
tof d k
tof e b
tof d e
X d
H d
Z c k d
H d
tof d i
tof e h
tof e j
H e
Z k b e
H e
tof e f
tof e g
tof e h
H e
Z k j e
H e
tof e f
tof e g
tof e h
H i
Z b k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
tof e f
X d
X e
tof e g
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof e h
H e
Z k j e
H e
tof e h
tof e g
tof e f
H e
Z k b e
H e
tof e j
tof i h
tof e i
X e
tof i g
tof e b
H d
Z k c d
H d
tof d g
tof d f
tof d e
tof d b
tof d a
tof d k
tof a j
tof a i
tof a f
tof a d
tof a c
tof j d
tof d a
tof j k
tof h c
tof j h
tof h j
tof k j
tof k f
tof k d
tof k c
tof d k
tof i j
tof i d
tof i c
tof d i
tof c h
tof h k
tof h g
tof c i
tof h b
tof h e
tof a i
tof i a
tof i b
tof i c
tof i e
tof i f
tof i j
tof i k
tof i g
tof k b
tof a k
tof k d
tof f j
tof b f
tof b h
tof j b
tof a c
tof a f
tof a g
tof b g
H b
Z k c b
H b
tof b f
tof b g
tof b h
tof f k
tof f b
tof f a
H f
Z k b f
H f
tof d k
tof d j
tof d f
tof d g
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d g
tof d f
tof d j
tof d k
H f
Z k b f
H f
tof f a
tof f b
tof f k
tof b h
tof b g
tof b f
H b
Z k c b
H b
tof b h
tof b g
tof b f
tof a k
tof a g
tof a f
tof a d
tof i a
tof a c
tof j h
tof j f
tof j b
tof i f
tof f j
tof k d
tof i k
tof k b
X b
tof i g
tof i e
tof a i
tof h e
tof h b
tof h a
tof a h
tof c k
tof c j
tof c b
tof a d
tof a c
X c
tof c a
tof c b
tof c h
tof h c
tof c e
tof h d
tof h i
tof i e
tof i f
tof i h
tof i j
tof d k
tof k b
tof k c
tof k d
tof k e
tof k f
tof k i
tof k j
tof e j
tof j b
tof j e
tof j h
tof a b
tof a e
tof e k
tof e h
tof c i
tof e c
tof e j
H e
Z k c e
H e
tof c g
tof a c
H a
Z k b a
H a
tof a c
tof c d
tof c e
tof c h
H c
Z k j c
H c
tof c d
tof c e
tof c g
tof c h
tof c i
tof k i
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof c i
tof c h
tof c g
tof c e
tof c d
H c
Z k j c
H c
tof c i
tof c h
tof c g
tof c e
tof c d
tof a g
tof a c
H a
Z k b a
H a
tof a i
tof a g
tof a c
H e
Z c k e
H e
tof k c
tof e k
tof e j
tof e i
tof e h
tof a e
tof a b
tof h e
tof j h
tof j b
tof k e
tof e j
tof i f
tof k i
tof k d
tof k b
tof d k
tof i h
tof c d
X b
tof c b
tof g k
tof c g
tof d i
tof i d
tof i e
tof i k
tof k c
tof k i
tof k g
tof d j
tof j b
tof j d
tof j e
tof j f
tof j g
tof j h
tof j i
tof d a
tof a c
tof d f
tof a d
tof a i
tof d a
tof a j
tof d k
X d
tof d g
H d
Z c k d
H d
tof f k
tof f b
tof f a
tof f c
tof f g
H f
Z k b f
H f
tof e k
tof e j
tof e a
tof e f
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e f
tof e a
tof e j
tof e k
H f
Z k b f
H f
tof f g
tof f c
tof f a
tof f b
tof f k
H d
Z k c d
H d
tof d j
tof k g
tof d k
tof a f
tof d a
tof j i
tof a j
tof a d
tof a c
tof d a
tof j h
tof j g
tof j f
tof j e
tof j d
tof h j
tof j b
tof d j
tof k i
tof k c
tof g k
tof i k
tof i e
tof i d
tof d i
tof h k
tof h i
tof c g
tof h c
tof c k
tof c h
tof c e
tof a c
tof a b
X a
tof c a
tof a c
tof c e
tof c g
tof c i
tof c k
tof g h
tof h b
tof h c
tof h g
tof i d
tof k i
tof i h
tof k c
tof k f
tof k g
tof j d
tof j k
tof f j
tof a f
tof f a
tof f k
tof f h
H f
Z k c f
H f
tof e k
tof e b
tof e a
tof f g
tof j i
tof f j
tof e f
tof e i
X e
H e
Z b k e
H e
tof k i
X i
tof e i
tof f c
tof f h
H f
Z k j f
H f
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f h
tof f g
tof f c
tof f j
H e
Z k b e
H e
tof e j
tof e i
tof e g
tof e f
tof e a
tof e b
tof e k
H f
Z k c f
H f
tof f h
tof a j
tof f a
tof f k
tof a f
tof j k
tof j d
tof i h
tof k i
tof k g
tof k f
tof k c
tof i d
tof h g
tof c b
tof h c
X b
tof g h
tof c k
tof i g
tof c i
tof c e
tof c a
tof e c
tof c e
tof c j
tof c k
tof a h
tof h a
tof h b
tof h c
tof k d
tof h k
tof j f
tof h j
tof i b
tof i d
tof i e
tof i h
tof k b
tof j k
tof a k
tof k e
tof j c
tof j d
tof a j
tof j g
tof j h
tof a c
tof d b
tof a d
H a
Z k c a
H a
tof a b
tof a e
tof a g
tof d k
tof d a
tof d c
tof d e
tof j i
tof d j
H d
Z k b d
H d
tof e k
tof e a
tof e b
tof e h
X e
X d
tof e f
tof e g
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e h
tof e g
tof e f
tof e b
tof e a
tof e k
H d
Z k b d
H d
tof i e
tof d i
tof d j
tof d c
tof a b
tof d a
tof d k
tof a g
tof a e
H a
Z k c a
H a
tof a g
tof a e
tof a b
tof j k
tof j h
tof j d
tof j c
tof a j
tof j g
tof j f
tof j e
tof k e
tof k d
tof k b
tof i h
tof i g
tof i d
tof i b
tof h k
tof h j
tof h f
tof h d
tof h c
tof h b
tof h a
tof a h
tof c k
tof c j
tof c e
tof e c
X c
X b
X d
tof a c
tof c a
tof c b
tof c d
tof c e
tof c g
tof c j
tof c k
tof d h
tof h d
tof h e
tof h i
tof a i
tof i a
tof i e
tof i b
tof i k
tof k c
tof k d
tof k j
tof a j
tof j a
tof j b
tof j c
tof j e
tof a j
tof j f
tof j g
tof e j
tof a k
tof e k
tof e h
H e
Z k c e
H e
tof g b
tof g h
H g
Z k b g
H g
tof d k
X g
tof d f
tof d g
X d
tof d e
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d g
tof d f
tof d e
tof d k
H g
Z k b g
H g
tof g h
tof g b
H e
Z k c e
H e
tof e j
tof e h
tof e k
tof a k
tof j g
tof a j
tof j a
tof a f
tof j e
tof j c
tof j b
tof a j
tof k j
tof k d
tof k c
tof i k
tof i e
tof i b
tof i a
tof a i
tof h i
tof h e
tof h d
tof d h
tof c k
tof c j
tof c g
tof c e
tof c d
tof a c
tof c b
X b
tof c a
tof a c
tof c d
tof c e
tof i c
tof e h
tof h e
tof h c
X e
tof c j
tof c k
tof h f
tof i a
tof i d
tof i e
tof i h
tof a k
tof k a
tof k b
tof k c
tof k d
tof a k
tof k j
tof f g
tof a f
X g
tof j a
tof a e
tof a h
H a
Z k c a
H a
tof a g
tof d h
tof a i
tof d a
tof a j
tof d b
tof a d
tof d f
tof f g
X i
X d
H d
Z b k d
H d
tof k i
tof d i
H a
Z k j a
H a
tof a d
tof a f
tof a g
tof a h
tof a i
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a f
tof a d
H a
Z j k a
H a
tof a h
tof a f
tof a d
H d
Z k b d
H d
tof d f
tof a j
tof d a
tof j f
tof d b
tof a h
H a
Z k c a
H a
tof a h
tof a g
tof a k
tof a f
tof a e
tof j k
tof j g
tof k a
tof j a
tof a j
tof k d
tof k c
tof k b
tof i a
tof a k
tof h j
tof h e
tof i h
tof i d
tof i c
tof h k
tof h f
tof h c
tof e h
tof c k
tof c j
tof c e
tof c d
tof c a
X c
tof c b
tof d c
tof c d
tof c e
tof k c
tof c j
tof a h
tof h a
tof h c
tof h d
tof h e
tof h j
tof k h
tof h f
tof i a
tof i b
tof i g
tof i d
tof k d
tof d j
tof d b
tof j d
tof j g
tof j h
tof d a
tof a d
tof a e
tof a f
tof a h
tof j i
tof a j
tof d k
tof d f
tof d g
H d
Z k c d
H d
tof d k
tof d f
tof b h
tof d b
tof d j
H d
Z k b d
H d
tof b g
H b
Z k j b
H b
tof b g
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof j i
tof k i
tof a k
H i
Z b k i
H i
H i
Z c k i
H i
tof b h
tof b g
H b
Z k j b
H b
tof b h
tof b g
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d f
tof d b
tof d k
H d
Z k c d
H d
tof d g
tof d f
tof d b
tof d k
tof a j
tof a h
tof a f
tof a e
tof a d
tof a b
tof d a
tof j h
tof j g
tof j d
tof j b
tof k d
tof d j
tof h f
tof h c
tof k h
tof i g
tof i d
tof i b
tof i a
tof h j
tof h e
tof h d
tof h a
tof a h
tof c j
tof c e
tof c d
tof d c
X b
X e
tof a c
tof c a
tof c b
tof c f
tof h a
tof h d
tof h e
tof h f
tof h g
tof h i
tof h j
tof d i
tof i b
tof i d
tof i k
tof e k
tof j k
tof e j
tof i e
tof j e
tof k f
tof k h
tof j b
tof d a
tof a d
tof e h
tof a e
tof e k
tof e c
H e
Z k c e
H e
tof d k
tof d b
tof d e
H d
Z k b d
H d
tof g k
tof g j
tof g b
tof g c
tof g i
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g i
tof g c
tof g b
tof g j
tof g k
H d
Z k b d
H d
tof d e
tof d b
tof d k
H e
Z k c e
H e
tof e h
tof e c
tof e k
tof a h
tof a e
tof a d
tof d a
tof h f
tof k h
tof j k
tof j e
tof j b
tof i e
tof h e
tof e j
X e
tof i k
tof i b
X i
tof i d
tof h d
X c
tof c d
tof d i
tof h g
tof h a
X f
X a
tof d h
tof h c
tof h d
tof e i
tof i h
tof h e
tof h j
tof i k
tof k i
tof i f
tof k b
tof k c
tof k d
tof e h
tof k e
tof k j
tof a j
tof a c
tof j a
tof j d
tof j f
tof j k
tof a b
tof f j
tof a f
tof e k
tof e a
tof e b
tof d e
tof e g
H e
Z k c e
H e
tof d j
H d
Z k b d
H d
tof d e
tof d g
tof d j
tof f k
tof f b
tof f g
tof f i
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
tof d e
X d
tof d g
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f g
tof f b
tof f j
tof f k
tof d j
H d
Z k b d
H d
tof d j
tof d g
tof d e
H e
Z k c e
H e
tof e h
tof e g
tof a b
tof e a
tof e k
tof j f
tof a j
tof j a
tof a c
tof j k
tof k j
tof j d
tof a j
tof i h
tof i f
tof i e
tof k i
tof k c
tof k b
tof i k
tof i j
tof h e
tof e i
tof h j
tof h d
tof h c
tof d h
tof c i
tof c f
tof c d
tof c b
tof c a
tof a c
X b
tof f c
tof c f
tof c g
tof c h
tof a h
tof h a
tof i f
tof i j
tof h i
tof i h
tof i a
tof i c
tof i e
tof i g
tof i k
tof d f
tof k d
tof k h
tof k i
tof k j
tof a j
tof j a
tof j c
tof a j
tof d j
tof j e
tof e j
tof a b
tof a f
tof a g
tof e a
tof a h
tof d k
H d
Z k c d
H d
tof d k
tof d b
tof g h
tof d g
tof g h
X d
H d
Z k b d
H d
tof e b
tof e c
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e c
tof e b
tof a j
tof e a
tof a e
H d
Z k b d
H d
tof d h
tof d g
tof d b
tof d k
H d
Z k c d
H d
tof j i
tof d j
tof d f
tof d e
tof d k
tof i h
tof a i
tof a g
tof a f
tof a b
tof j e
tof j c
tof j a
tof a j
tof i j
tof i f
tof k i
tof k d
tof i k
tof i g
tof i e
tof i c
tof h i
tof i a
tof h j
tof c h
tof h f
tof c g
tof f c
tof c b
X c
tof c f
tof c g
tof c i
tof a b
tof h a
tof k f
tof h k
tof h i
tof e i
tof i c
tof i e
tof i f
tof i h
tof i g
tof k i
tof k b
tof k d
tof k e
tof a j
tof a h
tof j a
tof d f
tof j d
tof j k
tof a e
tof f i
tof a f
tof d g
tof d i
tof d j
H d
Z k c d
H d
tof f g
tof d f
tof f k
tof f b
tof f a
tof f j
H f
Z k b f
H f
tof d k
tof d a
tof d c
tof d e
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d e
tof d c
tof d a
tof d k
H f
Z k b f
H f
tof f j
tof f i
tof f g
tof a b
tof f a
tof f k
tof d i
tof d g
tof d f
H d
Z k c d
H d
tof d j
tof d i
tof d g
tof d f
tof i f
tof a i
X f
tof a h
tof a e
tof j k
tof j h
tof j f
tof j d
tof j b
tof j a
tof a j
tof i e
tof k i
tof k d
tof k b
tof h g
tof i h
tof i c
tof h k
tof h i
tof c g
X b
tof i b
tof c i
tof c d
tof c j
tof i c
tof c k
tof h d
tof i h
tof k h
tof i e
tof k i
tof k d
tof k j
tof j a
tof j b
tof j c
tof j f
tof j k
tof d a
tof a b
tof a d
tof a g
tof a j
tof a k
tof b e
tof b g
tof b i
H b
Z k c b
H b
tof b e
tof b g
tof b i
tof g b
tof g c
tof g j
H g
Z k b g
H g
tof d k
tof d j
tof d e
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d e
tof d j
tof d k
H g
Z k b g
H g
tof g j
tof g c
tof g b
tof b i
tof b g
tof b e
H b
Z k c b
H b
tof b i
tof b g
tof b e
tof j k
tof a j
tof a g
tof a d
tof a b
tof d a
tof j f
tof j c
tof j b
tof j a
tof k j
tof i h
tof k i
tof k d
tof i k
tof i e
tof i c
tof i b
tof e i
tof h g
tof h f
tof h d
tof h b
tof h a
tof a h
tof c k
tof c d
tof d c
tof d j
X d
tof d f
tof c d
X b
tof c b
tof c g
tof d h
tof h b
tof h d
tof h f
tof h i
tof i a
tof i k
tof k i
tof j i
tof i e
tof i h
tof k b
tof k f
tof k g
tof j c
tof j f
tof f j
tof j g
tof d a
tof a d
tof a h
tof a j
tof d k
tof d c
tof d b
H d
Z k c d
H d
tof d b
tof d a
tof d c
tof d e
tof d j
tof d i
X d
H d
Z b k d
H d
tof k i
X i
tof d i
tof f a
tof f c
H f
Z k j f
H f
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f g
tof f c
tof f a
tof f j
H d
Z k b d
H d
tof d j
tof d e
tof d c
tof d a
tof d b
H d
Z k c d
H d
tof d b
tof d c
tof d k
tof j h
tof a j
tof a d
tof d a
tof j i
tof j g
tof j f
tof j e
tof j c
tof i h
tof k i
tof k g
tof k f
tof k e
tof k b
tof i k
tof i e
tof i a
tof h i
tof h f
tof h d
tof h b
tof d h
tof c j
tof c g
tof c f
tof c d
tof c b
tof d c
X b
tof a c
tof c a
tof c b
tof c f
tof c j
tof c k
tof a h
tof h a
tof h b
tof h d
tof h e
tof h f
tof h g
tof a i
tof i a
tof i c
tof i g
tof i h
tof i k
tof f k
tof k c
tof k f
tof k g
tof k h
tof k j
tof j f
tof j i
tof a j
tof j k
tof a b
tof a d
tof a h
tof d k
tof d c
tof d a
tof e f
tof d e
H d
Z k c d
H d
tof e h
tof k i
H e
Z b k e
H e
tof e f
tof e h
tof c f
tof c h
tof c i
H c
Z k j c
H c
tof c f
tof c h
tof c i
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
tof e f
X g
X d
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof c i
tof c h
tof c f
H c
Z k j c
H c
tof c i
tof c h
tof c f
tof e i
tof e h
H e
Z k b e
H e
tof e i
tof e h
tof e f
H d
Z k c d
H d
tof d f
tof d e
tof d a
tof d c
tof a d
tof d k
tof a j
tof a h
tof a b
tof j k
tof j i
tof k j
tof j f
tof h g
tof k h
tof k c
tof f k
tof i k
tof i h
tof i c
tof i a
tof a i
tof h f
tof h e
tof h d
tof h b
tof c h
tof h a
tof c k
tof c j
X c
tof c b
tof a f
tof a c
tof h c
tof k c
tof c j
tof h a
tof h e
tof k h
tof h g
tof a i
tof i a
tof i b
tof i c
tof i d
tof i e
tof i g
tof a i
tof k i
tof a k
tof d f
tof k d
tof g j
tof j c
tof j g
tof j i
tof a c
tof a h
tof a j
H a
Z k c a
H a
tof d b
tof d i
tof a d
tof d c
tof d e
tof d h
tof d j
H d
Z k b d
H d
tof d j
tof d c
tof d g
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d g
tof d c
tof d j
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d f
tof d e
tof d c
tof a d
tof d b
tof a f
H a
Z c k a
H a
tof k c
tof k f
tof k d
tof a k
tof a j
tof a h
tof j i
tof j g
tof j c
tof k g
tof g j
tof k h
tof i g
tof i e
tof i d
tof i c
tof i b
tof i a
tof a i
tof h j
tof h g
tof h e
tof h c
tof h a
tof a h
tof c j
tof c f
X b
tof a c
tof c a
tof c b
tof c e
tof c f
tof c g
tof h a
tof h d
tof h g
tof h i
tof h k
tof a i
tof i a
tof i c
tof i e
tof i j
tof i k
tof k j
tof i g
tof j i
tof k b
tof k c
tof k e
tof j k
tof k g
tof k h
tof j c
tof d f
tof j d
tof a e
tof a g
tof e k
tof e a
tof e h
tof e i
H e
Z k c e
H e
tof d k
tof d b
tof d a
tof d c
tof d i
H d
Z k b d
H d
tof g k
tof g a
tof g c
tof g h
tof g i
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g i
tof g h
tof g c
tof g a
tof g k
H d
Z k b d
H d
tof d i
tof d f
tof d c
tof d a
tof d b
tof d k
H e
Z k c e
H e
tof i a
tof e i
tof e h
tof e k
tof a g
tof a e
tof h g
tof k h
tof j k
tof j f
tof j d
tof k j
tof i j
tof j c
tof k e
tof k b
tof i k
tof h a
tof a i
tof h k
tof h d
tof c g
tof c f
tof c e
tof c a
X c
tof c b
tof a c
X d
tof e c
tof c f
tof c g
X c
tof c e
tof c b
tof c k
tof a h
tof h a
tof h e
tof h f
tof h i
tof i b
tof i d
tof i h
tof i e
tof i k
tof a k
tof k a
tof k b
tof k c
tof k e
tof k g
tof k h
tof k i
tof d a
tof j d
tof a d
tof j e
tof j h
tof j k
tof a b
tof f h
tof f i
tof a f
tof a k
tof k i
H f
Z k c f
H f
tof f h
tof f i
tof d j
H d
Z k b d
H d
tof d j
tof a b
tof a c
tof a d
H a
Z k j a
H a
tof a b
tof a c
tof a d
tof a e
tof a i
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a e
tof a d
tof a c
tof a b
H a
Z k j a
H a
tof a i
tof a d
tof a c
tof a b
tof d j
H d
Z k b d
H d
tof d j
tof f i
tof f h
H f
Z k c f
H f
tof f i
tof a f
tof f h
tof a k
tof a d
tof a b
tof j d
tof d a
tof h e
tof k h
tof j k
tof k i
tof c g
tof c b
tof k c
X b
tof k a
tof a k
tof i k
tof i h
tof i d
tof i b
tof h i
tof h f
tof h a
tof a h
tof c e
tof e c
tof e k
X e
tof e f
tof c e
tof c d
tof a j
tof c a
tof d h
tof h b
tof h c
tof d f
tof h d
tof g k
X g
tof k h
tof h g
tof h j
tof i a
tof k b
tof k c
tof d j
tof j b
tof j d
tof j h
tof a e
tof a g
tof d k
tof k i
tof d c
H d
Z c k d
H d
tof d e
tof d f
tof d h
H d
Z k b d
H d
tof d e
tof d j
tof d a
H d
Z k j d
H d
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof a j
tof a e
tof d a
H d
Z k b d
H d
tof d i
tof d h
tof d f
tof d e
H d
Z c k d
H d
tof k c
tof d k
tof d i
tof a d
tof j d
tof d f
tof a h
tof a g
tof a b
tof h b
tof j h
tof h j
X b
tof d j
tof h g
tof k h
tof g k
tof i j
tof i a
tof h f
tof h d
tof h c
tof d h
tof c k
tof c j
tof c f
tof c e
tof c d
tof c a
tof d c
tof c e
X c
tof c d
tof c b
tof c f
tof c j
tof a h
tof h a
tof h d
tof h e
tof h g
tof i h
tof k h
tof i c
tof k e
tof k f
tof k g
tof a j
tof j a
tof j b
tof j f
tof j g
tof d b
tof d a
tof a d
tof a c
tof a e
tof a f
tof a h
tof a j
tof a k
tof g c
tof g a
tof g b
tof g i
H g
Z k c g
H g
tof d a
tof e c
tof d e
tof d j
H d
Z k b d
H d
tof e k
tof e f
tof e h
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e f
tof e c
tof e k
H d
Z k b d
H d
tof d j
tof d e
tof d c
tof a b
tof d a
H g
Z k c g
H g
tof g i
tof a c
tof g a
tof a k
tof a j
tof a h
tof a f
tof a e
tof a d
tof d a
tof j g
tof j f
tof j b
tof j a
tof a j
tof k h
tof k g
tof k f
tof k e
tof i h
tof i c
tof h g
tof h e
tof h d
tof h a
tof a h
tof c j
tof c f
tof c e
tof c d
tof c b
tof d c
X b
tof a c
tof c a
tof c b
tof c d
tof c e
tof c g
tof h a
tof h e
tof h g
tof h j
tof h k
tof d i
tof i d
tof i e
tof i j
tof i k
tof i f
tof d k
tof k b
tof k c
tof k d
tof k e
tof k f
tof k g
tof j h
tof k j
tof a k
tof a b
tof j a
tof j d
tof a e
tof a g
tof d a
tof a j
tof d c
tof d b
tof d f
tof d i
H d
Z k c d
H d
tof e k
tof e b
tof e a
tof e c
tof e f
tof e h
H e
Z k b e
H e
tof d k
tof d j
tof d c
tof d f
tof d g
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d g
tof d f
tof d c
tof d j
tof d k
H e
Z k b e
H e
tof e h
tof e f
tof e c
tof a b
tof e a
tof e k
H d
Z k c d
H d
tof d j
X f
tof i f
tof d a
tof d i
tof d c
tof j k
tof a j
tof a g
tof a e
tof j h
tof j d
tof j b
tof j a
tof h j
tof h g
tof k h
tof k f
tof k e
tof k d
tof c b
tof k c
X b
tof i d
tof d k
tof i j
tof i e
tof d i
tof h k
tof h e
tof h a
tof c g
tof c e
tof a c
X a
tof c a
tof a c
tof a d
tof c e
tof c f
tof c j
tof a h
tof h a
tof h d
tof h g
tof i a
tof i b
tof i d
tof k j
tof j f
tof i j
tof k b
tof k c
tof k e
tof j a
tof j b
tof j c
tof j h
tof g i
tof d g
tof d j
tof d k
tof d a
tof a d
tof d b
tof d e
tof d f
tof d h
H d
Z k c d
H d
tof f k
tof f b
tof f a
tof f c
tof j i
tof f j
tof f i
X f
H f
Z b k f
H f
tof k i
X i
tof f i
H g
Z k j g
H g
tof g i
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof g i
H g
Z k j g
H g
tof g i
H f
Z k b f
H f
tof f j
tof f i
tof f c
tof f a
tof f b
tof f k
H d
Z k c d
H d
tof d j
tof d i
tof d h
tof d g
tof d f
tof d e
tof d b
tof a d
tof d k
tof a j
tof a i
tof a g
tof d a
tof j h
tof j f
tof c b
tof j c
X b
tof j a
tof k j
tof c e
tof k c
tof i j
tof i f
tof i d
tof i b
tof i a
tof c j
tof c f
tof c d
tof c g
tof h e
tof h i
tof h j
tof h k
tof d i
tof i c
tof d e
tof i d
tof i f
tof i k
tof k i
tof i g
tof i j
tof k a
tof k c
tof k d
tof k h
tof j a
tof j b
tof j c
tof j e
tof j k
tof g a
tof a g
tof a h
tof a k
tof b d
tof b j
H b
Z k c b
H b
tof b d
tof b j
tof d b
tof d c
tof d g
tof d h
tof k i
H d
Z b k d
H d
tof d j
tof d a
tof d c
tof d f
tof d h
H d
Z k j d
H d
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d f
tof d c
tof d a
tof d j
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof d e
tof d c
tof d b
tof j e
tof b j
tof b d
H b
Z k c b
H b
tof b j
tof b d
tof a k
tof a h
tof a g
tof g a
tof k c
tof j k
tof j b
tof k j
tof j a
tof k i
tof h g
tof h e
tof k h
tof i k
tof h k
tof k d
tof i j
tof i g
tof i f
tof i e
tof i c
tof d i
tof h a
tof a h
tof a j
tof c d
X a
X c
tof c g
tof c b
X e
tof h c
tof c g
tof h b
tof h d
tof e i
tof i e
tof k e
tof h k
tof i j
tof k j
tof k f
tof i f
tof j i
tof a b
tof a c
tof k a
tof k d
tof j b
tof d c
tof j d
tof j e
tof j k
tof a e
tof a f
tof d g
tof a h
tof d a
tof a k
tof d i
H d
Z k c d
H d
tof d k
tof d f
tof d g
tof d h
tof d j
H d
Z k b d
H d
tof c b
tof a c
tof a i
H a
Z j k a
H a
tof c j
tof a c
tof a g
tof a i
H i
Z b k i
H i
tof k i
tof a k
tof i a
tof b i
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a g
tof a c
tof a b
H a
Z k j a
H a
tof a i
tof a g
tof a c
tof a b
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d g
tof d f
tof d k
H d
Z k c d
H d
tof d i
tof k c
tof a k
tof d a
tof a h
tof a g
tof a f
tof a e
tof a b
tof k e
tof k d
tof j k
tof k j
X b
tof j b
tof k f
tof k a
tof i j
tof i f
tof i e
tof h e
tof e i
tof h k
tof h j
tof h g
tof c d
tof h c
tof h b
X f
tof c h
tof c i
tof c j
tof e h
tof e b
tof h k
tof k h
tof h e
tof h f
tof h j
tof d i
tof i c
tof i d
tof i j
tof k a
tof j a
tof k g
tof j c
tof j g
tof d j
tof j h
tof a b
tof a g
tof f k
tof f c
tof f a
tof e f
tof f j
H f
Z k c f
H f
tof e c
H e
Z k b e
H e
tof k i
tof d k
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d j
tof d k
H e
Z k b e
H e
tof e j
tof e f
tof e c
tof e b
H f
Z k c f
H f
tof f j
tof f a
tof f c
tof f k
tof a g
tof a b
tof j h
tof j g
tof j c
tof k j
tof j a
tof k h
tof k g
tof k f
tof k e
tof h k
tof k b
tof i j
tof c d
tof i c
tof d i
X d
tof h j
X h
tof h e
tof h f
tof e h
tof c j
tof c h
tof c g
tof c a
X c
tof a c
tof c a
tof c h
tof h c
tof c b
tof d g
tof h d
tof h i
tof h j
tof i k
X i
tof k i
tof i g
tof f k
X i
tof i f
tof k e
tof k h
tof e j
tof j e
tof j f
tof j h
tof a j
tof j k
tof a c
tof d f
tof a d
H a
Z k c a
H a
tof a b
tof a e
tof a g
tof d k
tof d b
tof d e
tof d h
tof j i
tof d j
H d
Z k b d
H d
tof f k
tof f a
tof f b
tof f i
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f b
tof f a
tof f k
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d g
tof d f
tof d e
tof d b
tof d k
tof a g
tof a e
tof a b
H a
Z k c a
H a
tof a g
tof k f
tof j k
tof a j
tof a d
tof a c
tof j h
tof j e
tof e j
tof k i
tof h g
tof k h
tof k e
tof i k
tof i g
tof i f
tof f i
tof h j
tof h i
tof h d
tof c b
tof h c
tof c h
X b
tof c a
tof a c
X c
X g
tof c a
tof c i
tof d h
tof h b
tof h c
tof h d
tof g k
tof h g
tof k h
tof i c
X i
tof k i
tof i g
tof i f
tof k f
X i
tof k c
tof k j
tof a k
tof j a
tof a j
tof j d
tof d j
tof d k
tof d c
tof d b
tof d e
tof d f
tof d g
tof a d
tof d h
H d
Z k c d
H d
tof a c
tof a e
tof a f
H a
Z k b a
H a
tof a c
tof d e
tof a d
tof a f
tof a g
tof a h
tof a i
tof d a
tof a j
tof d k
tof d b
tof d g
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d g
tof d e
tof d b
tof a j
tof d a
tof d k
tof a i
tof a h
tof a g
tof a f
tof a e
tof a d
tof a c
H a
Z k b a
H a
tof a j
tof a h
tof a f
tof a e
tof a d
tof a c
H d
Z k c d
H d
tof d j
tof h g
tof d h
tof d f
tof d e
tof d b
tof d c
tof j a
tof a d
tof d k
tof k j
tof k i
tof h c
tof k h
tof i g
tof g k
tof i f
tof i c
tof h d
tof d h
tof d b
tof h d
X b
tof c i
tof c a
tof c e
tof c g
tof c j
tof c k
tof h a
tof h g
tof a i
tof i a
tof i c
tof i f
tof i g
tof i j
tof e k
tof k b
tof k c
tof k e
tof j f
tof k j
tof j k
tof j a
tof j c
tof j b
tof d g
tof j d
tof d b
tof d e
tof d i
tof d f
tof d a
tof a d
H a
Z k c a
H a
tof a f
tof a h
tof d k
tof d h
H d
Z k b d
H d
tof d j
tof d c
tof d e
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d e
tof d c
tof d j
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof d b
tof d k
tof a h
tof a f
H a
Z k c a
H a
tof a f
tof i g
tof a i
tof a e
tof a d
tof a b
tof j d
tof d a
tof j k
tof j g
tof k j
tof j f
tof j c
tof j b
tof k e
tof e k
tof i j
tof i f
tof i c
tof i a
tof a i
tof h g
tof h d
tof h b
tof h a
tof c k
tof c j
tof c e
X c
tof c g
X b
X d
tof a c
tof c a
tof c d
tof c j
tof g h
tof h b
tof h g
tof h i
tof i a
tof i d
tof i h
tof i f
tof i k
tof d k
tof d b
tof k d
tof k c
tof f j
tof j b
tof j c
tof j f
tof j h
tof j k
tof d g
tof a d
tof d a
tof d k
tof d c
tof d j
H d
Z k c d
H d
tof d b
tof d a
tof b d
tof d e
tof d f
tof d h
H d
Z k b d
H d
tof b g
tof b i
H b
Z k j b
H b
tof b d
tof b e
tof b f
tof b g
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof b i
tof c i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof c i
tof b c
H i
Z c k i
H i
tof k i
tof c i
tof b c
tof b h
tof b g
tof b f
tof b e
H d
Z b k d
H d
H b
Z j k b
H b
tof b i
tof b h
tof b g
tof b f
tof b e
tof d h
tof d f
tof d e
tof a b
tof d a
H d
Z k c d
H d
tof d j
tof a g
tof d a
tof d c
tof d k
tof a d
tof j k
tof j h
tof j f
tof c b
tof j c
X b
tof f j
tof k d
tof k c
tof c k
tof i d
tof d k
tof i h
tof i f
tof i a
tof h i
tof g h
tof h g
tof h b
tof g h
tof c e
tof c g
tof h a
tof h d
tof h e
tof a i
tof i a
tof i c
tof i d
tof i e
tof i f
tof i g
tof h i
tof a h
tof h i
tof i j
tof j a
tof a h
tof i h
tof d k
tof d b
tof d g
tof k d
tof k h
tof k i
tof j f
tof j g
tof a c
tof a e
tof a g
tof d k
H d
Z k c d
H d
tof d k
tof d a
tof d c
tof d g
tof d j
H d
Z k b d
H d
tof d k
tof d c
tof d e
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d e
tof d c
tof d k
H d
Z k b d
H d
tof d j
tof i g
tof d i
tof d c
tof d a
tof d k
H d
Z k c d
H d
tof d g
tof d k
tof k d
tof d b
tof i h
tof a i
tof a e
tof a c
tof j g
tof j f
tof j a
tof a j
tof k i
tof d k
tof i j
tof i f
tof i e
tof c d
tof i c
tof i a
tof a i
tof h g
tof h e
tof h b
tof h a
tof c k
tof c j
tof c g
tof c e
tof c a
X c
tof c b
tof a c
X g
tof c d
tof c e
tof c g
tof h c
tof c j
tof h a
tof d i
tof i b
tof i d
tof i h
tof i g
tof i k
tof a k
tof k a
tof k b
tof k f
tof k h
tof k i
tof d j
tof j d
tof j e
tof j g
tof j h
tof e j
tof j i
tof j k
tof g a
tof a g
tof a h
tof a j
tof e a
tof e f
tof c e
tof e g
H e
Z k c e
H e
tof c j
H c
Z k b c
H c
tof e g
tof e j
tof c e
tof e c
tof e f
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e g
tof e f
tof c j
tof e c
tof c e
tof c g
H c
Z k b c
H c
tof c j
tof c g
tof c e
H e
Z k c e
H e
tof e j
tof e i
tof e f
tof a g
tof e a
tof e k
tof j h
tof a j
tof g a
tof k i
tof j k
tof j g
tof j e
tof j d
tof d j
tof k h
tof k f
tof k b
tof k a
tof a k
tof i k
tof i h
tof i g
tof i d
tof i b
tof d i
tof h j
tof c d
tof h c
tof h a
tof c j
tof c g
tof c e
X b
tof a c
tof c a
tof c b
tof c e
tof c g
tof c h
tof a h
tof h a
tof h b
tof h c
tof h d
tof h e
tof f g
tof h f
tof h i
tof a i
tof i a
tof i c
tof i j
X d
tof i d
tof i k
tof a k
tof k a
tof k b
tof k d
tof k j
tof j a
tof j f
tof j k
tof a g
tof a i
tof a e
tof a j
H a
Z k c a
H a
tof a b
tof a e
tof a h
tof a j
tof f b
tof f a
tof b f
tof f c
tof f h
H f
Z k b f
H f
tof b d
tof b i
H b
Z k j b
H b
tof b c
tof b d
tof b f
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof b i
tof c i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof c i
tof b c
H i
Z c k i
H i
tof k i
tof c i
tof b h
tof b f
tof b d
H b
Z k j b
H b
tof b i
tof b h
tof b f
tof b d
tof b c
H f
Z k b f
H f
tof f h
tof f g
tof f c
tof a b
tof f a
tof h e
tof a h
tof a j
H a
Z k c a
H a
tof a j
tof a e
tof a i
tof j a
tof a g
tof j k
tof j f
tof k j
tof k d
tof k b
tof k a
tof i a
tof a k
tof i j
tof i d
tof i c
tof h a
tof a i
tof h g
tof h f
tof h d
tof c b
tof h c
tof c h
X b
tof a h
tof c g
X c
X a
tof c k
tof d h
tof d c
tof h d
tof h g
tof i k
tof h i
tof i h
tof i f
tof i b
tof k b
X f
tof k d
tof j g
tof k j
tof j b
tof j e
tof j f
tof a c
tof a e
tof a i
tof a j
tof d a
tof a k
tof d e
tof d h
H d
Z k c d
H d
tof d k
tof d b
tof d a
tof d c
tof d e
tof d g
tof d i
tof d j
H d
Z k b d
H d
tof d k
tof d j
tof d a
tof d f
tof d g
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d g
tof d f
tof d a
tof d j
tof d k
H d
Z k b d
H d
tof d j
tof d i
tof d g
tof d e
tof d c
tof d a
tof d b
tof d k
H d
Z k c d
H d
tof d h
tof a e
tof k c
tof a k
tof d a
tof k d
tof a j
tof a i
tof j g
tof j f
tof j e
X b
tof k j
tof j b
tof k g
tof h k
tof i h
tof i f
tof i b
tof h i
tof h g
tof h d
tof h c
tof d h
tof c k
tof c e
tof c a
tof a c
tof c a
tof c g
tof c j
tof h c
tof c k
tof h b
tof h e
tof j f
tof h j
tof i a
tof i f
tof k g
tof i k
tof k d
tof k e
tof k f
tof d c
tof a d
tof j a
tof j e
tof d a
tof a j
tof d b
tof d h
H d
Z k c d
H d
tof d k
tof a c
tof a e
tof d a
tof d i
X d
H d
Z b k d
H d
tof k i
X i
tof d i
tof a f
tof a i
H a
Z j k a
H a
tof c j
tof a c
tof a e
tof a f
tof a i
H i
Z c k i
H i
tof a k
tof i a
tof c b
tof b i
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a f
tof a e
tof a c
H a
Z k j a
H a
tof a i
tof a f
tof a e
tof a c
H d
Z k b d
H d
tof d e
tof d c
tof d a
tof d k
H d
Z k c d
H d
tof d j
tof d i
tof d h
tof d b
tof d a
tof a d
tof d c
tof a j
tof j a
tof a i
tof j f
tof j e
tof j d
tof h j
tof j c
tof c j
tof k g
tof k f
tof k e
tof h k
tof k d
tof i g
tof i f
tof h b
tof c k
tof c g
tof c a
tof g c
tof c g
X b
X e
tof c b
tof c j
tof j c
tof i j
tof h g
tof i g
tof h a
tof k a
tof k d
tof k e
tof k f
tof k g
tof j a
tof j b
tof j d
tof j e
tof j f
tof j i
tof j k
tof e a
tof a c
tof a f
tof a h
tof a j
tof a k
tof d e
tof d f
tof d h
tof j i
tof d j
H d
Z k c d
H d
tof d e
tof d f
tof d h
tof d j
tof a c
tof a d
H a
Z k b a
H a
tof a c
tof a i
tof a g
H a
Z k j a
H a
tof a d
tof a e
tof a g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a g
tof a e
tof a d
H a
Z k j a
H a
tof a g
tof a i
tof a c
H a
Z k b a
H a
tof a d
tof a c
tof d j
tof h f
tof d h
tof d i
tof d e
H d
Z k c d
H d
tof d j
tof d h
tof d i
tof a h
tof j k
tof k d
tof d e
tof a j
tof a c
tof j e
tof h e
tof e a
tof j i
tof j f
tof j d
tof j c
tof j b
tof k g
tof k f
tof i k
tof i j
tof c g
tof i c
tof i a
tof h g
tof h d
tof c j
tof c b
tof g c
X b
tof a c
tof c a
tof c b
tof c d
tof c e
tof c f
tof c g
tof c h
tof a h
tof h a
tof h b
tof h c
tof h d
tof h g
tof h j
tof g i
tof i j
X g
tof i g
tof i k
tof a k
tof k a
tof k b
tof k e
tof k g
tof k i
tof k j
tof a j
tof j a
tof j c
tof d a
tof a c
tof d f
tof a d
tof a i
tof a j
tof a e
tof a h
H a
Z k c a
H a
tof a e
tof d a
tof a h
tof d k
tof d b
tof d c
tof e g
tof d e
H d
Z k b d
H d
tof e k
tof e j
tof e a
tof e h
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e g
tof e a
tof e j
tof e k
H d
Z k b d
H d
tof d h
tof d g
tof d f
tof d e
tof d c
tof d a
tof d b
tof d k
tof a h
tof a e
H a
Z k c a
H a
tof a h
tof a e
tof a j
tof a i
tof a f
tof a d
tof a c
tof d a
tof j c
tof k a
tof j a
tof a j
tof i g
tof k i
tof k e
tof k b
tof a k
tof i j
tof g i
tof g k
tof k j
tof h j
tof h g
X d
tof c d
tof c b
tof h c
X b
tof h a
tof c a
tof a h
tof c g
tof c f
tof c e
tof a c
X c
tof c a
tof c d
tof c g
tof c j
tof h a
tof h d
tof h f
tof h g
tof i b
tof i h
tof i f
tof k f
tof k b
tof k c
tof k d
tof k e
tof d j
tof j b
tof j d
tof j f
tof g h
tof j g
tof j k
tof f a
tof a b
tof a c
tof a f
tof a g
tof a k
tof a d
tof a e
H a
Z k c a
H a
tof a c
tof a f
H a
Z k b a
H a
tof a c
tof a d
tof a e
tof a f
tof a i
tof g j
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g i
tof g h
tof g j
tof a f
tof a e
tof a d
tof a c
H a
Z k b a
H a
tof a f
tof a c
H a
Z k c a
H a
tof a e
tof a d
tof a k
tof a h
tof a g
tof a f
tof c b
tof a c
X b
tof f a
tof j k
tof i h
tof j i
tof j g
tof j f
tof j d
tof j b
tof k d
tof d j
tof k f
tof k e
tof k c
tof i k
tof i f
tof i b
tof h g
tof h f
tof h d
tof h a
tof c j
tof c f
tof c h
tof d h
tof h d
tof h e
tof h f
tof h i
tof h j
tof i c
tof i d
tof i e
tof i h
tof i k
tof k a
tof k e
tof d b
tof k d
tof k j
tof j c
tof j k
tof d a
tof a d
tof a e
tof a f
tof a i
tof d a
tof a j
tof d k
tof d g
tof d h
H d
Z k c d
H d
tof d k
tof d b
tof d c
tof d f
H d
Z k b d
H d
tof d j
tof d a
tof d b
tof d c
tof d e
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
tof a h
X d
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d e
tof d c
tof d b
tof d a
tof d j
H d
Z k b d
H d
tof d f
tof d c
tof d b
tof d k
H d
Z k c d
H d
tof d j
tof d h
tof d g
tof a b
tof d a
tof d k
tof a j
tof a i
tof a f
tof a e
tof a d
tof d a
tof j k
tof j c
tof k j
tof k e
tof k d
tof k b
tof k a
tof i k
tof h e
tof i h
X e
tof c d
tof i c
tof h j
tof h i
tof h f
tof h d
tof d h
X g
X c
X a
tof c b
tof c h
tof a h
tof h a
tof h b
tof h c
tof h d
tof h e
tof h i
tof h j
tof d i
tof i d
tof i g
tof i j
tof k a
tof j a
tof f g
tof f h
tof k f
tof k b
tof j c
tof j d
tof a j
tof j k
tof d b
tof d e
tof a d
tof e a
tof d e
tof a g
tof e k
tof e b
tof e h
tof e j
H e
Z k c e
H e
tof d h
tof d i
H d
Z k b d
H d
tof f k
tof f j
tof f a
tof f b
tof f i
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f h
tof f g
tof f b
tof f a
tof f j
tof f k
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof a b
tof d a
H e
Z k c e
H e
tof e j
tof e h
tof e g
tof a k
tof e a
tof a e
tof a j
tof a g
tof j a
tof a d
tof j k
tof j c
tof k h
tof k g
tof k f
tof k b
tof k a
tof i j
tof i g
tof i d
tof h d
tof d i
tof h j
tof h e
tof h c
tof h b
tof h a
tof a h
tof c g
X b
tof c d
tof c i
tof c k
tof d h
tof h b
tof h d
tof j g
tof h j
tof h k
tof i b
tof i c
tof i g
tof i h
tof a k
tof k a
tof k b
tof k c
tof k f
tof k g
tof k h
tof k i
tof j a
tof j d
tof j e
tof j f
tof j k
tof e a
tof a e
tof a g
tof a h
tof a j
tof a k
tof d f
tof d g
tof d j
H d
Z k c d
H d
tof d b
tof d c
tof e h
tof d e
tof e h
X i
X d
H d
Z b k d
H d
tof k i
tof d i
tof e j
tof e a
tof e f
H e
Z k j e
H e
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e f
tof a j
tof e a
tof a e
H d
Z k b d
H d
tof i h
tof d i
tof d e
tof d c
tof d b
H d
Z k c d
H d
tof j g
tof d j
tof j d
tof d f
tof a k
tof h g
tof a h
tof j e
tof e a
tof j k
tof i g
tof k i
tof k f
tof k c
tof k b
tof k a
tof a k
tof i c
tof i b
tof h k
tof h j
tof h d
tof h b
tof c d
tof d h
X d
tof c k
tof c i
tof c f
tof a e
tof a c
X a
tof c a
tof a c
tof c d
tof c f
tof c g
tof c j
tof c k
tof h a
tof h b
tof h f
tof d i
tof i c
tof i d
tof i f
tof k e
tof f k
tof k g
tof d j
tof j b
tof j d
tof j g
tof f j
tof j h
tof e g
tof e a
tof a e
tof a k
tof f c
tof f a
tof f b
tof k i
H f
Z c k f
H f
tof e b
tof e a
tof e h
tof e i
X e
H e
Z b k e
H e
X i
tof e i
tof f j
tof f a
tof f g
tof f h
H f
Z k j f
H f
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f h
tof f g
tof f a
tof f j
H e
Z k b e
H e
tof e h
tof e g
tof e a
tof e b
H f
Z k c f
H f
tof f j
tof f i
tof f h
tof f g
tof f b
tof f a
tof f c
tof f k
tof k g
tof a k
tof a e
tof e a
tof j h
tof j g
tof j d
tof j b
tof d j
tof k e
tof i f
tof i d
tof i c
tof d i
tof h f
tof h a
tof c k
tof c j
tof c g
tof c f
tof c e
tof c d
tof c a
tof a c
tof c b
X c
tof c d
tof c e
tof c f
tof h c
tof c g
tof c j
tof h a
tof h e
tof a i
tof i a
tof i c
tof i d
tof f k
X f
tof k g
tof i k
tof b f
tof k b
tof j i
tof k j
tof a d
tof a f
tof j a
tof j g
tof j h
tof a c
tof a i
tof a j
tof a k
tof d e
tof b d
tof b h
tof b j
H b
Z k c b
H b
tof b d
tof b f
tof b h
tof d b
tof b j
tof d k
tof d a
tof d c
tof d g
tof d i
H d
Z k b d
H d
tof e k
tof e j
tof e a
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e a
tof e j
tof e k
H d
Z k b d
H d
tof d j
tof d i
tof d g
tof d e
tof d c
tof d a
tof d b
tof d k
tof b j
tof b h
tof b f
tof b e
tof b d
H b
Z k c b
H b
tof b j
tof b h
tof b f
tof b e
tof b d
tof a k
tof j i
tof j f
tof j d
tof a j
tof a c
tof h g
tof j h
tof j a
tof k j
tof i g
tof k i
tof k f
tof k b
tof f k
tof i k
tof i d
tof i c
tof i a
tof a i
tof h j
tof c e
tof c b
tof h c
X b
tof h a
tof c j
tof c g
tof a f
tof a c
tof a d
tof c a
tof c b
tof c h
tof a h
tof h a
tof h b
tof h c
tof h d
tof h f
tof h k
tof a i
tof i a
tof i b
tof i c
tof i e
tof i g
tof i j
tof i k
tof a k
tof k a
tof k c
tof k e
tof k f
tof k h
tof k g
tof j i
tof k j
tof j b
tof j d
tof j f
tof d a
tof a b
tof a c
tof a d
tof e i
tof e j
tof e k
tof a e
tof f g
tof a f
tof e h
H e
Z k c e
H e
tof f k
tof f a
tof f j
H f
Z k b f
H f
tof d j
tof d a
tof d b
tof d g
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d g
tof d b
tof d a
tof d j
H f
Z k b f
H f
tof f j
tof a g
tof f a
tof f k
H e
Z k c e
H e
tof j i
tof e j
tof e h
tof e k
tof k e
tof a k
tof j f
tof a j
tof a d
tof a c
tof a b
tof d a
tof j d
tof j b
tof i j
tof k i
tof i g
tof k g
tof h f
tof k h
tof k c
tof k a
tof i a
tof a k
tof i e
tof c b
tof i c
X b
tof a i
tof h k
X d
tof c d
tof c a
tof h c
tof a h
tof c g
X c
tof c a
tof c e
tof h c
tof c j
tof h d
tof h g
tof g i
tof i b
tof i g
tof i j
tof i k
tof i h
tof a k
tof k a
tof k d
tof k e
tof k h
tof k i
tof k j
tof a j
tof j a
tof j c
tof j g
tof j i
tof e b
tof e g
tof a e
tof a h
tof a i
tof a k
tof e k
H e
Z k c e
H e
tof d k
tof d b
tof d a
tof e c
tof e f
tof d e
tof d g
tof d h
tof d j
H d
Z k b d
H d
tof e k
tof e j
tof e a
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e f
tof e c
tof e a
tof e j
tof e k
H d
Z k b d
H d
tof d j
tof d h
tof d g
tof d f
tof d e
tof d c
tof a b
tof d a
tof d k
H e
Z k c e
H e
tof e g
tof e b
tof e k
tof k e
tof k i
tof k h
tof a k
tof j a
tof a g
tof j i
tof j c
tof k a
tof a j
tof k d
tof a k
tof i k
tof h j
tof i h
tof i g
tof i b
tof g i
tof h g
tof h d
tof h c
tof c j
tof c g
tof c f
tof a c
tof c a
tof c e
tof a c
X b
tof c b
tof c d
tof c f
tof c h
tof d h
tof h i
tof d k
tof h d
tof a i
tof i a
tof i b
tof e f
tof i e
tof i g
tof i j
tof i k
tof k j
tof k b
tof d f
tof k d
tof j a
tof j c
tof j g
tof j h
tof j k
tof e c
tof e a
tof a e
tof a g
tof a h
tof a j
tof a k
tof e a
tof e i
H e
Z k c e
H e
tof e b
tof e a
tof d e
tof e g
tof e i
H e
Z k b e
H e
tof d k
tof d b
tof d c
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d g
tof d f
tof d e
tof d c
tof d b
tof d k
H e
Z k b e
H e
tof e i
tof e g
tof e a
tof e b
H e
Z k c e
H e
tof e i
tof a f
tof e a
tof a e
tof e c
tof j k
tof j h
tof a j
tof j a
tof e g
tof i e
tof e a
tof a g
tof j c
tof k j
tof k f
tof k d
tof i k
tof k b
tof d k
tof i j
tof i f
tof a i
tof h k
tof h i
tof h d
tof c d
tof d h
X f
X c
X a
tof c b
tof a c
tof c h
tof h a
tof h b
tof h d
tof h e
tof h f
tof h g
tof h i
tof h k
tof a i
tof i g
tof i a
tof i j
tof a k
tof k a
tof k d
tof k e
tof k j
tof d j
tof j b
tof c d
tof j c
tof j e
tof j f
tof j g
tof j h
tof j i
tof j k
tof a b
tof a e
H a
Z k c a
H a
tof a d
tof a e
tof a f
tof a g
tof a j
tof c g
tof c h
tof c j
H c
Z k b c
H c
tof c d
tof c g
tof c h
tof c j
tof d k
tof d e
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d e
tof d k
tof c j
tof c h
tof c g
tof c d
H c
Z k b c
H c
tof c j
tof c h
tof c g
tof c d
tof j g
tof j f
tof j e
tof j d
tof a j
H a
Z k c a
H a
tof a e
tof a c
tof a b
tof j k
tof j i
tof j h
tof j c
tof j b
tof k d
tof d j
tof k e
tof k c
tof k a
tof a k
tof i j
tof i g
tof i c
tof i a
tof h a
tof a i
tof h k
tof h g
tof h f
tof h e
tof c d
tof h c
tof a h
tof a b
X b
tof h a
tof c f
X f
tof c j
tof c k
tof h c
tof h d
tof i h
tof h f
tof h g
tof i a
tof i b
tof i k
tof k a
tof k c
tof k d
tof k e
tof g i
tof f g
tof k g
tof g i
tof j a
tof j b
tof j f
tof j c
tof d a
tof a c
tof a d
tof a e
tof a g
tof a h
tof e c
tof e a
tof e i
tof e j
H e
Z k c e
H e
tof c d
tof c g
tof c h
tof c j
H c
Z k b c
H c
tof c d
tof c g
tof c h
tof c j
tof f k
tof f c
tof f h
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f h
tof c g
tof f c
tof f k
tof c j
tof c h
tof c d
H c
Z k b c
H c
tof c j
tof c h
tof c g
tof c d
H e
Z k c e
H e
tof j i
tof e j
tof e a
tof a e
tof e c
tof a h
tof a g
tof a d
tof d a
tof j g
tof j f
tof j c
tof j a
X j
tof j b
tof k i
tof k e
X d
tof c d
tof k c
tof k a
tof i h
tof h g
tof h f
tof h c
tof h b
tof c h
tof c k
X c
tof c e
tof c a
tof c b
tof c d
tof c f
tof i j
tof h e
tof k a
tof k b
tof k d
tof a j
tof j a
tof j c
tof j f
tof g h
tof j g
tof g i
tof j k
tof d e
tof a d
tof a k
tof g c
tof g b
H g
Z k c g
H g
tof d k
tof d c
tof d h
tof d j
H d
Z k b d
H d
tof e k
tof e a
tof e c
tof e f
tof e g
tof e h
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e g
tof e f
tof e c
tof e a
tof e k
H d
Z k b d
H d
tof j h
tof d j
tof d e
tof d c
tof d k
H g
Z k c g
H g
tof g i
tof g h
tof g b
tof j g
tof g c
tof a k
tof a e
tof a d
tof j k
tof j f
tof j a
tof a j
tof k g
tof k d
tof i k
tof k b
X b
tof k a
tof i j
tof i g
tof i f
tof h e
tof h a
tof c j
tof c g
tof c f
tof c d
tof e h
tof h e
tof c e
tof h j
tof h k
tof d i
tof i b
tof i c
tof i d
tof i e
tof i f
tof i j
X g
tof i g
tof i k
tof j i
tof k b
tof k e
tof k f
tof j b
tof j c
tof j e
tof j f
tof a b
tof a d
tof a k
tof a e
tof a f
tof a i
H a
Z k c a
H a
tof a g
tof a h
tof d c
tof a d
H a
Z k b a
H a
tof a d
tof a e
tof a f
tof a i
tof d k
tof d j
tof d b
tof d f
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof i f
tof d i
tof d c
tof d b
tof d j
tof d k
tof a f
tof a e
tof a d
tof a c
H a
Z k b a
H a
tof a d
tof a c
tof a h
tof a g
H a
Z k c a
H a
tof a i
tof k e
tof a k
tof a d
X a
tof a b
tof c e
tof c b
tof i c
X c
tof j i
tof i j
tof k f
tof k b
tof i k
tof i g
tof i d
tof d i
tof h k
tof h j
tof h e
tof c e
tof e h
tof c d
tof a h
tof h a
tof h b
tof h c
tof h d
tof h g
tof h j
tof h k
tof d i
tof i b
tof i d
tof i g
tof i f
tof i j
tof k a
tof d c
tof k d
tof k f
tof a j
tof j a
tof j e
tof j f
tof j g
tof j h
tof d i
tof j i
tof d a
tof a d
tof a f
tof d k
tof e b
tof e h
tof d e
H d
Z k c d
H d
tof e k
tof e a
tof e f
tof e g
H e
Z k b e
H e
tof e k
tof e j
tof e a
tof e c
tof e f
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e f
tof e c
tof e a
tof e j
tof e k
H e
Z k b e
H e
tof e h
tof e g
tof a f
tof e a
tof e b
tof e k
H d
Z k c d
H d
tof d i
tof d h
tof d e
tof d b
tof k c
tof d k
tof a i
tof a d
tof a c
tof d a
tof i f
tof j i
tof h g
tof j h
tof j e
tof j a
tof a j
tof k f
tof k d
tof h k
tof k a
tof i j
tof i g
tof i d
tof i b
tof d i
tof h j
tof c d
tof h c
tof h b
tof a h
tof c h
tof c e
X b
X f
X g
tof c i
tof c j
tof c k
tof d h
tof h d
tof h f
tof h g
tof h j
tof h k
tof d i
tof i c
tof i d
tof i g
tof i k
tof a k
tof k a
tof k d
tof k f
tof a j
tof j a
tof j b
tof j e
tof j f
tof j h
tof j k
tof f a
tof a c
tof a f
tof g h
tof a g
tof a i
tof a j
tof a k
tof d k
tof d e
tof d f
tof d g
H d
Z k c d
H d
tof k g
H g
Z b k g
H g
tof g i
tof k g
tof g h
tof d g
tof g i
tof d j
tof d a
tof d e
tof d f
H d
Z k j d
H d
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof g i
tof d g
tof d f
tof d e
tof a j
tof d a
tof g h
H g
Z k b g
H g
tof a g
tof g i
tof g h
H d
Z k c d
H d
tof d h
tof d g
tof d f
tof d e
tof d k
tof a k
tof a f
tof a c
tof j f
tof f a
tof j k
X h
tof j h
X b
tof h j
tof j b
tof j e
tof a j
tof k f
tof k d
tof k a
tof a k
tof i k
tof i g
tof i d
tof i c
tof d i
tof i j
X k
X i
tof h f
tof h i
tof i f
tof i g
tof c k
tof c j
tof a c
X a
tof c a
tof a c
tof c d
tof i a
tof a k
tof k a
tof k b
tof k h
tof k i
tof a k
tof k j
tof a f
tof j a
tof j h
tof a b
tof a c
tof a g
tof a i
tof b f
tof b h
tof b i
tof b j
H b
Z k c b
H b
tof b f
tof d h
tof b i
tof d b
tof b j
tof d a
tof d e
tof d f
H d
Z k b d
H d
tof b c
tof b g
H b
Z k j b
H b
tof b c
tof b g
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof b c
tof i a
tof a j
tof a k
tof j i
H i
Z c k i
H i
tof k i
tof b h
tof b g
H b
Z k j b
H b
tof c g
tof b c
tof b h
H d
Z k b d
H d
tof d j
tof d f
tof d e
tof d a
tof d b
tof b j
tof b i
tof b h
tof b f
H b
Z k c b
H b
tof b j
tof b h
tof a b
tof b i
tof a k
X b
tof b f
tof a c
tof j a
tof k h
tof j k
tof j f
tof k a
tof a j
tof k i
tof k b
tof a k
tof i j
tof i g
tof i f
tof i a
tof a i
tof h k
tof h j
tof h i
tof h g
tof h e
tof h d
tof h b
tof d h
tof c i
tof c j
tof c k
tof a h
tof h a
tof h b
tof h f
tof h g
tof h j
tof h k
tof d i
tof i k
tof k i
tof i c
tof i d
tof i g
tof i f
tof k a
tof k e
tof d j
tof d a
tof j d
tof a j
tof j f
tof j h
tof j k
tof d a
tof a b
tof a k
tof f g
tof f i
tof d f
H d
Z k c d
H d
tof a c
tof a f
H a
Z k b a
H a
tof a c
tof a e
tof a f
tof f a
tof f k
tof f h
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f h
tof a g
tof f a
tof f k
tof i f
tof a i
tof a e
tof a c
H a
Z k b a
H a
tof i g
tof a i
tof a e
tof a c
H d
Z k c d
H d
tof d i
tof d e
tof a b
tof a k
tof d a
tof a d
tof a e
tof j d
tof d a
tof j k
tof h f
tof j h
tof h a
tof a j
tof k i
tof k e
tof c d
tof k c
tof k a
tof c k
tof i d
tof i c
tof h k
tof h g
tof h b
tof c a
tof a h
tof c j
tof c g
tof a c
tof c b
X c
tof c a
tof c d
tof f h
tof h f
tof c f
tof c j
tof i c
tof c k
tof i h
tof h g
tof h j
tof i e
tof a k
tof k a
tof d b
tof k d
tof k f
tof k g
tof k h
tof k j
tof f j
tof j c
tof j f
tof d j
tof j h
tof a c
tof a f
tof a k
tof d c
tof d e
tof d g
H d
Z k c d
H d
tof d b
tof d a
tof d c
tof d f
tof d g
H d
Z k b d
H d
tof d k
tof d a
tof d c
tof d e
tof d f
tof d g
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof d c
tof d a
tof d k
H d
Z k b d
H d
tof d g
tof d f
tof d c
tof d a
tof d b
H d
Z k c d
H d
tof j h
tof d j
tof d g
tof d e
tof d b
tof d c
tof k f
tof a k
tof a c
tof j f
tof j c
tof f j
tof h g
tof k h
tof k d
tof k b
tof k a
tof a k
tof i k
tof h j
tof i h
tof i e
tof c d
tof i c
tof d i
tof h f
tof c f
tof f h
tof k j
tof c k
tof c b
tof c a
X b
X e
tof d c
tof c b
tof c d
tof c e
tof c f
tof k g
tof c k
tof h i
tof c h
tof h a
tof i b
tof i e
tof k f
tof i k
tof k b
X f
tof d j
tof j b
tof j d
tof j f
tof j g
tof j h
tof j k
tof d a
tof a b
tof d g
tof d h
tof a d
tof a j
tof d k
tof d c
tof d a
tof d e
tof d f
H d
Z k c d
H d
tof e h
tof e i
H e
Z k b e
H e
tof e h
tof e i
tof k i
X e
tof d k
tof d j
tof d a
tof d f
tof d g
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof d f
tof d a
tof d j
tof d k
tof e i
tof e h
H e
Z k b e
H e
tof e i
tof e h
H d
Z k c d
H d
tof d h
tof d g
tof d f
tof d e
tof d a
tof d c
tof d k
tof j h
tof j g
tof a j
tof a d
tof a b
tof d a
tof k f
tof j k
tof j d
tof j b
tof d j
tof i k
tof c k
tof k j
tof k g
tof k b
X b
tof i f
tof i e
tof h i
tof h a
tof c i
tof c h
tof c f
tof c d
X c
tof d c
tof c d
tof d e
X h
tof c a
tof c b
tof c g
tof c h
tof c j
tof h b
tof h d
tof h e
tof h i
tof j i
tof i c
tof i j
tof i k
tof a k
tof k a
tof k c
tof k d
tof k e
tof k g
tof k h
tof k i
tof k j
tof j b
tof j c
tof j d
tof f g
tof f k
tof j f
tof a b
H f
Z k c f
H f
tof d k
tof e i
tof k i
tof d e
X i
X d
H d
Z b k d
H d
tof d i
tof e f
tof e g
H e
Z k j e
H e
tof e f
tof e g
tof e i
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
tof e f
X d
X e
tof e g
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof e i
H e
Z k j e
H e
tof e i
tof e g
tof e f
H d
Z k b d
H d
tof d e
tof d k
H f
Z k c f
H f
tof j f
tof k g
tof f k
tof a b
tof j d
tof j c
tof j b
tof i j
tof i c
tof k i
tof h e
tof h d
tof k h
tof k a
tof a k
tof i k
tof j i
tof h i
tof c h
tof h b
X b
tof c j
tof c g
tof a c
tof c a
tof c d
tof c b
tof a c
tof c f
tof c h
tof c j
tof c k
tof h a
tof d e
tof d i
tof i d
tof h d
tof i f
tof a k
tof k a
tof k c
tof k f
tof k g
tof k j
tof j b
tof j d
tof j f
tof j h
tof d i
tof d k
tof a d
tof d f
tof d g
tof d h
tof d j
H d
Z k c d
H d
tof c d
tof c e
tof c i
H c
Z k b c
H c
tof c d
tof c e
tof c i
tof d j
tof d b
tof d c
tof d g
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d g
tof d c
tof d b
tof d j
tof c i
tof c e
H d
Z c k d
H d
H c
Z b k c
H c
tof d e
tof d i
tof i e
tof c i
tof d j
tof d h
tof d g
tof d f
tof a d
tof d k
tof a i
tof a b
tof j h
tof j f
tof j e
tof j d
tof k j
tof j b
tof k g
tof c f
tof c a
tof k c
tof a k
tof i f
tof i d
tof h d
tof d i
tof h e
tof h b
tof h a
tof c j
tof c h
tof c d
X c
tof c b
tof a c
tof c d
tof c f
tof c h
tof c j
tof a h
tof h a
tof h c
tof h d
tof h e
tof h f
tof h i
tof h j
tof i a
tof i b
tof i d
tof i h
tof i g
tof k g
tof k a
tof k d
tof j a
tof j b
tof j d
tof j e
tof a j
tof j f
tof e c
tof e g
tof a e
tof a h
tof a i
tof e f
tof e i
H e
Z k c e
H e
tof d k
tof d a
tof d c
tof d g
H d
Z k b d
H d
tof d j
tof d b
tof d c
tof d e
tof d f
tof d g
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof i g
tof d i
tof d f
tof d e
tof d c
tof d b
tof d j
H d
Z k b d
H d
tof d g
tof d c
tof d a
tof d k
H e
Z k c e
H e
tof e i
tof e f
tof a e
tof e c
tof a j
tof i h
tof a i
tof j a
tof a f
tof j e
tof j d
tof j b
tof k g
tof k d
tof k a
tof i d
tof i b
tof h i
tof i a
tof h j
tof h f
tof h e
tof h c
tof c h
tof h d
tof a h
tof c j
tof c f
X b
tof a c
tof c a
tof c b
tof c e
tof c h
tof c i
tof a h
tof h a
tof d f
tof h d
tof d b
tof h b
tof h g
tof h i
tof e i
tof i b
tof i c
tof i e
tof g j
X g
tof i h
tof i g
tof i k
tof a k
tof k a
tof k c
tof k e
tof k f
tof k h
tof k j
tof j b
tof j g
tof j h
tof j i
tof j k
tof e a
tof a b
tof a e
tof a i
tof a k
tof d c
tof e g
tof e j
tof d e
X d
H d
Z k c d
H d
tof f b
tof f a
H f
Z k b f
H f
tof e k
tof e a
tof e b
tof e c
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e g
tof e c
tof e b
tof e a
tof e j
tof e k
H f
Z k b f
H f
tof a b
tof f a
H d
Z k c d
H d
tof j g
tof d j
tof d f
tof d e
tof d b
tof d c
tof a k
tof a i
tof a e
tof e a
tof j k
tof i h
tof i b
tof j i
tof i g
tof g j
tof k j
tof h f
tof k h
tof c e
tof k c
tof k a
tof a k
tof i k
tof i c
tof e i
tof h i
tof h g
tof h d
tof h b
tof h a
tof c a
tof a h
tof c b
tof a c
X d
tof c f
X c
tof c e
tof c a
tof c h
tof c j
tof c k
tof i h
tof h b
tof h c
tof h i
tof h j
tof h k
tof i f
tof d k
tof k b
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof k j
tof d j
tof j c
tof j d
tof a j
tof j f
tof j g
tof a k
H a
Z k c a
H a
tof a b
tof d c
tof d e
tof a d
tof a f
H a
Z k b a
H a
tof a c
tof a e
tof a f
tof a g
tof a j
tof d k
tof d j
tof d b
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d e
tof d c
tof d b
tof d j
tof d k
tof j g
tof a j
tof a f
tof a e
tof a c
H a
Z k b a
H a
tof a f
tof a e
tof a c
tof a d
tof a b
H a
Z k c a
H a
tof a j
tof k f
tof a k
tof j f
tof j d
tof j c
tof k d
tof d j
tof k i
tof k h
tof k g
tof k e
tof k c
tof k b
tof d k
tof i f
tof h k
tof h i
tof c j
tof h c
tof h b
tof i h
tof c k
tof h f
tof c h
tof c e
tof c a
tof e c
X e
tof c e
X b
tof c b
tof c h
tof k c
tof c j
tof h a
tof h d
tof i e
tof h i
tof i c
tof i g
tof i f
tof i j
tof k e
tof k h
tof k i
tof d j
tof j b
tof j c
tof a j
tof j d
tof j h
tof j i
tof a b
tof e c
tof a e
tof a f
tof e a
tof e j
H e
Z k c e
H e
tof e b
tof d e
tof e f
tof e h
tof e j
H e
Z k b e
H e
tof d k
tof d a
tof d c
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d f
tof d e
tof d c
tof a j
tof d a
tof d k
H e
Z k b e
H e
tof j h
tof e f
X b
tof j b
tof e j
H e
Z k c e
H e
tof e a
tof a e
tof e c
tof a i
tof a h
tof a f
tof a d
tof a b
tof j i
tof j d
tof j c
tof d j
tof i j
tof k i
tof h e
tof k h
tof k c
tof i g
tof i f
tof c e
tof i c
tof h i
tof h f
tof h d
tof h a
tof c j
tof c h
tof c f
tof c b
tof e c
tof a c
tof c a
tof c b
tof c d
tof c e
tof c f
tof c h
tof c i
tof a h
tof h a
tof h b
tof h e
tof h f
tof j g
tof h j
tof a i
tof i a
tof i b
tof i h
tof i g
tof i k
tof d k
tof k b
tof k c
tof k d
tof k e
tof k j
tof a c
tof j a
tof e i
tof j e
tof a b
tof a d
tof a h
tof a i
tof a j
tof e c
tof f b
tof e f
tof e g
tof e h
H e
Z k c e
H e
tof f a
tof f c
tof f i
tof f j
H f
Z k b f
H f
tof e j
tof e b
tof e g
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e g
tof e b
tof e j
H f
Z k b f
H f
tof j i
tof f j
tof f c
tof a b
tof f a
H e
Z k c e
H e
tof e i
tof e h
tof e g
tof e f
tof e b
tof e c
tof a j
tof a h
tof a d
tof j a
tof a c
tof k j
tof j g
tof j e
tof k d
tof c b
tof k c
X b
tof d k
tof i k
tof h g
tof h b
tof i h
tof i a
tof a i
tof h j
tof h f
tof h e
tof h a
tof c a
tof a h
tof c i
tof c f
tof c e
tof a d
tof a c
X c
tof e a
tof c e
tof h f
tof c h
tof k c
tof c j
tof h a
tof i d
tof h i
tof i b
tof d b
tof d f
tof k d
tof k g
tof g j
tof j b
tof d j
tof a j
tof j c
tof j g
tof a b
tof a e
tof a h
tof d e
H d
Z k c d
H d
tof d b
tof d e
tof d f
tof d i
X d
H d
Z b k d
H d
tof k i
X i
tof j i
tof e j
tof d i
tof e a
tof e c
tof e g
tof e h
H e
Z k j e
H e
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof h g
tof e h
tof e c
tof a j
tof e a
tof a e
H d
Z k b d
H d
tof d f
tof d e
tof d b
H d
Z k c d
H d
tof j g
tof d j
tof d f
tof d e
tof c b
tof d c
X b
tof a h
tof a c
tof e a
tof j c
tof k g
tof g j
tof k f
tof k d
tof k c
tof i d
tof j b
tof i j
tof c i
tof i c
tof c e
tof e b
tof h e
tof i k
tof k a
tof k c
tof k d
tof k h
tof d a
tof j d
tof a d
tof j f
tof j g
tof j i
tof a c
tof a g
tof a h
tof e a
tof a k
tof d e
tof e j
H e
Z k c e
H e
tof d k
tof d c
tof d f
H d
Z k b d
H d
tof a b
tof a c
tof a e
tof a f
H a
Z k j a
H a
tof a b
tof a c
tof a e
tof a f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a f
tof a e
tof a c
tof a b
H a
Z k j a
H a
tof a f
tof a e
tof a c
tof a b
H d
Z k b d
H d
tof d j
tof d f
tof d e
tof d c
tof d k
H e
Z k c e
H e
tof j b
tof e j
tof a k
tof e a
tof a h
tof a g
tof a d
tof a c
tof j d
tof k d
tof d a
tof j i
tof j g
tof j f
tof k h
tof i k
tof k c
tof h i
tof i j
tof i e
tof h g
tof h f
tof h b
tof c h
tof h d
tof h a
tof c i
X c
tof a b
tof c a
tof c h
tof c i
tof d c
tof h d
tof h e
tof h j
tof f i
tof i c
tof i f
tof i h
tof a f
tof k a
tof k g
tof j i
tof k i
tof j b
tof j k
tof j d
tof j f
tof a j
tof j h
tof d a
tof a i
tof e b
tof d e
tof d g
H d
Z k c d
H d
tof e a
tof e c
tof e f
tof e h
tof e i
H e
Z k b e
H e
tof e k
tof e b
tof e c
tof e g
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e g
tof e c
tof e b
tof e k
H e
Z k b e
H e
tof e i
tof e h
tof e f
tof e c
tof a b
tof e a
H d
Z k c d
H d
tof d i
tof d g
tof d e
tof d a
tof d c
tof j h
tof j f
tof a j
tof j k
tof j d
tof j c
tof j b
tof k i
tof k g
tof k f
tof k b
tof k a
tof i h
tof i f
tof i c
tof f i
tof h j
tof h c
tof c e
tof c h
tof c a
X b
tof c g
tof h b
tof j f
tof h j
tof h k
tof i a
tof i c
tof k d
tof i k
tof a b
tof k a
tof k e
tof k g
tof j k
tof k h
tof j a
tof j c
tof e f
tof a e
tof a i
tof a j
tof a k
tof e c
tof d e
tof e h
tof e j
H e
Z k c e
H e
tof d k
tof d b
tof d a
tof d g
tof d i
H d
Z k b d
H d
tof f j
tof f a
tof f b
tof f h
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f h
tof f b
tof f a
tof f j
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d g
tof d e
tof a b
tof d a
tof d k
H e
Z k c e
H e
tof e j
tof e h
tof e f
tof e c
tof j k
tof a j
tof a i
tof a f
tof a e
tof j h
tof j f
tof j c
tof j b
tof j a
tof k h
tof k g
tof k e
tof k d
tof k b
tof i k
tof k a
tof i c
tof c i
tof i d
tof k j
tof h k
tof h f
tof h e
tof h d
tof h b
tof c g
X c
tof c f
X e
tof a c
tof h a
tof c h
tof c d
tof c k
tof h b
tof h f
tof h i
tof i h
tof h g
tof i a
tof i b
tof i e
tof i j
tof k i
tof i f
tof j f
tof k g
tof j a
tof j d
tof a b
tof f c
tof a f
tof a g
tof f a
tof a j
tof f k
tof f h
tof e f
tof f i
H f
Z k c f
H f
tof e k
tof e b
tof a h
tof e a
tof a e
H e
Z k b e
H e
tof a b
tof a g
H a
Z k j a
H a
tof a b
tof a e
tof a g
tof a h
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a e
tof a b
H a
Z k j a
H a
tof a h
tof a g
tof a e
tof a b
H e
Z k b e
H e
tof e i
tof e h
tof e f
tof e a
tof e b
tof e k
H f
Z k c f
H f
tof f j
tof f i
tof f h
tof a c
tof f a
tof f k
tof a j
tof a g
tof a f
tof a b
tof j f
tof j d
tof j a
tof i j
tof i g
tof i f
tof k i
tof i h
tof i e
tof h i
tof i b
tof i a
tof h g
tof h f
tof c k
tof c j
tof c d
tof a h
tof c a
tof a c
tof c b
X c
tof c d
tof c h
tof h c
tof h a
tof c j
tof h b
tof h f
tof h g
tof h i
tof d i
tof i c
tof i d
tof i e
tof i f
tof i g
tof k d
tof e h
tof k e
tof d j
tof j d
tof j f
tof j h
tof a j
tof e j
tof j i
tof a b
tof a d
tof a f
tof a k
tof e c
tof e b
tof e g
H e
Z k c e
H e
tof a c
tof a e
H a
Z k b a
H a
tof d a
tof a c
tof a e
tof a g
tof a h
tof a j
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d g
tof d e
tof a c
tof a j
tof d a
tof a h
tof a g
tof a e
H a
Z k b a
H a
tof a j
tof a e
tof a c
H e
Z k c e
H e
tof j i
tof j h
tof e j
tof e g
tof e b
tof e c
tof a k
tof i f
tof a i
tof a d
tof a b
tof j f
tof j d
tof d j
tof k h
tof k e
tof k d
tof i g
tof i e
tof i d
tof i c
tof d i
tof h j
tof h i
tof h g
tof h f
tof c b
tof h c
X b
tof h a
tof c j
tof a c
tof a d
tof a b
tof c a
tof c f
tof c g
tof c i
tof a h
tof h a
tof g k
tof k h
tof h g
tof i c
tof i f
tof i h
tof i j
tof k j
tof k i
tof k c
tof d j
tof j b
tof j c
tof j d
tof j e
tof j f
tof j h
tof j k
tof a c
tof a g
tof a h
tof a j
tof b f
tof b g
tof b h
tof b i
tof b j
H b
Z k c b
H b
tof b f
tof b g
tof b h
tof b i
tof b j
tof d k
tof d c
tof d e
tof d g
H d
Z k b d
H d
tof d j
tof d a
tof d e
tof d g
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof c i
tof b c
H i
Z c k i
H i
tof k i
tof c i
tof b c
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof d e
tof a j
tof d a
H d
Z k b d
H d
tof d g
tof d e
tof d c
tof d k
tof b j
tof b h
tof b g
tof b f
H b
Z k c b
H b
tof b j
tof b i
tof b f
tof a b
X f
tof b h
tof b g
tof a c
tof k h
tof j k
tof j f
tof j e
tof j d
tof j c
tof j b
tof d j
tof i j
tof k i
tof k g
tof k c
tof g k
tof i h
tof i c
tof c i
tof i f
tof h k
tof h g
tof h b
tof h a
tof c a
tof a h
tof c g
X c
tof c b
tof c d
tof c a
tof d h
tof c h
tof h c
tof c j
tof d e
tof h d
tof h f
tof i g
tof h i
tof i b
tof i c
tof i h
tof k a
tof d b
tof k d
tof k f
tof k g
tof a j
tof j a
tof j e
tof j f
tof j i
tof d a
tof a d
tof a f
tof a h
tof a i
tof a j
tof a k
tof d c
tof d g
tof d h
tof d i
H d
Z k c d
H d
tof d b
tof f a
tof d f
tof d e
tof d i
tof d j
H d
Z k b d
H d
tof f j
tof f b
tof f c
tof f g
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f g
tof f c
tof f b
tof f a
tof f j
H d
Z k b d
H d
tof j i
tof d j
tof d f
tof a e
tof a b
tof d a
H d
Z k c d
H d
tof d i
tof d h
tof d g
tof d e
tof d b
tof d c
tof a k
tof a j
tof a h
tof a f
tof a d
tof d a
tof j f
tof j e
tof j a
tof a j
tof k g
tof k f
tof k e
tof k d
tof k b
tof k a
tof h g
tof h c
tof i h
tof i b
tof h j
tof h i
tof h f
tof h e
tof h d
tof d h
tof c j
tof c h
tof c a
tof a c
tof h a
X b
tof h b
tof h d
tof c h
tof c e
tof c f
tof i g
tof c i
tof h i
tof h k
tof i h
tof i d
tof i j
tof k c
tof k d
tof g h
tof k g
tof k e
tof k j
tof a j
tof j a
tof j b
tof j e
tof j k
tof d b
tof d a
tof a d
tof a e
tof a f
tof a h
tof d c
tof d j
H d
Z k c d
H d
tof d k
tof d a
tof d e
tof d f
tof d g
tof d j
H d
Z k b d
H d
tof g k
tof g a
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g h
tof g a
tof g k
H d
Z k b d
H d
tof d j
tof d h
tof d g
tof d f
tof a e
tof d a
tof d k
H d
Z k c d
H d
tof j b
tof d j
tof d c
tof a h
tof a f
tof a d
tof a b
tof d a
tof k e
tof j k
tof j a
tof a j
tof k j
tof h g
tof k h
tof c d
tof k c
tof i j
tof h d
tof i h
tof h i
tof h k
tof h b
tof c h
tof h a
tof c i
X c
tof c g
tof c b
tof i a
tof c i
tof h g
tof c h
tof h c
tof h d
tof h e
tof h k
tof k h
tof h f
tof i c
tof i e
tof f g
tof i j
tof k i
tof i f
tof k f
tof b g
tof k b
tof k a
tof a j
tof j a
tof f j
tof j c
tof j h
tof e g
tof e i
tof e j
tof e a
tof a e
tof a k
H f
Z k c f
H f
tof e k
tof e c
tof e f
H e
Z k b e
H e
tof b c
tof b d
tof b f
H b
Z k j b
H b
tof b c
tof b d
tof b f
tof b g
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof j i
tof k i
tof a k
H i
Z b k i
H i
H i
Z c k i
H i
tof b g
tof b f
tof b d
tof b c
H b
Z k j b
H b
tof b g
tof b f
tof b d
tof b c
H e
Z k b e
H e
tof e j
tof e i
tof e g
tof e f
tof e c
tof e k
H f
Z k c f
H f
tof f j
tof f h
tof f g
tof f c
tof a k
tof a j
tof a g
tof a e
tof e a
tof j h
tof j c
tof j a
tof a j
tof k i
tof h g
tof h f
tof k h
tof k b
tof k a
tof i j
tof i g
tof i f
tof h c
tof i c
tof c h
tof c i
tof c k
X d
tof c f
X b
tof c j
tof h b
tof h c
tof i h
tof h g
tof e j
tof i j
tof i b
tof a k
tof a e
tof e j
tof j k
tof k a
tof a e
tof e a
tof j c
tof j d
tof f h
tof j f
tof j i
tof a b
tof e g
tof e h
tof a e
tof a j
tof e i
H e
Z k c e
H e
tof e g
tof d e
tof e h
tof e i
tof f k
tof f b
tof f c
H f
Z k b f
H f
tof d k
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof e h
tof e i
tof d e
tof d k
H f
Z k b f
H f
tof f h
tof f c
tof f b
tof f k
tof e g
H e
Z k c e
H e
tof e i
tof e h
tof a e
tof e g
tof j h
tof a j
tof a b
tof j e
tof e a
tof j k
tof j i
tof j f
X d
tof c d
tof j c
tof k a
tof a j
tof k e
tof a k
tof i j
tof h g
tof h e
tof i h
tof i b
tof i a
tof h k
tof h c
tof c j
X g
X c
tof h a
tof c h
tof c i
tof h e
tof h g
tof h j
tof h k
tof i b
tof i c
tof i d
tof i g
tof i j
tof i k
tof k b
tof k d
tof k e
tof k f
tof k h
tof j a
tof k i
tof j b
tof j d
tof j e
tof j f
tof j h
tof d a
tof a c
tof a d
tof e g
tof e h
tof e i
tof a e
tof e a
tof a j
tof f k
tof f b
tof f i
tof f j
H f
Z k c f
H f
tof d k
tof d c
tof d g
tof d h
tof d j
H d
Z k b d
H d
tof e k
tof e c
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e c
tof a j
tof e a
tof e k
H d
Z k b d
H d
tof d j
tof d h
tof d g
tof d c
tof d k
H f
Z k c f
H f
tof f i
X b
tof j b
tof f j
tof f k
tof a i
tof a e
tof e g
tof a h
tof a d
tof a c
tof j d
tof d a
tof j h
tof j f
tof j e
tof k i
tof k h
tof k f
tof k e
tof i k
tof k d
tof h k
tof k b
tof i j
tof i c
tof c i
tof h j
tof h g
tof h e
tof c h
tof h a
tof c b
X c
tof c a
tof c d
tof h i
tof c h
tof h c
tof i c
tof h d
tof h j
tof i h
tof h k
tof d e
tof i e
tof i b
tof d k
tof k b
tof k c
tof k d
tof k f
tof k h
tof k j
tof f j
tof j b
tof j f
tof j g
tof j h
tof j i
tof d a
tof c h
tof a c
H a
Z k c a
H a
tof a b
tof a d
tof a f
tof a j
tof c e
tof c g
H c
Z k b c
H c
tof c e
tof d c
tof c g
tof c h
tof d k
tof d a
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof c e
tof d c
tof d a
tof d k
tof c h
tof c g
H c
Z k b c
H c
tof c h
tof c g
tof c e
tof j f
tof a j
tof a e
tof a d
tof a b
H a
Z k c a
H a
tof a h
tof a c
tof d a
tof i h
tof i g
tof i b
tof j i
tof k f
tof f j
tof h e
tof k h
tof k d
tof k c
tof k b
tof d k
tof i k
tof i e
tof h i
tof i c
tof h g
tof d e
tof c d
tof c a
X b
tof c j
tof a i
tof a c
tof a e
tof i a
tof i g
tof i h
tof d k
tof k c
tof k d
tof k f
tof k h
tof k i
tof k j
tof d j
tof j b
tof d g
tof d i
tof j d
tof j k
tof a f
tof a b
tof a i
H a
Z k c a
H a
tof a b
tof a e
tof a i
tof d a
tof a j
tof d k
tof c h
tof d c
tof c d
tof d i
X d
H d
Z b k d
H d
tof k i
X i
tof d i
tof c f
H c
Z k j c
H c
tof c d
tof c f
tof c h
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof c h
tof c f
tof c d
H c
Z k j c
H c
tof c h
tof c f
tof c d
H d
Z k b d
H d
tof d j
tof d h
tof d g
tof d e
tof d c
tof d a
tof d k
tof j e
tof j b
tof a j
H a
Z k c a
H a
tof a i
tof a e
tof a b
tof a f
tof a c
tof j k
tof j g
tof k d
tof j d
tof i h
tof h d
tof d j
tof k i
tof k f
tof k e
tof k c
tof d k
X d
tof i g
tof i e
tof i c
tof i a
tof a i
tof h e
tof c j
tof c i
tof c h
tof c g
X c
X b
X e
X f
tof a c
tof c a
tof c d
tof c g
tof c h
tof c i
tof e h
tof h c
tof h e
tof h g
tof h j
tof h k
tof a i
tof i e
tof i a
tof i j
tof a k
tof k a
tof k b
tof k f
tof k g
tof a k
tof k h
tof f j
tof j b
tof j c
tof j f
tof j h
tof j i
tof d c
tof e g
tof d e
tof a d
tof d h
tof d i
H d
Z k c d
H d
tof e k
tof e b
tof e c
tof e f
tof e i
H e
Z k b e
H e
tof f k
tof f j
tof f a
tof f h
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof a h
tof f a
tof f j
tof f k
H e
Z k b e
H e
tof e i
tof e g
tof e f
tof e c
tof e b
tof e k
H d
Z k c d
H d
tof d i
tof d h
tof d g
tof a d
tof d e
tof d c
tof k g
tof a k
tof j i
tof j h
tof j f
tof j c
tof j b
tof f j
tof k h
tof k f
tof k b
tof k a
tof a k
tof i j
tof i e
tof i a
tof a i
tof h k
tof h j
tof h g
tof h e
tof h c
tof e h
tof h i
tof c h
tof c g
tof c d
tof c a
tof a c
X b
tof d c
tof c d
tof c i
tof c j
tof h a
tof h b
tof h c
tof h d
tof h e
tof h k
tof i a
tof i f
tof i g
tof i k
tof k c
tof k d
tof k e
tof k f
tof k i
tof a j
tof j a
tof j b
tof j e
tof b j
tof j g
tof j i
tof d a
tof a f
tof a g
tof a h
tof a k
tof b h
H b
Z k c b
H b
tof b g
tof b h
tof b i
tof b j
tof a e
H a
Z k b a
H a
tof a d
tof a e
tof a i
tof d j
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d j
tof a e
tof a d
H a
Z k b a
H a
tof a e
tof j i
tof b j
tof b h
tof b g
H b
Z k c b
H b
tof b j
tof b h
tof b g
tof a k
tof a h
tof a g
tof a f
tof d a
tof j g
tof j e
tof j b
tof j a
tof a j
tof i f
tof k i
tof k e
tof c d
tof k c
tof i k
tof i g
tof h i
tof i a
tof h k
tof h c
tof h b
tof c j
tof c i
tof d c
tof c b
X c
tof c d
tof c f
tof c g
tof c i
tof c j
tof h j
tof a i
tof i a
tof i c
tof i d
tof k e
tof i k
tof i j
tof j i
tof k i
tof i f
tof k b
tof k c
tof k g
tof j a
tof j b
tof j g
tof a c
tof a j
tof a k
tof a d
tof a f
H a
Z k c a
H a
tof d b
tof a d
tof a f
tof a h
tof d k
tof d c
tof d g
tof d h
tof d i
H d
Z k b d
H d
tof a b
tof a d
H a
Z k j a
H a
tof a b
tof a d
tof a e
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a e
tof a d
tof a b
H a
Z k j a
H a
tof a d
tof a b
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof d c
tof d b
tof d k
tof a h
tof a f
tof a d
tof a b
H a
Z c k a
H a
tof k c
tof k f
tof a k
tof a d
tof a j
tof j i
tof j g
tof j f
tof j b
tof j a
tof k i
tof k g
tof k e
tof k b
tof i k
tof i j
tof i f
tof i e
tof c d
tof i c
tof i a
tof a i
tof h j
tof h e
X e
X b
tof e g
tof c e
tof c k
tof a h
tof h a
tof h g
tof h j
tof i a
tof i b
tof i d
tof i f
tof i g
tof k h
tof i k
tof k a
tof k b
tof k e
tof a j
tof a c
tof a d
tof j a
tof j f
tof j h
tof j k
tof e h
tof e j
tof a e
tof d k
tof d a
tof b g
tof d b
tof j i
tof d j
H d
Z k c d
H d
tof e k
tof e c
tof e i
H e
Z k b e
H e
tof b f
H b
Z k j b
H b
tof b f
tof b g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof b g
tof b f
H b
Z k j b
H b
tof b g
tof b f
H e
Z k b e
H e
tof e j
tof e i
tof e h
tof e g
tof e c
tof e k
H d
Z k c d
H d
tof d j
tof d i
tof d g
tof d b
tof d a
tof d k
tof j h
tof a j
tof a g
tof a e
tof j a
tof a d
tof a c
tof j k
tof j f
tof a j
tof h g
tof k h
tof k e
tof k b
tof i k
tof k a
tof i h
tof i f
tof i d
tof c i
tof i b
tof h j
tof h a
tof a h
tof c k
tof c j
tof c f
tof c e
X e
X d
tof a c
tof c a
tof c b
tof c d
tof c g
tof c i
tof a h
tof h a
tof h c
tof h d
tof h f
tof h g
tof h i
tof a b
tof i a
tof i c
tof i d
tof i e
tof i f
tof i j
tof i k
tof d k
tof k c
tof k d
tof k g
tof e b
tof j e
tof j g
tof a j
tof j i
tof a d
tof a f
tof e k
tof e c
tof e j
H e
Z k c e
H e
tof f k
tof f g
X i
X g
tof f c
X f
H f
Z b k f
H f
tof k i
tof f i
tof d j
tof d h
H d
Z k j d
H d
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof k i
tof a k
tof j i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof a d
tof d j
H f
Z k b f
H f
tof f i
tof f g
tof f c
tof f k
H e
Z c k e
H e
tof k c
tof e k
tof e j
tof j e
tof e b
tof a f
tof a b
tof j i
tof j g
tof k g
tof k d
tof i d
tof d k
tof i j
tof i f
tof i e
tof i c
tof i b
tof h i
tof i a
tof h g
tof h f
X d
tof c d
tof h c
tof a h
tof c i
X g
X c
X a
tof c b
tof c d
tof c e
tof c f
tof h j
tof c h
tof h c
tof h f
tof h i
tof d i
tof i b
tof i d
tof i g
tof i e
tof i k
tof k a
tof k b
tof k c
tof k d
tof k h
tof k j
tof j b
tof j d
tof j e
tof j k
tof a d
tof a e
tof a i
tof a k
tof f k
tof f i
H f
Z k c f
H f
tof e k
tof e b
tof e a
tof e c
tof e f
tof e h
H e
Z k b e
H e
tof a e
tof a f
tof a g
H a
Z k j a
H a
tof a e
tof a f
tof a g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a g
tof a f
tof a e
H a
Z k j a
H a
tof a g
tof a f
tof a e
H e
Z k b e
H e
tof e h
tof e f
tof e c
tof e a
tof e b
tof e k
H f
Z k c f
H f
tof f i
tof f k
tof a k
tof i e
tof i d
tof a i
tof j k
tof j e
tof k j
tof j d
tof j b
tof h c
tof k h
tof k a
tof i k
tof d g
X b
tof i b
tof d i
X g
tof c h
tof h j
tof c i
tof c e
tof a c
tof c a
tof c d
tof a c
tof c b
tof i e
tof c i
tof h b
tof h d
tof i a
tof i h
tof i j
tof i k
tof k a
tof k c
tof k h
tof k i
tof d j
tof j d
tof j e
tof j g
tof j i
tof j k
tof e a
tof a f
tof a j
tof a k
tof a h
H a
Z k c a
H a
tof a b
tof a e
tof d a
tof a h
tof d b
tof g j
X g
X d
tof g i
tof d g
tof j i
H d
Z b k d
H d
tof k i
tof d i
tof g h
H g
Z k j g
H g
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g i
tof g h
tof g j
H d
Z k b d
H d
tof d j
tof d h
tof d g
tof a b
tof d a
tof a h
tof a e
H a
Z k c a
H a
tof a h
tof j k
tof a j
tof a f
tof e a
tof j i
tof j g
tof j e
tof j d
tof d j
tof i h
tof k i
tof c a
tof k c
tof i k
tof i j
tof i g
tof i e
tof i a
tof h i
tof h f
tof h d
tof h b
tof c i
X e
tof c d
X c
tof c b
tof c a
tof c i
tof a h
tof h a
tof h c
tof h d
tof h e
tof h f
tof i a
tof i c
tof i f
tof i d
tof i j
tof f k
tof k c
tof k f
tof k i
tof a j
tof j a
tof j d
tof j f
tof f a
tof a b
tof a c
tof a f
tof a g
tof a h
tof a i
tof d c
tof e b
tof e f
tof e g
tof e h
tof d e
H d
Z k c d
H d
tof e c
tof j i
tof e j
H e
Z k b e
H e
tof e k
tof e f
tof e h
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof j i
tof k i
tof a k
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e f
tof e k
H e
Z k b e
H e
tof e j
tof e i
tof e h
tof e g
tof e f
tof e c
X e
tof e b
tof a h
tof a b
H d
Z k c d
H d
tof d h
tof d g
tof d f
tof d e
tof d b
tof d c
tof a g
tof a f
tof a c
tof j f
tof f a
tof j d
tof a j
tof k i
tof k f
tof k c
tof f k
tof i j
tof i f
tof c d
tof i c
tof i a
tof h f
tof h e
tof h c
tof h a
tof a h
tof c i
tof c g
tof c a
tof c f
tof c k
tof h b
tof h c
tof j g
tof h j
tof a i
tof i a
tof i b
tof i d
tof i g
tof i h
tof a k
tof k a
tof k b
tof k c
tof k e
tof k f
tof k h
tof j a
tof f a
X f
tof a c
tof a g
tof a h
tof a k
tof d c
tof d e
tof a i
tof d a
X d
H d
Z k c d
H d
tof a c
tof a j
H a
Z k b a
H a
tof c b
tof a c
tof a j
tof a d
tof a e
tof a g
tof a h
H a
Z k j a
H a
tof a b
tof a d
tof a e
tof a f
tof a g
tof a h
tof a i
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a f
tof b d
tof a b
tof a e
H a
Z k j a
H a
tof a h
tof a g
tof a b
tof b d
tof a e
tof a j
tof a c
H a
Z k b a
H a
tof a j
tof a i
tof a f
tof a c
H d
Z k c d
H d
tof d i
tof d f
tof d e
tof a c
tof d a
tof k h
tof a k
tof a g
X g
tof j g
tof a f
tof f a
tof j a
tof k f
tof k e
tof k c
tof k b
tof k a
tof a k
tof h g
tof i h
tof i d
tof i a
tof a i
tof i b
tof h c
tof c k
X c
tof c d
tof c a
tof c g
tof c i
tof h e
tof i h
tof h f
tof i c
tof i k
tof g k
tof k g
tof k h
tof j k
tof a k
X g
tof k i
tof j b
tof j d
tof d j
tof j g
tof a j
tof d k
tof d e
tof d f
tof d h
tof d i
tof k i
H d
Z c k d
H d
tof d c
tof d k
tof d a
tof d f
tof d h
H d
Z k b d
H d
tof a d
tof a g
H a
Z k j a
H a
tof a d
tof a g
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a g
tof a d
H a
Z k j a
H a
tof a g
tof a d
H d
Z k b d
H d
tof i h
tof d i
tof d f
tof d c
tof d a
tof d k
H d
Z k c d
H d
tof d j
tof d h
tof d g
tof d f
tof d e
tof d k
tof j k
tof j b
tof a j
tof j g
tof j d
tof i g
tof k i
tof g k
X i
tof i g
tof i c
tof i f
tof h j
tof h f
tof h e
tof h b
X e
X a
tof c b
tof c d
tof a h
tof h a
tof j c
tof h j
tof i d
tof h i
tof i a
tof i b
tof i c
tof i f
tof k i
tof i g
tof i h
tof k b
tof k c
tof d e
tof k d
tof j k
tof k f
tof j a
tof j b
tof j e
tof j i
tof f a
tof a f
tof a i
tof f a
tof a j
tof f c
tof f h
H f
Z k c f
H f
tof d k
tof d f
tof d j
H d
Z k b d
H d
tof d k
tof d j
tof d b
tof d c
tof d f
tof d g
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d g
tof d f
tof d c
tof d b
tof d j
tof d k
H d
Z k b d
H d
tof d j
tof d f
tof k e
tof d k
H f
Z k c f
H f
tof f j
tof f h
tof f a
tof f c
tof j i
tof j f
tof a j
tof f a
tof k c
tof k b
tof j k
tof i h
tof i g
tof i f
tof i d
tof k i
tof i c
tof i b
tof h i
tof i a
tof h j
tof c d
tof h c
tof c a
tof a h
tof c g
tof c e
X b
X e
X g
tof c k
tof h f
tof h g
tof h j
tof i h
tof h k
tof i a
X f
tof i f
tof d c
tof i d
tof g k
tof k c
tof k g
tof d k
tof k i
tof j a
tof j c
tof j e
tof j f
tof j g
tof j h
tof e a
tof a b
tof a c
tof a e
tof a g
tof a h
tof a i
tof d b
tof c d
tof d e
tof d g
H d
Z k c d
H d
tof c f
tof c h
H c
Z k b c
H c
tof d e
tof c d
tof c f
tof c g
tof c h
tof d k
tof d a
tof d b
tof d c
tof d g
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d g
tof c e
tof d c
tof d b
tof d a
tof d k
tof c h
tof c g
tof c f
tof c d
H c
Z k b c
H c
tof c h
tof c g
tof c f
tof c e
tof c d
H d
Z k c d
H d
tof d i
tof d g
tof d e
tof d b
tof k c
tof d k
tof a i
tof a h
tof a g
tof a e
tof a c
tof a b
tof j e
tof e a
tof j h
tof j g
tof j f
tof j c
tof k i
tof k g
tof g k
tof h k
tof h f
tof i h
tof i d
tof i c
tof i a
tof c j
tof c h
tof c g
tof c k
tof c i
tof c f
X c
X b
tof a c
tof c a
tof c d
tof c f
tof c g
tof c i
tof h d
tof h e
tof h f
tof h i
tof a h
tof i e
tof k e
tof i a
tof k i
tof k f
tof k g
tof j b
tof j d
tof j f
tof j k
tof a c
tof a f
tof a b
tof a d
H a
Z k c a
H a
tof a b
tof a d
tof e j
tof a e
tof e h
H e
Z k b e
H e
tof e h
tof e j
tof e k
tof e a
tof e b
tof e c
tof e f
tof e g
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e g
tof c f
tof e c
tof e b
tof e a
tof e k
tof e j
tof e h
H e
Z k b e
H e
tof e h
tof a e
tof e j
tof a d
tof a b
H a
Z k c a
H a
tof a d
tof a b
tof a h
tof a c
tof k f
tof j k
tof j d
tof j b
tof k i
tof k g
tof k e
tof h e
tof i h
tof i a
tof h i
tof h d
tof c i
tof c g
tof c d
tof c a
tof a c
X b
X d
tof d c
tof c d
tof c f
tof c g
tof c i
tof c k
tof h a
tof h b
tof h d
tof h k
tof a i
tof i j
tof i k
tof i a
tof e k
tof k b
tof k c
tof k e
tof a k
tof k f
tof d k
tof k h
tof d j
tof j b
tof j d
tof a g
tof a j
tof d e
tof f i
tof d f
H d
Z k c d
H d
tof f b
tof f a
tof f c
tof f g
H f
Z k b f
H f
tof d j
tof d b
tof d e
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d e
tof d b
tof d j
H f
Z k b f
H f
tof f i
tof f g
tof f c
tof f a
tof f b
H d
Z k c d
H d
tof d i
tof d h
tof d f
tof d e
tof d k
tof k h
tof j k
tof a j
tof a g
tof a f
tof j d
tof j b
tof d j
tof k f
tof k e
tof k c
tof k b
tof e k
tof i k
tof i j
tof i a
tof a i
tof h k
tof h d
tof h b
tof h a
tof c k
tof c i
tof c g
tof c f
tof c d
tof d c
tof c b
X c
tof i d
tof c i
tof c k
tof h d
tof i a
tof i c
tof i e
tof i f
tof i j
tof d k
tof k b
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof k j
tof d j
tof j c
tof j d
tof j f
tof j h
tof j i
tof j k
tof a b
tof a g
tof a h
tof a k
tof f k
tof f j
tof f i
X f
H f
Z c k f
H f
tof k i
X i
tof f i
tof a d
tof a e
H a
Z k b a
H a
tof a d
tof j i
tof e j
tof a e
tof e a
tof e b
H e
Z k j e
H e
H i
Z b k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e b
tof a j
tof e a
tof a e
tof a i
tof a d
H a
Z k b a
H a
tof a e
tof a d
H f
Z k c f
H f
tof j k
tof f j
tof i f
tof j i
tof k h
tof k g
tof k b
tof a k
tof j h
tof j d
tof j c
tof k d
tof d j
tof i e
tof i c
tof k i
tof c d
tof d k
tof i j
tof i d
tof i a
tof h g
tof h d
tof c i
tof c b
X b
tof e c
tof c e
tof c g
tof c i
tof c k
tof k c
tof c j
tof h i
tof i h
tof h a
tof i b
tof i c
tof i e
tof j f
tof i j
tof k d
tof k e
tof k f
tof k g
tof k i
tof d c
tof j d
tof j e
tof j g
tof a b
tof a c
tof a g
tof d a
tof a h
tof d k
H d
Z k c d
H d
tof f b
tof f a
tof d f
X d
tof d e
tof f c
tof j i
tof f j
tof f i
X f
H f
Z b k f
H f
tof k i
X i
tof f i
H d
Z k j d
H d
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d f
tof d e
tof d c
tof d j
H f
Z k b f
H f
tof f j
tof f i
tof f c
tof f a
tof f b
H d
Z k c d
H d
tof a h
tof a c
tof d a
tof d k
tof a g
tof a b
tof k j
tof j g
tof j f
tof j e
tof j d
tof j c
tof k i
tof h j
tof h f
tof i h
tof c e
tof i c
tof i b
tof h i
tof i a
tof c k
tof c j
tof c i
tof c g
tof e c
X e
X d
X b
tof c a
tof c d
tof c f
tof c i
tof a h
tof h a
tof h c
tof h d
tof h f
tof i g
tof h i
tof h k
tof i a
tof i b
tof i c
tof i f
tof i e
tof i j
tof k a
tof k c
tof k d
tof k g
tof k h
tof a j
tof j a
tof e g
tof j e
tof j h
tof d a
tof a c
tof a d
tof e f
tof a e
tof a h
tof a i
tof e i
tof e j
H e
Z k c e
H e
tof e f
tof e g
tof e i
tof e j
tof d b
tof d a
tof d c
tof d g
tof d i
tof d j
H d
Z k b d
H d
tof d j
tof d e
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof e j
tof d e
H d
Z k b d
H d
tof d j
tof i g
tof d i
tof d c
tof d a
tof d b
tof i f
tof e i
H e
Z k c e
H e
tof e j
tof a e
tof e i
tof a h
tof a d
tof a c
tof d a
tof h g
tof j h
tof j e
tof j a
tof a j
tof h d
tof h c
tof h a
tof k h
tof h k
tof i j
tof c e
tof i c
tof i b
tof i a
tof h i
tof h f
tof c a
tof a h
tof c i
tof c f
tof c d
X b
X f
X g
tof c j
tof d h
tof c k
tof d c
tof h d
tof h g
tof i h
tof i a
tof j i
tof e k
tof k c
tof k e
tof j f
tof k j
tof j b
tof j c
tof f a
tof a b
tof a c
tof a f
tof a g
tof a i
tof d a
tof d h
H d
Z k c d
H d
tof g k
tof g a
tof g c
tof g j
H g
Z k b g
H g
tof d j
tof d b
tof d c
tof d e
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d e
tof d c
tof d b
tof d j
H g
Z k b g
H g
tof g j
tof g c
tof g a
tof g k
H d
Z k c d
H d
tof d h
tof a c
tof d a
tof a i
tof a g
tof a f
tof a b
tof f a
tof j i
tof j f
tof j c
tof j b
tof k j
tof k i
tof k f
tof k e
tof k c
tof e k
tof i h
tof i a
tof h g
tof h d
tof h c
tof d h
tof c k
tof c j
tof c h
tof c e
X c
X b
X d
tof a c
tof c a
tof c d
tof c e
tof f i
tof c f
tof h d
tof h g
tof i k
tof h i
tof i h
tof k h
tof i f
tof i c
tof i j
tof a c
tof k a
tof d j
tof k d
tof j d
tof e g
tof k e
tof j b
tof j f
tof j h
tof j i
tof j k
tof a b
tof a d
tof a f
tof a h
tof a i
tof a k
tof e f
tof e j
H e
Z k c e
H e
tof e f
tof e g
tof e j
tof f k
tof f a
tof f c
tof j i
tof f j
H f
Z k b f
H f
tof d k
tof d e
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d e
tof d k
H f
Z k b f
H f
tof f j
tof f i
tof f c
tof f a
tof f k
tof e j
tof e g
tof e f
H e
Z k c e
H e
tof e j
tof e g
tof e f
tof a k
tof i h
tof i f
tof a i
tof a d
tof a c
tof a b
tof j k
tof j i
tof j d
tof j b
tof k d
tof d j
tof k h
tof k g
tof k e
tof i c
tof c a
tof k c
tof i k
tof i j
tof c f
tof f i
tof h i
tof h d
tof c e
tof c d
tof a c
X b
X g
tof d c
tof c d
tof c e
tof c g
tof c j
tof c k
tof h a
tof h b
tof j e
tof h j
tof k i
tof i b
tof i f
tof j i
tof i g
tof i h
tof g i
tof j i
tof g h
tof k a
tof k c
tof k d
tof k e
tof j a
tof j c
tof j d
tof d e
tof a d
tof a g
tof d c
tof d h
H d
Z k c d
H d
tof e k
tof e c
tof e j
H e
Z k b e
H e
tof g k
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof k i
tof a k
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof i h
tof g i
tof g k
H e
Z k b e
H e
tof e j
tof e c
tof e k
H d
Z k c d
H d
tof d h
tof d e
tof d c
tof j a
tof a h
tof a g
tof a e
tof k a
tof a d
tof j c
tof k i
tof k g
tof k f
tof c e
tof k c
tof k b
tof i f
tof h j
tof h e
tof h a
tof c k
tof c j
tof c g
tof c d
tof d c
tof c b
X c
tof c e
tof c f
tof c j
tof c k
tof h c
tof h f
tof i a
tof i e
tof i k
tof k i
tof i h
tof k d
tof a k
tof k j
tof j a
tof j d
tof j f
tof g h
tof j g
tof g j
tof c j
tof c e
tof a c
X e
tof g k
H g
Z k c g
H g
tof c g
H c
Z k b c
H c
tof c d
tof c e
tof c g
tof c j
tof a b
tof a c
H a
Z k j a
H a
tof a b
tof a c
tof a d
tof a f
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a f
tof c d
tof a c
tof a b
H a
Z k j a
H a
tof c i
tof a c
tof a b
tof c j
tof c g
tof c e
H c
Z k b c
H c
tof c j
tof c i
tof c g
tof c e
tof c d
H g
Z k c g
H g
tof j k
tof g j
tof i h
tof g i
tof a j
tof a e
tof a c
tof j i
tof j g
tof j f
tof j d
tof j a
tof a j
tof i j
X d
tof k i
tof k d
tof i e
tof i b
tof i a
tof h k
tof h g
tof h f
tof c d
tof c b
tof h c
X b
tof c k
tof c j
tof c f
tof c e
X f
tof a c
tof c a
tof c b
tof i f
tof c i
tof e h
tof h b
tof h c
tof h e
tof h f
tof h k
X i
tof i e
tof k a
tof k c
tof k g
tof j i
tof k j
tof d e
tof j d
tof j a
tof j f
tof j h
tof f a
tof a b
tof a c
tof a f
tof a g
tof a h
tof a j
tof g a
tof a k
tof g c
tof d g
tof g i
H g
Z k c g
H g
tof d b
tof d a
tof d c
tof d f
tof d h
tof d i
X d
H d
Z b k d
H d
tof k i
tof j i
tof f j
tof d i
tof f a
tof f c
H f
Z k j f
H f
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f c
tof f a
tof f j
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof d c
tof d a
tof d b
H g
Z k c g
H g
tof g i
tof a c
tof g k
tof g a
tof k g
tof a k
tof j h
tof j f
tof a j
tof a b
tof f a
tof j i
tof j e
tof j d
tof i j
tof k i
tof k c
tof k a
tof i k
tof i g
tof i f
tof i e
tof h k
tof h f
tof h e
tof c b
tof h c
tof e h
tof c k
tof c j
tof c i
tof c g
tof c f
tof c a
tof a c
X d
tof g c
tof h g
X c
tof c h
tof c i
tof c j
tof c k
tof h a
tof d j
tof h d
tof h k
tof f i
tof i c
tof i f
tof i g
tof i h
tof i j
tof i k
tof k e
tof k g
tof j b
tof k i
tof j d
tof j e
tof j f
tof j g
tof f c
tof f a
tof a f
tof a g
tof a h
tof a j
tof f k
tof f h
tof f j
H f
Z k c f
H f
tof c d
tof c e
H c
Z k b c
H c
tof c d
tof c e
tof a b
tof a d
tof a f
H a
Z k j a
H a
tof a b
tof a d
tof a f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a f
tof a d
tof a b
H a
Z k j a
H a
tof a f
tof a d
tof a b
tof c e
tof c d
H c
Z k b c
H c
tof c e
tof c d
H f
Z k c f
H f
tof f j
tof f h
tof f c
tof f k
tof a j
tof a h
tof a g
tof a f
tof a c
tof f a
tof j g
tof j f
tof j e
tof j d
tof j b
tof d j
tof i g
tof k i
tof k e
tof i k
tof h j
tof i h
tof i f
tof i c
tof f i
tof h k
tof h g
tof h d
tof h a
tof c k
tof c j
tof c i
tof c h
tof c g
tof g c
tof c b
X c
X e
tof c f
tof c h
tof c i
tof c j
tof c k
tof h b
tof h d
tof h g
tof h j
tof a i
tof i a
tof i b
tof i c
tof i e
tof i f
tof i h
tof i j
tof a i
tof k i
tof a k
tof k a
tof k b
tof j f
tof k j
tof j d
tof j e
tof e j
tof j g
tof a f
tof a g
tof a k
tof e c
tof e i
H e
Z k c e
H e
tof d b
tof d c
tof d e
H d
Z k b d
H d
tof d j
tof d a
tof d e
tof d f
tof d g
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof d e
tof a f
tof d a
tof d j
H d
Z k b d
H d
tof d e
tof d c
tof d b
H e
Z k c e
H e
tof e j
tof e i
tof e g
tof e c
tof a k
tof a i
tof a g
tof j g
tof j f
tof j e
tof j d
tof k j
tof k f
tof k b
tof k a
tof a k
tof h j
tof i h
tof i f
tof i e
tof c b
tof i c
X b
tof i a
tof a i
tof h g
tof h d
tof h b
tof c k
tof c j
tof c i
tof c h
tof d f
tof d c
tof c d
tof c b
tof c e
tof c g
tof c i
tof c j
tof a h
tof h a
tof h b
tof h c
tof h e
tof h g
tof a i
tof i a
tof i e
tof i c
tof i k
tof k a
tof k f
tof k g
tof k h
tof d j
tof j c
tof j d
tof j e
tof j f
tof j h
tof d j
tof j i
tof e c
tof e a
tof a e
tof a f
tof e a
tof a g
tof a j
tof e k
tof e b
tof e i
H e
Z k c e
H e
tof d k
tof d c
H d
Z k b d
H d
tof d k
tof d c
tof d e
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d e
tof d c
tof d k
H d
Z k b d
H d
tof d j
tof d i
tof d c
tof d k
H e
Z k c e
H e
tof e j
tof e i
tof e g
tof e b
tof a c
tof e a
tof e k
tof a j
tof a g
tof a f
tof a e
tof e a
tof j i
tof j h
tof j f
tof j e
tof j d
tof j c
tof d j
tof h g
tof k h
tof k f
tof i k
tof k a
tof c e
tof i c
tof a i
X b
tof h c
tof a h
tof h b
tof h a
tof a h
X f
tof h c
tof c k
tof h d
tof i f
tof h i
tof i a
tof i b
tof i j
X e
tof i e
tof i k
tof f d
tof k f
tof f k
tof k i
tof a j
tof a c
tof a k
tof j a
tof a b
tof f a
tof a g
tof f c
tof f h
tof f j
H f
Z k c f
H f
tof f k
tof f b
tof f c
tof f g
H f
Z k b f
H f
tof a e
tof a f
H a
Z k j a
H a
tof a d
tof a e
tof a f
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a f
tof a e
tof a d
H a
Z k j a
H a
tof a i
tof a f
tof a e
tof a d
H f
Z k b f
H f
tof f g
tof f c
tof f b
tof f k
H f
Z k c f
H f
tof f j
tof f h
tof a g
tof a c
tof a k
tof f a
tof a i
tof a d
tof a b
tof j k
tof j c
tof j a
tof a j
tof i f
tof k i
tof k d
tof i k
tof i j
tof i e
tof i b
tof h i
tof i a
tof h k
tof h f
tof c d
tof c b
tof h c
X b
tof c k
tof c j
tof d i
tof d c
tof d g
tof d f
tof c b
tof c e
tof c k
tof a h
tof h a
tof h b
tof h c
tof h f
tof h g
tof h j
tof h k
tof a i
tof i a
tof i b
tof i e
tof i f
tof i h
tof i g
tof a k
tof k a
tof k c
tof j f
tof j e
tof k j
tof j a
tof j b
tof j d
tof j h
tof j i
tof d a
tof a b
tof a d
tof a f
tof a i
tof f a
tof a j
tof f c
tof f h
H f
Z k c f
H f
tof d k
tof d a
H d
Z k b d
H d
tof d k
tof d j
tof d b
tof d c
tof d e
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d e
tof d c
tof d b
tof d j
tof d k
H d
Z k b d
H d
tof d a
tof d k
H f
Z k c f
H f
tof f j
tof f h
tof f a
tof f c
tof j i
tof j f
tof j d
tof j b
tof a j
tof d a
tof j h
tof k j
tof j e
X f
tof k f
tof c a
tof k c
tof h g
tof h f
tof i h
tof i e
tof c i
tof c e
tof e c
X b
tof h b
tof h e
tof e g
tof e f
tof c j
tof c k
tof i h
tof h d
tof i f
tof i g
tof i j
tof i k
tof k a
tof k b
tof k d
tof k g
tof k h
tof a c
tof j a
tof j f
tof j h
tof j i
tof a b
tof a d
tof a g
tof d a
tof a j
tof d f
tof c h
tof d c
tof d i
H d
Z k c d
H d
tof c g
tof c i
H c
Z k b c
H c
tof c e
tof c g
tof c h
tof c i
tof d j
tof d e
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d e
tof d j
tof i h
tof c i
tof c g
tof c e
H c
Z k b c
H c
tof c i
tof c g
tof c e
H d
Z k c d
H d
tof d j
tof i f
tof d i
tof a e
tof d a
tof a d
tof d c
tof a j
tof a g
tof a b
tof j i
tof j e
tof j c
tof j a
tof k h
tof k g
tof k d
tof k b
tof k a
tof i a
tof a k
tof i j
tof i g
tof i d
tof i b
tof h a
tof a i
tof h j
tof h d
tof h b
tof a h
tof c k
tof c j
tof c g
tof c f
tof c e
tof e c
X b
X g
tof h c
tof c b
tof c h
tof c k
tof d h
tof h b
tof h d
tof h e
tof h f
tof i j
tof i k
tof h i
tof a k
tof k i
tof i a
tof k c
tof k d
tof k e
tof j b
tof d a
tof a d
tof a e
tof a f
tof a g
tof a k
tof d c
tof d a
tof d b
tof d i
H d
Z k c d
H d
tof d k
tof d a
tof d e
tof d f
tof d h
tof d i
H d
Z k b d
H d
tof g k
tof g b
tof g c
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g c
tof g b
tof g k
H d
Z k b d
H d
tof d i
tof d h
tof d f
tof d e
tof d a
tof d k
H d
Z k c d
H d
tof d i
tof d b
tof d a
tof d c
tof a k
tof a g
tof a f
tof a e
tof k d
tof a d
tof d a
tof h j
tof j b
tof k i
tof k e
tof k c
tof a k
tof i j
tof i a
tof h k
tof h i
tof h f
tof h e
tof h d
tof d h
tof c k
tof c h
tof h c
X h
tof h b
tof d i
X f
tof i d
X g
tof c d
tof c f
tof c g
tof k c
tof c j
tof j c
tof a h
tof h a
tof h b
tof h c
tof i h
tof k h
tof i e
tof k i
tof k a
tof k b
tof j k
tof k g
tof j d
tof j f
tof e a
tof a e
tof a f
tof a j
tof f c
tof f a
tof f h
tof f i
H f
Z k c f
H f
tof g b
tof g a
tof g h
tof g i
H g
Z k b g
H g
tof e k
tof e a
tof e f
tof e g
tof e h
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e h
tof e g
tof e f
tof e a
tof e k
H g
Z k b g
H g
tof i h
tof g i
tof g a
tof g b
H f
Z k c f
H f
tof f i
tof f a
tof f c
tof j f
tof a j
tof a e
tof e a
tof k g
tof j k
tof j d
tof k j
tof j c
tof k i
tof k b
tof k a
tof i e
tof i d
tof d i
tof c b
tof h c
X b
tof h d
tof h f
tof h a
tof a h
tof c j
tof a i
tof a c
tof a g
tof c a
tof h c
tof c b
tof c j
tof h k
tof a i
tof i a
tof i c
tof i b
tof i k
tof k a
tof k d
tof k f
tof k h
tof a j
tof a c
tof j a
tof j d
tof j e
tof j g
tof j i
tof j k
tof e b
tof a e
tof a f
tof a g
tof f k
tof e f
tof f a
H f
Z k c f
H f
tof e k
tof e c
tof e j
H e
Z k b e
H e
tof d k
tof d b
tof d c
tof d e
tof d g
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof d e
tof d c
tof d b
tof d k
H e
Z k b e
H e
tof e j
tof e f
tof e c
tof e a
tof e b
tof e k
H f
Z k c f
H f
tof f a
tof f k
tof a g
tof a f
tof a e
tof a c
tof a b
tof j k
tof j i
tof j g
tof j e
tof j d
tof j c
tof j a
tof a j
tof h f
tof h d
tof k h
tof i k
tof k a
tof c b
tof i c
tof a i
tof h k
tof c j
tof h c
tof c i
tof c g
tof c f
tof a c
X a
tof c a
tof c d
tof a c
tof c b
tof c e
tof c f
tof c g
tof i j
tof c i
tof j c
tof e h
tof h b
tof h c
tof h e
tof i f
tof i k
tof h i
tof k h
tof i a
tof i g
tof i b
tof k b
tof b i
tof k c
tof k e
tof j k
tof k g
tof j i
tof a c
tof a f
tof a h
tof a i
tof d f
tof d h
tof b d
H b
Z k c b
H b
tof b d
tof b i
tof e k
tof e a
tof e c
tof e f
tof e g
tof e h
tof e j
H e
Z k b e
H e
tof d k
tof d c
tof d g
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof c i
tof b c
H i
Z c k i
H i
tof k i
tof c i
tof b c
H d
Z k j d
H d
tof d h
tof d g
tof d f
tof d c
tof d k
H e
Z k b e
H e
tof e j
tof e h
tof e g
tof e f
tof e c
tof e a
tof e k
tof b h
tof b f
tof b d
H b
Z k c b
H b
tof b i
tof b h
tof b f
tof b d
tof a i
tof a h
tof a f
tof a c
tof k c
tof j k
tof i g
tof j i
tof k h
tof k g
tof k e
tof i k
tof h k
tof k b
X i
tof i f
tof i a
tof h i
X f
tof h f
tof i j
tof h e
tof h c
tof e h
X e
tof c d
X c
X g
tof c b
tof h a
tof h b
tof h d
tof h k
tof a i
tof i a
tof i e
tof i c
tof a k
tof k a
tof k b
tof k c
tof k e
tof e j
tof j e
tof j f
tof j h
tof j i
tof j k
tof e a
tof a h
tof a i
H a
Z k c a
H a
tof a e
tof a j
tof d k
tof d b
tof d a
tof d c
tof d e
tof d f
H d
Z k b d
H d
tof f k
tof f b
tof f i
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f b
tof f k
H d
Z k b d
H d
tof d f
tof d e
tof d c
tof d a
tof d b
tof d k
tof a j
tof a e
H a
Z k c a
H a
tof a i
tof a h
tof e a
tof j k
tof j i
tof j h
tof j f
tof j e
tof e j
tof k e
tof k c
tof k b
tof k a
tof a k
tof i e
tof i c
tof i a
tof a i
tof h k
tof h d
tof h b
tof c f
tof c h
tof c a
X b
tof c b
tof h c
tof c d
tof h e
tof i h
tof h f
tof h k
tof k i
tof i b
tof i e
tof i j
tof j i
tof j c
tof k c
tof a k
tof k d
tof j b
tof e g
tof e h
tof j e
tof a j
tof e k
tof e f
H e
Z k c e
H e
tof f k
tof f a
tof f j
H f
Z k b f
H f
tof a b
tof a c
tof a e
tof a g
tof a h
H a
Z k j a
H a
tof a b
tof a c
tof a e
tof a g
tof a h
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a e
tof a c
tof a b
H a
Z k j a
H a
tof a h
tof a g
tof a e
tof a c
tof a b
H f
Z k b f
H f
tof a j
tof f a
tof f k
H e
Z k c e
H e
tof e h
tof e g
tof e f
tof e k
tof k d
tof a k
tof j i
tof j h
tof j g
tof j e
tof k j
tof j c
tof j b
tof i e
tof k i
tof i k
tof i j
tof h f
tof i h
X i
tof i b
tof h k
tof h e
tof c d
X h
tof h a
tof h c
tof c h
X j
tof k h
tof h b
tof h c
tof h k
tof d i
tof i d
tof i h
tof i f
tof k f
X f
tof k d
tof k e
tof k g
tof e j
tof j e
tof j g
tof j k
tof d a
tof a b
tof a c
tof a j
tof a e
tof a g
H a
Z k c a
H a
tof a d
tof a e
tof a f
tof a g
tof a i
tof g k
tof g a
tof g h
tof e g
tof g j
H g
Z k b g
H g
tof k i
tof e k
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e g
tof e j
tof e k
H g
Z k b g
H g
tof g j
tof g h
tof g a
tof g k
tof a i
tof e f
tof a e
tof e f
tof a g
tof a d
H a
Z k c a
H a
tof a g
tof j e
tof a j
X c
tof c b
tof a c
tof d a
tof k g
tof j k
tof e j
tof k f
tof k e
tof k d
tof i h
tof i f
tof i d
tof d i
tof h k
tof h c
tof k h
tof j e
tof i j
X i
tof c d
X a
tof j c
tof k a
tof h k
tof i b
tof h i
tof i d
tof i f
tof k i
tof i g
tof k c
tof k d
tof k e
tof a h
X i
tof a d
tof a i
tof j a
tof a k
tof e c
tof e a
tof e b
tof e g
tof e i
tof e j
H e
Z k c e
H e
tof d b
tof d c
tof d e
tof d g
X d
H d
Z b k d
H d
tof k i
tof d i
tof a c
tof a e
tof a f
tof a g
tof a h
tof a i
H a
Z k j a
H a
tof a c
tof a e
tof a f
tof a g
tof a h
tof a i
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof i j
tof a i
tof i j
tof a k
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a f
tof a e
tof a c
H a
Z k j a
H a
tof a i
tof a h
tof a g
tof a f
tof a e
tof a c
H d
Z k b d
H d
tof d i
tof d g
tof d e
tof d c
tof d b
H e
Z k c e
H e
tof e j
tof e g
tof e b
tof e a
tof j e
tof e c
tof a k
tof j a
tof a h
tof h j
tof k a
tof a d
tof k g
tof c e
tof k c
tof i j
tof i g
tof i f
tof i e
tof i d
tof h i
tof c i
tof i b
X b
tof h k
tof h e
tof h a
tof c d
tof d h
tof h d
tof h e
tof h f
tof j g
tof h j
tof h i
tof h k
tof a i
tof i a
tof i b
tof i c
tof i j
tof j i
X d
tof k d
tof j d
tof i d
tof f g
tof a f
tof f g
tof k a
tof j c
tof j e
tof j f
tof j h
tof j k
tof a e
tof a j
tof e c
tof e b
tof e j
H e
Z k c e
H e
tof e k
tof e c
tof e f
tof e g
tof e h
tof e i
H e
Z k b e
H e
tof e k
tof e a
tof e f
tof e h
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e h
tof a f
tof e a
tof e k
H e
Z k b e
H e
tof e i
tof h g
tof h f
tof e h
tof e c
tof e k
H e
Z k c e
H e
tof e j
tof e i
tof e b
tof e c
tof a j
tof i g
tof a i
tof a e
tof j k
tof h e
tof j h
tof i j
tof j c
tof c j
tof k g
tof k f
tof k d
tof k a
tof i d
tof i b
tof i a
tof a i
tof i j
tof i k
tof h i
tof h d
tof d h
tof c g
tof c b
tof a d
tof a c
X a
tof c a
tof a c
X f
tof c b
tof c h
tof c j
tof a h
tof h a
tof h b
tof h e
tof h f
tof h g
tof h i
tof i h
tof i a
X e
tof d b
tof i b
tof i e
tof g k
tof k b
tof k g
tof k h
tof k i
tof k j
tof d j
tof j d
tof j g
tof d i
tof a j
tof d a
tof a d
tof a e
tof f g
tof a f
tof d a
tof a k
tof d c
tof d g
tof d h
H d
Z k c d
H d
tof f k
tof f b
tof a c
tof f a
H f
Z k b f
H f
tof a b
tof a d
tof a g
tof a h
H a
Z k j a
H a
tof a b
tof a c
tof a d
tof a g
tof a h
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a d
tof a c
tof a b
H a
Z k j a
H a
tof a h
tof a g
tof a d
tof a c
tof a b
H f
Z k b f
H f
tof f g
tof f c
tof a b
tof f a
tof f k
H d
Z k c d
H d
tof d j
tof d h
tof a g
tof d a
tof d c
tof a d
tof d k
tof a i
tof a f
tof a e
tof d a
tof j i
tof j g
tof j d
tof j b
tof d j
tof h j
tof i h
tof k i
tof k g
tof k b
tof g k
tof h i
tof i k
tof i e
X e
tof i b
tof i a
tof h g
tof h f
tof c a
tof a h
tof c j
tof c d
X c
tof c b
tof a c
tof c a
tof c d
tof c f
tof c g
tof c h
tof c j
tof e h
tof h e
tof h f
tof i g
tof h i
tof h j
tof i a
tof i b
tof i c
tof i h
tof i d
tof k d
tof k h
tof k a
tof k b
tof k e
tof k f
tof k j
tof a k
tof j a
tof j e
tof a j
tof j f
tof j i
tof a c
tof a d
tof a g
tof a h
tof c h
tof f c
H f
Z k c f
H f
tof c d
tof c g
H c
Z k b c
H c
tof c d
tof c g
tof d c
tof c h
tof d j
tof d e
tof d f
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d e
tof d c
tof d j
tof c h
tof c g
tof c d
H c
Z k b c
H c
tof c h
tof c g
tof c d
H f
Z k c f
H f
tof a f
tof f h
tof f c
tof j k
tof j i
tof a j
tof a g
tof a d
tof k j
tof j f
tof j e
tof j a
tof k h
tof k d
tof k b
tof h g
tof i h
tof i d
tof c b
tof i c
X b
tof i a
tof h j
tof h i
tof h f
tof h e
tof e h
tof c g
tof c a
tof c k
tof h a
tof h g
tof h i
tof h k
tof d i
tof i b
tof i j
tof d k
tof i d
tof k d
tof i e
tof k f
tof k g
tof k i
tof a j
tof j a
tof j c
tof j d
tof j i
tof j k
tof d a
tof a c
tof a f
tof a i
tof a j
tof a k
H a
Z k c a
H a
tof a b
tof a g
tof a c
tof a e
tof a j
H a
Z k b a
H a
tof a c
tof a d
tof a e
tof a h
tof a j
tof e k
tof e j
tof e c
tof e g
X e
X d
tof e f
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e g
tof e f
tof e c
tof e j
tof e k
tof a j
tof a h
tof a e
tof a d
tof a c
H a
Z k b a
H a
tof a j
tof a e
tof a c
tof a g
tof a b
H a
Z k c a
H a
tof k i
tof j k
tof a j
tof a f
tof a c
tof j d
tof d a
tof j c
tof a j
tof k g
tof k f
tof k d
tof i d
tof d k
tof i j
tof i e
tof i b
tof d i
tof h k
tof h i
tof h g
tof h a
tof c k
tof h j
tof c h
X d
tof c e
X b
X c
tof c f
tof c a
tof h g
tof h i
tof c h
tof h c
tof a b
tof h a
tof h e
tof h f
tof i a
tof i d
tof i j
tof e k
tof i e
tof e c
tof e f
tof k e
tof g h
tof k g
tof a e
tof j a
tof a d
tof a g
tof e a
tof a i
tof a k
tof e h
tof e j
H e
Z k c e
H e
tof d b
tof d a
tof d f
tof d h
tof d i
tof d j
H d
Z k b d
H d
tof g k
tof g j
tof g a
tof g b
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g h
tof g b
tof g a
tof g j
tof g k
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof a f
tof d a
tof d b
H e
Z k c e
H e
tof e j
tof e i
tof e h
tof a c
tof e k
tof e a
tof k e
tof a k
tof i d
tof a i
tof h g
tof a h
tof j a
tof i a
tof a b
tof j f
tof j e
tof j c
tof h f
tof h c
tof k h
tof i e
tof h i
tof e k
tof h e
tof c i
tof i j
tof h b
tof c h
tof h a
tof c g
tof c d
X c
tof c b
tof a i
tof i a
tof c a
tof h g
tof c h
tof c j
tof h b
tof h d
tof i h
tof h f
tof i b
tof i c
tof a k
tof k a
tof k d
tof k e
tof k i
tof a j
tof j a
tof j b
tof j h
tof d a
tof e g
tof a e
tof e g
X g
tof a i
H a
Z k c a
H a
tof d b
tof a d
tof a f
tof a g
tof d k
tof d c
tof d e
tof d g
tof d h
H d
Z k b d
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
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
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
Z k b d
H d
tof d h
tof d g
tof d e
tof d c
tof d b
tof d k
tof a g
tof a f
tof a d
tof a b
H a
Z k c a
H a
tof a g
tof a i
tof a e
tof d a
tof j h
tof j b
tof j a
tof a j
tof k i
tof k e
tof k d
tof k a
tof a k
tof i h
tof c f
tof c b
tof i c
X b
tof i a
tof a i
tof h g
tof h d
tof h b
tof c j
tof c g
tof c d
tof c k
tof h a
tof h c
tof h j
tof d i
tof i b
tof d f
tof i d
tof i h
tof i k
tof k a
tof k e
tof k f
tof k g
tof e j
tof b e
tof j b
tof j c
tof j g
tof a c
tof d i
tof a d
tof a k
tof b g
tof b i
H b
Z k c b
H b
tof b e
tof b g
tof b i
tof d b
tof d c
tof d g
tof d h
H d
Z k b d
H d
tof d k
tof d b
tof d g
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d g
tof d b
tof d k
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof d f
tof d c
tof d b
tof b i
tof b g
tof b e
H b
Z k c b
H b
tof b i
tof j b
tof b g
tof b e
tof a k
tof i f
tof i d
tof a i
tof a c
tof j c
tof e j
tof k g
tof k f
tof k e
tof k a
tof i k
tof i h
X i
tof i b
tof d i
tof h j
tof c f
tof c a
tof h c
tof c h
tof c k
X c
tof c d
tof c a
tof c f
tof h g
tof c h
tof c j
tof h a
tof h b
tof h c
tof a i
tof i a
tof i e
tof i h
tof i f
tof i k
tof a k
tof k a
tof k c
tof k d
tof k f
tof k g
tof k i
tof a j
tof j a
tof j b
tof j c
tof j d
tof j e
tof j f
tof j h
tof a c
tof d j
tof a d
tof e g
tof e i
tof e k
tof a e
tof e c
tof e b
tof e h
H e
Z k c e
H e
tof d b
tof d a
tof d c
tof d f
H d
Z k b d
H d
tof e k
tof e a
tof e b
tof e f
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e f
tof e b
tof e a
tof e k
H d
Z k b d
H d
tof d j
tof d f
tof d c
tof d a
tof d b
H e
Z k c e
H e
tof e i
tof e h
tof e g
tof e b
tof e c
tof a e
tof e k
tof a j
tof a i
tof a g
tof j a
tof a d
tof a c
tof j h
tof j f
tof j e
tof j b
tof a j
tof k i
tof k g
tof k f
tof k d
tof k c
tof k a
tof i a
tof a k
tof i h
tof i f
tof i e
tof a i
tof h c
tof c h
tof h b
X b
tof h a
tof c j
tof c i
X e
X c
tof c a
tof c d
tof h i
tof h j
tof c h
tof h b
tof h e
tof h f
tof j b
tof i j
tof k b
tof k c
tof j k
tof k e
tof k h
tof a b
tof a c
tof d c
tof e i
tof k i
tof d e
X i
X d
H d
Z c k d
H d
tof d i
tof f b
tof f g
H f
Z k b f
H f
tof e j
tof e a
tof e b
tof e f
tof e h
H e
Z k j e
H e
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
tof d i
H d
Z c k d
H d
tof d c
tof d i
H e
Z k j e
H e
tof e i
tof e h
tof e f
tof e b
tof e a
tof e j
H f
Z k b f
H f
tof f g
tof f b
X d
tof a c
tof d e
tof a b
tof k h
tof k e
X b
tof k b
tof j k
tof k c
tof h i
tof c i
tof i b
tof h g
tof h f
tof c h
tof h e
tof c g
tof c d
tof c k
tof i k
tof i h
tof h i
tof i a
tof i b
tof i c
tof i d
tof i g
tof k a
tof k d
tof j a
tof j b
tof j c
tof j d
tof j h
tof j i
tof c f
tof c i
tof a c
tof a k
tof b e
tof b f
tof b g
tof k i
H i
Z b k i
H i
H b
Z c k b
H b
tof b e
tof b f
tof b g
tof c g
tof c h
tof c j
H c
Z k b c
H c
tof c f
tof c g
tof c h
tof j i
tof c j
tof a c
tof a h
H a
Z k j a
H a
tof a c
tof a d
tof a e
tof h j
tof a h
H i
Z c k i
H i
tof a k
tof i a
tof c b
tof b i
tof c j
tof h k
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof c i
tof b c
H i
Z c k i
H i
tof k i
tof c i
tof b c
tof a h
tof a e
tof a d
tof a c
H a
Z k j a
H a
tof c h
tof a c
tof c j
tof c g
tof c f
H c
Z k b c
H c
tof j h
tof c j
tof c g
tof c f
tof b g
tof b f
tof b e
H b
Z k c b
H b
tof b i
tof b g
tof b f
tof b e
tof a k
tof a i
tof a f
tof j a
tof a c
tof i j
tof j d
tof j b
tof k d
tof i k
tof k a
tof i g
tof i c
tof h k
tof h j
tof h i
tof i h
tof c k
tof c f
tof c b
tof c a
X c
tof a c
tof c a
tof c b
tof c d
tof c f
tof c g
tof c h
tof c k
tof a h
tof h a
tof h b
tof h d
tof h i
tof h j
tof h k
tof a i
tof i a
tof i b
tof i h
tof i d
tof i k
tof k a
tof k e
tof j i
tof j f
tof k j
tof j a
tof j b
tof j c
tof d c
tof d g
tof d a
tof a d
tof a i
tof a j
tof d k
tof d b
tof d e
tof d f
tof d h
tof d j
H d
Z k c d
H d
tof d k
tof a c
tof d a
tof d e
H d
Z k b d
H d
tof a b
tof a d
tof a f
tof a g
tof a h
tof a i
H a
Z k j a
H a
tof a b
tof a c
tof a d
tof a f
tof a g
tof a h
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a f
tof a d
tof a c
tof a b
H a
Z k j a
H a
tof a i
tof a h
tof a g
tof a f
tof a d
tof a c
tof a b
H d
Z k b d
H d
tof d e
tof d c
tof d a
tof d k
H d
Z k c d
H d
tof d j
tof d h
tof d g
tof d f
tof d e
tof d b
tof d c
tof d k
tof j i
tof a j
tof a g
tof a d
tof a c
tof d a
tof c f
X b
tof c b
tof j c
tof k j
tof j a
tof k i
tof k f
tof k e
tof h k
tof h d
tof h b
tof i h
tof i a
tof h a
tof a i
tof h j
tof c a
tof a h
tof c k
tof c g
tof c d
tof a c
X c
tof c a
tof d h
tof h d
tof c d
tof c k
tof h i
tof h j
tof a i
tof i a
tof i b
tof i c
tof i e
tof i f
tof k h
tof i k
tof k a
tof k b
tof j f
tof k j
tof j a
tof j c
tof j d
tof j e
tof j g
tof j h
tof d j
tof a j
tof d a
tof a b
tof a h
tof a k
H a
Z k c a
H a
tof a d
tof a e
tof a f
tof d b
tof d a
tof d i
H d
Z k b d
H d
tof b c
tof b f
tof b h
H b
Z k j b
H b
tof b c
tof b f
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof b c
tof i a
tof a j
tof a k
tof j i
H i
Z c k i
H i
tof k i
tof b h
tof b f
H b
Z k j b
H b
tof b h
tof b f
tof b c
H d
Z k b d
H d
tof d i
tof d a
tof d b
tof a f
tof a e
tof a d
H a
Z k c a
H a
tof k b
tof a k
tof i h
tof j i
tof a j
tof j d
tof d a
tof j g
tof j f
tof j e
tof j c
tof h j
tof k h
tof i k
tof k f
tof k a
tof i e
tof i c
tof i b
tof a i
tof h i
tof h d
tof c d
tof d h
tof c k
tof c a
X b
X e
tof d c
tof c d
tof c g
tof c h
tof c j
tof c k
tof a h
tof h a
tof h f
tof h k
tof a i
tof a b
tof a c
tof i a
tof i d
tof i e
tof k h
tof i k
tof a f
tof a g
tof k a
tof e j
tof j c
tof e f
tof e h
tof j e
tof f a
tof a j
tof f i
tof d c
tof d a
tof d b
tof d g
tof d h
H d
Z k c d
H d
tof e k
tof e b
tof e a
H e
Z k b e
H e
tof f k
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f a
tof f j
tof f k
H e
Z k b e
H e
tof e h
tof e f
tof a b
tof e a
tof e k
H d
Z k c d
H d
tof d h
tof d g
tof a c
tof d a
tof j i
tof a j
tof a g
tof a f
tof j h
tof j f
tof j e
tof j c
tof e j
tof k h
tof k g
tof k f
tof k c
tof i k
tof k b
tof k a
tof i h
tof i e
tof c d
tof i c
tof a i
tof h k
tof h f
tof h a
tof a h
tof c k
tof c j
tof c h
tof c g
tof d c
X e
tof c a
tof c b
tof c e
tof c i
tof c j
tof c k
tof a h
tof h a
tof h b
tof h c
tof h d
tof i h
tof h f
tof k g
tof i k
tof k a
tof k d
tof e f
tof k e
tof a b
tof j a
tof j e
tof j g
tof a g
tof a i
tof a k
tof a d
H a
Z k c a
H a
tof a b
tof a d
tof a h
tof a j
tof e k
tof e c
tof e j
H e
Z k b e
H e
tof e j
tof e a
tof e b
tof e c
tof e f
tof e g
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof i g
tof e i
tof e f
tof e c
tof e b
tof a j
tof e a
H e
Z k b e
H e
tof j f
tof e j
tof e c
tof e k
tof a h
tof a d
tof a b
H a
Z k c a
H a
tof a d
tof a b
tof a k
tof a i
tof j g
tof j e
tof j b
tof j a
tof k g
tof k f
tof k e
tof k d
tof k a
tof i k
tof h f
tof i h
tof h d
tof c b
tof h c
tof h a
tof a h
tof c k
tof c j
tof e i
tof i e
tof c e
tof c a
X c
tof a c
tof c a
tof c b
tof c d
tof c e
tof h g
tof c h
tof c j
tof c k
tof h c
tof h d
tof k h
tof i j
tof i f
tof h f
tof a c
tof k a
tof a k
tof j k
tof k d
tof d k
tof j b
tof a j
tof j i
tof e g
tof e h
tof a e
tof e a
tof d a
tof d f
tof d g
H d
Z k c d
H d
tof e k
tof e b
H e
Z k b e
H e
tof d j
tof d c
tof d e
tof d f
tof d g
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof d c
tof d j
H e
Z k b e
H e
tof e h
tof e g
tof e a
tof e b
tof e k
H d
Z k c d
H d
tof d g
tof d f
tof a k
tof d a
tof j d
tof j i
tof a j
tof a h
tof a g
tof a e
tof a c
tof j k
tof j b
tof h f
tof h c
tof c h
tof h d
tof k h
tof c k
tof k a
tof i j
tof i f
tof i e
tof c e
tof e i
tof h g
tof c j
X c
tof c b
tof a c
X f
tof d a
tof c d
tof c e
tof c f
tof c h
tof c i
tof c j
tof h c
tof c k
tof h d
tof a h
tof i b
tof i e
tof i h
tof i f
X i
tof e k
tof k b
tof k c
tof k e
tof k g
tof k h
tof j b
tof j c
tof j g
tof a b
tof a g
tof a k
H a
Z k c a
H a
tof a d
tof a e
tof f k
tof f c
tof f g
X f
H f
Z b k f
H f
tof k i
tof f i
tof d j
tof d a
tof d c
tof d h
H d
Z k j d
H d
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d c
tof d a
tof d j
H f
Z k b f
H f
tof f i
X g
tof k g
tof f c
tof f k
tof a e
tof a d
H a
Z k c a
H a
tof k h
tof k b
tof a k
tof d a
tof j i
tof j g
tof j c
tof j b
tof k e
tof k c
tof e k
tof i h
tof i f
tof i e
tof i b
tof h k
tof c d
tof c a
tof h c
tof c h
tof c k
tof c j
tof c i
tof c f
tof c e
X b
tof a c
tof c a
tof e b
tof c e
tof c d
tof c f
tof c g
tof c h
tof c j
tof c k
tof d h
tof h b
tof d c
tof h d
tof h f
tof h j
tof g i
tof i j
X g
tof i g
tof i k
tof a k
tof k a
tof k d
tof d k
tof k g
tof e j
tof j e
tof j c
tof j i
tof j k
tof a i
tof a j
tof d f
tof d h
tof d j
H d
Z k c d
H d
tof e a
tof e c
tof e g
tof e j
H e
Z k b e
H e
tof e k
tof e j
tof e a
tof e b
tof e f
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e f
tof e b
tof e a
tof e j
tof e k
H e
Z k b e
H e
tof e j
tof e g
tof e c
tof e a
tof e b
H d
Z k c d
H d
tof d j
tof d h
tof d g
tof d f
tof d c
tof d k
tof j i
tof a j
tof j k
tof j e
tof j c
tof j b
tof e j
tof k g
tof k d
tof k c
tof k a
tof a k
tof i k
tof i j
tof i g
tof g i
tof h j
tof h f
tof h d
tof c b
tof h c
tof c d
tof d h
tof a h
tof h d
tof h a
X h
tof c k
tof c j
tof c g
tof c f
tof c e
X c
tof c b
tof c g
tof c j
tof c k
tof h f
tof h i
tof h j
tof i h
tof h k
tof i g
tof i a
tof k a
tof g i
tof k d
tof k e
tof k f
tof j c
tof j d
tof j e
tof j k
tof a b
tof a c
tof a e
tof a f
tof g h
tof a g
tof a j
tof d k
tof d a
tof d f
tof d i
H d
Z k c d
H d
tof d k
tof d f
H d
Z k b d
H d
tof g k
tof g a
tof g c
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g i
tof g h
tof g c
tof g a
tof g k
H d
Z k b d
H d
tof d f
tof d k
H d
Z k c d
H d
tof d i
tof a f
tof d a
tof d k
tof a j
tof i h
tof i g
tof a i
tof a e
tof a c
tof a b
tof k e
tof k d
tof j k
tof j c
tof k f
tof h i
tof i k
tof k a
tof h j
tof h f
tof h d
tof a h
tof c k
tof c j
tof c g
tof a c
tof c a
X a
tof a c
tof a b
X e
X f
tof c f
tof c j
tof c k
tof d h
tof h b
tof h d
tof h f
tof h i
tof h j
tof a i
tof i a
tof i b
tof i c
tof i d
tof i e
tof i f
tof i g
tof i k
tof k a
tof k d
tof k h
tof k j
tof d j
tof j b
tof d g
tof j d
tof d j
tof j h
tof a b
X i
tof a g
tof a i
tof d a
tof d c
tof d e
tof d f
X d
H d
Z c k d
H d
tof k i
tof d i
tof e b
tof e g
tof e i
tof e j
H e
Z k b e
H e
tof f j
tof f b
tof f h
X f
X e
tof f g
H f
Z k j f
H f
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
tof d i
H d
Z c k d
H d
tof d c
H f
Z k j f
H f
tof f h
tof f g
tof f b
tof f j
H e
Z k b e
H e
tof e j
tof e i
tof e g
tof e b
tof d j
tof d h
tof d g
tof d f
tof d e
tof d a
tof i g
tof a i
tof i a
tof a b
tof j h
tof j g
tof j d
tof j b
tof k d
tof d j
tof k h
tof k a
tof i k
tof i f
tof i e
tof i d
tof i c
tof a i
tof h j
tof h i
tof h f
tof h d
tof h b
tof d h
tof c k
tof c j
tof c f
tof c a
X b
X g
tof f c
tof c b
tof c f
tof c g
tof c h
tof c j
tof a h
tof h a
tof h b
tof h c
tof h d
tof h g
tof h j
tof h k
tof e i
tof i e
tof i c
tof i h
tof a k
tof k a
tof k c
tof k e
tof k i
tof k j
tof a j
tof j a
tof j c
tof j f
tof j g
tof d a
tof a d
tof a g
tof a j
tof a k
tof e f
tof e g
H e
Z k c e
H e
tof e f
tof e g
tof g k
tof a c
tof a i
tof g a
tof g j
H g
Z k b g
H g
tof a b
tof a e
tof a g
H a
Z k j a
H a
tof a b
tof a c
tof a e
tof a g
tof a h
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a e
tof a c
tof a b
H a
Z k j a
H a
tof a i
tof a h
tof a g
tof a e
tof a c
tof a b
H g
Z k b g
H g
tof g j
tof g i
tof g h
tof g c
tof g a
tof g k
tof e g
tof e f
H e
Z k c e
H e
tof e g
tof e f
tof a k
tof a j
tof a h
tof a g
tof a d
tof d a
tof j g
tof j f
tof j c
tof k a
tof j a
tof a j
tof i e
tof i c
tof k i
tof i h
tof h a
tof a k
tof e i
tof h j
tof h d
tof c b
tof h c
tof c j
tof c h
tof c f
tof f c
tof c d
X c
tof c f
tof h b
tof c h
tof c k
tof h a
tof h c
tof h d
tof h e
tof h f
tof a i
tof i a
tof i b
tof i g
tof i j
tof i k
tof i h
tof a k
tof a c
tof k a
tof k d
tof k g
tof k j
tof d j
tof j d
tof j h
tof j i
tof a d
tof a f
tof a g
tof a h
tof f a
tof a i
tof f k
tof f c
H f
Z k c f
H f
tof d b
tof d c
tof e f
tof d e
tof d h
tof d j
H d
Z k b d
H d
tof k i
tof e k
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof k i
tof a k
tof j i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e f
tof e k
H d
Z k b d
H d
tof j h
tof d j
tof d f
tof d e
tof d c
tof d b
H f
Z c k f
H f
tof k c
tof f k
tof f a
tof a f
tof h g
tof a h
X g
tof a d
tof a c
tof j i
tof k d
tof j d
tof d j
tof k g
tof k a
tof i a
tof a k
tof i j
tof i h
tof i b
tof a i
tof h f
tof h e
tof c d
tof c b
tof h c
X b
tof h a
tof c k
tof h g
tof c h
tof c f
X c
tof d c
tof c d
tof c f
tof h i
tof h j
tof c h
tof c k
tof h a
tof h b
tof h c
tof h f
tof i k
tof k i
tof e k
tof i e
tof i g
tof k f
tof k j
tof d j
tof d a
tof j d
tof j e
tof a e
tof g k
tof j g
tof g j
tof a i
tof g c
tof g b
tof g h
H g
Z k c g
H g
tof d b
tof d a
tof d c
tof d j
H d
Z k b d
H d
tof d e
tof d g
H d
Z k j d
H d
X f
X d
tof d g
tof d e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
tof d e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof d g
H d
Z k j d
H d
tof d g
tof d e
H d
Z k b d
H d
tof d j
tof d i
tof d c
tof d a
tof d b
H g
Z k c g
H g
tof g j
tof g i
tof g h
tof g b
tof g c
tof a g
tof g k
tof i g
tof k i
tof j d
tof a j
tof d a
tof j k
tof k j
tof h a
tof j e
tof k f
tof i k
tof i e
tof e i
tof h i
tof h g
X f
tof c f
tof h c
tof h b
tof a h
tof c k
tof c j
tof c i
tof c h
tof c g
tof c d
tof d c
X b
tof g c
tof c b
tof c g
tof c h
tof c i
tof c k
tof e h
tof h c
tof h e
tof h f
tof i g
tof h i
tof i h
tof h j
tof i a
tof i c
tof i e
tof k j
tof i k
tof i f
tof d e
tof k d
tof j a
tof j b
tof j c
tof j e
tof j f
tof j g
tof j h
tof d f
tof a d
tof a g
tof a h
tof a i
tof d a
tof a k
tof d c
H d
Z k c d
H d
tof g k
tof g b
tof g c
tof j i
tof g j
H g
Z k b g
H g
tof f k
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f k
H g
Z k b g
H g
tof g j
tof g i
tof g c
tof g b
tof g k
H d
Z k c d
H d
tof d f
tof a e
tof d a
tof d c
tof d k
tof k d
tof a k
tof h g
tof h f
tof i h
tof a i
tof h e
tof h c
tof j h
tof j b
tof j a
tof a j
tof i k
tof k j
tof k e
tof i c
tof i a
tof h j
tof h i
tof e h
tof c k
X h
tof h i
tof c h
tof c g
tof c b
X g
tof g c
X f
tof d c
tof c b
tof c d
tof c f
tof h a
tof h b
tof h d
tof h e
tof h f
tof h g
tof h j
tof h k
tof i g
tof i k
tof f k
tof k f
tof g k
tof k c
tof k h
tof f j
tof j c
tof j f
tof j h
tof j k
tof e a
tof a e
X i
tof a h
tof a i
X g
H g
Z c k g
H g
tof k i
tof g i
tof a d
H a
Z k b a
H a
tof a d
tof e j
tof e a
tof e b
H e
Z k j e
H e
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
tof g i
H g
Z c k g
H g
tof g c
H e
Z k j e
H e
tof e b
tof e a
tof e j
tof a d
H a
Z k b a
H a
tof a d
tof g h
tof g k
tof a i
tof a h
tof a e
tof e a
tof k h
tof j k
tof j f
tof j c
tof f j
tof k f
tof k c
tof f k
tof i g
tof h k
tof h d
tof h b
tof h a
tof c f
tof c d
X c
tof c b
tof d c
tof c d
tof c g
tof h d
tof i b
tof i c
tof i d
tof j i
tof i f
tof i e
tof k e
X f
tof k a
tof k b
tof k h
tof j g
tof d a
tof a d
tof a e
tof a f
tof a i
tof a k
tof d k
tof d c
tof d g
tof d i
tof d j
H d
Z k c d
H d
tof d f
tof d j
H d
Z k b d
H d
tof d f
tof d j
tof e k
tof e b
tof e g
tof e h
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e g
tof e b
tof e k
tof d j
tof d f
H d
Z k b d
H d
tof d j
tof d f
H d
Z k c d
H d
tof j i
tof j g
tof d j
tof d c
tof a d
tof d k
tof i f
tof i e
tof a i
tof d a
tof j f
tof j e
tof h e
tof k h
tof k b
tof k a
tof c g
tof i c
tof h d
tof c d
X b
tof c j
tof c k
tof h a
tof h k
tof i a
tof i c
tof j h
tof i j
tof a k
tof k a
tof k b
tof k d
tof k e
tof k h
tof j a
tof j c
tof j e
tof j f
tof j g
tof j k
tof e b
tof a e
tof a f
tof g h
tof a g
tof g h
tof a i
tof a j
tof f h
tof f j
H f
Z k c f
H f
tof f h
tof f j
tof e k
tof e a
tof e h
H e
Z k b e
H e
tof b d
tof b g
tof b h
tof b i
H b
Z k j b
H b
tof b d
tof b g
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof b i
tof c i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof c i
tof b c
H i
Z c k i
H i
tof k i
tof c i
tof b c
tof b h
tof b g
tof b d
H b
Z k j b
H b
tof b i
tof b h
tof b g
tof b d
H e
Z k b e
H e
tof a h
tof a b
tof e a
tof e k
tof f j
tof f h
H f
Z k c f
H f
tof f j
tof f h
tof a j
tof a i
tof j a
tof a g
tof a f
tof a e
tof k h
tof j k
tof i j
tof j c
tof k e
tof k d
tof k b
tof k a
tof i a
tof a k
tof h g
tof i h
tof i d
tof i b
tof h k
tof h j
tof h i
tof h f
tof h a
tof c k
X e
X f
tof c b
tof c e
tof c g
tof c h
tof c i
tof d h
tof h b
tof h c
tof h d
tof h e
tof h k
tof i e
tof i g
tof j h
tof i j
tof a i
tof k i
tof a k
tof k a
tof k b
tof k c
tof k e
tof k f
tof k g
tof j b
tof d g
tof j d
tof j k
tof e a
tof a b
tof a c
tof a e
tof a g
tof a j
tof d c
tof d e
tof d i
tof d j
H d
Z k c d
H d
tof a c
tof a d
tof a f
H a
Z k b a
H a
tof a c
tof a d
tof f h
tof f i
tof a f
tof f a
tof f k
tof f j
tof f c
tof f g
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f h
tof f g
tof a c
tof f a
tof f j
tof f k
tof a i
tof a h
tof a f
tof a d
H a
Z k b a
H a
tof a f
tof a d
tof a c
H d
Z k c d
H d
tof d j
tof i g
tof d i
tof d e
tof d c
tof j g
tof a j
tof a e
tof c b
tof a c
tof e a
tof j k
tof j h
tof j d
tof j b
tof k i
tof k f
tof k e
tof k c
tof k a
tof a k
tof h e
tof i h
tof h k
tof h d
tof h c
tof c h
tof d h
tof c i
tof c g
tof d e
tof d c
tof c d
X d
tof i b
tof c i
tof h i
tof h a
tof h g
tof h k
tof i a
tof i e
tof i f
tof i h
tof k a
tof k b
tof k c
tof k d
tof k e
tof d j
tof j c
tof j d
tof j f
tof j k
tof d a
tof a e
X i
tof j i
tof a b
tof a j
H a
Z k c a
H a
tof a b
tof a d
tof a f
tof g k
tof g b
tof a h
tof g a
tof a g
tof g i
X g
H g
Z b k g
H g
tof k i
tof g i
tof a d
tof a e
H a
Z k j a
H a
tof a d
tof a e
tof a g
tof c j
tof h j
tof a h
H i
Z c k i
H i
tof a k
tof i a
tof c b
tof b i
tof h k
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a e
tof a d
H a
Z k j a
H a
tof a h
tof a g
tof a e
tof a d
H g
Z k b g
H g
tof g h
tof a b
tof g a
tof g k
tof a f
tof a d
H a
Z k c a
H a
tof a b
tof a j
tof a i
tof i a
tof a e
tof d a
tof j k
tof j f
tof j d
tof j c
tof d j
tof k e
tof c d
tof c b
tof k c
X b
tof k a
tof i h
tof h i
tof i f
tof i b
tof h k
tof h g
tof h a
tof c i
tof c e
tof d c
X c
tof c d
tof c e
tof c f
tof c g
tof c i
tof h c
tof h d
tof h e
tof i h
tof i b
tof i k
tof a k
tof k a
tof k d
tof k e
tof k h
tof k i
tof a j
tof j a
tof j c
tof j d
tof j g
tof d f
tof d a
tof a b
tof e f
tof a e
tof a i
tof g k
tof d g
tof g j
H g
Z k c g
H g
tof d c
H d
Z k b d
H d
tof e k
tof e j
tof e b
tof e g
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e g
tof e f
tof e b
tof e j
tof e k
H d
Z k b d
H d
tof d j
tof d i
tof d g
tof d e
tof d c
tof a b
tof d a
H g
Z k c g
H g
tof g j
tof g k
tof a i
tof a f
tof a e
tof j g
tof c d
tof j c
tof j a
tof a j
tof i h
tof k i
tof k e
tof k d
tof k a
tof a k
tof i k
tof i j
tof i b
tof h f
tof h e
tof h c
tof c i
tof c g
X b
X f
tof c a
tof c b
tof c k
tof a h
tof h a
tof h e
tof h i
tof h j
tof h k
tof i a
tof i d
tof i h
tof d k
tof k c
tof k d
tof k e
tof f g
tof k f
tof k h
tof j k
tof k i
tof a b
tof a c
tof a d
tof a k
tof f c
tof f i
tof f j
X f
tof d f
H f
Z k c f
H f
tof d k
tof d b
tof d a
tof d e
H d
Z k b d
H d
tof e j
tof e b
tof e c
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e c
tof e b
tof e j
H d
Z k b d
H d
tof d f
tof d e
tof a b
tof d a
tof d k
H f
Z k c f
H f
tof j i
tof f j
tof f g
tof f c
tof a k
tof a d
tof a c
tof j k
tof i h
tof k i
tof k g
tof k f
tof k e
tof k d
tof k c
tof d k
tof i d
tof h i
tof i a
tof h j
tof c h
tof h k
tof a h
tof a e
tof c b
tof e b
tof c a
X e
X d
tof c g
tof h b
tof h d
tof h g
tof h i
tof h j
tof i c
tof i h
tof i f
tof i k
tof a k
tof k a
tof k b
tof k c
tof k g
tof j i
tof j h
tof k j
tof e c
tof j e
tof d a
tof a c
tof a d
tof a f
tof a g
tof a j
tof a k
tof e f
tof e g
H e
Z k c e
H e
tof d b
tof d a
tof d c
tof d g
tof d h
tof d j
H d
Z k b d
H d
tof e k
tof e a
tof e b
tof e h
X e
X d
tof e f
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e h
tof e f
tof e b
tof e a
tof e k
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d g
tof d c
tof d a
tof d b
H e
Z k c e
H e
tof e g
tof e f
tof e b
tof e c
tof a k
tof a j
tof a i
tof a g
tof a f
tof a d
tof a c
tof d a
tof j h
tof j e
tof k j
tof j c
tof j b
tof i h
tof k i
tof k g
tof k a
tof a k
tof i k
tof i f
tof i c
tof h j
tof h i
tof h g
tof h e
tof c h
tof h d
tof h b
X b
tof c g
X f
tof a h
tof h a
tof h d
tof h f
tof h g
tof h i
tof h j
tof h k
tof a i
tof i a
tof i j
tof i k
tof k j
tof k i
tof i b
tof k e
tof d k
tof k f
tof k h
tof a j
tof j a
tof j b
tof j c
tof j e
tof j f
tof j i
tof j k
tof e a
tof a e
tof a f
tof a g
tof a j
tof a k
tof d e
tof d g
tof d j
H d
Z k c d
H d
tof f b
tof f c
tof f i
tof k i
H f
Z b k f
H f
tof f b
tof f k
tof f a
tof f g
tof f h
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f h
tof f g
tof f b
tof f a
tof f k
H f
Z k b f
H f
tof f i
tof c b
tof f c
tof c f
H d
Z k c d
H d
tof d j
tof d h
tof d g
tof d f
tof d e
tof d k
tof j k
tof a j
tof a g
tof a f
tof j e
tof a e
tof e a
tof j i
tof j c
tof c j
tof a j
tof i j
tof k i
tof h f
tof h e
tof h b
tof k h
tof h k
tof i k
tof a i
tof i b
tof i a
tof a i
X c
tof h d
tof c d
tof f c
tof c b
tof c f
tof c k
tof h c
tof h f
tof i d
tof i e
tof i g
tof i k
tof k i
tof a i
tof i h
tof k b
tof k c
tof k d
tof k f
tof k j
tof d b
tof j d
tof d e
tof a d
tof a f
tof d k
tof d c
tof d a
tof d j
H d
Z k c d
H d
tof d k
tof d c
tof d f
tof g j
tof d g
H d
Z k b d
H d
tof g k
tof g b
tof g c
tof g i
H g
Z k j g
H g
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H g
Z k j g
H g
tof g i
tof g c
tof g b
tof g j
tof g k
H d
Z k b d
H d
tof d j
tof d g
tof d f
tof d c
tof d k
H d
Z k c d
H d
tof d j
tof d e
tof a b
tof d a
tof d k
tof k d
tof d c
tof i h
tof a i
tof a f
tof a e
tof a d
tof j d
tof i j
tof k i
tof j b
tof k f
tof i k
tof i g
tof i e
tof i d
tof i a
tof h f
tof h e
tof c k
tof h c
tof c f
X c
tof c b
tof f c
tof c f
X e
tof c i
tof c k
tof h d
tof i a
tof i b
tof i h
tof k h
tof i g
X g
tof k a
tof d b
tof k d
tof k e
tof e c
tof j e
tof j i
tof j k
tof d a
tof a d
tof a e
tof a f
tof a h
tof a i
tof a j
tof e a
tof a k
tof e g
tof e h
tof e i
H e
Z k c e
H e
tof d k
tof d f
tof d j
H d
Z k b d
H d
tof d k
tof d j
tof d a
tof d f
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d f
tof d a
tof d j
tof d k
H d
Z k b d
H d
tof d j
tof d f
tof d b
tof d k
H e
Z k c e
H e
tof e i
tof e h
tof e g
tof a c
tof a k
tof e a
tof j e
tof j i
tof a j
tof a h
tof a f
tof a d
tof a b
tof d a
tof j k
tof j c
tof k h
tof k e
tof k d
tof k b
tof k a
tof h j
tof h g
tof h b
tof i h
X b
tof h i
tof i a
tof h k
tof h d
tof a h
tof c k
tof c j
X f
tof f c
tof c f
tof c i
tof f c
tof c b
tof c g
tof c k
tof e h
tof h b
tof h c
tof h e
tof i j
tof h i
tof a g
tof i a
tof i k
tof d k
tof k c
tof k d
tof k h
tof k i
tof k j
tof d j
tof j d
tof a j
tof e k
tof j e
tof e j
tof b f
X i
tof b h
tof e b
X e
H e
Z c k e
H e
tof k i
tof e i
tof a f
tof a h
H a
Z k b a
H a
tof a f
tof a h
tof a j
tof b g
H b
Z k j b
H b
tof b f
tof b g
tof b h
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
tof e i
H e
Z c k e
H e
tof b h
tof b g
tof b f
H b
Z k j b
H b
tof b h
tof b g
tof b f
tof a j
tof a h
tof a f
H a
Z k b a
H a
tof a j
tof a h
tof a f
tof e j
tof e h
tof e f
tof e b
tof a e
tof j e
tof e k
tof a g
tof k d
tof j d
tof d j
tof k i
tof h c
tof k h
tof c k
tof d k
tof i k
tof i j
tof i g
tof i a
tof h j
tof h i
tof h e
tof h b
tof e h
tof c i
tof c g
tof c f
tof c b
tof f c
X e
tof a c
tof c a
tof c e
tof c g
tof c j
tof c k
tof j h
tof h c
tof h f
tof a i
tof i a
tof i h
tof a k
tof k a
tof k b
tof k d
tof k g
tof k h
tof j k
tof a d
tof a h
tof a e
H a
Z k c a
H a
tof e b
tof a e
tof a f
tof a i
tof e c
tof e g
H e
Z k b e
H e
tof d j
tof d b
tof d e
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d e
tof d b
tof d j
H e
Z k b e
H e
tof e g
tof e c
tof a e
X e
tof e b
tof a f
H a
Z k c a
H a
tof a e
tof a h
tof a d
tof k h
tof j k
tof j f
tof j c
tof k g
tof k d
tof k b
tof k a
tof a k
tof i h
tof i a
tof a i
tof h f
tof h c
tof c k
tof c j
tof c g
tof c e
tof c a
tof a c
X d
tof c h
tof c k
tof h b
tof h f
tof h i
tof h j
tof d i
tof i c
tof i d
tof i e
tof i h
tof i g
tof k g
tof k i
tof k a
tof k c
tof k d
tof k e
tof k f
tof j b
tof j d
tof j g
tof f a
tof a b
tof a f
tof a h
tof a i
tof a k
tof a g
tof a j
H a
Z k c a
H a
tof a g
tof a d
tof a f
tof a h
H a
Z k b a
H a
tof a d
tof a f
tof a h
tof a j
tof e k
tof e j
tof e h
X e
X d
tof e f
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e h
tof e f
tof e j
tof e k
tof a j
tof a h
tof a f
tof a d
H a
Z k b a
H a
tof a h
tof a f
tof a d
tof a g
H a
Z k c a
H a
tof j g
tof a j
tof k i
tof a k
tof a h
tof a f
tof a b
tof k f
tof f a
tof j d
tof j b
tof k g
tof k e
tof k d
tof k c
tof i h
tof i g
tof i e
tof i d
tof i c
tof d i
tof h j
tof h i
tof h f
tof h b
tof h k
tof c h
X b
tof d c
tof c d
tof c g
tof c j
tof h a
tof h c
tof h g
tof d i
tof i b
tof i c
tof i d
tof i f
tof i h
tof i j
tof a k
tof k a
tof k b
tof d g
tof k d
tof a k
tof d k
tof d i
tof d j
tof j b
tof d c
tof j d
tof d j
tof e f
tof a e
tof a g
tof d a
tof d f
tof d i
H d
Z k c d
H d
tof e k
tof e j
H e
Z k b e
H e
tof d e
tof d g
tof d i
H d
Z k j d
H d
tof d e
tof d g
tof d i
tof c b
H i
Z b k i
H i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
tof d e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof d i
tof d g
H d
Z k j d
H d
tof d i
tof d g
tof d e
H e
Z k b e
H e
tof e j
tof e i
tof e f
tof e k
H d
Z k c d
H d
tof d j
tof d i
tof d g
tof a f
tof d a
tof d c
tof d k
tof a k
tof a i
tof a g
tof a e
tof k g
tof j k
tof j d
tof j c
tof j b
tof d j
tof i d
tof i b
tof k i
tof k a
tof a k
tof h j
tof h f
tof h c
tof i h
tof d i
tof h k
tof c j
X d
tof c d
tof d c
tof d g
tof c k
tof h c
tof h e
tof a i
tof i a
tof i b
tof i c
tof i h
tof i e
X e
tof a k
tof k a
tof k c
tof k d
tof k i
tof a j
tof j a
tof j b
tof j c
tof j f
tof j g
tof j i
tof d k
tof j k
tof d a
tof a d
tof a b
tof a c
tof a h
tof d e
tof d f
tof a d
tof d j
H d
Z k c d
H d
H a
Z k b a
H a
tof a d
tof a f
tof a g
tof a j
tof d k
tof d a
tof d g
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof a g
tof d a
tof d k
tof a j
tof a f
tof a d
H a
Z k b a
H a
tof a j
tof a d
H d
Z k c d
H d
tof j f
tof d j
tof d e
tof a d
tof d k
tof a h
tof a c
tof a b
tof d a
tof k i
tof j k
tof j g
tof j c
tof j b
tof j a
tof a j
tof k d
tof k c
tof k a
tof a k
tof h e
tof i h
X e
tof i c
tof i b
tof i a
tof c k
tof c g
tof g c
X b
tof c b
tof h c
tof i g
tof i j
tof c i
tof c k
tof i h
tof h d
tof i b
tof i a
tof k a
tof k b
tof k h
tof a j
tof j a
tof j c
tof j h
tof j i
tof e a
tof a b
tof a e
tof a f
tof a h
tof a k
tof d c
tof d a
H d
Z k c d
H d
tof d k
tof d a
tof d c
tof d f
tof d h
tof d i
H d
Z k b d
H d
tof d k
tof d j
tof d b
tof d f
tof d g
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d g
tof d f
tof d b
tof d j
tof d k
H d
Z k b d
H d
tof i h
tof d i
tof d f
tof d c
tof d a
tof d k
H d
Z k c d
H d
tof d a
tof d c
tof k h
tof a k
tof a f
tof a e
tof a b
tof e a
tof j i
tof j c
tof j a
tof a j
tof k b
tof k a
tof i j
tof i g
tof i d
tof i b
tof i a
tof a i
tof h k
tof h j
tof h f
tof h d
tof h b
tof h a
tof c k
tof c j
tof c i
tof c g
tof c b
tof g c
X b
tof e c
tof c b
tof c e
tof c f
tof c i
tof c k
tof a h
tof h a
tof h c
tof j f
tof h j
tof h i
tof a k
tof i j
tof j i
tof a j
tof k i
tof i a
tof k c
tof k d
tof k f
tof j b
tof j c
tof j g
tof j h
tof d a
tof a b
tof a d
tof e i
tof a e
tof a j
tof e a
tof a k
tof e c
tof e h
H e
Z k c e
H e
tof a d
tof a f
tof a g
tof a h
H a
Z k b a
H a
tof a d
tof a f
tof a g
tof a h
tof d k
tof d g
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d g
tof d k
tof a h
tof a g
tof a f
tof a d
H a
Z k b a
H a
tof a h
tof a g
tof a f
tof a d
H e
Z k c e
H e
tof e i
tof e h
tof e a
tof e c
tof a e
tof e k
tof a j
tof a d
tof a b
tof d a
tof j h
tof j g
tof j f
tof j c
tof j b
tof j a
tof i f
tof k i
tof k d
tof k c
tof k a
tof i a
tof a k
tof i j
tof h a
tof a i
tof h j
tof c f
tof h c
tof a h
tof c k
tof c i
tof c e
X e
tof e c
tof e b
tof c e
tof c a
tof c f
tof c g
tof c k
tof e h
tof h b
tof h c
tof h e
tof h f
tof h j
tof a i
tof i a
tof i e
tof i h
tof i k
tof k a
tof k b
tof k e
tof k j
tof a j
tof j a
tof j c
tof j d
tof j e
tof j f
tof j g
tof f j
tof e a
tof a j
tof a d
tof a h
H a
Z k c a
H a
tof a b
tof a d
tof a e
tof a h
H f
Z k b f
H f
tof f j
tof b c
tof b e
tof b f
tof b g
tof b h
H b
Z k j b
H b
tof b c
tof b e
tof b f
tof b g
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof b c
tof i a
tof a j
tof a k
tof j i
H i
Z c k i
H i
tof k i
tof b h
tof b g
tof b f
tof b e
H b
Z k j b
H b
tof b h
tof b g
tof b f
tof b e
tof b c
tof f j
tof f i
H f
Z k b f
H f
tof f j
tof f i
tof a h
tof a e
tof a d
tof a b
H a
Z k c a
H a
tof a h
tof j d
tof a j
tof j a
tof a i
tof e a
tof j g
tof j f
tof j e
tof j c
tof k a
tof a j
tof k e
tof k b
tof i k
tof h e
tof i h
tof i a
tof a i
tof h j
tof c f
tof c b
tof h c
X b
tof e h
tof c k
tof c g
tof c e
tof c a
X c
X d
tof a c
tof c a
tof c e
tof c f
tof c g
tof c i
tof c j
tof c k
tof d h
tof h b
tof h i
tof i h
tof h c
tof h d
tof h f
tof i g
tof i e
tof i k
tof a k
tof k a
tof k b
tof k c
tof k e
tof k f
tof k i
tof a j
tof j a
tof j b
tof j c
tof j d
tof j e
tof j i
tof d k
tof a d
tof d a
tof d g
H d
Z k c d
H d
tof e k
tof e b
tof e a
tof e j
H e
Z k b e
H e
tof d k
tof d j
tof d a
tof d b
tof d c
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d c
tof d b
tof d a
tof d j
tof d k
H e
Z k b e
H e
tof e j
tof e a
tof e b
tof e k
H d
Z k c d
H d
tof d g
tof a k
tof j a
tof d a
tof a d
tof i e
tof i c
tof j i
tof j b
tof a j
tof i f
tof k i
tof k b
tof k a
tof a k
tof i k
tof i h
tof i g
tof h i
tof i d
X f
tof c f
tof h c
tof h b
tof d h
tof c k
tof c j
tof c i
tof c g
tof c e
tof c a
tof a c
X b
tof d c
tof c b
tof c d
tof c e
tof c i
tof c k
tof f h
tof h b
tof h f
tof h j
tof a i
tof i a
tof i e
tof i j
tof i k
tof k j
tof k i
tof i g
tof k a
tof a k
tof k c
tof a j
tof a h
tof j a
tof e b
tof e f
tof a e
tof a i
tof e k
tof e c
tof e a
tof e h
tof d e
tof e j
H e
Z k c e
H e
tof d k
tof d a
tof d c
H d
Z k b d
H d
tof a b
tof a e
tof a f
tof a h
tof a i
H a
Z k j a
H a
tof a b
tof a e
tof a f
tof a h
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a f
tof a e
tof a b
H a
Z k j a
H a
tof a i
tof a h
tof a f
tof a e
tof a b
H d
Z k b d
H d
tof d j
tof d e
tof d c
tof d a
tof d k
H e
Z k c e
H e
tof j h
tof e j
tof e f
tof a b
tof k c
tof a k
tof e a
tof a e
tof a i
tof h f
tof a h
tof k a
tof j k
tof a j
tof i g
tof k i
tof i k
tof i j
tof i e
tof i a
tof a i
tof h j
tof h b
tof f h
tof c k
tof c i
X c
tof c e
tof c b
tof c f
tof c g
tof i j
tof c i
tof i c
tof a h
tof h a
tof h b
tof h f
tof i k
tof h k
tof k h
tof h j
tof i a
X i
tof i f
tof k a
tof k c
tof k g
tof j a
tof j b
tof j c
tof j d
tof j i
tof j k
tof e a
tof a c
tof a g
tof a j
tof e b
tof e i
tof k i
H e
Z c k e
H e
tof e c
tof e k
tof e a
tof e f
X e
H e
Z b k e
H e
tof e i
tof d j
tof d c
tof d h
H d
Z k j d
H d
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d c
tof d j
H e
Z k b e
H e
tof e f
tof e c
tof e a
tof e k
H e
Z k c e
H e
tof e j
tof e i
tof e g
tof e b
tof a c
tof e a
tof a j
tof a g
tof j k
tof j i
tof j d
tof j c
tof j b
tof k j
tof i j
tof j a
tof k h
tof k g
tof i k
tof k c
tof i f
tof h k
tof h j
tof h f
tof h b
tof h a
tof a h
tof c j
tof c i
tof c g
tof c d
tof d c
X b
tof d b
tof c d
tof d f
tof c i
tof c k
tof d h
X e
tof h e
tof h d
tof h f
tof h k
tof a i
tof i a
tof i b
tof i e
tof i j
tof k i
tof i h
tof k a
tof a j
tof j a
tof j b
tof j e
tof j f
tof j h
tof j k
tof d f
tof d a
tof a d
tof d g
tof d a
tof a j
tof d c
tof d e
tof c d
tof d i
H d
Z k c d
H d
tof c f
tof c g
tof c j
H c
Z k b c
H c
tof c d
tof c f
tof c g
tof j i
tof c j
tof a e
tof a f
tof a i
H a
Z k j a
H a
tof a e
tof a f
tof a g
tof a h
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof j i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a h
tof a g
tof a f
tof a e
H a
Z k j a
H a
tof a i
tof a h
tof a g
tof a f
tof a e
tof c j
tof c i
tof c g
tof c f
H d
Z c k d
H d
H c
Z b k c
H c
tof c j
tof c i
tof c g
tof d j
tof d c
tof c f
tof i h
tof d i
tof d e
tof a b
tof d a
tof j h
tof a j
tof a g
tof a f
tof a d
tof d a
tof j k
tof j f
tof j e
tof j b
tof j a
tof a j
tof i a
tof k i
tof i j
tof i b
X i
tof i e
tof a i
tof h k
tof h f
tof h e
tof h d
tof h b
tof d h
tof c b
X c
X k
tof i b
tof c d
X g
tof e h
tof h b
tof h c
tof h e
tof h f
tof h j
tof i a
tof i f
tof i h
tof a k
tof k a
tof d c
tof k d
tof k e
tof k f
tof k h
tof k i
tof k j
tof a j
tof j a
tof j e
tof d j
tof j k
tof g a
tof a b
tof a g
tof j i
tof a j
tof a k
tof d f
tof d g
H d
Z k c d
H d
tof d b
tof d f
tof d g
tof d h
tof d i
H d
Z k b d
H d
tof d k
tof d a
tof d e
tof d g
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d e
tof a g
tof d a
tof d k
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof d f
tof d b
H d
Z k c d
H d
tof d j
tof d g
tof d f
tof d c
tof d k
tof j k
tof a j
tof a i
tof a b
tof g a
tof j e
tof k a
tof j a
tof a j
tof h f
tof i h
X f
tof k i
tof k e
tof k d
tof k c
tof a k
tof i b
tof i a
tof h j
tof h e
tof h c
tof h b
tof e h
tof c k
tof c i
X b
X c
tof a c
tof c a
tof c i
tof c k
tof h e
tof h f
tof k j
tof h k
tof i b
tof i c
tof i d
tof i j
tof k d
tof k e
tof k g
tof j a
tof a e
tof f j
tof a f
X i
tof a b
tof d a
tof a i
H a
Z k c a
H a
tof a b
tof a g
tof a h
tof a i
tof d k
tof d f
X d
H d
Z b k d
H d
tof k i
tof d i
tof f a
tof f c
tof f i
H f
Z k j f
H f
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f c
tof f a
tof f j
H d
Z k b d
H d
tof d j
tof d i
tof d h
X g
tof k g
tof d f
tof d k
tof a b
tof d a
tof a i
tof a h
tof a g
H a
Z k c a
H a
tof i b
tof a i
X b
tof a j
tof a f
tof a e
tof j a
tof k j
tof k e
tof k d
tof i j
tof i d
tof i c
tof h k
tof h j
tof h f
tof h e
tof c i
X e
tof c j
tof i h
tof h b
tof h i
tof h k
tof f i
tof i b
tof i f
tof i j
tof i k
tof i g
tof k b
tof k c
tof f j
tof j f
tof j g
tof j i
tof e a
tof a e
tof a g
tof a i
tof g h
tof g j
H g
Z k c g
H g
tof g h
tof g j
tof d b
tof d a
tof d c
tof d f
tof d g
tof d h
H d
Z k b d
H d
tof d k
tof d j
tof d e
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d f
tof d e
tof d j
tof d k
H d
Z k b d
H d
tof g h
tof d g
tof d f
tof d c
tof d a
tof d b
tof g j
H g
Z k c g
H g
tof g j
tof g h
tof i g
tof a i
tof a e
tof e a
tof i f
tof j i
tof f j
tof k c
tof h i
tof i k
tof k b
tof f i
tof i h
tof i j
tof i e
X i
tof c k
tof c j
tof c a
tof a c
X c
tof c d
tof c e
tof a h
tof h a
tof h b
tof h k
tof i a
tof i b
tof i g
tof i f
tof i k
tof d k
tof k c
tof k d
tof k e
tof a j
tof j a
tof j b
tof j c
tof j d
tof j f
tof j g
tof j h
tof j k
tof e a
tof a c
tof a e
tof a i
tof f k
tof f a
H f
Z k c f
H f
tof d b
tof d h
tof d i
H d
Z k b d
H d
tof d k
tof d a
tof d e
tof d f
tof d g
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d g
tof d f
tof d e
tof d a
tof d k
H d
Z k b d
H d
tof d i
tof j d
tof h b
tof d h
H f
Z k c f
H f
tof f a
tof j f
tof f k
tof a i
tof a e
tof a c
tof e a
tof j g
tof j c
tof j a
tof i a
tof a j
tof k e
tof k d
tof k c
tof d k
tof i g
tof i f
tof i e
tof i b
tof h k
tof h a
tof a h
tof c e
tof c d
X c
tof c b
tof k c
tof c a
tof c i
tof e h
tof h e
tof i d
tof i e
tof i f
tof i g
tof d j
tof g h
tof j g
tof j d
tof d a
tof a j
tof a f
H a
Z k c a
H a
tof a b
tof a d
tof a f
tof a g
tof g h
tof a i
tof d k
tof d i
H d
Z k b d
H d
tof e k
tof e j
tof e a
tof e b
tof e c
tof e g
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e g
tof e c
tof e b
tof e a
tof e j
tof e k
H d
Z k b d
H d
tof k i
tof d k
tof a i
tof a h
tof a g
tof a f
tof a d
tof a b
H a
Z k c a
H a
tof a f
tof a j
tof d a
tof j h
tof j g
tof j d
tof d j
tof k g
tof k f
tof k e
X d
tof c d
tof c a
tof k c
tof c k
tof i g
tof i f
tof i e
tof i d
tof h e
tof e h
X e
tof c e
tof d h
tof h d
tof k h
tof h f
tof h g
tof a b
tof i a
tof i d
tof d i
tof i h
tof k e
tof a j
tof a e
tof j a
tof j g
tof j h
tof j i
tof j k
tof a c
tof d f
tof d j
tof a d
tof e k
tof e a
tof e g
tof e j
H e
Z k c e
H e
tof d k
tof d b
tof d c
tof d e
tof c d
tof d g
tof d i
X d
H d
Z b k d
H d
tof k i
X i
tof d i
tof c f
tof c h
tof c i
H c
Z k j c
H c
tof c d
tof c f
tof c g
tof c h
tof c i
H i
Z c k i
H i
tof j i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof c i
tof c h
tof c g
tof c f
tof c d
H c
Z k j c
H c
tof c i
tof c h
tof c g
tof c f
tof c d
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d g
tof d f
tof d e
tof d c
tof d b
tof d k
H e
Z k c e
H e
tof e j
tof e g
tof e a
tof e k
tof j i
tof j h
tof a j
tof a f
tof a e
tof a d
tof a c
tof j a
tof a b
tof k g
tof k e
tof j k
tof a j
tof k h
tof k f
tof i k
tof h d
tof i h
tof i b
tof i a
tof h g
tof h f
tof d h
tof c i
tof c e
tof c b
X c
tof c d
tof e c
tof c b
tof c e
tof c i
tof c j
tof c k
tof e h
tof h e
tof h g
tof d i
tof i c
tof i d
tof i e
tof i f
tof k g
tof i k
tof i j
tof k a
tof k b
tof k h
tof e j
tof j b
tof j e
tof j f
tof j h
tof d j
tof j i
tof g a
tof a c
tof a g
tof a h
tof a i
tof a j
tof d k
tof d e
H d
Z k c d
H d
tof b c
tof d b
tof d a
tof d e
tof d h
tof d i
H d
Z k b d
H d
tof b f
tof b g
tof b h
H b
Z k j b
H b
tof b c
tof b f
tof b g
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof b c
tof i a
tof a j
tof a k
H i
Z c k i
H i
tof k i
tof b h
tof b g
tof b f
H b
Z k j b
H b
tof b h
tof b g
tof b f
H d
Z b k d
H d
tof d b
tof b c
tof d i
tof d h
tof d e
tof d a
H d
Z k c d
H d
tof d j
tof d e
tof d k
tof j h
tof a j
tof a g
tof a c
tof k g
tof g a
tof j f
tof j e
tof j b
tof i e
tof e j
tof k h
tof k b
tof i k
tof i g
tof i f
tof i d
tof i c
tof d i
tof h g
tof h e
tof e h
tof c k
tof c j
tof c i
tof c e
tof c b
tof f c
tof e c
tof c f
tof g i
X g
tof i g
tof h b
tof c h
tof c g
tof c j
tof c k
tof h c
tof h d
tof h j
tof a k
tof k a
tof k b
tof k d
tof k e
tof k f
tof k h
tof a j
tof a g
tof j a
tof d c
tof j d
tof a j
tof j h
tof d k
tof d b
tof d e
tof d f
tof d h
tof d i
H d
Z k c d
H d
tof d k
tof d a
tof d f
tof d h
tof d i
H d
Z k b d
H d
tof d k
tof d a
tof d c
tof d g
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d g
tof d c
tof d a
tof d k
H d
Z k b d
H d
tof d i
tof d h
tof d f
tof d a
tof d k
H d
Z k c d
H d
tof d i
tof d h
tof d f
tof d e
tof d b
tof d c
tof d k
tof j h
tof a j
tof j a
tof a g
tof j d
tof j c
tof a j
tof k h
tof k f
tof k e
tof k d
tof k b
tof k a
tof a k
tof i g
tof g i
tof h j
tof h d
tof c b
tof h c
tof c h
tof c k
tof c j
tof c i
tof c g
tof c f
tof f c
X d
tof d c
tof c d
tof c e
tof c f
tof c i
tof i h
tof h c
tof c g
tof h e
tof h f
tof i a
tof i d
tof i b
tof i k
tof k f
tof k g
tof j a
tof j b
tof j d
tof j f
tof j i
tof d a
tof a b
tof a d
tof a e
tof a j
tof d k
tof a g
tof d a
tof d h
H d
Z k c d
H d
tof a c
tof a d
tof a e
tof a i
H a
Z k b a
H a
tof a c
tof a d
tof a e
tof d a
tof a g
tof a i
tof d k
tof d j
tof d b
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d g
tof d b
tof d a
tof d j
tof d k
tof a i
tof a g
tof a e
tof a d
tof a c
H a
Z k b a
H a
tof a i
tof a g
tof a e
tof a d
tof a c
H d
Z k c d
H d
tof d h
tof d g
tof d a
tof d k
tof a j
tof a e
tof a d
tof a b
tof j d
tof d a
tof i f
tof i b
tof j i
tof k g
tof k f
tof i k
tof i h
tof i e
tof i d
tof i c
tof i a
tof h f
tof c e
tof h c
tof c i
X d
tof c d
tof d c
tof d f
tof c e
tof i j
tof i k
tof c i
tof i c
tof h c
tof h j
tof h k
tof i h
tof k h
tof i b
tof k i
tof k a
tof d e
tof k d
tof k g
tof d j
tof j c
tof j d
tof a k
tof f c
tof f g
H f
Z k c f
H f
tof a j
H a
Z k b a
H a
tof a d
tof a g
tof d a
tof j i
tof a j
tof d b
tof d c
tof d f
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d f
tof d e
tof d c
tof d b
tof a j
tof d a
tof a d
tof i g
tof a i
tof a e
H a
Z k b a
H a
tof a j
H f
Z k c f
H f
tof f g
tof f c
tof a k
tof j e
tof j d
tof j c
tof d j
tof i h
tof k i
tof k e
tof k d
tof k a
tof i k
tof i j
tof i c
tof i b
tof h k
tof h j
tof c g
tof h c
tof c k
tof c j
tof c i
tof e c
tof c f
tof c e
tof e c
tof c b
tof c h
tof c i
tof c j
tof c k
tof a h
tof h a
tof h b
tof h d
tof h i
tof h k
tof a i
tof i a
tof i b
tof i d
tof i f
tof i k
tof k i
tof i h
tof k a
tof k d
tof k e
tof j d
tof f g
tof j f
tof j h
tof d a
tof a c
tof d e
tof a d
tof a g
tof a h
tof a j
tof f c
tof d f
tof f a
tof f i
H f
Z k c f
H f
tof d k
tof d b
tof d h
tof d j
H d
Z k b d
H d
tof d k
tof d j
tof d a
tof d e
tof d g
tof d h
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d h
tof d g
tof d e
tof d a
tof d j
tof d k
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d f
tof d e
tof d a
tof d b
tof d k
H f
Z k c f
H f
tof f i
tof a g
tof a c
tof f a
tof j h
tof a j
tof a e
tof a d
tof d a
tof j g
tof j f
tof j d
tof i h
tof k i
tof k e
tof i k
tof h k
tof k d
tof k a
tof i f
tof i b
tof a i
tof h b
tof a h
tof c k
tof c j
tof c i
tof c h
tof c f
tof c e
tof c b
tof e c
X e
tof d c
tof c b
tof c d
tof c e
tof c h
tof c i
tof c j
tof h c
tof c k
tof k h
tof h f
tof h j
tof i g
tof i e
tof k e
tof k d
tof a j
tof a b
tof a d
tof a e
tof j a
tof j g
tof j h
tof j i
tof a j
tof e j
tof j k
tof a c
tof e a
tof e f
tof e h
tof e i
H e
Z k c e
H e
tof e k
tof e f
tof e h
tof e i
H e
Z k b e
H e
tof e k
tof e j
tof e a
tof e c
tof e f
tof e g
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e g
tof e f
tof e c
tof e a
tof e j
tof e k
H e
Z k b e
H e
tof e i
tof e h
tof e f
tof e k
H e
Z k c e
H e
tof e j
tof e i
tof e h
tof e f
tof a k
tof e a
tof j e
tof j d
tof a j
tof a c
tof j a
tof a b
tof j k
tof j i
tof j h
tof j g
tof a j
tof h j
tof h f
tof k h
X f
tof k e
tof k d
tof i g
tof i e
tof c k
tof h c
tof c h
tof c j
tof c i
tof c e
tof c d
tof d c
tof d b
tof c d
X d
X e
X g
tof c h
tof c i
tof c j
tof c k
tof f h
tof h b
tof h f
tof h i
tof h j
tof h k
tof d i
tof i b
tof i d
tof j h
tof i j
tof i k
tof k b
tof k c
tof k e
tof k f
tof k h
tof d c
tof a d
tof j a
tof j f
tof j k
tof a e
tof a h
tof a k
tof d k
tof d b
tof d e
tof d g
H d
Z k c d
H d
tof g b
tof g h
tof e g
tof j i
tof g j
H g
Z k b g
H g
tof e k
tof e a
tof e f
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e g
tof e f
tof e a
tof e j
tof e k
H g
Z k b g
H g
tof g j
tof i b
tof g i
tof g h
H d
Z k c d
H d
tof d g
tof d e
tof d b
tof d c
tof a d
tof j d
tof d k
tof a h
tof a e
tof j a
tof a c
tof j h
tof j f
tof k h
tof k f
tof k e
tof c b
tof k c
tof c k
tof i k
tof h j
tof i h
tof i d
tof d i
tof h k
tof h i
tof h f
tof h b
tof f h
tof h j
tof h c
tof h i
X h
tof c d
tof c k
tof h k
tof i h
tof h b
tof h f
tof i d
tof k e
tof i k
tof k c
tof k d
tof k f
tof k h
tof k j
tof a j
tof j a
tof j b
tof j c
tof j f
tof j h
tof j i
tof j k
tof d a
tof a b
tof a d
tof a e
tof a h
tof f a
tof a k
tof g i
tof f g
H f
Z k c f
H f
tof g b
tof g c
tof g h
tof e g
tof g j
H g
Z k b g
H g
tof e k
tof e a
tof e b
tof e i
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e g
tof e b
tof e a
tof e j
tof e k
H g
Z k b g
H g
tof j i
tof j h
tof g j
tof g c
tof g b
H f
Z k c f
H f
tof f i
tof f g
tof a k
tof f a
tof a h
tof a e
tof a d
tof a b
tof d a
tof k f
tof k c
tof j k
tof j b
tof j a
tof a j
tof k j
tof k h
tof i k
tof k e
tof k d
tof h f
tof h b
tof i h
tof h d
tof h k
tof h c
tof c h
X c
tof i c
tof c i
tof h b
tof e i
tof i b
tof i c
tof i e
tof i g
tof i k
tof k a
tof k b
tof j c
tof k j
tof j k
tof j a
tof e j
tof j g
tof d c
tof d a
tof a d
tof a f
tof a g
tof a j
tof d a
tof d h
H d
Z k c d
H d
tof e k
tof e b
H e
Z k b e
H e
tof f k
tof f j
tof f a
tof f b
tof f i
H f
Z k j f
H f
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H f
Z k j f
H f
tof f i
tof f b
tof f a
tof f j
tof f k
H e
Z k b e
H e
tof j g
tof e j
tof e b
tof e k
H d
Z k c d
H d
tof d h
tof d a
tof a d
tof d c
tof a j
tof a f
tof d a
tof k c
tof j k
tof k j
tof j a
tof i k
tof h k
tof k b
tof i g
tof i e
tof i c
tof e i
tof h j
X h
tof h c
tof c i
tof i c
X e
tof d c
tof c b
tof c d
tof c e
tof c g
tof c h
tof c j
tof c k
tof d h
tof d c
tof h d
tof h f
tof h g
tof h j
tof h k
tof d i
tof i d
tof i e
tof i h
tof j h
tof i f
X f
tof e k
tof k e
tof k g
tof k i
tof j a
tof d b
tof j d
tof j k
tof e a
tof a g
tof a k
tof d h
tof d j
H d
Z k c d
H d
tof d b
tof d e
tof d f
tof d g
tof d h
tof d i
H d
Z k b d
H d
tof a d
H a
Z k j a
H a
tof a d
tof a e
tof a i
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a i
tof a j
tof a k
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
tof a e
tof a d
H a
Z k j a
H a
tof a d
H d
Z k b d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof d b
H d
Z k c d
H d
tof j h
tof j b
tof d j
tof j d
tof d c
tof a k
tof a g
tof e a
tof j k
tof j a
tof k i
tof k g
tof k e
tof e k
tof h f
tof i h
tof i e
tof i d
tof i c
tof d i
tof h k
tof h j
tof h g
tof c d
tof h c
tof d h
tof c k
tof c j
tof c g
tof c e
tof d c
tof d b
tof c d
X d
X e
X f
tof c g
tof c h
tof c j
tof c k
tof f h
tof h c
tof h f
tof h g
tof d i
tof i d
tof k f
tof i k
tof i j
tof k c
tof k d
tof k e
tof k g
tof k h
tof a j
tof a b
tof j a
tof j k
tof a e
X i
tof a f
tof a i
tof d a
tof f k
tof f b
tof f h
H f
Z k c f
H f
tof d k
tof d b
tof d g
tof d h
tof d j
X d
H d
Z b k d
H d
tof k i
tof j i
tof e j
tof d i
tof e c
tof e f
tof e g
tof e h
H e
Z k j e
H e
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e i
tof e h
tof e g
tof e f
tof e c
tof e j
H d
Z k b d
H d
tof d j
tof d i
tof d h
tof d g
tof a b
tof d a
tof d k
H f
Z k c f
H f
tof f h
tof f b
tof f k
tof i f
tof a i
tof a e
tof j k
tof j b
tof j a
tof a j
tof h g
tof h f
tof k h
tof k e
tof k d
tof k c
tof i k
tof i j
tof i d
tof d i
tof h c
tof f h
tof c k
tof c j
tof c h
tof c g
tof c d
tof c b
X d
X g
tof h c
tof c h
tof c j
tof c k
tof g h
tof h b
tof h c
tof h g
tof d i
tof i h
tof i d
tof i j
tof a i
tof a k
tof k a
tof k b
tof k c
tof k d
tof k h
tof d j
tof d b
tof j d
tof j c
tof j f
tof j h
tof a j
tof a c
tof a g
tof e a
tof a h
tof a k
tof b f
tof e b
tof d e
tof e g
H e
Z k c e
H e
tof d a
tof d j
H d
Z k b d
H d
tof b c
tof b d
tof b e
tof b h
H b
Z k j b
H b
tof b c
tof b d
tof b e
tof b f
tof b h
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
X g
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof b c
tof i a
tof a j
tof a k
tof j i
H i
Z c k i
H i
tof k i
tof b h
tof b f
tof b e
tof b d
H b
Z k j b
H b
tof b h
tof b f
tof b e
tof b d
tof b c
H d
Z k b d
H d
tof d j
tof d i
tof d g
tof d e
tof d a
tof d b
H e
Z k c e
H e
tof e h
tof e g
tof e f
tof e b
tof a k
tof e a
tof j h
tof a j
tof a g
tof a c
tof j i
tof j f
tof j d
tof j c
tof j b
tof d j
tof i h
tof i d
tof k i
tof k c
tof k b
tof k a
tof i j
tof d i
tof h g
tof h c
tof h b
tof g h
tof c k
tof c j
tof c h
tof h c
tof f h
X g
tof h f
tof g c
tof c g
tof c i
tof c k
tof h b
tof i c
tof h i
tof k h
tof h j
X g
tof d b
tof i b
tof i g
tof k a
tof d k
tof k f
tof e j
tof j b
tof j c
tof j e
tof e a
tof a c
tof a e
tof a h
tof a j
tof d c
tof d a
H d
Z k c d
H d
tof d b
tof d a
tof d c
tof d f
tof d g
tof d i
tof d j
H d
Z k b d
H d
tof d k
tof d j
tof d b
tof d c
tof d e
tof d f
tof d h
tof d i
H d
Z k j d
H d
tof c b
H i
Z b k i
H i
tof k i
tof j i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X g
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d f
tof d e
tof d c
tof d b
tof d j
tof d k
H d
Z k b d
H d
tof i g
tof d i
tof d j
tof d f
tof d c
tof d a
tof d b
H d
Z k c d
H d
tof d f
tof d b
tof a c
tof d a
tof d k
tof a j
tof a h
tof a e
tof e a
tof j e
tof j c
tof j b
tof e j
tof h j
tof h f
tof k h
tof k a
tof h i
tof i c
tof i b
tof f h
tof c k
tof c i
tof c g
tof g c
X f
tof f c
tof c f
tof c h
tof c k
tof h b
tof h c
tof h e
tof h j
tof e i
tof i b
tof i e
tof i g
tof i j
tof j i
tof i h
tof k i
tof k a
tof k b
tof j d
tof d j
tof j e
tof a f
tof a g
H a
Z k c a
H a
tof a b
tof a f
tof a g
tof d b
tof d a
H d
Z k b d
H d
tof e k
tof e b
tof e g
tof e h
H e
Z k j e
H e
tof c b
H i
Z b k i
H i
tof k i
tof a k
tof a j
tof i a
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
X f
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H e
Z k j e
H e
tof e h
tof e g
tof e b
tof e k
H d
Z k b d
H d
tof d j
tof d i
tof d e
tof a b
tof d a
tof a g
tof a f
H a
Z k c a
H a
tof a g
tof a f
tof j h
tof j e
tof j d
tof i b
tof k i
tof k a
tof a k
tof h j
tof i h
tof i g
tof i e
tof e i
tof h e
tof h c
tof h b
tof c k
tof c h
tof c f
tof f c
X f
tof e c
tof k b
tof c k
tof c e
tof e h
tof h c
tof h e
tof a i
tof i a
tof i k
tof k c
tof k e
tof k h
tof e j
tof j c
tof j e
tof j f
tof j h
tof j k
tof f j
tof d f
tof d a
tof a d
tof d a
tof d k
tof d c
tof d i
H d
Z k c d
H d
tof f k
tof f b
tof f g
tof f i
X f
H f
Z b k f
H f
tof k i
tof f i
tof j i
tof d j
X i
tof d c
tof d e
tof d h
H d
Z k j d
H d
H i
Z c k i
H i
tof a k
tof a j
tof i a
tof c b
tof b i
tof c j
tof h k
tof h j
H c
Z b j c
H c
tof h b
tof b c
H h
Z b i h
H h
tof a b
tof a c
tof a h
X d
X e
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H k
Z 0 i k
H k
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H i
Z k j i
H i
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 1
Z a g 1
H 1
H 0
Z 1 h 0
H 0
H j
Z 0 i j
H j
H 0
Z 1 h 0
H 0
H 1
Z a g 1
H 1
X f
X e
X d
tof a h
tof b c
tof a b
H h
Z b i h
H h
tof h b
H c
Z b j c
H c
tof h j
tof h k
tof c j
tof b i
tof c b
tof i a
tof a j
tof a k
tof j i
tof k i
H i
Z b k i
H i
H i
Z c k i
H i
H d
Z k j d
H d
tof d i
tof d h
tof d e
tof d c
tof d j
H f
Z k b f
H f
tof f j
tof f g
tof f b
tof f k
H d
Z k c d
H d
tof d j
tof d i
tof a f
tof d a
tof d c
tof d k
tof a j
tof a d
tof d a
tof k h
tof j k
tof j f
tof j e
tof j c
tof e j
tof k e
tof k c
tof i k
X k
tof k b
tof i a
tof a i
tof h e
tof h c
tof e h
tof c k
tof c e
tof c b
tof e c
X j
X f
X c
tof b a
tof f b
tof a b
tof f g
tof f k
tof c b
tof b a
tof c k
tof b c
tof g j
tof j f
tof j g
tof j h
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c k
tof c j
tof j h
tof j g
tof j f
tof g j
tof b k
tof b c
tof b a
tof c b
tof f b
tof f k
tof f g
X c
tof c f
tof f c
tof a f
tof a j
tof d b
tof b a
tof j d
tof b j
tof b k
tof j a
tof c b
tof c i
tof j c
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c i
tof b k
tof c b
tof j i
tof j d
tof j c
tof b j
tof j a
tof a j
tof b d
tof d b
tof a f
tof a b
tof b a
tof f c
tof c f
X c
X d
tof b f
tof f b
tof f c
tof f d
tof a d
tof a j
tof c a
tof j c
tof d b
tof b d
tof b f
tof b k
tof c f
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c f
tof j c
tof c a
X c
tof a j
tof b k
tof d f
tof f d
tof f b
tof d f
tof b d
tof a c
tof b a
tof a b
tof e b
tof f e
tof b e
tof f g
tof f h
tof f k
tof b a
tof a i
tof a j
tof g j
tof j g
tof j b
X g
tof b k
tof j a
tof j f
tof j h
tof j i
tof c b
tof c e
tof c f
tof c g
tof c h
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c h
tof c g
tof c f
tof b e
tof c b
tof j k
tof j i
tof j h
tof j g
tof j f
tof j a
tof g j
tof b k
tof b j
tof a i
tof b a
tof a b
tof f e
tof e b
tof b j
tof b a
tof b d
tof b c
X c
tof f k
tof f h
tof f g
tof f d
tof f c
tof b f
tof f b
tof f d
tof f e
tof a f
tof c b
tof b c
tof b d
tof b e
tof f k
tof j b
tof b f
tof j a
tof j d
tof j k
tof d c
tof c a
tof c b
tof c d
tof c e
tof c k
tof a f
tof k a
X k
tof b j
tof j k
tof j c
H b
Z f j b
H b
H j
Z c k j
H j
X k
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c k
tof c e
tof b d
tof c b
tof c a
tof d c
tof j k
tof j a
tof a j
tof j d
tof b k
tof b f
tof b e
tof c b
tof a f
tof a c
tof f e
tof f b
tof b f
tof b c
X c
tof f b
tof f a
tof f g
tof f i
tof a c
tof a e
tof c j
tof a j
tof j a
tof a i
tof j b
tof b k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j k
tof k a
tof a f
tof j i
tof j b
tof a c
tof c j
X c
tof b d
tof a i
tof a e
tof c g
tof f c
tof f d
tof f h
tof d a
tof a d
tof a e
tof a i
tof a j
tof a k
tof c j
tof j b
tof c d
tof c h
tof c i
tof j c
tof c a
tof c k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof j b
tof b a
tof k a
tof f d
tof j f
tof a f
tof c k
tof c i
tof c h
tof c g
tof c a
tof j i
tof j h
tof j g
tof j c
tof c j
tof b c
tof a k
tof a j
tof a i
tof a e
tof d a
tof f i
tof f h
tof f b
X c
tof d f
tof f d
tof f e
tof f j
tof b a
tof a b
tof a c
tof a f
tof a h
tof a i
tof d b
tof b a
tof b d
tof b e
tof b f
tof b h
tof b i
tof b k
tof c j
tof c d
tof j c
tof j e
tof c a
tof c h
tof c i
tof c j
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c k
tof c j
tof c i
tof c h
tof c d
tof c a
tof j e
tof j d
tof j c
tof c j
tof b k
tof b i
tof b h
tof b f
tof b e
tof b d
tof b a
tof d b
tof a i
tof a h
tof a f
tof a c
tof a b
tof b a
tof f j
tof f e
tof f d
tof d f
X c
X f
tof f b
tof a f
tof f e
tof a j
tof j a
tof a d
tof j b
tof b c
tof b k
tof j e
tof c a
tof c f
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j k
tof k a
tof a f
tof c k
tof c f
tof j c
tof c a
X c
tof f d
tof f a
tof a d
tof f b
tof f g
tof a i
tof b d
tof i c
tof c a
tof c i
tof c j
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X i
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof c j
tof c i
tof c a
tof i c
tof j i
tof j a
tof a j
tof j e
tof b k
tof b d
X c
tof a b
tof f g
tof f c
tof f d
tof f h
tof f k
tof a f
tof a h
tof b k
tof j a
tof j b
tof j d
tof j f
tof j g
tof j i
tof d c
tof c d
tof c f
tof c g
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X i
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
X d
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof c f
tof f k
tof c i
tof c g
tof c d
tof d c
tof j i
tof j g
tof j f
tof j d
tof j a
tof b k
tof b c
tof a i
tof f h
tof e c
tof f e
tof a f
tof f a
tof f c
tof f k
tof f j
tof b d
tof f b
tof a f
tof j c
tof f j
tof a d
tof a f
tof a h
tof j a
tof a i
tof b e
tof c e
tof j b
tof b k
tof c j
tof j h
tof c a
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j i
tof j h
tof c j
tof c e
tof c a
tof e c
tof j k
tof b c
tof j b
tof j a
tof b k
tof b e
tof b d
tof a i
tof a h
tof a d
tof f a
tof f j
tof f b
tof f i
tof a e
tof a i
tof a k
tof b c
tof e j
tof j e
tof j b
tof b k
tof j a
tof j g
tof e c
tof c e
tof c g
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
X e
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof c g
tof c e
tof e c
tof j k
tof j g
tof a e
tof j a
tof b k
tof b c
tof a k
tof a i
tof a c
tof f j
tof f i
tof f a
tof a b
tof a f
tof b a
tof a b
X c
tof f d
tof j f
tof f e
tof a c
tof a d
tof a f
tof a h
tof a i
tof a k
tof h b
tof b a
tof b f
tof j b
tof b h
tof b i
tof c b
tof c e
tof c h
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
X e
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof k a
tof f k
tof j k
tof a k
tof c h
tof c e
tof c b
tof j i
tof j h
tof j e
tof e j
tof b i
tof a h
tof b a
tof h b
tof a k
tof a i
tof c d
X c
tof f c
tof a d
tof f b
tof b a
tof a d
tof a f
tof a h
tof a j
tof j a
tof a i
tof b k
tof c h
tof c k
tof j c
tof c b
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c h
tof b k
tof c b
X c
tof c d
tof b c
tof j a
tof a j
tof a k
tof j d
tof j c
tof f a
tof f c
tof a f
tof f b
tof f g
tof f h
tof f i
tof a f
tof a d
tof j a
tof b j
tof j b
tof d c
tof j d
tof c d
tof j e
tof c a
tof c b
tof c f
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j k
tof k a
tof a f
tof c f
tof c d
tof b a
tof c b
tof j d
tof d c
tof j i
tof j h
tof a j
tof j e
tof b k
tof b j
tof b i
tof b h
tof a f
tof a d
tof f i
tof f h
tof f g
tof f c
tof a f
tof f b
tof f a
X a
tof a f
tof f c
tof f g
tof c a
tof a c
tof a e
tof a g
tof a j
tof a k
tof e j
tof j e
tof j b
X e
tof b k
tof j f
tof j g
tof c d
tof c e
tof c f
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof j b
tof b a
tof k a
tof f k
tof a f
tof c k
tof c i
tof c f
tof c e
tof c d
tof j g
tof j e
tof a c
tof c a
tof e j
X e
tof c g
X c
tof f b
tof f d
tof a b
tof a d
tof a k
tof b k
tof c f
tof c h
tof j c
tof c b
tof c g
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof k a
tof f k
tof j k
tof a f
tof c k
tof c i
tof f g
tof c f
tof c h
tof c e
tof c b
tof j h
tof j e
tof j c
tof c j
tof b k
tof a j
tof a g
tof a e
tof a d
tof a b
tof f d
tof c f
tof f c
tof c f
X f
tof f a
tof a f
X d
tof f d
tof f e
tof f h
tof a g
tof j a
tof a i
tof j b
tof b k
tof j d
tof j e
tof d c
tof c d
tof c f
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j k
tof k a
tof a f
tof c f
tof f k
tof c i
tof c d
tof d c
tof j i
tof j e
tof j d
tof a i
tof a g
X a
tof f c
tof a c
tof c a
tof f h
tof a f
tof a e
tof a d
X d
tof a g
tof f a
tof a c
tof a j
tof c a
tof a k
tof d j
tof j d
tof j e
tof j f
tof j i
tof c f
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof c a
X c
tof a c
tof f k
tof a f
tof j i
tof f e
tof j f
X e
tof j d
tof d j
tof b k
tof j g
tof a j
tof f g
tof f d
tof f a
tof a f
tof f a
tof f c
tof f i
tof d b
tof d a
tof a d
tof a e
tof f k
tof a k
tof a g
tof b k
tof e c
tof c b
tof c e
tof c h
tof c i
tof c k
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c k
tof c i
tof c h
tof c e
tof c b
tof e c
tof j g
tof b k
tof b g
tof b f
tof b e
tof b d
tof b a
tof d b
tof f d
tof a f
tof f g
tof j f
tof f c
X c
tof f h
tof a i
tof a k
tof e b
tof b a
tof b e
tof b g
tof j b
tof b i
tof j k
tof c a
tof c d
tof c h
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j h
tof c j
tof c d
tof c a
tof j k
tof f i
tof j f
tof j c
tof j b
tof b i
tof b g
tof a e
tof b a
tof e b
tof a k
tof a i
tof a g
tof b a
tof f h
tof f g
tof f d
tof f a
tof a f
X c
X d
tof b f
tof f b
tof f d
tof f g
tof f j
tof f k
tof d a
tof a d
tof a e
tof a g
tof a h
tof c a
tof a j
tof c d
tof j c
tof e b
tof b a
tof b e
tof b f
tof b h
tof j b
tof j e
tof j g
tof c b
tof c f
tof c i
tof c j
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof c j
tof j f
tof k a
tof a f
tof f k
tof c i
tof j c
tof c d
tof b a
tof c b
tof j g
tof j e
tof c j
tof b h
tof b f
tof b e
tof e b
tof a j
tof a h
tof a g
tof a e
tof a d
tof d a
tof f k
tof f j
tof f g
X b
tof f d
tof f b
tof b f
X c
tof a f
tof a b
tof f a
tof f e
tof f g
tof f j
tof a c
tof a d
tof a g
tof a i
tof a j
tof a k
tof b c
tof b k
tof c j
tof j a
tof c d
tof c e
tof c g
tof c i
tof j c
tof j f
tof f k
tof c b
tof a f
tof k a
X k
tof b j
tof j k
tof j c
H b
Z f j b
H b
H j
Z c k j
H j
X k
tof a b
tof a c
tof a j
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof c i
tof c g
tof c e
tof b d
tof c b
tof j k
tof j i
tof j g
tof j e
tof j d
tof a c
tof j a
tof c j
X c
tof f b
tof b k
tof f a
tof f i
tof f g
tof f d
tof a j
tof a b
tof a c
tof a h
tof b k
tof d j
tof j a
tof j b
tof j d
tof j e
tof j i
tof c d
tof a f
tof c a
X d
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof j b
tof b a
tof k a
tof j a
tof c a
tof f k
tof c d
tof j i
tof j e
tof j d
tof d j
tof b d
X c
tof a b
tof b c
tof a i
tof a h
tof a e
tof f a
tof a d
tof f c
tof f b
tof c a
tof a c
tof a d
tof a e
tof a f
tof a h
tof a i
tof a j
tof j a
tof j d
tof j e
tof b j
tof b f
tof b h
tof b i
tof b k
tof c h
tof j c
tof j i
tof j k
tof c b
tof c d
tof c e
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c k
tof c h
tof c e
tof b d
tof c b
tof j k
tof j i
tof j h
tof j e
tof j d
tof j c
tof b j
tof j a
tof a j
tof b k
tof b i
tof b h
tof f e
tof b f
tof a i
tof a h
tof a f
tof a d
tof a c
tof c a
tof f j
tof f g
tof f a
X c
tof a f
tof a b
tof f a
tof f c
tof f e
tof j i
tof f j
tof f k
tof a d
tof a e
tof a f
tof j a
tof a h
tof b c
tof b d
tof b e
tof b k
tof c f
tof j c
tof c j
tof j g
tof c a
tof c h
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j i
tof j h
tof j g
tof j f
tof c j
X c
tof j c
X a
tof c a
tof b k
tof b e
tof b d
tof a h
tof f e
tof a f
tof f d
tof f a
tof f k
tof f j
tof c f
tof a c
tof c f
tof f a
tof f g
tof a f
tof f j
tof a e
tof a h
tof a k
tof j b
tof b k
tof j a
tof c d
tof c e
tof c h
tof j c
tof j i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j k
tof k a
tof f k
tof c k
tof c h
tof c e
tof j c
tof c d
tof a j
tof j i
tof j h
tof j e
X c
tof f a
tof f j
tof a f
tof f g
tof a c
tof f a
tof f h
tof f i
tof a f
tof f j
tof c j
tof j a
tof a e
tof b d
tof j b
tof d c
tof j d
tof c d
tof c f
tof c e
tof c g
tof c i
tof a f
tof k a
tof j k
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof j b
tof b k
tof k a
tof a f
tof c f
tof f k
tof c i
tof c g
tof c e
tof j d
tof c d
tof d c
tof j a
tof a j
tof j e
tof c j
X c
tof b d
tof a k
tof f g
tof f d
tof a f
tof f a
tof f k
tof f c
tof a f
tof a j
tof f i
tof a h
tof f a
tof a f
tof f k
tof a d
tof a e
tof j a
tof j d
tof j f
tof j h
tof h c
tof c a
tof c b
tof c h
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c i
tof c h
tof c b
tof c a
tof h c
tof j h
tof j f
X d
tof a d
tof j a
tof b k
tof b c
tof a k
tof a i
tof f e
tof a f
tof f a
tof a b
tof b a
tof a b
tof f k
tof f h
X c
tof f g
tof a c
tof a d
tof a e
tof a h
tof j i
tof a j
tof d b
tof b a
tof b d
tof b e
tof b f
tof b k
tof j d
tof j f
tof j g
tof d c
tof c d
tof c e
tof c f
tof c g
tof c h
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c i
tof c h
tof c g
tof c f
tof c e
tof c d
tof d c
tof j g
tof j f
tof j d
tof b k
tof f e
tof b f
tof a d
tof b a
tof d b
tof a j
tof a h
tof a e
tof a c
tof b a
tof f j
tof f g
X f
X c
tof f b
tof f d
tof f e
tof b a
tof a b
tof a d
tof a e
tof j h
tof a j
tof a k
tof c b
tof b a
tof b c
tof b d
tof b e
tof b j
tof j a
tof j g
tof g c
tof c b
tof c g
tof c h
tof c i
tof c k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
X g
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof c k
tof c i
tof c h
tof c g
tof c b
tof g c
tof j i
tof j h
tof j g
tof b j
tof j a
tof a j
tof b i
tof b h
tof b e
tof b d
tof b c
tof c b
tof a k
tof a i
tof a h
tof a e
tof a d
tof c a
tof a b
tof a c
tof b a
X b
tof f e
tof f c
tof f h
tof f j
tof j i
tof a j
tof b d
tof b e
tof b k
tof j b
tof j c
tof j d
tof j f
tof c a
tof c h
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c h
tof c a
tof j i
tof f d
tof j f
tof b c
tof j b
tof b k
tof b e
tof b d
tof c b
tof a j
tof a i
tof a c
tof f j
tof c f
tof f c
tof f h
tof c f
X b
tof f g
tof f i
tof a f
tof f k
tof a g
tof b k
tof j c
tof j e
tof j f
tof j g
tof j i
tof j k
tof c b
tof c d
tof c h
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof k a
tof f k
tof j f
tof c k
tof c i
tof c h
tof c d
tof c b
tof j i
tof f g
tof f c
tof j f
tof b k
tof a g
tof a b
tof f k
tof f i
tof f h
X h
tof c f
tof e c
tof d f
tof f d
tof f i
tof f k
tof b a
tof a b
tof a f
tof a h
tof h b
tof b a
tof b f
tof b h
tof b k
tof j c
tof j d
tof j h
tof c b
tof c e
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a k
tof c j
tof c i
tof c e
tof j e
tof c b
tof e c
tof j h
tof j d
tof b k
tof a h
tof h b
tof h a
tof f i
tof f d
tof d f
tof f b
tof f d
tof f e
tof f h
tof f j
tof f k
tof c a
tof a c
tof j e
tof a j
tof b k
tof c b
tof c d
tof j c
tof j f
tof j g
tof j h
tof c a
tof c g
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c i
tof c g
tof c d
tof c b
tof c a
tof j h
tof j g
tof f e
tof f d
tof j f
tof j c
tof f j
tof j b
tof b k
X b
tof a j
tof c a
tof a e
X a
tof a c
tof c a
tof f h
X f
tof b f
tof f b
tof f e
tof f h
tof f j
tof f k
tof a b
tof a h
tof a i
tof a j
tof a k
tof c b
tof b c
tof b e
tof b f
tof b h
tof b j
tof c j
tof j b
tof c f
tof c g
tof j c
tof j f
tof f k
tof c a
tof a f
tof k a
X k
tof b j
tof j k
tof j c
H b
Z f j b
H b
H j
Z c k j
H j
X k
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c g
tof c f
tof c a
tof j k
tof j g
tof j f
tof j c
tof b c
tof c j
tof b h
tof f e
tof b f
tof c b
tof a j
tof a e
tof a c
tof f k
X c
X h
tof f c
tof f d
tof a f
tof h b
tof b f
tof b h
tof b j
tof b k
tof c j
tof j b
tof e c
tof j e
tof c e
tof j f
tof c j
tof j h
tof c b
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
X e
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof f k
tof a h
tof c k
tof c j
tof c i
tof c h
tof c e
tof c b
tof j e
tof e c
tof j b
tof b j
tof j f
tof f j
tof j h
tof c j
tof h k
tof h b
tof a i
tof f d
tof b f
tof f c
X c
tof a f
tof f a
tof j h
tof j k
tof f j
tof j f
tof a i
tof h c
tof c a
tof c b
tof c h
tof c i
tof c k
tof a f
tof k a
X k
tof b j
tof j k
tof j c
H b
Z f j b
H b
H j
Z c k j
H j
X k
tof a b
tof a c
tof a j
X d
X e
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c k
tof c i
tof c h
tof c b
tof c a
X c
tof a h
tof h c
tof j k
tof j h
tof b k
tof f b
tof b c
tof c b
tof b c
tof a i
tof f j
tof f e
tof f g
tof f i
tof a d
tof a e
tof j f
tof j k
tof a j
tof b d
tof b e
tof b k
tof j b
tof j d
tof j g
tof j i
tof c a
tof c f
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof j b
tof b a
tof k a
tof c a
tof f k
tof a f
tof c i
tof j i
tof j g
tof j d
tof b e
tof b d
tof b c
tof c b
tof a j
tof f h
tof f e
tof a f
tof a d
tof f a
tof a c
tof f i
tof f g
tof f b
tof a f
X b
tof d f
tof f d
tof f e
tof f h
tof f j
tof f k
tof c b
tof c a
tof a c
tof a d
tof a e
tof a j
tof b k
tof a k
tof j b
tof c e
tof j c
tof j f
tof j h
tof j i
tof c d
tof c g
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c k
tof c g
tof c e
tof c d
tof j i
tof f h
tof f e
tof j f
tof b j
tof j c
tof b e
tof a d
tof b a
tof a c
tof c b
X c
tof j k
tof a j
tof a e
tof b a
tof f j
tof f d
tof d f
X d
tof a f
tof f a
tof f b
tof f c
tof f e
tof f h
tof a f
tof f j
tof j f
tof j a
tof a c
tof a h
tof b k
tof j g
tof j i
tof d c
tof c d
tof c f
tof c h
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c i
tof c h
tof c f
tof c d
tof d c
tof j k
tof j i
tof j h
tof j g
tof j f
tof j c
tof j a
tof b k
tof f k
tof a f
tof f j
tof f h
tof f b
X c
X e
tof f g
tof f i
tof a d
tof a f
tof e j
tof j e
tof j b
X e
tof b k
tof j a
tof j g
tof d c
tof c a
tof c b
tof c d
tof c e
tof c f
tof c g
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof b c
tof a b
tof b c
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c g
tof c f
tof c e
tof c d
tof c b
tof c a
tof d c
tof j k
tof j g
tof j e
tof j a
tof e j
tof b k
tof a j
tof a h
tof a f
tof a d
tof f a
tof a c
tof f i
X f
tof a f
tof a e
tof f b
tof b d
X b
tof f c
tof f h
tof f j
tof a b
tof a i
tof a j
tof a k
tof b c
tof d j
tof j d
tof j b
X d
tof b k
tof j e
tof j g
tof e c
tof c e
tof c g
tof c h
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof f k
tof a f
tof c j
tof c i
tof c h
tof c e
X c
tof c g
tof e c
tof j k
tof j g
tof j e
tof j d
tof j b
tof d j
tof b d
tof f c
tof a j
tof f i
tof f a
tof f g
tof a d
tof a c
tof g j
tof j a
tof j b
tof j f
tof j g
tof j i
tof g c
tof c f
tof c g
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c g
tof c f
tof g c
tof j i
tof j g
tof j f
tof j a
tof a g
tof g j
X c
tof a b
tof b k
tof f b
tof b c
tof c b
tof c d
tof b c
tof f g
tof f d
tof a d
tof b e
tof c b
tof e j
tof j e
tof j b
X e
tof b k
tof j f
tof j g
tof c f
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof f k
tof a f
tof c k
tof c i
tof c f
tof b d
tof c b
tof b c
tof j k
tof f g
tof j f
tof j e
tof e j
tof b k
tof b e
X b
tof f c
tof c b
tof a j
tof a i
tof a d
tof f e
tof f a
tof f k
tof d a
tof a d
tof a e
tof a g
tof a j
tof a k
tof b k
tof c j
tof j c
tof j d
tof j f
tof j h
tof j k
tof c a
tof c f
tof c g
tof c h
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof k a
tof a f
tof c f
tof f k
tof f b
tof c i
tof c h
tof a g
tof c a
tof j h
tof j d
tof j c
tof c j
tof a k
tof j e
tof a j
tof a d
tof d a
X c
X d
tof c a
tof f c
tof a c
tof f d
tof a e
tof j a
tof a g
tof j c
tof d c
tof c a
tof c d
tof c g
tof c k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof c k
tof c g
tof c d
tof c a
tof d c
tof j g
tof j e
tof a c
tof j a
tof b k
tof a g
tof c e
tof c a
X c
tof f h
tof f g
tof f d
tof f b
tof f e
tof a b
tof a d
tof a h
tof j i
tof a j
tof j b
tof b k
tof c g
tof j c
tof j h
tof c a
tof c e
tof c f
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c g
tof a i
tof c a
tof f e
tof c f
tof j k
tof j i
tof j h
tof j g
tof j c
tof b k
tof a j
tof a h
tof a e
tof a d
tof f b
tof f a
tof f j
tof f c
X f
tof c f
tof f c
tof f d
tof f e
tof f g
tof f h
tof f j
tof f k
tof c e
tof a c
tof a f
tof a h
tof b k
tof c j
tof j a
tof j b
tof c h
tof j c
tof c j
tof j i
tof c d
tof c f
tof c g
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof c f
tof f k
tof j i
tof j h
tof c j
tof c g
tof c e
tof c d
tof j e
tof j c
tof j b
tof j a
tof c j
tof j k
tof f h
tof f e
tof f c
tof a f
tof f j
tof f g
tof f d
tof c f
X c
tof a f
tof f a
tof f e
tof f g
tof j h
tof f j
tof j a
tof a c
tof a g
tof j b
tof j e
tof j i
tof d c
tof c a
tof c d
tof c e
tof c f
tof c h
tof c j
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof c a
tof a f
tof j h
tof j e
tof c j
tof c d
tof d c
tof j k
tof j i
tof j g
tof j c
tof j b
tof j a
tof f b
tof a g
tof f g
X c
tof c e
tof c i
tof f c
tof a d
tof a f
tof d j
tof j a
tof j b
tof j d
tof j e
tof j g
tof c a
tof c b
tof c g
tof c k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c k
tof c i
tof c g
tof c e
tof c b
tof c a
tof j g
tof j e
tof j d
tof j a
tof d j
tof a b
tof b k
X b
tof a f
tof f d
tof f a
tof a c
X c
tof f h
tof a f
X h
tof f j
tof f i
tof a b
tof a g
tof f a
tof a f
tof a c
tof a e
tof b c
tof b k
tof c j
tof j a
tof j c
tof j f
tof h c
tof c a
tof c b
tof c h
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c i
tof c h
tof c b
tof c a
tof h c
tof j f
tof a c
tof j a
tof c j
X c
tof b k
tof b c
tof a i
tof a g
tof a f
tof a e
tof a d
tof a b
tof f b
tof f h
tof c a
tof a c
tof b a
tof a e
tof a j
tof b d
tof d j
tof j d
tof j b
X d
tof b k
tof j e
tof j f
tof j g
tof j h
tof c a
tof c b
tof c d
tof c f
tof c g
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c i
tof c g
tof c f
tof b d
tof c b
tof c a
tof j k
tof j h
tof j g
tof j f
tof j e
tof j b
tof d j
X d
tof a e
tof b a
tof a j
X a
tof f c
tof a c
tof c a
tof f d
X g
tof d a
tof a d
tof a e
tof a h
tof a i
tof a j
tof b c
tof j f
tof g c
tof c a
tof c b
tof c g
tof c h
tof c j
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
X d
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof c b
tof b j
tof c f
tof k a
tof a f
tof c g
tof a h
tof c a
tof g c
tof b c
tof f j
tof b k
tof a j
tof a i
tof a e
tof a d
tof d a
tof f i
tof f h
tof f g
tof f c
tof b f
tof b a
tof f b
tof f i
tof f j
tof a f
tof f k
tof a c
tof a d
tof c b
tof b a
tof b c
tof b e
tof b g
tof b h
tof b j
tof b k
tof j b
tof j c
tof j e
tof j g
tof j i
tof c d
tof c f
tof c h
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof c f
tof k f
tof a f
tof k a
tof c i
tof c h
tof c d
tof j i
tof b j
tof j g
tof j e
tof j c
tof b k
tof b h
tof b a
tof a c
tof c b
tof a j
tof a i
tof a d
tof f b
tof b a
tof a b
tof a j
tof f d
tof f g
tof c b
tof a c
tof f c
tof b c
tof a e
tof a h
tof a k
tof b d
tof b k
tof d j
tof j a
tof j d
tof j e
tof j g
tof j h
tof j i
tof j f
tof f k
tof d c
tof c b
tof c d
tof c e
tof c g
tof c h
tof c i
tof a f
tof k a
X k
tof b j
tof j k
tof j c
H b
Z f j b
H b
H j
Z c k j
H j
X k
tof a b
tof a c
tof a j
X d
X e
X g
X h
X i
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j k
tof k a
tof a k
tof c i
tof c h
tof c g
tof c e
tof c d
tof c b
tof d c
tof j i
tof j h
tof j g
tof j e
tof j d
tof d j
tof b k
tof b d
tof b c
tof c b
tof a i
tof a b
tof f d
X b
tof a f
tof b k
tof c j
tof j c
tof j e
tof j g
tof j k
tof h c
tof c f
tof c h
tof c i
tof c j
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof c j
tof f g
tof j f
tof k a
tof c i
tof c h
tof h c
tof j k
tof j e
tof j c
tof c j
tof b k
tof b c
X b
tof f h
tof f a
tof a f
tof a b
tof j i
tof j k
tof a j
tof j a
tof b k
tof j b
tof j d
tof j e
tof j g
tof j h
tof d c
tof c d
tof c e
tof c g
tof c h
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c k
tof c h
tof c g
tof c e
tof c d
tof d c
tof j k
tof j i
tof j h
tof j g
tof j e
tof j a
tof a j
tof j d
tof b k
X c
tof a b
tof b c
tof a k
tof a i
tof a h
tof f g
tof a f
tof f a
tof a e
X e
tof f j
tof f i
tof f d
tof b f
tof f c
tof f b
tof b f
tof f d
tof f h
tof c b
tof c a
tof a c
tof a d
tof b a
tof a e
tof a g
tof a h
tof b k
tof e j
tof j a
tof j e
tof j k
tof e c
tof c b
tof c e
tof c i
tof c k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof b k
tof k a
tof a f
tof c k
tof c i
tof c e
tof c b
tof e c
tof j e
tof e j
tof b k
tof b d
tof b c
tof a c
tof c b
tof a h
tof a g
tof a e
tof a d
tof b a
tof f h
tof f d
tof f c
tof f b
tof b f
X b
tof c f
tof f c
tof f e
tof f g
tof f h
tof c a
tof a c
tof a e
tof a g
tof a j
tof j b
tof b k
tof j d
tof j e
tof c a
tof c b
tof c d
tof c h
tof c j
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof c j
tof c h
tof c d
tof c b
tof c a
tof j k
tof j e
tof j d
tof j b
tof b k
tof a j
tof a g
tof a e
tof a c
tof c a
tof f h
tof f g
X c
tof f e
tof f c
tof c f
X b
X d
tof a f
tof f a
tof f d
tof f e
tof j i
tof f j
tof b a
tof a b
tof a c
tof a f
tof a g
tof a h
tof a j
tof g b
tof b a
tof b f
tof b g
tof b h
tof j k
tof b j
tof j d
tof j e
tof d c
tof c a
tof c b
tof c d
tof c e
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c k
tof c e
tof c d
tof b a
tof c b
tof d c
tof j k
tof j i
tof j e
tof j d
tof b k
tof b j
tof b i
tof b h
tof b g
tof b f
tof a g
tof g b
tof a j
tof a i
tof a h
tof a f
tof f a
tof a c
X c
tof b a
tof f j
tof f i
tof f e
tof f d
tof a f
tof f b
tof f e
tof f i
tof f j
tof a h
tof a j
tof a k
tof c b
tof b c
tof b d
tof b e
tof b k
tof c j
tof j a
tof d c
tof j d
tof c d
tof j e
tof j h
tof j i
tof j k
tof c a
tof c e
tof c g
tof c i
tof c k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof k a
tof b a
tof a f
tof c k
tof c i
tof c g
tof c e
tof c d
tof c a
tof j d
tof d c
tof j i
tof j h
tof j e
tof c j
tof b e
tof b d
tof b c
tof c b
tof a k
tof a j
tof a h
tof a c
tof f j
tof f i
tof f e
tof f c
X g
tof f b
X f
tof i f
X b
tof j i
tof j k
tof f j
tof c f
tof c d
tof j c
tof g a
tof a f
tof a g
tof a h
tof b k
tof c j
tof j a
tof c e
tof c g
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
X g
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof c j
tof k a
tof a f
tof f k
tof c g
tof c e
tof j c
tof c d
tof c a
X c
tof j i
tof b k
tof a h
tof a g
tof a f
tof g a
tof f k
tof f j
tof f i
tof i f
X b
tof b f
tof f b
tof f h
tof f i
tof f j
tof f k
tof a e
tof a h
tof a i
tof a j
tof c b
tof b c
tof b f
tof b h
tof b i
tof b j
tof c j
tof j b
tof j c
tof j e
tof f k
tof j f
tof h c
tof c a
tof c b
tof c h
tof c i
tof c j
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
X h
X i
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c i
tof c h
tof c b
tof c a
tof h c
tof j k
tof j f
tof j e
tof b c
tof j b
tof c j
X h
tof b f
tof f b
tof b i
tof b h
tof c b
tof a j
tof a i
tof a h
tof a e
tof f k
tof f j
tof b f
X c
X d
tof f c
tof f e
tof f g
tof f j
tof c b
tof d c
tof d a
tof a d
tof c a
tof a f
tof a g
tof b a
tof a h
tof a k
tof j k
tof b j
tof j b
tof j a
tof j e
tof j f
tof j h
tof c a
tof c b
tof c g
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof b c
tof a b
tof b c
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c k
tof c g
tof b d
tof c b
tof c a
tof d c
tof j k
tof j h
tof j f
tof j e
tof j a
tof b k
tof b j
tof f g
tof b f
tof a c
tof c b
X c
tof a k
tof a h
tof a f
tof a d
tof b a
tof f j
tof f c
X f
tof f b
tof f j
tof j f
tof f k
tof b a
tof a b
tof a e
tof a f
tof j a
tof a h
tof a i
tof c b
tof b a
tof b c
tof b e
tof b f
tof b h
tof b i
tof b k
tof j e
tof h c
tof c a
tof c b
tof c h
tof c i
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
X e
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j i
tof c j
tof c h
tof b a
tof c b
tof b h
tof h c
tof j k
tof j h
tof j f
tof a e
tof j a
tof b k
tof b i
tof b f
tof b e
tof c b
tof a i
tof a h
tof a f
tof a b
tof b a
tof f k
tof f j
tof f e
tof f b
X c
X d
tof b f
tof f b
tof f g
tof f j
tof d a
tof a d
tof a f
tof a g
tof j h
tof a j
tof c b
tof b a
tof e c
tof b e
tof c e
tof b f
tof b g
tof j k
tof b j
tof j e
tof j g
tof c b
tof c f
tof c i
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof c f
tof a k
tof f k
tof c i
tof b e
tof c b
tof j e
tof e c
tof b j
tof j k
tof j h
tof j g
tof b a
tof f b
tof c b
tof a j
tof a h
tof a g
tof a d
tof d a
tof f j
tof f g
tof b f
X b
tof c f
tof f c
tof f d
tof f e
tof f g
tof f h
tof f j
tof c b
tof c a
tof a c
tof a d
tof a e
tof j b
tof b k
tof c a
tof c g
tof j c
tof c e
tof c h
tof c i
tof c k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof c k
tof c i
tof c h
tof c g
tof c e
tof j c
tof b c
tof c a
tof j k
tof f j
tof j g
X g
tof b k
tof b e
tof b d
tof c b
tof a c
X a
tof a e
tof f h
X f
tof f d
tof f g
tof f j
tof a f
tof f k
tof a g
tof d b
tof b a
tof b d
tof b e
tof j k
tof b j
tof j f
tof g c
tof c a
tof c b
tof c g
tof c h
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c h
tof c g
tof b a
tof c b
tof g c
tof j f
tof b j
tof j k
tof b e
tof b d
tof a d
tof d b
tof a k
tof f g
tof f j
tof a f
tof f k
tof f e
tof f c
tof c f
X c
tof b f
tof f b
tof f h
tof a h
tof j a
tof d c
tof a d
tof b c
tof j b
tof b f
tof b g
tof b k
tof j i
tof c a
tof c b
tof c d
tof c e
tof c h
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof k a
tof a f
tof f k
tof c h
tof c e
tof c d
tof c b
tof c a
tof j d
tof d c
tof j i
tof j g
tof j a
tof b k
tof b g
tof a b
tof b f
tof b c
tof a j
tof a d
tof f b
X f
tof b a
tof a f
tof f h
X b
tof c e
tof c g
tof c i
tof f c
tof c f
tof a e
tof j g
tof a j
tof j b
tof b k
tof j d
tof j e
tof j f
tof j h
tof j i
tof c a
tof c d
tof c h
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j i
tof j h
tof f g
tof f e
tof j f
tof j d
tof c j
tof c a
tof b k
X b
tof j b
tof a j
tof a h
tof a g
tof a e
tof f i
tof f c
X f
tof b f
tof f b
tof f c
tof f d
tof f e
tof f h
tof b a
tof a b
tof a d
tof a g
tof a k
tof c b
tof b c
tof b d
tof b k
tof d j
tof j a
tof j b
tof j d
tof j e
tof j h
tof d c
tof c d
tof c e
tof c h
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c i
tof c h
tof c e
tof c d
tof d c
tof j h
tof j e
tof j d
tof j a
tof d j
tof b k
tof b d
tof b c
tof c b
tof a k
tof a g
tof a d
tof a b
tof b a
tof f h
tof f e
tof f d
tof f c
tof f b
tof b f
X b
tof c f
tof f c
tof f g
tof f h
tof c f
tof c a
tof a c
tof a j
tof a k
tof b k
tof j d
tof j e
tof j h
tof c a
tof c e
tof c g
tof c h
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof f g
tof f h
tof c e
tof a f
tof c a
tof f e
tof j h
tof j e
tof j d
tof j k
tof a j
tof f d
tof j a
tof f k
tof a k
tof k a
X k
tof j b
tof j c
tof j g
tof e c
tof c b
tof c e
tof c g
tof c h
tof c i
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
H j
Z c k j
H j
X k
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof k a
tof a f
tof f k
tof c i
tof c h
tof c g
tof c e
tof c b
tof e c
tof j g
tof a c
tof j a
X f
X b
X k
tof b d
tof a h
tof a g
tof c e
tof f e
tof a f
tof c a
tof f h
tof f j
tof a f
tof b f
tof a g
tof b h
tof b j
tof j f
tof g c
tof c a
tof c b
tof c g
tof c h
tof c j
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof c f
tof k a
tof c a
tof f k
tof c j
tof c h
tof c g
tof c b
tof g c
tof j k
tof b j
tof j f
tof b h
tof b d
tof a g
tof a e
tof f k
tof f j
tof f h
X f
tof f c
tof f d
tof c a
tof f c
tof a j
tof a f
tof f a
tof b g
tof b i
tof f b
tof a d
tof a g
tof a k
tof b a
tof b c
tof b d
tof c j
tof j c
tof j b
tof b e
tof b f
tof j h
tof j i
tof j k
tof d c
tof c b
tof c d
tof c e
tof c g
tof c j
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j k
tof c j
tof c g
tof c e
tof c d
tof c b
tof d c
tof j i
tof j h
tof j f
tof j e
tof j c
tof j b
tof c j
tof f g
tof f i
tof b f
tof b e
tof b d
tof a c
tof b a
X b
tof a k
tof d g
tof d j
X d
tof a d
tof d g
tof c a
tof f d
tof f a
tof a f
tof f b
X f
tof f e
tof c g
tof f c
tof f i
tof f j
tof a e
tof a h
tof b k
tof j a
tof j d
tof j f
tof j i
tof c a
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c i
tof c a
X c
tof c g
tof f i
tof j f
tof j d
tof j a
tof d j
tof b k
tof a h
tof a e
X b
tof b d
tof a b
tof f e
tof f d
tof f c
tof f h
tof b f
tof j f
tof f k
tof c a
tof a c
tof a d
tof a e
tof a f
tof b a
tof a g
tof b e
tof g c
tof c a
tof c b
tof c g
tof c h
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c j
tof c h
tof c g
tof b a
tof c b
tof a g
tof g c
tof j k
tof j f
tof b k
tof b g
tof b f
tof b e
tof b d
tof a f
tof a e
tof a d
tof c a
tof f k
tof f g
X c
X d
tof f a
tof a f
tof f b
tof a c
tof a d
tof a j
tof j a
tof a h
tof d b
tof b a
tof b d
tof b e
tof b k
tof j c
tof j d
tof j g
tof j k
tof c a
tof c b
tof c e
tof c h
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j h
tof c j
tof b e
tof b a
tof c b
tof j k
tof j g
tof j a
tof a j
tof j d
tof j c
tof b k
tof b d
X b
tof f h
tof a f
tof f a
tof f j
tof e f
tof f e
tof e b
tof j f
X f
tof f g
tof f h
tof d a
tof a d
tof a g
tof b k
tof j a
tof j d
tof c b
tof c d
tof c g
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
tof c j
X d
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c d
tof c b
tof j h
tof f g
tof j f
tof a d
tof j a
tof b k
tof b g
tof b a
tof d b
X d
tof f h
tof f e
tof e b
tof f e
X f
tof a f
tof b f
tof f b
tof f d
tof f g
tof f h
tof a i
tof a j
tof b a
tof b g
tof b i
tof b j
tof b k
tof d j
tof j a
tof j d
tof j e
tof j g
tof j i
tof c a
tof c d
tof c e
tof c h
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c k
tof c i
tof c h
tof c g
tof c e
tof c d
tof c a
tof j i
tof j g
tof j e
tof j d
tof j a
tof d j
tof b k
tof b j
tof b i
tof b g
tof a e
tof b a
tof e b
tof a j
tof a i
tof a g
tof b c
tof b a
X b
tof f h
tof f g
tof f d
X d
tof f c
tof f e
tof f j
tof d a
tof a d
tof a j
tof j a
tof a g
tof b k
tof j e
tof j f
tof d c
tof c d
tof c e
tof c f
tof c j
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof c f
tof f k
tof j e
tof c j
tof c d
tof d c
tof j g
tof j f
tof j a
tof b k
tof f b
tof b c
X c
tof a j
tof a g
tof a d
tof d a
tof f j
tof f e
tof f a
tof a f
tof f g
tof f j
tof c b
tof c a
tof j c
tof a j
tof j a
tof b a
tof b e
tof b g
tof j b
tof b i
tof b k
tof j e
tof j f
tof j h
tof d c
tof c a
tof c d
tof c e
tof c f
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j f
tof j e
tof c j
tof c d
tof c a
tof d c
tof j k
tof j i
tof j h
tof b c
tof j b
tof j a
tof b k
tof b j
tof b i
tof b g
tof b e
tof a c
tof c b
tof b j
tof b a
X j
tof f j
tof d b
tof f d
tof b d
tof f e
tof f h
tof f i
tof c g
tof a c
tof j a
tof a i
tof b e
tof j b
tof b k
tof c d
tof c e
tof c f
tof j c
tof c k
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
X g
X i
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof b j
tof j b
tof b a
tof k a
tof a f
tof c f
tof f k
tof c g
tof c e
tof j c
tof c d
X c
tof j i
tof j g
tof j a
tof a j
tof j e
tof b e
tof b d
tof d b
tof a c
tof f e
tof c b
tof f c
tof b c
tof a h
tof b k
tof c j
tof j c
tof j g
tof j k
tof d c
tof c b
tof c d
tof c i
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof f i
tof f g
tof a f
X g
tof f h
X h
tof c i
tof c d
tof c b
tof d c
tof j k
tof j g
tof j c
tof c j
tof b k
tof b c
tof c b
tof a e
tof f d
X f
tof f c
tof a f
tof f a
tof f c
tof f d
tof a f
tof f i
tof a e
tof a k
tof c b
tof b c
tof b d
tof b k
tof h j
tof j b
tof j h
tof j i
H c
Z a b c
H c
tof c a
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c a
H c
Z a b c
H c
tof j i
tof j h
tof j b
tof h j
tof b k
tof b d
tof b c
tof c b
tof a k
tof a i
tof f h
tof a f
tof a e
tof f i
tof f d
tof f c
tof f a
tof a f
X g
tof b h
tof b i
tof f b
tof f k
tof d a
tof a d
tof a f
tof a h
tof a j
tof a k
tof b e
tof b f
tof g j
tof j f
tof j g
tof j h
tof g c
tof c a
tof c b
tof c f
tof c g
tof c h
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof c i
tof c h
tof c g
tof b f
tof c b
tof c a
tof g c
tof j h
tof j g
tof j f
tof g j
tof b i
tof b h
tof b e
tof a k
tof a j
tof f h
tof a f
tof a d
tof d a
tof f k
X f
X i
X b
X d
tof f d
tof b a
tof a b
tof a h
tof a i
tof c b
tof b c
tof b d
tof b k
tof d j
tof j a
tof j d
tof j e
tof j h
tof j k
tof g c
tof c a
tof c b
tof c g
tof c h
tof c j
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof j h
tof c j
tof c g
tof c b
tof c a
tof g c
tof j k
tof j e
tof j d
tof j a
tof d j
tof b k
tof b d
tof b c
tof c b
tof a i
tof a h
tof a b
tof b a
tof f i
tof f d
tof f b
X e
tof e f
tof f e
tof f g
tof f i
tof c i
tof a c
tof c a
tof g b
tof b f
tof b g
tof b h
tof b k
tof j g
tof j i
tof c b
tof c d
tof c j
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X e
X g
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j i
tof c j
tof c d
tof c b
tof c a
tof j g
tof b k
tof b h
tof b g
tof b f
tof g b
tof a i
tof a c
tof f i
tof f g
tof f e
tof e f
tof d b
tof f d
tof b d
tof f h
tof f j
tof b k
tof g j
tof j g
tof c j
tof j h
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X d
X e
X g
X h
X i
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j f
tof k a
tof a f
tof f k
tof j h
tof c j
tof j g
tof g j
tof b k
tof f d
tof b d
tof d b
tof f j
tof f h
tof c f
tof f c
X a
tof g a
tof a f
tof a g
tof a j
tof c b
tof b a
tof c k
tof j c
tof b j
tof j b
tof j a
tof c i
tof f k
tof a f
tof k a
tof j k
tof j f
tof b k
tof b j
tof j c
H b
Z f j b
H b
tof c j
H j
Z c k j
H j
tof a b
tof a c
tof a j
X h
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H k
Z 0 f k
H k
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
tof c j
tof a c
tof a b
H j
Z c k j
H j
tof j c
H b
Z f j b
H b
tof j k
tof b j
tof j b
tof j f
tof k a
tof a f
tof f k
tof c k
tof c i
tof b j
tof j k
tof j c
tof j a
tof a j
tof c b
tof a g
tof a f
tof g a
tof f c
tof c f
tof b j
tof j b
tof a f
tof f a
tof f k
tof j f
tof k j
X a
X b
X c
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
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
H k
Z 0 f k
H k
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
H 2
Z g h 2
H 2
H 1
Z 2 i 1
H 1
H 0
Z 1 j 0
H 0
H f
Z 0 k f
H f
H 0
Z 1 j 0
H 0
H 1
Z 2 i 1
H 1
H 2
Z g h 2
H 2
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
H k
Z 0 f k
H k
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
tof k j
X k
tof a k
tof j f
tof f a
tof a f
tof a k
tof j b
tof b j
tof k a
tof k b
tof k c
tof k d
tof k e
tof k f
tof k g
tof k h
tof k i
tof k j
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
