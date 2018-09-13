# Synthesized by applying the method "Reversible Circuit Synthesis Using a Cycle-Based Approach" (http://arxiv.org/abs/1004.4320)
# (c) Copyright 2007-2010 Mehdi Saeedi  Morteza Saheb Zamani  Mehdi Sedighi  and Zahra Sasanian (http://ceit.aut.ac.ir/QDA/)
# Distributing this file without an express written permission or erasing this note is prohibited.
.v a b c d e f g h i j 0 1 2 3 4 5
.i a b c d e f g h i j
.o a b c d e f g h i j
BEGIN
X a
tof a c
tof c a
tof c d
tof c e
tof d g
tof g c
tof g d
tof g f
tof d h
tof h c
tof h d
X h
tof h f
tof h e
tof d j
tof j c
tof j d
tof j g
tof j h
tof j i
tof d i
tof i c
tof i d
tof i e
tof i f
tof i j
tof d a
tof a c
tof a j
tof a b
H a
Z j c a
H a
tof d b
tof a d
tof a g
tof d a
tof a h
tof d f
tof d h
X d
H d
Z b j d
H d
tof j h
tof d h
tof a f
H a
Z j i a
H a
tof a f
H h
Z c j h
H h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a f
H a
Z j i a
H a
tof a f
H d
Z j b d
H d
tof d f
tof a h
tof d a
tof a d
tof d b
tof a g
H a
Z j c a
H a
tof a b
tof a j
tof a c
tof d a
tof i j
tof i f
tof i e
tof i d
tof i c
tof j d
tof d i
tof j h
tof g c
tof j g
tof d j
tof h f
tof h e
tof h d
tof h c
tof d h
tof d g
tof g f
tof g d
tof d g
tof c e
tof c d
tof a c
tof a b
X a
tof c a
tof a c
tof c d
tof c f
tof g c
tof g e
tof h d
tof h c
tof j h
tof j f
tof i a
tof i c
tof i d
tof i f
tof d b
tof d a
tof a d
tof a c
tof a h
tof a j
tof f j
tof f b
H f
Z j c f
H f
tof d a
tof d c
tof d e
tof d f
tof d h
H d
Z j b d
H d
tof a d
tof a f
tof a g
H a
Z j i a
H a
tof a d
tof a f
tof a g
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
H a
Z j i a
H a
tof a g
tof a f
tof a d
H d
Z j b d
H d
tof d h
tof d f
tof d e
tof d c
tof d a
tof a d
tof d b
H f
Z j c f
H f
tof f j
X f
tof j h
tof f b
tof a j
tof a c
tof i d
tof d a
tof i f
tof i c
tof j f
tof h d
tof h c
tof g f
tof g e
tof g c
tof c g
tof g d
tof c f
tof c b
tof c h
tof c i
tof g a
tof g c
tof g h
tof g j
tof d h
tof h d
tof h i
tof h j
tof h g
tof a j
tof j a
tof j f
tof i c
tof i d
tof d e
tof d a
tof a d
tof a f
tof a h
tof a j
tof d j
tof d g
tof d h
tof d i
H d
Z j c d
H d
tof d j
tof d b
tof d c
tof d i
H d
Z j b d
H d
tof d i
tof d b
tof d c
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof i h
tof j h
tof a j
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d c
tof d b
tof d i
H d
Z j b d
H d
tof d i
tof d c
tof d b
tof d j
H d
Z j c d
H d
tof h g
tof d h
tof d i
tof a d
tof d e
tof d j
tof a f
tof d a
tof i d
tof i c
tof j f
tof j a
tof a j
tof h j
tof h i
tof h d
tof d h
tof g j
tof a h
tof h a
tof c a
X h
tof g c
tof c g
X c
tof c i
X b
tof f c
tof c f
tof f g
tof g b
tof g f
tof g i
tof g j
tof h c
tof h d
tof h i
tof i h
tof a j
tof j h
tof a b
tof j a
tof j c
tof j d
tof j e
tof i b
tof i c
tof i e
tof f g
tof f j
tof i f
tof a d
tof a e
tof a h
tof a j
H f
Z j c f
H f
tof d i
tof c d
H c
Z j b c
H c
tof c d
tof d j
tof d a
tof d g
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof i h
tof j h
tof a j
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d g
tof d a
tof d i
tof d j
tof h d
tof c h
tof c i
H c
Z j b c
H c
tof c h
tof c i
H f
Z j c f
H f
tof f g
tof f j
tof a j
tof a e
tof a d
tof a b
tof j e
tof j c
tof j b
tof i j
tof g f
tof i g
tof j h
tof j a
tof a j
tof h i
tof h c
tof h a
tof a h
tof g j
tof g i
X g
X b
tof f i
tof c f
tof f c
tof c d
tof c a
X c
tof c b
tof c j
tof j c
tof g j
tof g a
tof j h
tof a h
tof h a
tof a h
tof i f
tof j i
tof i j
tof i b
tof i c
tof i g
tof a c
tof a f
tof a g
tof a j
tof d h
tof d j
tof d c
tof e b
tof e f
tof d e
H d
Z j c d
H d
H e
Z j b e
H e
tof d j
tof d b
tof d f
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof j h
tof a j
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d f
tof d b
tof d j
H e
Z j b e
H e
tof e f
X e
tof e b
tof a g
H d
Z j c d
H d
tof d h
tof d f
tof d e
tof d b
tof d c
tof d j
tof a j
tof a f
tof a c
tof i j
tof i g
tof i f
tof i c
tof i b
tof j i
tof j h
tof j f
tof j c
tof j a
tof h a
tof a h
tof c j
tof c b
tof g c
tof c g
tof a g
tof g a
tof a g
tof c i
tof c d
tof d c
tof c b
tof c d
tof c j
tof g e
tof g f
tof h a
tof h d
tof h f
tof h i
tof f j
tof j b
tof j f
tof j g
tof f h
tof i e
tof a f
tof d j
tof d a
tof d b
tof d e
tof d h
H d
Z j c d
H d
tof f j
tof f b
H f
Z j b f
H f
tof a d
tof a f
tof a g
H a
Z j i a
H a
tof a d
tof a f
tof g i
tof a g
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof h a
tof b h
tof c i
tof g j
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
H a
Z j i a
H a
tof a g
tof a f
tof a d
H f
Z j b f
H f
tof f h
tof f b
tof f j
H d
Z j c d
H d
tof d h
tof d e
tof d b
tof d a
tof d j
tof a h
tof a f
tof i e
tof j g
tof j f
tof j b
tof f j
tof h i
tof h f
tof h d
tof h a
tof g f
tof g e
tof g a
tof a g
tof c j
tof c d
X c
tof c b
tof d c
X d
tof a c
tof c a
tof c b
tof c d
tof e h
tof h e
tof d g
tof g d
tof g c
tof c e
tof h g
tof g i
tof h f
tof h j
tof e j
tof j b
tof j e
tof j g
tof j i
tof i a
tof i e
tof i f
tof i h
tof i j
tof f a
tof a b
tof f c
tof a f
tof a h
tof a j
tof f j
tof d f
tof f g
tof f i
tof f h
X f
H f
Z c j f
H f
tof j h
X h
tof f h
tof d e
tof d h
H d
Z j b d
H d
tof d f
tof d g
tof d a
H d
Z j i d
H d
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d a
tof d g
tof d f
H d
Z j b d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
H f
Z j c f
H f
tof f i
tof f g
tof a f
tof f c
tof i f
tof f j
tof a h
tof a b
tof f a
tof i h
tof j i
tof i e
tof j g
tof j b
tof h e
tof e j
tof g i
tof h g
tof h f
tof g e
tof e h
tof g d
tof g c
tof d g
tof c h
tof c e
tof c d
tof c b
tof c a
tof a c
X b
tof e c
tof c e
tof c g
tof c h
tof a g
tof g a
tof g e
tof h g
tof g i
tof g j
tof h a
tof h c
tof a h
tof j h
tof a j
tof a i
tof i a
tof j a
tof a i
tof i g
tof f i
tof i h
tof a e
tof d c
tof d a
tof d h
X d
H d
Z c j d
H d
tof d h
tof f b
tof f a
tof f h
X f
H f
Z b j f
H f
tof f h
tof e i
tof e a
H e
Z j i e
H e
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
tof d h
H d
Z c j d
H d
tof d c
tof d h
H e
Z j i e
H e
tof e a
tof e i
H f
Z j b f
H f
tof i h
tof f i
tof f a
tof f b
tof d a
tof i g
tof a i
tof a e
tof i j
tof j a
tof h a
tof a i
tof i j
tof h g
tof h c
tof g j
tof g i
tof g e
tof g a
tof a g
tof c h
tof c g
tof c e
tof e c
tof c a
X c
tof c e
tof c h
tof c i
tof a g
tof g a
tof g e
tof g j
tof e h
tof h b
tof h e
tof h g
tof h j
tof a j
tof j a
tof j b
tof i h
tof i c
tof j c
tof j h
tof d e
tof i d
tof i g
tof d a
tof a c
tof a j
tof b g
tof b i
H b
Z j c b
H b
tof b g
tof b i
tof a e
tof a f
tof a g
tof a h
H a
Z j b a
H a
tof d f
tof a d
tof a g
tof d a
tof a h
tof d j
tof d b
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
tof a g
X d
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d f
tof d e
tof d b
tof d a
tof d j
tof a h
tof a g
tof a f
tof a e
tof a d
H a
Z j b a
H a
tof a h
tof a g
tof a f
tof a e
tof i g
tof b i
H b
Z j c b
H b
tof b i
tof a j
tof j a
tof a c
tof d a
tof i h
tof i e
tof i d
tof i c
tof h b
tof j h
tof h j
X b
tof a j
tof h g
tof h e
tof e h
tof g e
tof g a
X g
tof g j
tof a g
tof c i
tof c h
tof c e
tof c a
X c
tof e c
tof c b
tof c e
tof c h
tof c i
tof c j
tof g f
tof g i
tof a h
tof h a
tof h c
tof h g
tof h d
tof i h
tof a j
tof j a
tof j d
tof j i
tof i j
tof i b
tof i d
tof i f
tof d a
tof a c
tof a d
tof a e
tof d a
tof a f
tof a g
tof a j
H d
Z j c d
H d
H a
Z j b a
H a
tof a i
H j
Z b g j
H j
H i
Z b g i
H i
tof a b
tof a g
H a
Z j i a
H a
tof a b
tof a g
tof a h
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a b
H a
Z j i a
H a
tof a g
tof a b
H i
Z b g i
H i
H j
Z b g j
H j
tof a i
H a
Z j b a
H a
tof i h
tof a i
H d
Z j c d
H d
tof d i
tof d g
tof a f
tof a j
tof d a
tof a d
tof a i
tof a g
tof a e
tof a c
tof d a
tof i j
tof i f
tof i d
tof i b
tof j i
tof h d
tof j h
tof j a
tof a j
tof h g
tof h c
tof h a
tof a h
tof g i
X g
tof g f
tof c i
X c
tof c j
tof c h
tof c b
tof c e
tof e c
X d
tof a c
tof c a
tof c d
tof c e
tof c h
tof c j
tof a g
tof g a
tof g b
tof h c
tof g h
tof h b
tof h j
tof j h
tof h d
tof h e
tof a h
tof j h
tof j a
tof j c
tof j g
tof d i
tof d g
tof d h
tof i d
tof a b
tof e f
tof a e
H e
Z j c e
H e
tof d b
tof d a
H d
Z j b d
H d
tof e j
tof e i
tof e a
tof e c
tof e g
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e g
tof e c
tof e a
tof e i
tof e j
H d
Z j b d
H d
tof d h
tof d g
tof a b
tof d a
H e
Z j c e
H e
tof a e
tof a h
X e
tof e f
tof i h
tof i g
tof i d
tof h i
X d
tof h d
tof d i
tof j h
tof j g
tof j e
tof j c
tof j a
tof h j
tof h e
tof g h
tof h c
tof h b
X b
tof g a
tof a g
tof c j
tof c h
tof c e
tof c d
tof c a
tof a c
tof g j
X g
tof e c
tof c b
tof c e
tof g h
tof c g
tof g a
tof g f
tof h b
tof d e
tof d g
tof h i
tof h d
tof d h
tof a j
tof j a
tof d j
tof j b
tof j f
tof a i
tof i a
tof i b
tof i c
tof i g
tof i j
tof e f
tof a e
tof a j
tof d a
H d
Z j c d
H d
tof d j
tof d a
tof d e
tof d g
H d
Z j b d
H d
tof e j
tof e c
tof e h
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
tof e f
tof e c
tof e j
H d
Z j b d
H d
tof d g
tof d f
tof d e
tof d a
tof d j
H d
Z j c d
H d
tof d h
tof d g
tof d f
tof d e
tof d b
tof a j
tof d a
tof a f
tof a e
tof i j
tof i g
tof i c
tof i b
tof i a
tof a i
tof j f
tof j b
tof j a
tof a g
X a
tof a j
tof h i
tof h g
tof h e
tof h d
tof h b
tof g a
tof a h
tof g f
tof a g
tof c h
tof c f
tof g i
tof h d
tof h e
tof h j
tof j h
tof h g
tof j a
tof j b
tof d i
tof i d
tof i c
tof j i
X d
tof i j
tof i f
tof i g
H a
Z h i a
H a
tof f i
tof a i
tof a h
tof f h
tof f c
tof f b
H f
Z j c f
H f
tof e j
tof e a
tof e c
tof e i
H e
Z j b e
H e
tof f j
tof f b
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f b
tof f j
H e
Z j b e
H e
tof e i
tof e c
tof e a
tof e j
H f
Z j c f
H f
tof f i
tof f h
tof f b
tof f c
tof a i
tof a h
H a
Z h i a
H a
tof j g
tof i j
tof i f
tof i d
tof i c
tof d i
tof h d
tof j h
tof c b
tof j c
tof j a
tof a j
tof h j
tof h g
tof h e
tof g i
tof g f
tof g a
tof a g
tof c j
tof c g
tof c f
tof c e
tof e c
X j
X i
X h
tof a b
tof b f
X b
tof b a
tof d c
tof c d
tof c i
tof e g
tof g e
tof g j
tof a h
tof j a
tof f j
tof j f
tof h j
tof h a
tof j g
tof f i
tof i f
tof i g
tof a i
tof e b
tof i e
tof a c
tof e a
tof a j
tof e g
tof e h
H e
Z j c e
H e
tof d j
tof d b
tof d a
tof d f
tof d h
H d
Z j b d
H d
tof d j
tof d a
tof d b
tof d c
tof d f
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d f
tof d c
tof d b
tof d a
tof d j
H d
Z j b d
H d
tof d h
tof d f
tof d a
tof d b
tof d j
H e
Z j c e
H e
tof e h
tof e g
tof e b
tof a j
tof e a
tof a g
tof a f
tof a c
tof i f
tof f a
tof i g
tof i e
tof i b
tof a i
tof j g
tof j f
tof f j
tof h f
tof h a
tof a h
tof g j
tof g e
tof e g
tof d f
tof c d
X d
X a
tof d i
tof d c
tof b f
tof b a
tof a b
tof g a
tof c g
tof g b
tof g c
tof g d
tof a h
tof h a
tof j b
tof j c
tof j f
tof j i
tof a i
tof i a
tof i b
tof i d
tof i g
tof f a
tof a c
tof a f
tof a g
tof a j
tof a d
tof a e
tof a i
H a
Z j c a
H a
tof a b
tof a d
tof a e
tof a i
tof e j
tof e a
tof e c
tof e g
tof e h
X e
H e
Z b j e
H e
tof j h
X h
tof e h
tof c d
tof c f
tof c h
H c
Z j i c
H c
tof c d
tof c f
tof c h
H h
Z c j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof c h
tof c f
tof c d
H c
Z j i c
H c
tof c h
tof c f
tof c d
H e
Z j b e
H e
tof e g
tof e c
tof e a
tof e j
tof a i
tof a e
tof a d
tof a b
H a
Z c j a
H a
tof j c
tof a j
tof a i
tof a e
tof g d
tof a g
tof a f
tof f a
tof g b
tof i g
X b
tof i a
tof a i
tof j i
tof j f
tof j b
tof h a
tof g a
tof a g
tof a c
tof c a
tof g c
tof c i
tof c b
tof c e
tof c j
tof g d
tof g e
tof g f
tof a h
tof h a
tof h b
tof d c
tof h d
tof h j
tof j h
tof h g
tof j c
tof j f
tof d i
tof i d
tof i j
tof d e
tof d a
tof a d
tof a f
tof j h
tof a j
tof d j
H d
Z j c d
H d
tof d b
tof d f
tof d g
tof d i
H d
Z j b d
H d
tof d i
tof d a
tof d b
tof d f
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d f
tof d b
tof d a
tof d i
H d
Z j b d
H d
tof d i
tof d g
tof d b
tof a d
tof d f
H d
Z j c d
H d
tof d h
tof d e
tof d c
tof d j
tof d a
tof i j
tof i d
tof i c
tof d i
tof h g
tof j h
tof j f
tof h j
tof j c
tof c j
tof h d
tof h b
tof h a
tof g a
tof a h
tof g f
tof g e
tof g d
tof a g
tof c e
X c
tof c f
tof c b
X d
tof a c
tof c a
tof c d
tof c f
tof g j
tof c g
tof g c
tof j g
tof g d
tof g i
tof f h
tof h f
tof h i
tof i h
tof h g
tof j b
tof j f
tof i b
tof i j
tof d a
tof a b
tof d f
tof a d
tof a j
tof d c
tof d i
H d
Z j c d
H d
tof e j
tof e i
tof e h
X e
H e
Z b j e
H e
tof j h
X h
tof e h
H f
Z j i f
H f
H h
Z c j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
H e
Z j b e
H e
tof e i
tof e j
H d
Z j c d
H d
tof d i
tof d c
tof a d
tof d f
tof a j
tof a b
tof d a
tof i j
tof h g
tof i h
X b
tof j i
tof i b
tof j g
tof j f
tof g j
tof j d
tof h i
tof h f
tof f h
tof g i
tof g c
tof c j
tof c g
tof c a
tof g c
tof a g
tof a f
tof g a
tof a d
tof c e
tof g h
tof h g
tof c j
tof j c
tof j a
tof h j
tof a c
tof g f
tof h e
tof h i
tof j b
tof f i
tof i c
tof i f
tof i g
tof e a
tof i h
tof a i
tof e j
X e
tof e f
H e
Z c j e
H e
tof a d
tof a e
H a
Z j b a
H a
tof a d
tof a e
tof d g
H d
Z j i d
H d
tof d g
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof d g
H d
Z j i d
H d
tof d g
tof a e
tof a d
H a
Z j b a
H a
tof a e
tof a d
H e
Z j c e
H e
tof e i
tof e f
tof a h
tof e a
tof h f
tof e j
tof a i
tof h a
tof a c
tof i g
tof i f
tof i c
tof f i
tof j c
tof j b
tof j a
tof g j
tof g e
tof h g
tof g h
tof g f
tof c d
tof g c
tof g a
tof a g
tof c j
tof c f
tof c e
X b
X c
tof a c
tof c a
tof c d
tof c e
tof c f
tof c j
tof f g
tof g b
tof g c
tof g f
tof g h
tof g j
tof a h
tof h a
tof h g
tof h e
tof h i
tof f j
tof j f
tof j g
tof j h
tof j i
tof a i
tof i a
tof i b
tof i d
tof e f
tof i e
tof d c
tof d a
tof a d
tof a g
tof d j
tof d a
tof d f
H d
Z j c d
H d
tof e j
tof e b
tof e a
tof e c
tof e h
H e
Z j b e
H e
tof a d
tof a e
tof a g
H a
Z j i a
H a
tof a d
tof a e
tof a g
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a e
tof a d
H a
Z j i a
H a
tof a g
tof a e
tof a d
H e
Z j b e
H e
tof e h
tof e f
tof e c
tof e a
tof e j
X e
tof j f
tof e b
H d
Z j c d
H d
tof d j
tof a c
tof d a
tof a g
tof i d
tof a d
tof d a
tof i f
tof i e
tof i b
tof a i
tof h i
tof h g
tof j h
tof g f
tof f j
tof h e
tof h a
tof a h
tof c h
tof g c
tof f g
tof f b
tof g f
tof c j
tof c f
tof c d
tof g a
tof h d
tof g h
tof j i
tof g j
tof h c
tof h a
tof j a
tof j d
tof j e
tof j f
tof a i
tof i a
tof i c
tof i d
tof i f
tof i g
tof i j
tof a d
tof a e
tof a b
tof a i
H a
Z j c a
H a
tof a b
tof i h
tof f i
tof a f
tof d j
tof d c
tof f g
tof d f
H d
Z j b d
H d
tof f b
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof j h
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f g
tof f b
tof a f
tof f i
H d
Z j b d
H d
tof d i
tof d h
tof g f
tof d g
tof d c
tof d j
tof a b
H a
Z j c a
H a
tof a i
tof a b
tof a e
tof i a
tof a d
tof i j
tof i g
tof i c
tof j a
tof a i
tof j f
tof j e
tof j d
tof h d
X a
tof h c
tof g h
tof h a
tof g j
tof g i
tof g d
tof g b
X d
tof c b
tof c f
tof a g
tof g a
tof g b
tof g c
tof g d
tof j h
tof g j
tof h c
tof h f
tof h e
X f
tof j a
tof j b
tof j d
tof e j
tof j g
tof a i
tof i a
tof i c
tof i e
tof e i
tof d a
tof a b
tof a d
tof a e
tof e a
tof e c
tof e b
tof c e
tof e h
H e
Z j c e
H e
tof c d
tof c f
tof c g
H c
Z j b c
H c
tof c d
tof c e
tof c f
tof c g
tof c h
tof d g
H d
Z j i d
H d
tof d g
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof d g
H d
Z j i d
H d
tof c d
tof d g
tof c h
tof c f
H e
Z c j e
H e
H c
Z b j c
H c
tof c h
tof c g
tof c f
tof c d
tof e i
tof e h
tof e g
tof a b
tof e a
tof e c
tof a e
tof e j
tof i g
tof a i
tof a d
tof d a
tof j e
tof j c
tof i j
tof i a
tof a i
tof j h
tof j g
tof j f
tof g j
tof j d
tof j b
tof j a
tof h f
tof h e
tof g h
tof h c
tof c h
X g
tof a g
tof c f
X e
X c
X j
tof g i
tof c g
tof g a
tof g f
tof g h
tof g j
tof a h
tof a c
tof h i
tof h j
tof j i
tof h a
tof a h
tof j f
tof i b
tof i c
tof i d
tof a i
tof i f
tof a j
tof a g
H a
Z j c a
H a
tof a d
tof a e
tof a g
tof a h
tof d j
tof d f
tof i h
tof d i
H d
Z j b d
H d
tof d j
tof d a
tof d b
tof d f
tof d h
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d f
tof d b
tof d a
tof d j
H d
Z j b d
H d
tof d i
tof d h
tof d f
tof d j
tof a h
tof a g
tof a e
tof a d
H a
Z j c a
H a
tof a h
tof a g
tof a j
tof i f
tof i c
tof a i
tof i d
tof i b
tof j f
tof h j
tof j i
tof h c
tof h a
X h
tof g a
tof a h
tof g j
tof g i
X g
tof g f
tof c f
tof c h
tof a g
tof g a
tof g f
tof a h
tof h a
tof h b
tof h c
tof h j
tof j h
tof h f
tof h i
tof i h
tof j b
tof j d
tof j e
tof i c
tof i d
tof i e
tof f a
tof a b
tof a c
tof a f
tof a g
tof a h
H j
Z g h j
H j
H c
Z g h c
H c
tof j h
tof a g
tof a h
tof a i
H a
Z j c a
H a
tof a g
tof a h
H b
Z c g b
H b
tof a c
tof a g
H a
Z j b a
H a
tof a c
tof a g
tof a i
H i
Z b g i
H i
tof a b
tof a g
tof a h
H a
Z j i a
H a
tof a b
tof a g
tof a h
tof c b
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a b
H a
Z j i a
H a
tof a h
tof a g
tof a b
H i
Z b g i
H i
tof a i
tof a g
tof a c
H a
Z j b a
H a
tof a g
tof a c
H b
Z c g b
H b
tof a h
tof a g
H a
Z j c a
H a
tof a i
tof a h
tof a g
H c
Z g h c
H c
H j
Z g h j
H j
tof a h
tof a g
tof a f
tof a c
tof a b
tof f a
tof i h
tof i e
tof i d
tof i c
tof h i
tof h f
tof j h
tof j e
tof j d
tof h j
tof j b
X j
tof c a
tof h c
X h
tof g a
tof a g
tof c i
tof c e
tof a c
X e
tof a b
tof c a
tof g c
tof c j
tof g d
tof g e
tof d h
tof h b
tof h d
tof h i
tof h j
tof h e
tof a j
tof j a
tof j b
tof j c
tof j d
tof j f
tof j g
tof j i
tof i a
tof i b
tof i d
tof i f
tof a c
tof a e
tof a i
H a
Z j c a
H a
tof a b
tof d i
tof a d
tof f b
tof f c
tof f i
H f
Z j b f
H f
tof d b
tof d g
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d g
tof d b
tof a d
tof d i
H f
Z j b f
H f
tof f i
tof f c
tof f b
tof a b
H a
Z j c a
H a
tof a i
tof a e
tof a c
tof i f
tof i d
tof j i
tof i b
tof i a
tof g f
tof g d
tof g c
tof j g
tof c g
tof a j
tof h i
X j
tof e j
tof h e
tof h d
tof h b
tof d h
tof c f
tof c b
X b
tof c h
tof g b
tof g d
tof g f
tof g h
tof a h
tof h a
tof h b
tof h c
tof h d
tof h f
tof h g
tof h j
tof j b
tof j e
tof j f
tof j h
tof j i
tof i b
tof i c
tof i d
tof f j
tof i f
tof a c
tof a d
tof a e
tof a j
tof f a
tof f b
tof f h
H f
Z j c f
H f
tof d j
tof d b
tof d a
tof d c
tof d g
X d
tof d f
tof b d
H d
Z j b d
H d
tof b e
tof j h
H h
Z b j h
H h
H b
Z i j b
H b
tof b d
tof b e
H h
Z c j h
H h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof c h
tof b c
H h
Z c j h
H h
tof j h
tof c h
tof b c
tof b e
tof b d
H b
Z j i b
H b
tof b h
tof b e
tof b d
H d
Z j b d
H d
tof d g
tof d f
tof d c
tof d a
tof d b
tof d j
H f
Z j c f
H f
tof f h
tof f b
tof a j
tof f a
tof a e
tof a d
tof a c
tof j f
tof i j
tof i d
tof i c
tof j i
tof i b
tof j h
tof j e
tof e j
tof g j
tof g f
tof g d
tof h g
tof h c
tof h b
tof h a
tof a h
tof g h
tof c e
tof e c
X b
tof g e
tof e c
X g
tof g e
X h
tof c a
tof g d
tof g f
tof g i
tof g j
tof i h
tof h b
tof h c
tof h j
tof h i
tof i h
tof h g
tof j i
tof i g
tof j a
tof j b
tof i j
tof j d
tof j f
tof i c
tof d a
tof a d
tof a e
tof f i
tof a f
tof a j
tof f c
tof f a
tof f b
tof f g
tof e f
tof d f
tof f h
H f
Z j c f
H f
tof e j
tof e a
H e
Z j b e
H e
tof d j
tof d i
tof d a
tof d b
tof d c
tof d g
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d g
tof d f
tof d c
tof d b
tof d a
tof d i
tof d j
H e
Z j b e
H e
tof e h
tof e f
tof e a
tof e j
H f
Z j c f
H f
tof f i
tof f h
tof f g
tof f b
tof f a
tof f c
tof j f
tof i j
tof a i
tof a e
tof a d
tof d a
tof i h
tof i d
tof i c
tof h i
tof h g
tof j h
tof j d
tof j b
tof j a
tof h j
tof h c
tof h b
tof i h
tof g j
tof g i
tof g f
tof g e
X d
tof g d
tof g b
tof c a
tof c g
X c
tof c h
tof e i
tof c i
X i
tof g c
tof g e
tof g j
tof a h
tof h a
tof h b
tof a j
tof j h
tof j a
tof i b
tof j i
tof i e
tof i f
tof i g
tof d c
tof d a
tof a d
tof a e
tof a j
tof d g
H d
Z j c d
H d
tof a c
tof a f
tof a h
H a
Z j b a
H a
tof a c
tof a f
tof a h
tof d i
tof d b
tof d e
tof d g
tof d h
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d g
tof d e
tof d b
tof d i
tof a f
tof a c
H a
Z j b a
H a
tof a h
tof a f
tof a c
H d
Z j c d
H d
tof d g
tof a d
tof d c
tof a j
tof a e
tof d a
tof i g
tof i f
tof i e
tof i b
tof e i
tof j i
tof h b
tof h a
tof j h
tof a h
tof h j
X h
tof g j
tof g e
tof g a
tof c i
tof c h
tof c g
tof g c
X c
tof a c
tof c a
tof c e
tof c h
tof g d
tof g f
tof g j
tof j g
tof g i
tof a g
tof i a
tof d h
tof h c
tof h d
tof e f
tof h e
tof j c
tof i j
tof j d
tof i e
tof a b
tof a c
tof a d
tof a f
tof d a
tof a i
tof e j
tof e c
tof e g
tof j h
H e
Z c j e
H e
X h
tof b g
tof d b
X d
tof b g
H d
Z b j d
H d
tof d h
H e
Z j i e
H e
tof e h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof e h
H e
Z j i e
H e
tof e h
H d
Z j b d
H d
tof d i
tof d h
tof a g
tof d a
tof a d
tof d b
H e
Z j c e
H e
tof e h
tof e g
tof e f
tof e c
tof e j
tof i f
tof a i
tof a c
tof j g
tof i j
tof i e
tof i d
tof i a
tof j i
tof j d
tof j c
tof h f
tof h e
tof h d
tof h c
X d
tof d h
tof c h
tof g j
tof g i
tof g f
tof c e
tof c a
tof a c
tof c g
tof c h
tof c j
tof g j
tof j g
tof g b
tof g e
tof a h
tof h a
tof h b
tof j c
tof j d
tof a i
tof i a
tof i c
tof i f
tof e f
tof e g
tof e h
tof e j
tof a e
tof e a
tof e c
tof e i
H e
Z j c e
H e
tof d b
tof d i
H d
Z j b d
H d
tof c d
tof c e
tof c g
tof c h
H c
Z j i c
H c
tof c d
tof c e
tof c g
tof c h
tof j h
tof c b
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof c h
tof c g
tof c e
tof c d
H c
Z j i c
H c
tof c h
tof c g
tof c e
tof c d
H d
Z j b d
H d
tof d i
tof d b
H e
Z j c e
H e
tof e i
tof e h
tof e g
tof a f
tof e a
tof e c
tof e j
tof j e
tof a j
tof a h
tof a g
tof i f
tof i c
tof i a
tof a i
tof g d
tof j g
X d
tof j c
tof j b
tof h b
tof h a
tof g j
tof g b
tof d g
tof d e
tof j d
tof c j
tof c h
X i
tof a c
tof c a
tof h a
tof c g
tof g c
tof c i
tof g d
tof g f
tof h c
tof h e
tof h g
tof j a
tof a j
tof j g
tof d i
tof i b
tof i c
tof i d
tof i e
tof i g
tof i j
tof a b
tof a d
tof a e
tof a i
H c
Z b j c
H c
tof a b
H a
Z j c a
H a
tof a b
tof e j
tof e f
tof e g
tof e h
X e
tof d e
tof d g
H e
Z j b e
H e
tof d j
tof d i
tof d a
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d g
tof d e
tof d a
tof d i
tof d j
H e
Z j b e
H e
tof e h
tof e g
tof e f
tof e j
tof a b
H a
Z j c a
H a
tof a b
H c
Z b j c
H c
tof j g
tof i j
tof i e
tof i d
tof i b
tof a i
tof i c
tof d i
tof j d
tof j a
tof g e
tof g c
tof h g
tof h a
tof a h
tof g i
tof d g
tof g d
X d
tof d g
tof d f
tof c h
X h
tof h c
tof c f
tof g c
tof h g
tof g e
tof g j
tof h b
tof h i
tof j h
tof h a
tof j c
tof j d
tof j f
H i
Z b c i
H i
tof i b
tof i c
tof i h
tof d a
tof a b
tof a c
tof a d
tof a e
tof a f
tof a i
tof a j
tof d j
tof f h
tof d f
H d
Z j c d
H d
tof a h
H a
Z j b a
H a
tof a h
tof f j
tof f i
tof f c
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f c
tof f i
tof f j
H a
Z j b a
H a
tof i h
tof a i
H d
Z j c d
H d
tof h f
tof d h
tof a d
tof d j
tof a f
tof a e
tof a c
tof a b
tof j d
tof d a
tof i c
tof i b
H i
Z b c i
H i
tof h c
tof j h
tof h j
tof h i
tof g e
tof h g
tof h b
tof h a
tof g j
tof g d
tof g c
tof c i
tof c f
tof a c
tof c a
X g
tof c e
tof a c
X i
X h
tof c g
tof c h
tof g a
tof g c
tof h e
tof h j
tof g h
tof h g
tof h b
tof h c
tof a j
tof j a
tof j b
tof j c
tof j h
tof d e
tof d i
tof a d
tof i a
tof i f
X e
tof a b
tof a g
tof a h
tof d j
tof d c
H d
Z j c d
H d
tof d b
tof d a
tof d c
tof d e
tof d g
tof d i
H d
Z j b d
H d
tof d j
tof d i
tof d b
tof d e
tof d f
tof d g
tof d h
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d g
tof d f
tof d e
tof d b
tof d i
tof d j
H d
Z j b d
H d
tof d i
tof d g
tof d e
tof d c
tof a b
tof d a
H d
Z j c d
H d
tof d i
tof d h
tof d g
tof d f
tof a e
tof d a
tof j c
tof d j
tof a h
tof a g
tof i a
tof a d
tof i f
tof i e
tof a i
tof h b
tof j h
tof j a
tof a j
tof g j
X j
tof g e
tof h g
tof h c
tof c h
tof c a
tof a g
tof g c
tof a e
tof c a
tof g i
tof g j
tof c g
tof d b
tof g d
tof g f
tof g h
tof a h
tof h a
tof h e
tof h f
tof h j
tof e j
tof j e
tof j h
tof j i
tof a i
tof i a
tof i g
tof i j
tof d c
tof d e
tof d h
tof d a
tof a d
tof a i
tof d j
tof d a
tof d g
H d
Z j c d
H d
H j
Z b c j
H j
tof c g
tof i h
tof c i
H c
Z j b c
H c
tof c g
tof c i
tof b c
tof b e
tof b f
tof j h
H h
Z b j h
H h
H b
Z i j b
H b
tof b c
tof b e
tof b f
H h
Z c j h
H h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof c h
tof b c
H h
Z c j h
H h
tof j h
tof c h
tof b f
tof b e
H b
Z j i b
H b
tof b h
tof b f
tof b e
tof b c
tof c i
tof c h
tof c g
H c
Z j b c
H c
tof c i
tof c h
tof c g
H j
Z b c j
H j
H d
Z j c d
H d
tof d h
tof d g
tof d e
tof a b
tof a c
tof d a
tof d j
tof a i
tof h e
tof a h
tof a d
tof d a
tof i j
tof i g
tof i a
tof a i
tof j i
tof j h
tof e j
tof h a
X h
tof h f
tof a h
tof g j
tof g i
tof g h
tof g f
tof g d
tof g b
X g
tof c f
tof c h
tof d g
tof g b
tof g d
tof g f
tof h a
tof h d
tof h e
tof h j
tof j h
tof h g
tof j d
tof j f
tof j i
tof a i
tof i a
tof i b
tof i c
tof i f
tof i g
H a
Z c g a
H a
tof a c
tof a g
tof i h
tof a i
tof a j
tof d c
tof d a
tof d b
tof d g
H d
Z j c d
H d
tof d b
tof d a
tof f i
tof d f
H d
Z j b d
H d
tof f j
tof f c
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f c
tof f i
tof f j
H d
Z j b d
H d
tof d i
tof d h
tof d f
tof d a
tof d b
H d
Z j c d
H d
tof d g
tof d b
tof a c
tof d a
tof a j
tof a i
tof a h
tof a g
H a
Z c g a
H a
tof i g
tof i f
tof i c
tof i b
tof i a
tof a i
tof j i
tof h g
tof j h
X j
tof j f
tof h j
tof j d
tof h e
tof c h
tof h a
X h
tof g f
X b
tof g d
tof g b
tof d g
tof c j
tof c i
tof c g
tof a f
tof a c
tof a e
X a
tof c a
tof c b
tof g j
tof c g
tof g c
tof j c
tof g d
tof j g
tof g i
tof i g
tof a h
tof h a
tof h c
tof h e
tof h f
tof h g
tof j a
tof j f
tof i b
tof i c
tof i e
tof i h
tof f i
tof i j
tof d a
tof a c
tof a d
X h
tof j h
tof d g
tof a j
tof d a
tof f c
X f
tof d b
tof d f
H f
Z c j f
H f
tof f h
tof d i
X d
tof d e
tof a d
H d
Z j b d
H d
tof a f
H a
Z j i a
H a
tof a d
tof a f
tof a g
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
H a
Z j i a
H a
tof a g
tof a f
tof a d
H d
Z j b d
H d
tof d i
tof d f
tof d e
tof d a
tof d b
H f
Z j c f
H f
tof i c
tof i j
tof f i
tof a j
tof h g
tof a h
tof a d
tof a c
tof d a
tof i g
tof i e
tof i b
tof g i
tof j g
tof j f
tof j c
tof j a
tof h f
tof h e
tof h c
tof h a
tof a h
tof g j
tof g d
tof g c
tof c j
tof c g
tof c b
X b
X e
tof c i
tof a g
tof g a
tof g c
tof g d
tof g f
tof g h
tof g i
tof h g
tof g j
tof h d
tof h e
tof a j
tof j a
tof j b
tof j c
tof j d
tof j e
tof j f
tof d i
tof i c
tof i d
tof i e
tof a j
tof a g
H a
Z j c a
H a
tof a b
tof a d
tof e f
tof a e
tof e g
tof a h
tof e a
tof a g
tof a i
tof e b
H e
Z j b e
H e
tof e j
tof e i
tof e b
tof e c
tof e f
tof e g
tof e h
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof h g
tof e h
tof e f
tof e c
tof e b
tof e i
tof e j
H e
Z j b e
H e
tof e i
tof a f
tof e a
tof a e
tof e b
tof a i
tof a h
tof a d
H a
Z j c a
H a
tof a g
tof a j
tof i e
tof i d
tof i c
tof d i
tof j f
tof j e
tof j d
tof j c
tof j b
tof j a
tof a j
tof h j
tof h e
tof g h
tof h d
tof g j
tof g i
tof c f
tof g c
tof g a
tof a g
X i
tof c e
X c
tof c a
tof c f
tof g a
tof g d
tof g e
tof g h
tof g i
tof g j
tof d h
tof h b
tof h c
tof h d
tof h i
X e
tof h e
tof d j
tof j b
tof j d
tof j e
tof j g
tof j h
tof a j
tof j i
tof i a
tof i d
tof i e
tof i h
tof a b
tof f c
tof a f
tof a h
tof f j
tof a g
tof f a
tof a f
H f
Z j c f
H f
tof d j
tof d b
tof d c
tof d f
tof d g
tof d i
H d
Z j b d
H d
tof a d
H a
Z j i a
H a
tof a d
tof a f
tof a g
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
H a
Z j i a
H a
tof a g
tof a f
tof a d
H d
Z j b d
H d
tof d i
tof d g
tof d f
tof d c
tof d b
tof d j
H f
Z j c f
H f
tof f g
tof a c
tof a j
tof f a
tof a f
tof a h
tof a b
tof h e
tof j h
tof j d
tof i j
tof i a
tof a i
tof g i
tof j g
tof j b
tof d j
tof h i
tof h d
tof h c
tof h b
tof g d
tof d h
X d
tof g j
tof g e
tof g a
tof i f
tof c i
X c
X a
tof e c
tof c e
tof c g
tof c j
tof a g
tof g a
tof g c
tof g d
tof j e
tof g j
tof h i
tof g h
tof d a
tof h d
tof h g
tof a b
tof j a
tof i c
tof j i
tof j h
tof i j
X h
tof a d
tof a h
tof d b
H a
Z j c a
H a
tof a b
tof a e
tof a g
tof d f
tof d g
X d
H d
Z b j d
H d
tof d h
tof e i
tof e c
tof e f
H e
Z j i e
H e
H h
Z c j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e f
tof e c
tof e i
H d
Z j b d
H d
tof d h
tof d g
tof d f
tof d b
tof a g
tof a e
tof a b
H a
Z j c a
H a
tof a b
tof a h
tof g d
tof a d
tof d a
tof i j
tof h f
tof i h
tof j i
tof i c
tof j f
tof j e
tof j b
tof j a
tof g i
tof h g
X h
tof g h
tof g j
tof g f
tof g e
tof g c
tof a g
X g
X f
tof c f
tof g c
tof c h
tof g a
tof g d
tof g e
tof e h
tof h b
tof h c
tof h f
tof h e
tof h j
tof a j
tof j a
tof j e
tof j g
tof j i
tof i a
tof i b
tof i c
tof i d
tof d a
tof a d
tof a e
tof a i
H j
Z b c j
H j
tof a b
tof a g
H a
Z j c a
H a
tof a b
tof a g
tof e b
tof e a
tof f c
tof e f
H e
Z j b e
H e
tof f j
tof f i
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f c
tof f i
tof f j
H e
Z j b e
H e
tof e f
tof e c
tof a b
tof e a
tof a g
H a
Z j c a
H a
tof a g
tof a b
H j
Z b c j
H j
tof i h
tof a i
tof a e
tof i d
tof a d
tof d a
tof i c
tof i b
tof j i
tof g e
tof j g
tof j a
tof a j
tof h j
tof h f
tof h e
tof h c
X h
tof h b
tof e h
tof g d
tof g c
tof g a
X g
tof c j
tof c h
tof c f
tof c e
tof e c
tof g e
tof c g
tof c a
tof c b
tof c d
tof g c
tof c j
tof g h
tof g i
tof h c
tof h d
tof h e
tof j g
tof h j
tof j a
tof j c
tof j d
tof f i
tof j f
tof i f
tof i b
tof i c
tof i g
tof e i
tof a f
tof a g
tof b d
tof b g
H b
Z j c b
H b
tof b d
tof e b
tof b g
tof e j
H e
Z j b e
H e
tof a b
H a
Z j i a
H a
tof a b
tof a d
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a d
tof a b
H a
Z j i a
H a
tof a b
H e
Z j b e
H e
tof i g
tof e i
tof e b
tof e j
tof b g
tof b d
H b
Z j c b
H b
tof b g
X b
tof b d
tof a g
tof a f
tof i f
tof i c
tof i b
tof j f
tof f i
tof j g
tof j d
tof j c
tof j a
tof g j
tof g e
tof h g
tof h d
tof g h
tof h c
tof c h
tof e g
tof c e
tof e i
tof j d
tof g c
tof c j
tof c b
tof g f
tof j g
tof h j
tof a b
tof h a
X h
tof a g
tof a h
tof h f
X h
tof j c
tof j e
tof d i
tof i c
tof i d
tof i e
tof a d
tof a i
tof e a
tof a j
tof e b
tof e f
H e
Z j c e
H e
tof a d
tof a f
tof a h
H a
Z j b a
H a
tof a d
tof a f
tof a h
tof d j
tof d b
tof d e
tof d h
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d e
tof d b
tof d j
tof a f
tof a d
H a
Z j b a
H a
tof h f
tof a h
tof a d
H e
Z j c e
H e
tof e f
tof a b
tof a j
tof e a
tof j e
tof i d
tof a i
tof h g
tof a h
tof i e
tof i c
tof d i
tof g d
tof g c
tof j g
tof g j
tof h j
tof h d
X h
tof h b
tof h a
tof c a
tof a h
X c
X g
tof c e
tof g d
tof h j
tof g h
tof h g
tof h a
tof j h
tof h f
tof i f
tof h c
tof i h
tof a b
tof a d
tof j a
tof i j
tof j e
tof i b
tof i d
tof i g
tof a f
tof d j
tof d a
tof e g
tof d e
H d
Z j c d
H d
tof f j
tof f g
tof f i
H f
Z j b f
H f
tof e j
tof e b
tof e f
tof e h
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
tof e g
tof e f
tof e b
tof e j
H f
Z j b f
H f
tof f i
tof f h
tof f g
tof f j
H d
Z j c d
H d
tof d g
tof d e
tof d a
tof d j
tof a f
tof a d
tof a b
tof i j
tof i g
tof i f
tof i e
tof i d
tof i b
tof h f
tof j h
tof j e
tof j d
tof j c
tof j b
tof h j
tof j a
tof h g
tof h c
tof a h
tof g j
tof h i
tof g h
tof g f
tof g d
tof g b
tof c h
tof e g
tof g e
tof c e
X g
X d
tof a c
tof c b
tof c a
X c
tof h f
tof c h
tof h c
tof g f
tof j g
tof g i
tof h b
tof j b
tof j d
tof j e
tof a i
tof i a
tof i c
tof d h
tof i d
tof e a
tof a b
tof a c
tof a e
tof f a
tof a h
tof f c
tof f b
tof f g
tof f i
H f
Z j c f
H f
tof d j
tof d b
tof d a
tof d c
tof d g
H d
Z j b d
H d
tof d j
tof d e
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d e
tof d j
H d
Z j b d
H d
tof d h
tof d g
tof d c
tof a b
tof d a
tof d j
H f
Z j c f
H f
tof f i
tof f g
tof a c
tof f a
tof a h
tof a e
tof e a
tof i d
tof i c
tof i a
tof a i
tof g i
tof g e
tof j g
tof j d
tof j b
tof c f
tof c b
tof h c
tof c h
tof g f
tof e g
tof a d
tof a c
X a
tof c a
tof a c
tof c b
tof c e
tof c h
tof a g
tof g a
tof g b
tof g c
tof h f
tof h j
tof g h
tof h g
tof h b
tof h c
tof a j
tof j a
tof j d
tof j e
tof j g
tof a i
tof a c
tof i a
tof d f
tof i d
tof i j
tof a b
tof a f
H e
Z j c e
H e
tof d j
tof d a
tof e c
tof d e
tof d g
tof d h
X d
H d
Z b j d
H d
tof j h
X h
tof i h
tof e i
tof d h
X e
tof e f
H e
Z j i e
H e
H h
Z c j h
H h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
X f
tof i f
tof e c
tof e i
H d
Z j b d
H d
tof d g
tof d f
tof d e
tof d c
tof d a
tof d j
H e
Z j c e
H e
tof a f
tof a c
tof a b
tof i j
tof i d
tof i c
tof i a
tof a i
tof j g
tof j e
tof j d
tof j a
tof a j
tof h j
tof g i
tof g f
tof h g
tof g h
tof c b
tof h c
tof c h
X b
tof g j
tof g a
tof a g
tof c i
tof c e
tof c d
tof c a
X c
tof f c
tof c b
tof g f
tof c g
tof c i
tof c j
tof g b
tof g c
tof d h
tof h g
tof g d
tof h b
tof h e
tof h c
tof e i
tof a j
tof j a
tof j c
tof j g
tof e a
tof i e
tof i f
tof a f
tof f i
tof a b
tof a g
tof f a
tof a h
tof f j
tof f c
H f
Z j c f
H f
tof d j
tof d b
tof d c
tof d e
tof d f
tof d g
tof i h
tof d i
H d
Z j b d
H d
tof a c
tof a d
tof a e
tof a f
H a
Z i j a
H a
tof c i
tof a c
tof a d
tof a e
tof a f
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof h a
tof b h
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a f
tof a e
tof a d
tof a c
H a
Z j i a
H a
tof a f
tof a e
tof a d
tof a c
H d
Z j b d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof d c
tof d b
tof d j
H f
Z c j f
H f
tof j c
tof f j
tof f i
tof a h
tof f a
tof a i
tof a g
tof a e
tof a b
tof i e
tof e a
tof i f
tof a i
tof j g
tof j a
tof a j
tof h g
tof h e
tof h d
tof c b
tof h c
X h
tof g d
tof d h
tof g c
tof c g
X g
tof g f
tof c j
tof c i
tof f c
X a
tof j c
tof c j
tof d g
tof g b
tof g c
tof g d
tof g f
tof g h
tof a h
tof h a
tof h j
tof j h
tof h b
tof d e
tof d h
tof h c
tof j g
tof j i
tof a i
tof i a
tof i b
tof i c
tof i e
tof i f
tof i h
tof d i
tof d j
tof d a
tof a d
tof d a
tof f g
tof d f
H d
Z j c d
H d
tof f b
tof f c
H f
Z j b f
H f
tof a d
tof a f
tof a g
H a
Z j i a
H a
tof a d
tof a f
tof a g
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
H a
Z j i a
H a
tof a g
tof a f
tof a d
H f
Z j b f
H f
tof f g
tof f c
tof f b
H d
Z j c d
H d
tof d i
tof d h
tof d g
tof d f
tof a e
tof a c
tof a j
tof d a
tof a d
tof a i
tof i a
tof a h
tof d a
tof i f
tof i e
tof i c
tof i b
tof a i
tof j i
tof j h
tof g c
tof g b
tof j g
tof c j
tof j c
tof h c
tof h b
tof h a
tof a h
tof g h
tof g f
tof g d
tof d g
X d
X a
tof d c
tof c d
tof g e
tof g h
tof g j
tof c g
tof g a
tof g d
tof a h
tof h a
tof h c
tof h d
tof h f
tof a j
tof j a
tof j b
tof j d
tof j e
tof j g
tof h i
tof d h
tof j h
tof h i
tof i j
tof i d
tof d h
tof i e
tof i f
tof i g
tof d a
tof a b
tof a c
tof a d
tof f h
tof a f
tof f j
tof f c
tof f g
H f
Z j c f
H f
tof d j
tof d e
X f
X e
tof a f
tof d a
tof d i
H d
Z j b d
H d
tof a d
tof a g
H a
Z j i a
H a
tof a d
tof a f
tof a g
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
H a
Z j i a
H a
tof a g
tof a f
tof a d
H d
Z j b d
H d
tof d i
tof d f
tof d e
tof d a
tof d j
H f
Z j c f
H f
tof f h
tof f g
tof f c
tof f j
tof a h
tof a f
tof a d
tof a c
tof a b
tof d a
tof j h
tof j g
tof i j
tof i f
tof i e
tof j d
tof i d
tof d i
tof j e
tof j b
tof j a
tof a j
tof h f
tof c d
tof h c
tof g h
tof h a
tof a h
tof g e
tof g d
tof c g
tof c e
tof d c
X b
X c
tof c a
tof c d
tof c e
tof c g
tof g a
tof g b
tof a h
tof h a
tof h b
tof h f
tof h e
tof h j
tof a j
tof j a
tof j b
tof j c
tof f g
tof j f
tof j i
tof a i
tof i a
tof i b
tof i d
tof i e
tof i f
tof i j
tof d a
tof c d
tof a c
tof a f
tof a h
tof f j
H f
Z j c f
H f
tof c f
tof c g
tof i h
tof c i
H c
Z j b c
H c
tof c d
tof c f
tof c g
tof d c
tof c i
tof d a
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof c h
tof d c
tof d a
tof c d
tof d i
tof c g
tof c f
H c
Z j b c
H c
tof c i
tof c h
tof c g
tof c f
tof c d
H f
Z j c f
H f
tof f j
tof j f
tof a f
tof f g
tof a h
tof a d
tof a c
tof i d
tof d a
tof i j
tof i e
tof i b
tof j a
tof a i
tof j c
tof j b
tof h a
tof g a
tof c a
tof a j
tof h f
tof h e
tof h b
tof a h
tof g b
tof c g
tof c e
tof c d
X b
X e
tof a c
tof c d
tof a g
tof h a
tof g e
tof g c
tof c h
tof h c
tof h b
tof c j
tof g i
tof d j
tof j c
tof j d
tof j f
tof j g
tof j h
tof e i
tof i c
tof i e
tof i f
tof d a
tof a d
tof a e
tof a h
tof a i
tof f a
tof a j
tof d f
tof f g
tof f h
H f
Z j c f
H f
tof d j
tof d c
tof d i
H d
Z j b d
H d
tof d j
tof d a
tof d e
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d e
tof d a
tof d j
H d
Z j b d
H d
tof d i
tof d h
tof d g
tof d f
tof d c
tof d j
H f
Z j c f
H f
tof f h
tof f g
tof a j
tof f a
tof j f
tof a i
tof a h
tof a e
tof a d
tof d a
tof i f
tof i e
tof i c
tof e i
tof j h
tof j g
tof j d
tof h j
tof j c
tof d j
tof g h
X b
tof c b
tof a j
tof g a
tof c f
tof g d
tof h e
tof h j
tof h i
tof i h
tof h g
tof j i
tof j a
tof j b
tof j d
tof j f
tof i e
tof i f
tof f c
tof f g
tof f h
tof a f
tof a j
tof f b
H f
Z j c f
H f
tof a c
tof a d
tof a f
H a
Z j b a
H a
tof a e
tof a i
tof a b
tof a g
H a
Z j i a
H a
tof c b
tof a c
tof a d
tof a f
tof a g
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
tof a c
tof a b
H a
Z j i a
H a
tof a g
tof a b
tof i e
tof a i
H a
Z j b a
H a
tof a f
tof a d
tof a c
H f
Z j c f
H f
tof f h
tof f g
tof f b
tof a f
tof f c
tof a j
tof j a
tof a g
tof h g
tof i h
tof j i
tof i f
tof j d
tof j b
tof h a
tof a j
tof h i
tof h e
X h
tof h b
tof g i
tof g f
tof g e
tof c d
tof c a
tof g c
tof a g
tof c j
tof c h
tof c f
tof a c
tof c b
tof c a
tof b c
X b
tof b f
tof c b
tof b h
tof c e
tof g f
tof c g
tof c j
tof g a
tof g b
tof g c
tof a h
tof a e
tof a f
tof h a
tof h g
tof h j
tof d j
tof j b
tof j d
tof j e
tof j g
tof j i
tof i b
tof i e
tof i j
tof b c
tof a b
tof b c
tof a h
tof a j
tof d c
tof d g
tof d i
H d
Z j c d
H d
tof d g
H d
Z j b d
H d
tof d g
tof f j
tof f i
tof f c
tof f h
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof j h
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f c
tof f i
tof f j
tof d g
H d
Z j b d
H d
tof d g
H d
Z j c d
H d
tof d i
tof d g
tof d c
tof a j
tof a f
tof a e
tof c b
tof a c
tof j e
tof i j
tof j i
tof i b
tof j g
tof j d
tof d j
tof g j
tof g f
tof h g
tof h e
tof h a
tof a h
tof c a
tof g c
tof c g
tof c h
tof c e
tof b c
tof c f
tof b h
tof b a
tof a b
X a
X d
X h
tof c a
tof c j
tof g a
tof g b
tof g f
tof h j
tof j h
tof a j
tof h a
tof h c
tof j b
tof j i
tof d i
tof i c
tof i d
tof i e
H a
Z b g a
H a
tof a b
tof a g
tof a j
tof c j
H c
Z b h c
H c
tof b h
tof c j
tof b i
H b
Z j c b
H b
tof b h
tof b i
tof c i
H c
Z j b c
H c
tof i h
tof c i
H j
Z c g j
H j
tof c g
H c
Z i j c
H c
tof g i
tof c g
tof c h
tof j h
tof c b
H h
Z b j h
H h
tof a j
tof a i
tof h a
tof b h
tof g j
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof c b
tof c a
tof h a
tof b a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof c g
H c
Z j i c
H c
tof c h
tof c g
H j
Z c g j
H j
tof c i
H c
Z j b c
H c
tof c i
tof b i
H b
Z j c b
H b
tof b i
tof b h
tof c j
H c
Z b h c
H c
tof c j
tof h c
X h
tof a j
tof a g
tof a b
H a
Z b g a
H a
tof i e
tof i d
tof i c
tof d i
tof j i
tof j h
tof j b
tof h j
tof j a
tof a h
tof g j
tof g f
tof g b
tof g a
tof c a
X c
X f
tof c e
tof e g
tof g b
tof g c
tof g e
tof g f
tof g i
tof a h
tof h a
tof h b
tof h d
tof h c
tof h j
tof a j
tof j a
tof j b
tof j c
tof j d
tof j h
tof j i
tof d i
tof d a
tof i d
tof i e
tof a i
tof i g
tof i h
tof i j
tof f h
tof a f
tof f a
tof f j
tof f b
H f
Z j c f
H f
tof a c
tof a e
tof a f
tof a g
H a
Z j b a
H a
tof a c
tof a e
tof a f
tof d a
tof a g
tof d i
tof d b
tof d c
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d g
tof d c
tof d b
tof d a
tof d i
tof a g
tof a f
tof a e
tof a c
H a
Z j b a
H a
tof a g
tof a f
tof a e
tof a c
H f
Z j c f
H f
tof f h
tof f b
tof f a
tof f j
tof a h
tof a f
tof a e
tof i d
tof a d
tof d a
tof j h
tof i j
tof g e
tof i g
tof g i
tof j a
tof a i
tof j d
tof j c
tof j b
tof h a
tof a j
tof h d
tof h c
tof h b
tof a h
tof g f
tof g c
tof g b
tof e g
tof c j
tof c e
X d
X a
X b
X e
tof a c
tof c a
tof c b
tof c f
tof c g
tof c j
tof a g
tof g a
tof g b
tof g c
tof g d
tof h e
tof h i
tof g h
tof g j
tof h a
tof h d
tof j h
tof h f
tof h g
tof j a
tof j b
tof j i
tof i d
tof i g
tof j h
tof i j
tof d a
tof a c
tof a e
tof a f
tof a g
tof a j
tof a b
tof a i
H a
Z j c a
H a
tof a b
tof a d
tof a i
tof e b
tof e c
tof e i
H e
Z j b e
H e
tof b f
tof i h
H h
Z b j h
H h
H b
Z i j b
H b
tof b f
H h
Z c j h
H h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
tof h f
tof b h
H b
Z j i b
H b
tof b h
H e
Z j b e
H e
tof e i
tof e c
tof e b
tof a i
tof a d
tof a b
H a
Z j c a
H a
tof a i
tof a b
tof j g
tof a j
tof a f
tof a e
tof a c
tof d a
tof i j
tof i d
tof j i
tof j f
tof j b
tof j a
tof g i
tof h g
tof g h
tof h e
tof h d
tof h a
tof c j
tof c b
tof g c
tof c a
tof a g
tof c f
tof a c
tof c d
X c
tof c a
tof c b
tof j e
tof g j
tof c g
tof j c
tof g f
tof g h
tof h i
tof i h
tof a h
tof h a
tof d b
tof j d
tof j f
tof d j
tof j g
tof i b
tof i f
tof i g
tof d c
tof d a
tof a d
tof d a
tof e f
tof e i
tof d e
H d
Z j c d
H d
tof a d
tof a f
tof a g
tof j h
H a
Z b j a
H a
tof a d
tof a f
tof a g
tof e c
H e
Z j i e
H e
H h
Z c j h
H h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
tof e f
tof e c
tof e i
tof a g
tof a f
tof a d
H a
Z j b a
H a
tof a h
tof a g
tof a f
tof a d
H d
Z j c d
H d
tof d i
tof d h
tof d g
tof d f
tof d e
tof c b
tof a c
X b
tof a j
tof d a
tof a d
tof a g
tof d a
tof g f
tof i g
X f
tof i b
tof i a
tof a i
tof g e
tof g d
tof c g
tof j c
tof h j
tof g h
tof h a
tof c a
tof c e
X c
tof e c
tof c b
tof h e
tof h i
tof c h
tof j c
tof g c
tof g e
tof h a
tof h b
tof f g
tof h f
tof h d
tof j d
tof i j
tof j e
tof i a
tof i c
tof d a
tof a d
tof a h
tof a i
tof f j
tof f b
tof f i
H f
Z j c f
H f
tof e j
tof e b
tof e f
tof e g
tof e h
H e
Z j b e
H e
tof a e
tof a f
tof a g
H a
Z j i a
H a
tof a e
tof a f
tof a g
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a e
H a
Z j i a
H a
tof a g
tof a f
tof a e
H e
Z j b e
H e
tof e h
tof e g
tof e f
tof e b
tof e j
H f
Z j c f
H f
tof f i
tof f g
tof f b
tof f j
tof a i
tof h d
tof a h
tof d a
tof j e
tof j c
tof i j
tof i a
tof j d
tof h j
tof h i
tof h g
tof h f
tof h e
tof h b
X h
tof g a
tof g e
X a
tof g d
tof g c
tof c j
tof c i
tof c h
tof c e
tof c b
tof e c
X f
X g
tof c e
tof c f
tof c g
tof c h
tof c i
tof c j
tof g i
tof g j
tof d e
tof a d
tof d e
tof h a
tof j a
tof i j
tof j f
tof a j
tof j g
tof i d
tof i e
tof f i
tof a b
H a
Z j c a
H a
tof a b
tof a f
tof d b
tof d a
tof d c
tof d g
tof d h
H d
Z j b d
H d
tof f b
tof f g
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f g
tof f b
tof f i
H d
Z j b d
H d
tof d h
tof d g
tof d c
tof a b
tof d a
tof i h
tof i f
tof a i
H a
Z j c a
H a
tof a b
tof j g
tof j e
tof j d
tof a j
X d
tof i j
tof j f
tof j a
tof h e
tof h d
tof h a
tof a h
tof g j
tof c i
tof c g
tof c f
tof c e
tof c d
tof g a
tof g d
tof g e
tof h a
tof h i
tof h j
tof j i
tof j h
tof h c
tof j b
tof j d
tof j e
tof j f
tof j g
tof a i
tof i a
tof i c
tof i e
tof f h
tof d f
tof i f
tof i h
tof d i
tof a d
tof d a
tof d c
tof d g
tof d h
H d
Z j c d
H d
tof d j
tof d b
tof d a
tof f c
tof d f
H d
Z j b d
H d
tof f j
tof f b
tof f g
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f g
tof f c
tof f b
tof f j
H d
Z j b d
H d
tof d h
tof d f
tof d c
tof d a
tof d b
tof d j
H d
Z j c d
H d
tof d i
tof d h
tof d g
tof a f
tof d a
tof d c
tof a i
tof a d
tof i h
tof i f
tof i e
tof i c
tof i a
tof a i
tof j i
tof j h
tof j g
tof j f
tof j e
tof j d
tof j c
tof j b
tof h c
tof h a
tof c h
tof g i
tof g e
tof g d
tof e c
tof c e
X e
tof e d
tof h f
tof c h
tof h c
tof g e
tof g j
tof h a
tof e j
tof j e
tof h j
tof h b
tof j c
tof d i
tof i b
tof i d
tof e g
tof i e
tof i j
tof a d
tof e f
tof a e
tof a h
H a
Z j c a
H a
tof e b
tof a e
tof e a
tof e h
X e
tof e f
H e
Z j b e
H e
tof a g
H a
Z j i a
H a
tof a f
tof a g
tof a h
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
H a
Z j i a
H a
tof a h
tof a f
H e
Z j b e
H e
tof e f
tof e a
tof a e
tof i e
tof e b
tof a h
H a
Z j c a
H a
tof a h
tof a g
tof a e
tof a f
tof a d
tof i j
tof i g
tof i d
tof d i
tof j e
tof j c
tof h e
tof g e
tof e j
tof h i
tof c f
tof h c
tof h b
tof h a
tof g a
tof c j
tof c i
tof c h
tof c e
X e
tof e c
X d
tof a c
tof c b
tof c a
X c
tof c e
tof c f
tof c g
tof c i
tof g c
tof c j
tof g b
tof g d
tof g e
tof g h
tof d g
tof h d
tof h f
tof h i
tof a h
tof a j
tof j a
tof j c
tof j g
tof d i
tof d j
tof i d
tof d i
tof a b
tof a e
tof a i
tof d c
tof d a
tof d b
tof d h
tof j h
H d
Z c j d
H d
tof d j
tof d b
tof d e
tof d g
tof d i
tof d h
X d
H d
Z b j d
H d
X h
tof i h
tof e i
tof d h
tof e c
tof e f
H e
Z j i e
H e
H h
Z c j h
H h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
tof e f
tof e c
tof e i
H d
Z j b d
H d
tof d i
tof d h
tof d g
tof d e
tof d b
tof d j
H d
Z j c d
H d
tof d i
tof d h
tof d g
tof a b
tof d a
tof d c
tof d j
tof a i
tof a h
tof a e
tof j g
tof i j
tof i d
tof d i
tof j h
tof j c
tof j a
tof a j
tof h i
tof h g
tof h f
tof g h
tof h d
tof g j
tof c e
tof c b
tof g c
tof g i
tof c g
tof c j
tof a c
X a
tof c a
tof a c
tof a f
tof j b
tof c j
tof g d
tof c g
tof g b
tof g c
tof g f
tof g h
tof a h
tof h a
tof j g
tof j c
tof j d
tof j e
tof j f
tof i h
tof j i
tof a j
tof i a
tof i b
tof c e
tof i e
tof a c
tof c e
tof e a
tof e d
tof e f
tof a h
tof e j
H e
Z j c e
H e
tof a c
tof a g
H a
Z j b a
H a
tof a c
tof a d
tof a f
tof a g
tof a i
tof f j
tof f a
tof f c
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof a c
tof f a
tof f j
tof a i
tof g f
tof a g
tof a d
H a
Z j b a
H a
tof a i
tof a g
tof c d
tof a c
X d
H e
Z j c e
H e
tof e i
tof j h
tof a j
tof e a
tof i e
tof a i
tof a f
tof a c
tof j b
tof i j
tof i a
tof g i
tof j g
tof j e
tof j c
tof h a
tof a h
tof g h
tof c b
tof g c
tof c g
X b
X j
tof j a
tof c a
X c
X i
tof c b
tof c e
tof g h
tof c g
tof g c
tof g d
tof g i
tof d h
tof h d
tof h b
tof h e
tof j e
tof i f
tof j i
tof a j
tof i a
tof e c
tof e b
tof i e
tof i g
tof i h
tof a c
tof a d
tof a f
tof a i
H e
Z j c e
H e
tof e b
tof e a
tof e f
tof d e
tof e h
H e
Z j b e
H e
tof d j
tof d i
tof d c
tof d g
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d g
tof d e
tof d c
tof d i
tof d j
H e
Z j b e
H e
tof e h
tof a f
tof e a
tof e b
H e
Z j c e
H e
tof e b
tof e c
tof i j
tof a i
tof a d
tof i a
tof a c
tof i h
tof i g
tof i f
tof i e
tof i b
tof j i
tof j f
tof j e
tof j a
tof h e
tof h d
X h
tof h b
tof g d
tof d h
tof c i
tof g c
tof c g
tof c j
tof c e
X c
tof c a
tof c g
tof j i
tof c j
tof i c
tof g b
tof j d
tof g j
tof h a
tof h c
tof h g
tof h d
tof i d
tof j a
tof a j
tof i j
tof a b
tof a f
tof a e
tof a i
H a
Z j c a
H a
tof a e
tof a i
tof d b
tof d e
H d
Z j b d
H d
tof a b
tof a c
tof a d
tof a f
tof a g
H a
Z j i a
H a
tof a b
tof a c
tof a d
tof a f
tof a g
tof c b
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
tof a g
tof a f
tof a d
tof a c
tof a b
H a
Z j i a
H a
tof a g
tof a f
tof a d
tof a c
tof a b
H d
Z j b d
H d
tof d e
tof d b
tof a i
tof a e
H a
Z j c a
H a
tof a i
tof a e
tof a j
tof a f
tof a b
tof j d
tof i j
tof i c
tof j i
tof j a
tof g d
tof h g
tof c a
tof h c
tof c h
tof c g
tof a c
tof c a
X a
tof g j
tof g i
tof g b
X e
tof h b
tof c h
tof c g
tof c j
tof a g
tof g a
tof g b
tof g d
tof g e
tof g i
tof g j
tof h a
tof h c
tof h d
tof h g
tof h e
tof h i
tof e j
tof j e
tof d j
tof j g
tof i b
H a
Z b c a
H a
tof a b
tof a c
tof d a
tof a i
tof d f
tof d h
H d
Z j c d
H d
tof d j
tof d b
tof a f
tof d a
tof d g
tof d i
H d
Z j b d
H d
tof c b
tof a c
tof a h
H a
Z j i a
H a
tof a c
tof a f
tof a h
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
tof a f
tof a c
tof a b
H a
Z j i a
H a
tof a h
tof a f
tof a c
tof a b
H d
Z j b d
H d
tof d i
tof d g
tof d f
tof d a
tof d b
tof d j
H d
Z j c d
H d
tof d i
tof h g
tof d h
tof d f
tof d a
tof d j
tof a i
tof a c
tof a b
H a
Z b c a
H a
tof i b
tof h i
tof g e
tof j g
tof h e
tof e j
tof h d
tof c a
tof h c
tof c h
tof g i
tof g d
tof g b
tof g a
tof a g
tof a c
X d
X a
X f
tof j i
X j
tof d c
tof c b
tof c d
tof c f
tof d g
tof g d
tof g e
tof h a
tof h e
tof h f
tof a b
tof j a
tof f j
tof a i
tof i a
tof i e
tof i g
tof i h
tof a d
tof f g
tof a f
tof f i
H f
Z j c f
H f
tof f b
tof f c
H f
Z j b f
H f
H i
Z b c i
H i
tof b c
H b
Z j i b
H b
tof c h
H h
Z c j h
H h
tof b c
tof c b
tof b h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof j h
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
tof b c
H b
Z j i b
H b
tof b c
H i
Z b c i
H i
H f
Z j b f
H f
tof f c
tof f b
H f
Z j c f
H f
tof i h
tof i g
tof f i
tof a f
tof f j
tof g d
tof a g
tof i a
tof a b
tof i e
tof j a
tof a i
tof h b
X h
tof j h
tof h f
tof h e
tof h j
tof h a
tof g e
tof d g
tof c f
tof c d
tof c b
X d
tof d c
tof a c
tof c a
tof c e
tof c f
tof g a
tof g h
tof d i
tof g d
tof g j
tof a h
tof h a
tof h b
tof f j
tof j f
tof j b
tof j h
tof d b
tof i d
tof i f
tof i j
tof a f
tof a h
tof a i
tof d c
tof d e
tof d g
tof d i
H d
Z j c d
H d
tof d j
tof d f
tof d g
tof d h
tof d i
H d
Z j b d
H d
tof f j
tof f i
tof f a
tof f h
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof a i
tof f a
tof f j
H d
Z j b d
H d
tof d i
tof d h
tof d g
tof j f
tof d j
H d
Z j c d
H d
tof g e
tof i b
tof d i
tof d g
tof d c
tof a f
tof i j
tof i d
tof g d
tof d i
tof h b
tof j h
tof g f
tof f j
tof g h
tof h a
tof a h
tof c f
tof c e
tof c a
tof a c
X c
tof c a
tof c d
tof c g
tof g b
tof a h
tof h a
tof h g
tof h c
tof j h
tof j e
tof j f
tof j i
tof e i
tof i c
tof i e
tof i f
H a
Z c g a
H a
tof a c
tof a g
tof a h
tof a i
tof a j
H c
Z g j c
H c
tof g i
H g
Z j c g
H g
tof g i
H j
Z b i j
H j
tof a i
H a
Z j b a
H a
tof a i
H j
Z b c j
H j
tof b c
tof b g
tof b h
H b
Z j i b
H b
tof b c
tof b g
tof c b
H h
Z b j h
H h
tof j h
tof b h
tof c h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof c h
tof b c
H h
Z c j h
H h
tof j h
tof c h
tof b g
H b
Z j i b
H b
tof b h
tof b g
tof b c
H j
Z b c j
H j
tof a i
H a
Z j b a
H a
tof a i
H j
Z b i j
H j
tof g i
H g
Z j c g
H g
tof g i
H c
Z g j c
H c
tof a j
tof a i
tof a h
tof a g
tof a c
H a
Z c g a
H a
tof i f
tof i e
tof i c
tof j e
tof e i
tof j h
tof j f
tof h g
tof c a
tof h c
tof a h
X a
tof g h
tof g f
tof d e
tof d g
tof c d
tof g d
tof c j
tof j i
tof h j
tof j h
tof i h
tof g h
tof h g
tof h b
tof j e
tof j f
tof i j
tof e b
tof e a
tof a e
tof a f
tof a h
tof a i
tof e c
tof e a
tof e h
X e
H e
Z c j e
H e
tof j h
X h
tof e h
tof d a
tof d i
H d
Z j b d
H d
tof a b
tof a d
tof a f
tof a h
H a
Z j i a
H a
tof a b
tof a d
tof a f
tof a h
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
tof e h
H e
Z c j e
H e
tof e c
tof e h
tof a f
tof a d
tof a b
H a
Z j i a
H a
tof a h
tof a f
tof a d
tof a b
H d
Z j b d
H d
tof d i
tof a b
tof d a
tof e a
tof i h
tof a i
tof a f
tof a e
tof e a
tof j g
tof i j
tof j i
tof i b
tof j h
tof j f
tof j e
X j
tof g i
tof g j
tof h g
tof h b
tof g h
tof g e
tof g d
tof d g
tof c e
X c
X b
tof g c
tof c a
tof a c
tof g b
tof g d
tof f h
tof h f
tof g f
tof j c
tof h j
tof j f
tof i a
tof a b
X f
tof a e
tof a f
tof a d
tof d c
tof d i
H d
Z j c d
H d
tof d b
tof d a
tof d f
tof d h
tof d i
H d
Z j b d
H d
tof d i
tof d b
tof d f
tof d g
tof d h
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d g
tof d f
tof d b
tof d i
H d
Z j b d
H d
tof d i
tof h f
tof d h
tof a b
tof d a
H d
Z j c d
H d
tof i c
tof d i
tof a f
tof a e
tof a d
tof a c
tof i a
tof j f
tof h j
tof j c
tof g f
tof f h
tof g d
tof c b
tof c a
tof g c
tof c j
tof c f
X c
X e
tof a c
tof c a
tof c b
tof c h
tof c i
tof c j
tof f g
tof g b
tof g f
tof g j
tof a h
tof h a
tof h e
tof h c
tof h i
tof a j
tof j a
tof j c
tof j e
tof j f
tof j g
tof j h
tof d f
tof d j
tof i d
tof d i
tof a b
tof d c
tof a d
tof d e
H d
Z j c d
H d
tof a c
tof a f
tof i h
tof a i
H a
Z j b a
H a
tof a c
tof a d
tof e f
tof e i
tof a e
tof e c
tof e g
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof j h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
tof e g
tof a e
tof e f
tof e c
tof e i
tof a d
H a
Z j b a
H a
tof a i
tof a h
tof a f
tof a e
tof a d
tof a c
H d
Z j c d
H d
tof i f
tof d i
tof c e
tof d c
tof i d
tof d j
tof a b
tof h c
tof j h
tof g f
tof j g
tof j a
tof a j
tof h i
X a
tof h a
tof c h
tof g j
tof g b
tof f g
tof c i
tof c b
tof g f
tof g h
tof c g
tof j c
tof c i
tof g c
tof j g
tof g e
tof h a
tof j h
tof h b
tof b d
tof i b
tof i e
tof i j
tof a d
tof a g
tof a h
tof a j
tof b f
H b
Z j c b
H b
tof b d
tof b f
tof d j
tof d b
tof d c
tof d h
H d
Z j b d
H d
tof f j
tof f a
tof f c
tof f g
tof f h
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f g
tof f c
tof f a
tof f j
H d
Z j b d
H d
tof d h
tof d c
tof d b
tof d j
tof b f
tof b d
H b
Z j c b
H b
tof b f
tof b d
tof a j
tof a h
tof a g
tof a d
tof j e
tof i j
tof i d
tof j i
tof i b
tof j h
tof g c
tof j g
tof h b
tof h a
tof g h
tof e g
tof g f
X f
tof g e
tof e g
tof c e
tof c h
tof c f
tof g b
tof g i
tof g j
tof h a
tof f j
X f
tof j f
tof h b
tof j g
tof a i
tof i a
tof i b
tof i c
tof i e
tof i f
tof i g
tof i h
tof d a
tof a c
tof a d
tof e h
tof a e
tof e a
tof e j
tof e c
H e
Z j c e
H e
tof e b
tof e c
tof e f
tof e g
tof e h
tof e i
H e
Z j b e
H e
tof e i
tof e a
tof e b
tof e c
tof e f
tof e h
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
tof e f
tof e c
tof e b
tof e a
tof e i
H e
Z j b e
H e
tof i h
tof g f
tof i g
tof e i
tof e c
tof e b
H e
Z j c e
H e
tof a c
tof e a
tof e j
tof a h
tof a e
tof a d
tof d a
tof i e
tof i c
tof i b
tof i a
tof a i
tof j h
tof j g
tof f j
tof h b
tof h a
tof a h
tof g i
tof g e
tof g b
tof e g
tof c j
tof c i
tof c a
X a
tof a c
tof d c
tof c d
tof c e
tof g h
tof g j
X c
tof c g
tof g a
tof g b
tof d h
tof d j
tof j d
tof j b
tof h j
tof j h
tof c i
tof a c
tof j c
tof c i
tof i a
tof i b
tof d h
tof d j
tof a d
tof j h
tof d b
tof d f
tof d g
tof d i
X d
H d
Z c j d
H d
tof d h
tof e b
tof e f
tof e h
X e
H e
Z b j e
H e
tof e h
tof f g
H f
Z j i f
H f
tof f g
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof j h
tof a j
tof i h
H h
Z b j h
H h
H h
Z c j h
H h
tof f g
H f
Z j i f
H f
tof f g
H e
Z j b e
H e
tof e f
tof e b
H d
Z j c d
H d
tof d i
tof d g
tof d f
tof d b
tof d j
tof j d
tof j c
tof a j
tof i c
tof i b
tof i a
tof a i
tof j i
tof h b
tof j h
tof d j
tof h d
tof d h
tof g j
tof g h
tof g b
tof g a
tof c j
tof c h
tof g e
tof c g
tof c d
tof d c
X a
tof a c
tof c a
tof g b
tof g j
tof c g
tof h i
tof c h
tof g d
tof h b
tof h c
tof h g
tof i g
tof h d
tof i h
tof e j
tof j e
tof j g
tof i b
tof i c
tof i j
H a
Z b g a
H a
tof a b
tof a g
tof a h
tof a i
tof a j
tof e c
tof e b
tof e f
tof e g
H e
Z j c e
H e
tof a c
tof a d
tof a e
H a
Z j b a
H a
tof a c
tof a d
tof a e
tof e i
tof e a
tof e b
tof e f
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e f
tof e b
tof e a
tof e i
tof a e
tof a d
tof a c
H a
Z j b a
H a
tof a e
tof a d
tof a c
H e
Z j c e
H e
tof e g
tof e f
tof e b
tof e c
tof i j
tof i h
tof a i
tof a g
tof a b
H a
Z b g a
H a
tof i g
tof h i
tof c b
tof i c
tof c i
tof j g
tof j e
tof e j
tof g d
X g
tof h g
tof g j
tof g b
tof c g
tof g e
tof c j
tof a h
tof h c
X h
tof c a
tof a c
X f
tof c e
tof c f
tof f g
tof g c
tof g f
tof g j
tof h c
tof h g
tof h e
tof j e
tof j h
tof j a
tof j b
tof j c
tof a c
tof a d
tof i a
tof i g
tof a i
tof i h
tof a b
tof a e
tof a j
H c
Z g j c
H c
tof a g
H a
Z j c a
H a
tof a i
tof a c
tof a d
H a
Z j b a
H a
tof a c
tof a d
tof a g
tof e j
tof e i
tof e b
tof e f
tof e h
H e
Z j i e
H e
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H e
Z j i e
H e
tof e h
tof e f
tof e b
tof e i
tof e j
tof a g
tof a d
tof a c
H a
Z j b a
H a
tof a d
tof a c
tof a i
H a
Z j c a
H a
tof a i
tof a g
H c
Z g j c
H c
tof j h
tof j e
tof a j
tof a d
tof a c
tof a b
tof h g
tof i h
tof i d
tof i c
tof i a
tof j c
tof j a
X j
tof j b
tof h e
tof h c
tof h a
tof a h
tof g j
tof g f
tof g c
tof f g
tof c f
tof c e
X f
X d
tof a c
tof c a
tof c b
tof c f
tof c g
tof c j
tof d g
tof g b
tof g d
tof h f
tof h j
tof g h
tof h g
tof h b
tof d e
tof h d
tof h c
tof j b
tof j e
tof i f
tof j i
tof i j
tof i b
tof i e
tof a j
H a
Z j c a
H a
tof a b
tof f h
tof a f
tof a i
tof d j
tof d c
tof d f
H d
Z j b d
H d
tof f i
tof f b
tof f g
H f
Z j i f
H f
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof i h
tof a i
tof a j
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof f h
tof f g
tof f b
tof f i
tof i f
tof a i
H d
Z j b d
H d
tof h f
tof h e
tof d h
tof d c
tof d j
tof a b
H a
Z j c a
H a
tof a j
tof j e
tof i j
tof j i
tof i b
tof j f
tof g j
tof g d
tof h g
tof c b
tof h c
tof g h
tof g f
tof g b
tof d g
X j
tof c g
X c
X a
tof c f
tof c b
tof c e
tof g c
tof c h
tof g a
tof j g
tof d i
tof i g
tof g d
tof a h
tof h a
tof h b
tof a c
tof j a
tof j e
tof i c
tof i h
tof i j
tof d e
tof a d
tof d a
tof d j
tof a d
tof d f
tof d i
tof d h
X d
H d
Z c j d
H d
tof j h
X h
tof d h
tof a g
H a
Z j b a
H a
tof a d
tof a f
tof a g
tof a i
tof f i
H f
Z j i f
H f
H h
Z b j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X e
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H f
Z j i f
H f
tof a f
tof f i
tof a g
tof a d
H a
Z j b a
H a
tof a i
tof a g
tof a f
tof a d
H d
Z j c d
H d
tof d i
tof d f
tof a e
tof d a
tof d j
tof a d
tof a c
tof i j
tof i h
tof i g
tof i d
tof i c
tof j d
tof d i
tof j g
tof j e
tof j c
tof j a
tof h b
tof h a
tof g a
tof a h
tof g i
tof g d
tof g c
X j
tof c h
X c
X e
X b
X a
tof c f
tof a g
tof a c
tof g a
tof g h
tof h g
tof g f
tof h b
tof h e
tof i e
tof h c
tof i h
tof f j
tof j c
tof j f
tof j h
tof i b
tof i g
tof d e
tof a d
tof a f
tof d a
tof a j
tof d c
tof d b
H d
Z j c d
H d
tof d j
tof d a
tof d e
tof d f
tof d g
tof d i
H d
Z j b d
H d
tof d i
tof d a
tof d f
tof d h
H d
Z j i d
H d
tof c b
H h
Z b j h
H h
tof j h
tof i h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d h
tof d f
tof d a
tof d i
H d
Z j b d
H d
tof i g
tof d i
tof d f
tof d e
tof d a
tof d j
H d
Z j c d
H d
tof d e
tof d b
tof j c
tof a j
tof d a
tof a d
tof a f
tof a e
tof i h
tof i e
tof i b
tof j h
tof j f
tof f j
tof g f
tof h g
tof h e
tof h c
tof h b
tof g h
tof g c
tof g a
tof a g
tof c j
tof c f
tof c e
tof c a
tof a c
tof d c
tof d b
tof c d
tof c j
tof j g
tof g j
tof e h
tof h b
tof h e
tof j i
tof h j
tof i h
tof j a
tof i b
tof i c
tof i d
tof a i
tof i g
tof a h
tof e c
tof e a
tof d e
tof e i
H e
Z j c e
H e
tof f j
tof f g
tof f h
X f
H f
Z b j f
H f
tof j h
X h
tof f h
tof d c
H d
Z j i d
H d
H h
Z c j h
H h
tof i h
tof a j
tof a i
tof h a
tof c b
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X e
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X f
X e
X d
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H d
Z j i d
H d
tof d e
tof d c
tof d i
H f
Z j b f
H f
tof f g
tof f j
H e
Z j c e
H e
tof a i
tof e a
tof e c
tof a h
tof a g
tof a b
tof i h
tof i g
tof c d
X i
tof c b
tof i c
tof j i
tof j b
tof j a
tof h j
tof h i
tof h e
tof h b
tof e h
tof g j
tof j g
tof c j
X g
tof d c
tof c a
tof c b
tof c e
tof c i
tof a g
tof g a
tof g b
tof g i
tof a h
tof h a
tof h c
tof h j
tof e j
tof j h
tof h e
X e
tof h i
H i
Z c g i
H i
tof i c
tof i g
tof i j
H a
Z b g a
H a
tof a b
tof a g
tof a h
H c
Z h j c
H c
tof h i
H h
Z j c h
H h
tof h i
H b
Z c i b
H b
tof a c
tof a i
H a
Z j b a
H a
tof a c
tof a i
H j
Z b h j
H j
tof i h
tof j h
H b
Z i j b
H b
tof c b
H h
Z b j h
H h
tof a j
tof a i
tof h a
tof b h
tof c i
tof g j
tof g i
H c
Z b i c
H c
tof g b
tof b c
H g
Z b h g
H g
tof a b
tof a c
tof a g
X d
X f
H h
Z j i h
H h
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H j
Z 0 h j
H j
H 0
Z a g 0
H 0
H h
Z j i h
H h
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
H 2
Z b c 2
H 2
H 1
Z 2 d 1
H 1
H 0
Z 1 e 0
H 0
H a
Z 0 f a
H a
H 0
Z 1 e 0
H 0
H 1
Z 2 d 1
H 1
H 2
Z b c 2
H 2
H 0
Z a g 0
H 0
H i
Z 0 h i
H i
H 0
Z a g 0
H 0
X e
tof a g
tof b c
tof a b
H g
Z b h g
H g
tof g b
H c
Z b i c
H c
tof g i
tof g j
tof c i
tof b h
tof c b
tof h a
tof a i
tof a j
tof i h
tof j h
H h
Z b j h
H h
H h
Z c j h
H h
H b
Z j i b
H b
H j
Z b h j
H j
tof a i
tof a c
H a
Z j b a
H a
tof a i
tof a c
H b
Z c i b
H b
tof h i
H h
Z j c h
H h
tof h i
H c
Z h j c
H c
tof a h
tof a g
tof a b
H a
Z b g a
H a
tof i j
tof i g
tof i c
H i
Z c g i
H i
tof h i
tof j h
tof j e
tof e j
tof c e
tof h c
tof h a
tof a h
tof g i
tof c g
tof g b
X c
tof g j
tof g a
tof j g
tof j b
X j
tof c i
tof a b
tof a f
tof j h
tof b c
tof c j
H c
Z a b c
H c
X d
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
tof a d
tof a c
X c
X j
tof a j
tof a h
tof a i
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
tof a b
tof a h
tof a g
tof a i
tof a d
tof a e
X d
X e
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X j
tof a c
tof a j
X c
tof a h
tof a d
tof a i
X d
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X g
H c
Z a b c
H c
tof c j
tof b c
tof j h
tof j g
tof j b
tof a g
tof g j
tof a i
tof a f
tof a e
tof a d
tof a b
X c
tof b a
tof a b
tof a g
tof a h
tof d b
tof b d
tof h j
tof j b
tof j h
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X e
X f
X g
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j i
tof j h
tof j b
tof h j
tof b d
tof d b
tof a h
tof a g
tof a b
X b
tof b a
tof d a
tof a d
tof a h
tof b a
tof a i
tof b e
tof j b
tof b h
X h
tof j g
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j i
tof j h
tof j g
tof j b
tof b i
tof b e
tof a h
tof b a
tof a i
tof a d
tof d a
X d
tof e a
tof a e
tof h j
tof j h
tof a h
X h
tof d b
tof b d
tof j b
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X e
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X e
X h
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j i
tof j h
tof j b
tof b d
tof a h
tof h j
tof d e
tof e d
tof a e
X d
tof e a
tof d e
tof a g
tof b a
tof a h
tof j i
tof j c
tof a j
tof b f
tof j d
tof j e
tof j f
tof j g
tof c j
H c
Z a b c
H c
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
H c
Z a b c
H c
tof c j
tof a c
tof j i
tof j g
tof j f
tof j e
tof j d
tof j c
tof b g
tof b f
tof b e
tof b d
tof a d
tof d b
tof a j
tof a i
tof a h
tof a g
tof a e
tof b a
X c
tof a d
tof a f
tof a i
tof g j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
X d
X e
X f
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
tof a b
tof a h
tof a g
tof a i
tof a d
tof a e
X d
X e
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X j
tof a c
tof a j
X c
X b
tof a h
tof a d
tof a i
X d
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X g
H c
Z a b c
H c
tof c j
tof b c
tof j h
tof j g
tof j b
tof a g
tof g j
tof a i
tof a f
tof a e
tof a d
tof a b
X c
tof b a
tof a b
tof a g
tof a h
tof d b
tof b d
tof h j
tof j b
tof j h
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X e
X f
X g
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X e
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j i
tof j h
tof j b
tof h j
tof b d
tof d b
tof a h
tof a g
tof a b
X b
tof b a
tof d a
tof a d
tof a h
tof a i
tof e b
tof a c
tof b a
tof b e
tof b h
tof j b
tof b i
tof b c
tof c j
H c
Z a b c
H c
X e
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X e
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof a c
tof j i
tof b i
tof b h
tof b e
tof b a
tof e b
tof a h
X g
tof a e
tof a j
tof g j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X d
H c
Z a b c
H c
tof c j
tof b c
tof j h
tof j g
tof j b
tof g j
tof a j
tof a i
tof a d
X a
tof d a
tof d e
tof a d
X c
tof a f
tof a h
tof a i
tof a j
tof e b
tof b a
tof b e
tof b g
tof b i
tof b j
tof j a
tof b c
tof j b
tof j d
tof j e
tof a c
tof c j
H c
Z a b c
H c
X d
X e
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X e
H c
Z a b c
H c
tof c j
tof j b
tof b a
tof a c
tof j e
tof j a
tof a j
tof j d
tof b j
tof b i
tof b g
tof b e
tof e b
tof a i
X a
tof a h
X b
tof a j
tof b c
tof b d
tof g j
tof j b
tof j g
tof j i
tof b c
tof c j
H c
Z a b c
H c
X d
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
tof j c
tof j b
tof j i
tof j g
tof g j
tof b d
tof a j
tof a f
tof a e
tof d a
X d
tof d b
tof a d
tof b a
tof a g
tof a i
tof b c
tof b e
tof j b
tof j i
tof b c
tof c j
H c
Z a b c
H c
X e
X f
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
X c
tof j c
tof b i
tof j b
tof a e
tof b a
tof a h
tof a j
tof b g
tof g j
tof j b
tof j g
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X e
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j h
tof b g
tof j b
tof g j
tof b i
tof b h
tof b e
tof a d
tof b a
tof d b
tof a j
tof a i
tof a h
tof a g
tof a e
tof b a
tof a c
tof b d
X a
tof a b
tof a e
tof a f
tof a g
tof b a
tof a i
tof a j
tof d j
tof j a
tof b c
tof j b
tof j d
tof j e
tof j g
tof j i
tof a c
tof c j
H c
Z a b c
H c
X d
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
H c
Z a b c
H c
tof c j
tof j b
tof a i
tof b a
tof j c
tof a g
X j
tof j a
tof j e
tof a j
tof j d
tof h j
tof b d
tof d j
tof d b
tof a b
tof b d
tof j b
tof j h
tof j i
tof b c
tof c j
H c
Z a b c
H c
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X f
X d
H c
Z a b c
H c
tof c j
tof j c
tof j b
tof j i
tof j h
tof h j
tof a d
tof b a
tof a g
tof a i
tof b e
tof f j
tof j b
X f
tof b f
tof j g
tof b c
tof c j
H c
Z a b c
H c
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j g
tof b f
tof j b
tof f j
tof b i
tof b g
tof b e
tof a d
tof b a
X b
tof d b
tof a j
tof a i
tof a g
tof a f
tof a e
tof a c
tof g j
X j
tof j g
X c
tof d a
tof a d
tof a h
tof a i
tof j b
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X e
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X e
X g
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j h
tof j g
tof j b
tof g j
tof a i
tof a h
tof a d
tof d a
tof a d
X c
tof a f
tof a i
tof e b
tof b a
tof b e
tof j b
tof b f
tof b i
tof j h
tof b c
tof c j
H c
Z a b c
H c
X e
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X e
H c
Z a b c
H c
tof c j
tof j c
tof b i
tof j b
tof b c
tof a f
X f
tof b a
tof j h
tof j f
tof b e
tof e b
tof a i
tof b a
X b
tof a b
tof b d
tof a e
tof a g
tof a j
tof b c
tof f j
tof j b
tof j f
tof j g
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X j
tof a c
tof a j
X c
tof a d
tof a h
tof a i
X d
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof a c
tof j g
tof j f
X j
tof a i
tof a j
tof j f
X j
tof a h
tof a d
tof d a
tof d g
tof d e
tof a d
tof a b
X b
tof b c
tof a i
tof a f
tof j b
tof j g
tof b c
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
tof b f
tof a d
H c
Z a b c
H c
tof c j
tof j c
tof j b
X i
tof a i
tof b g
tof j g
X a
tof f j
tof b a
tof b e
tof d b
tof a b
tof a h
tof e b
tof b c
tof b e
tof b f
tof e j
tof j a
tof j b
tof j e
tof j f
tof j g
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X e
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X e
H c
Z a b c
H c
tof c j
tof j c
tof j b
tof a c
tof j h
tof j g
tof j f
tof a e
tof j a
tof e j
tof b f
tof b e
tof e b
tof a h
tof a g
tof a f
tof d b
tof d a
tof a d
tof b a
X d
tof a e
tof a g
tof h j
X h
tof j h
tof a i
tof a h
tof j i
tof j b
tof a c
tof b c
tof c j
H c
Z a b c
H c
X e
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j i
tof j h
tof j b
tof a h
tof h j
tof b d
tof a d
tof d b
tof a i
tof a g
tof e a
tof a e
tof e a
X b
X f
X h
tof a h
tof a j
tof b c
tof f j
tof j b
tof j f
tof j g
tof a c
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X e
H c
Z a b c
H c
tof c j
tof j c
tof j b
tof a c
tof j g
tof j f
tof f j
tof b j
tof b h
tof a e
tof b a
X b
tof a j
tof e h
tof e a
X d
tof a f
tof d b
tof b c
tof b d
tof b e
tof j b
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof a c
tof j i
X j
tof g j
X b
tof b d
tof b e
tof d b
tof a h
tof a e
tof a j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof j h
tof j g
tof g j
tof a j
tof a f
tof a e
tof e a
X e
tof a e
tof a h
tof a j
tof b e
tof b f
tof e j
tof j a
tof j b
tof j e
tof j f
tof j g
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X e
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X e
H c
Z a b c
H c
tof c j
tof j c
tof j b
tof a c
tof j h
tof j g
tof j f
tof a e
tof j a
tof e j
tof b f
tof b e
tof e h
tof e a
X d
tof a f
tof d b
tof b a
tof b d
tof b e
tof j b
tof b f
X f
tof b h
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j i
tof j h
X f
tof b f
tof j b
tof b h
tof b e
tof b d
tof b a
tof d b
tof a h
tof a f
tof b a
X b
tof a b
tof a d
tof a e
tof a g
tof a h
tof a i
tof a j
tof b c
tof f j
tof j b
tof j f
tof j g
tof a c
tof b c
tof c j
H c
Z a b c
H c
X e
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X j
tof a c
tof a j
X c
tof a i
tof a h
tof a d
X d
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof j g
tof j f
tof f j
tof a e
tof e a
tof e j
tof e g
tof a e
tof a b
X b
tof a f
tof a h
tof b c
tof f j
tof j b
tof j f
tof j g
tof a c
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X e
H c
Z a b c
H c
tof c j
tof j c
tof b g
tof b f
tof j b
tof f j
tof a c
tof b h
tof a e
tof b a
tof d b
tof e b
tof a j
X a
tof a h
X f
tof a b
tof b c
tof b d
tof b e
tof j b
tof j i
tof b c
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X d
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof j i
X b
tof b d
tof b e
tof d b
tof a e
tof a h
tof a j
tof g j
tof j b
tof j g
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
X c
tof a b
tof b c
tof j h
tof j g
tof j b
tof a g
tof g j
tof a h
tof a f
tof b e
tof b a
tof e b
X a
tof a b
tof b e
tof a c
tof a g
tof a j
tof b f
tof e j
tof j a
tof j b
tof j e
tof j g
tof a c
tof c j
H c
Z a b c
H c
X e
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X e
H c
Z a b c
H c
tof c j
tof j b
tof j c
tof j a
X c
tof j g
tof j e
X g
tof g j
tof e j
tof b f
tof b e
tof e b
tof a d
tof d b
tof b a
tof b d
X a
tof a h
tof a i
tof b e
tof j b
tof b g
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j h
tof b g
tof j b
tof g j
tof b i
tof b h
tof b e
tof a d
tof b a
tof d b
tof a j
tof a i
tof a h
tof a g
tof b e
tof b a
tof e b
X a
tof b c
tof a b
X c
tof b e
X e
X f
tof a d
tof b a
tof a f
tof a g
tof a i
tof a j
tof f j
tof j b
tof j f
tof j g
tof j h
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X f
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X f
X e
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof a c
tof j i
tof j h
tof j g
tof j f
tof b f
tof f j
tof b i
tof b g
tof b e
tof b a
tof e b
tof a i
tof a d
tof a h
tof g j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
X d
X e
X f
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
X c
tof a b
tof b c
tof j h
tof j g
tof j b
tof a g
tof g j
tof a h
tof a f
tof a e
X a
X d
tof b a
tof a b
tof a e
tof a g
tof a j
tof d b
tof b d
tof b f
tof b g
tof d j
tof j d
tof j f
tof j g
tof j h
tof j i
tof b c
tof c j
H c
Z a b c
H c
X d
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
H c
Z a b c
H c
tof c j
tof b c
tof j i
tof j h
tof j g
tof j f
tof j d
tof d j
tof b g
tof b f
tof b d
tof d b
tof a j
tof a g
tof b a
tof a e
tof b d
tof d b
tof a b
tof b d
tof d a
tof a c
tof a f
X g
tof b a
tof a g
tof a i
tof a j
tof b e
tof b f
tof f j
tof j b
tof j f
tof j g
tof a c
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof f g
tof b f
tof j f
tof f g
X f
tof j b
tof b i
tof b e
tof b d
tof b a
tof d b
tof a i
tof a d
tof a c
tof e b
tof b c
X b
tof b e
tof b a
tof a h
tof b g
tof b f
tof j b
tof a c
tof b c
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X e
H c
Z a b c
H c
tof c j
tof j c
tof b g
tof b f
tof j b
tof f j
tof a c
tof b h
tof a e
tof b a
tof e b
tof a j
tof a h
tof a g
tof a f
tof a c
tof b a
tof a e
X a
tof a b
tof a g
tof a j
tof f j
tof j b
tof j f
tof j g
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
H c
Z a b c
H c
tof c j
tof j g
X j
tof j b
tof j c
tof j f
tof a j
X e
tof a d
X a
X g
tof a h
tof a i
tof j c
tof a j
tof j b
tof j f
tof j g
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X d
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof a c
tof j g
tof j f
tof f j
tof a j
tof a i
tof a h
tof a g
tof a e
tof d b
tof a d
X d
tof b d
tof d a
tof a d
X h
tof a e
tof a f
tof a g
tof a i
tof a j
tof h j
tof j b
tof j h
tof j i
tof b c
tof c j
H c
Z a b c
H c
X f
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
tof a d
H c
Z a b c
H c
tof c j
tof b c
tof j i
tof j h
tof j b
tof h j
tof b f
tof a j
tof a e
tof d j
tof j d
tof a j
X a
tof j a
tof a h
tof j c
tof j b
tof j f
tof j g
tof a c
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X d
H c
Z a b c
H c
tof c j
tof j c
tof j b
tof a c
tof j h
tof j g
tof j f
tof j d
tof j a
tof d j
tof b f
tof b d
tof a d
tof a i
tof a h
tof a g
tof a f
X c
tof d a
tof a d
X d
tof a g
tof a i
tof g j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
X f
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X d
H c
Z a b c
H c
tof c j
X c
tof b c
tof j b
tof a i
tof a d
tof b a
tof j h
tof j g
tof g j
tof b g
tof d b
tof a g
tof b a
X a
tof a b
tof a d
tof a f
tof a g
tof b a
tof a h
tof a i
tof b c
tof d j
tof j a
tof j b
tof j d
tof j g
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
H c
Z a b c
H c
tof c j
tof j a
X c
tof a c
tof b h
tof j b
tof j g
tof j d
tof d j
tof a i
tof b a
tof a b
tof a h
tof a g
X a
tof a i
tof g j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof j h
tof j g
tof g j
tof a i
tof a f
tof a d
tof d a
X d
tof a d
tof a h
tof a i
tof b d
tof b f
tof d j
tof j a
tof j b
tof j d
tof j f
tof j g
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X d
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
H c
Z a b c
H c
tof c j
tof j a
tof a c
tof b h
tof j b
tof j g
tof j f
tof j d
tof d j
tof b d
tof a i
tof a d
tof d a
tof d h
tof a f
tof b a
tof b d
tof f j
tof j b
tof j f
tof j g
tof j h
tof j i
tof a c
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X d
tof a d
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j i
tof j h
tof j g
tof j b
tof b j
tof j f
tof f j
tof a h
tof b a
tof g j
tof j g
X c
tof a i
tof j b
tof j h
tof b c
tof c j
H c
Z a b c
H c
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
tof b c
tof j h
tof j g
tof j b
tof g j
tof a i
X c
X a
X b
tof d b
tof b d
tof a d
tof a g
tof h j
tof j b
tof j h
tof j i
tof b c
tof c j
H c
Z a b c
H c
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X f
X d
H c
Z a b c
H c
tof c j
tof b c
tof j i
tof j h
tof j b
tof h j
tof b d
tof a d
tof d b
X b
tof b d
tof a g
tof b c
tof b a
tof a i
tof b f
tof f j
tof j b
tof j f
tof j g
tof b c
tof c j
H c
Z a b c
H c
X f
X h
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j g
tof j f
tof j b
tof f j
tof b i
tof b f
tof a d
tof b a
X d
tof d b
tof b g
tof a i
tof a c
X a
tof a b
tof b a
tof b d
tof b f
tof f j
tof j b
tof j f
tof j g
tof j h
tof j i
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X f
X d
H c
Z a b c
H c
tof c j
tof j b
X c
tof j c
tof a c
tof j i
tof j h
tof j g
tof j f
tof f j
tof b g
tof b f
tof b d
tof b a
tof d b
tof a d
tof a h
tof a i
tof g j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
X f
X g
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
H c
Z a b c
H c
tof c j
tof b c
X a
X c
tof j h
tof j g
tof j b
tof g j
X g
X i
X h
X f
tof d b
tof b a
tof b d
tof b f
tof b g
tof b h
tof b i
tof f j
tof j b
tof j f
tof j g
tof b c
tof c j
H c
Z a b c
H c
X d
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X d
H c
Z a b c
H c
tof c j
tof j c
tof b g
tof j b
tof a c
tof j f
tof f j
tof b i
tof b h
tof b f
tof a d
tof b a
tof d b
tof a i
tof a h
tof a g
tof a f
X a
X c
tof b a
tof a b
tof a d
tof a g
tof a i
tof f b
tof b f
tof d j
tof j a
tof j d
tof j f
tof j g
tof j h
tof j i
tof b c
tof c j
H c
Z a b c
H c
X d
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
X d
H c
Z a b c
H c
tof c j
tof b c
X c
tof a i
X h
tof j h
tof a g
tof j a
tof j f
tof j d
tof d j
tof b f
tof f b
tof a d
X d
tof b f
tof b a
tof a b
X a
tof b a
tof a g
tof g j
tof j b
tof j g
tof j h
tof b c
tof c j
H c
Z a b c
H c
X g
X i
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X g
X f
H c
Z a b c
H c
tof c j
tof b c
tof j h
tof j g
tof j b
tof g j
tof a g
tof a f
tof a b
X c
tof b a
tof a g
X a
tof a b
tof a h
tof f b
tof b f
tof f j
tof j a
tof j f
tof j g
tof a c
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X f
H c
Z a b c
H c
tof c j
tof b c
tof a c
tof j g
tof j f
tof j a
tof f j
tof a f
tof f b
tof a h
tof a g
tof f a
X f
tof a h
tof b c
tof b g
tof f j
tof j a
tof j b
tof j f
tof j h
tof a c
tof b c
tof c j
H c
Z a b c
H c
X f
H 5
Z c d 5
H 5
H 4
Z 5 e 4
H 4
H 3
Z 4 f 3
H 3
H 2
Z 3 g 2
H 2
H 1
Z 2 h 1
H 1
H 0
Z 1 i 0
H 0
H a
Z 0 j a
H a
H 0
Z 1 i 0
H 0
H 1
Z 2 h 1
H 1
H 2
Z 3 g 2
H 2
H 3
Z 4 f 3
H 3
H 4
Z 5 e 4
H 4
H 5
Z c d 5
H 5
X h
X g
X f
H c
Z a b c
H c
tof c j
tof j c
tof j b
tof a c
tof j h
tof j f
tof j a
tof f j
tof b g
tof b f
tof f b
tof a h
tof a f
X j
X f
tof j a
tof j b
tof j c
tof j d
tof j e
tof j f
tof j g
tof j h
tof j i
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
