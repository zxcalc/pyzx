# Synthesized by applying the method "Reversible Circuit Synthesis Using a Cycle-Based Approach" (http://arxiv.org/abs/1004.4320)
# (c) Copyright 2007-2010 Mehdi Saeedi  Morteza Saheb Zamani  Mehdi Sedighi  and Zahra Sasanian (http://ceit.aut.ac.ir/QDA/)
# Distributing this file without an express written permission or erasing this note is prohibited.
.v a b c d e f g h 0 1 2 3
.i a b c d e f g h
.o a b c d e f g h
BEGIN
X a
tof a c
tof c a
tof d e
tof e c
tof c d
tof e f
tof a f
tof f a
tof f c
tof f d
tof a h
tof h a
tof h c
tof h d
tof h e
tof d g
tof g d
tof b g
tof g e
tof d a
tof a d
tof a e
tof a f
tof a g
tof a h
H h
Z b c h
H h
tof h f
H b
Z c h b
H b
tof e g
tof b e
H b
Z e h b
H b
H e
Z b h e
H e
tof e g
H e
Z g h e
H e
H f
Z b h f
H f
tof g f
tof a h
tof a g
tof f a
tof c b
tof b f
tof c g
tof e h
tof e g
H c
Z b g c
H c
tof e b
tof b c
H e
Z b f e
H e
tof a b
tof a c
tof a e
X d
H f
Z g h f
H f
H h
Z a f h
H h
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H h
Z a f h
H h
H f
Z g h f
H f
H g
Z a f g
H g
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H g
Z a f g
H g
X d
tof a e
tof b c
tof a b
H e
Z b f e
H e
tof e b
H c
Z b g c
H c
tof e g
tof e h
tof c g
tof b f
tof c b
tof f a
tof a g
tof g f
tof h f
tof a h
H f
Z b h f
H f
H f
Z c h f
H f
H e
Z g h e
H e
tof e g
tof b e
H b
Z e h b
H b
H e
Z b h e
H e
tof e g
tof b f
H b
Z c h b
H b
tof b g
tof b f
tof b e
H h
Z b c h
H h
tof g e
tof a g
tof a h
tof a d
tof d a
tof g d
tof d g
tof e d
tof e c
tof h e
tof h a
tof a h
tof f d
tof f c
tof e f
tof e a
tof d e
tof e d
tof c e
X d
X b
tof c b
tof e c
tof f c
tof c g
tof e h
tof a f
tof f b
tof h d
tof h g
tof g b
tof g e
tof d g
tof g f
tof g h
tof a c
tof a e
tof d c
H d
Z c h d
H d
tof d b
tof d a
tof d e
tof d g
H d
Z b h d
H d
H h
Z b e h
H h
tof a b
tof a e
H a
Z g h a
H a
tof a b
tof a e
tof c b
H f
Z b h f
H f
tof h f
tof g f
tof a h
tof a g
tof f a
tof b f
tof c g
tof e h
tof e g
H c
Z b g c
H c
tof e b
tof b c
H e
Z b f e
H e
tof a b
tof a c
tof a e
X d
H f
Z g h f
H f
H h
Z a f h
H h
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H h
Z a f h
H h
H f
Z g h f
H f
H g
Z a f g
H g
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H g
Z a f g
H g
X d
tof a e
tof b c
tof a b
H e
Z b f e
H e
tof e b
H c
Z b g c
H c
tof e g
tof e h
tof c g
tof b f
tof c b
tof f a
tof a g
tof a h
tof g f
tof h f
H f
Z b h f
H f
H f
Z c h f
H f
tof a e
tof a b
H a
Z g h a
H a
tof a e
tof a b
H h
Z b e h
H h
H d
Z b h d
H d
tof d g
tof a e
tof a b
tof d a
H d
Z c h d
H d
tof g f
tof d g
tof d c
tof d h
tof a f
tof f a
tof a c
tof g h
tof g e
tof h g
tof h b
tof h d
tof e h
X e
tof f g
tof a f
tof e c
tof c e
X a
tof c f
tof e a
tof e b
tof e c
tof g e
tof f g
tof h f
tof f d
tof h d
tof h b
tof h c
tof h e
tof g a
tof a c
tof a e
tof a f
tof a g
tof a h
tof b e
tof b g
H b
Z c h b
H b
tof d b
tof b e
tof b g
tof d h
tof d a
tof d c
H d
Z b h d
H d
tof d h
tof d a
H d
Z g h d
H d
tof c b
H f
Z b h f
H f
tof h f
tof g f
tof a h
tof a g
tof f a
tof b f
tof c g
tof e h
tof e g
H c
Z b g c
H c
tof e b
tof b c
H e
Z b f e
H e
tof a b
tof a c
tof a e
X d
H f
Z g h f
H f
H h
Z a f h
H h
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H h
Z a f h
H h
H f
Z g h f
H f
H g
Z a f g
H g
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H g
Z a f g
H g
X d
tof a e
tof b c
tof a b
H e
Z b f e
H e
tof e b
H c
Z b g c
H c
tof e g
tof e h
tof c g
tof b f
tof c b
tof f a
tof a g
tof a h
tof g f
tof h f
H f
Z b h f
H f
H f
Z c h f
H f
H d
Z g h d
H d
tof d a
tof d h
H d
Z b h d
H d
tof d g
tof d e
tof d c
tof d a
tof d b
tof d h
tof b g
tof b e
H b
Z c h b
H b
tof b g
tof b e
tof a h
tof a g
tof f e
tof a f
tof a c
tof e b
tof g e
X b
tof g a
tof f g
tof h f
tof c b
tof h c
tof f d
tof f b
tof e g
X d
tof c d
tof c a
tof a c
tof c a
tof c f
tof e d
tof e f
tof f e
tof e h
tof f a
tof f c
tof f b
tof g f
tof h a
tof h b
tof h c
tof a e
tof a h
tof g a
tof a c
tof a d
H a
Z c h a
H a
tof a g
tof d b
tof d c
tof d e
tof g f
tof d g
H d
Z b h d
H d
tof a b
tof a d
tof a e
H a
Z g h a
H a
tof a b
tof a d
tof a e
tof a f
tof c b
H f
Z b h f
H f
tof h f
tof a h
tof a g
tof f a
tof b f
tof c g
tof e h
tof e g
H c
Z b g c
H c
tof e b
tof b c
H e
Z b f e
H e
tof a b
tof a c
tof a e
X d
H f
Z g h f
H f
H h
Z a f h
H h
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H h
Z a f h
H h
H f
Z g h f
H f
H g
Z a f g
H g
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H g
Z a f g
H g
X d
tof a e
tof b c
tof a b
H e
Z b f e
H e
tof e b
H c
Z b g c
H c
tof e g
tof e h
tof c g
tof b f
tof c b
tof f a
tof g f
tof a g
tof a h
tof h f
H f
Z b h f
H f
H f
Z c h f
H f
tof a e
tof a d
tof a b
H a
Z g h a
H a
tof a e
tof a d
tof a b
H d
Z b h d
H d
tof d g
tof f e
tof d f
tof d c
tof d b
tof a g
H a
Z c h a
H a
tof a h
tof e d
tof a e
tof e a
tof a c
tof g h
tof f a
tof g f
tof f g
tof h g
tof c b
tof h c
X c
tof h a
tof f c
tof a f
tof a h
tof e h
tof e g
tof e b
tof a e
tof c e
tof e a
X e
tof c d
tof f c
tof c g
tof e b
tof e d
tof e h
tof h f
tof f e
tof h b
tof h c
tof d g
tof g c
tof g d
tof g f
H a
Z b e a
H a
tof a b
tof a e
tof a h
H c
Z e h c
H c
tof a e
tof a g
H a
Z c h a
H a
tof a e
tof a g
H h
Z b c h
H h
tof c e
tof c f
H c
Z b h c
H c
tof c e
tof c f
tof d h
tof d c
H d
Z g h d
H d
tof c b
H f
Z b h f
H f
tof h f
tof g f
tof a h
tof a g
tof f a
tof b f
tof c g
tof e h
tof e g
H c
Z b g c
H c
tof e b
tof b c
H e
Z b f e
H e
tof a b
tof a c
tof a e
X d
H f
Z g h f
H f
H h
Z a f h
H h
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H h
Z a f h
H h
H f
Z g h f
H f
H g
Z a f g
H g
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H g
Z a f g
H g
X d
tof a e
tof b c
tof a b
H e
Z b f e
H e
tof e b
H c
Z b g c
H c
tof e g
tof e h
tof c g
tof b f
tof c b
tof f a
tof a g
tof a h
tof g f
tof h f
H f
Z b h f
H f
H f
Z c h f
H f
H d
Z g h d
H d
tof d c
tof d h
tof c f
tof c e
H c
Z b h c
H c
tof c f
tof c e
H h
Z b c h
H h
tof a g
tof a e
H a
Z c h a
H a
tof a g
tof a e
H c
Z e h c
H c
tof a h
tof a e
tof a b
H a
Z b e a
H a
tof g f
tof g d
tof g c
tof d g
tof f e
tof f c
tof h f
tof h b
tof f h
tof c f
tof f g
tof e h
tof e d
X c
tof c b
X a
tof e b
tof c g
tof e c
tof d f
tof f d
tof e d
tof h a
tof h b
tof g f
tof h g
tof g h
tof g a
tof d b
tof g d
H a
Z e f a
H a
tof a e
tof g f
tof a g
tof d a
tof h f
H f
Z d h f
H f
tof d c
H d
Z b h d
H d
H d
Z g h d
H d
tof d f
tof a h
tof a g
tof f a
tof c b
tof b f
tof c g
tof e h
tof e g
H c
Z b g c
H c
tof e b
tof b c
H e
Z b f e
H e
tof a b
tof a c
tof a e
X d
H f
Z g h f
H f
H h
Z a f h
H h
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H h
Z a f h
H h
H f
Z g h f
H f
H g
Z a f g
H g
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H g
Z a f g
H g
X d
tof a e
tof b c
tof a b
H e
Z b f e
H e
tof e b
H c
Z b g c
H c
tof e g
tof e h
tof c g
tof b f
tof c b
tof f a
tof a g
tof a h
tof g f
tof h f
H f
Z b h f
H f
H f
Z c h f
H f
tof d f
H d
Z g h d
H d
tof d f
H d
Z b h d
H d
tof d f
tof d c
tof d a
tof d b
H f
Z c h f
H f
tof a g
tof a f
tof a e
H a
Z e f a
H a
tof h f
tof h a
tof g h
X g
tof g d
tof h g
tof g b
tof f d
tof e d
tof d f
tof c a
tof e c
tof c e
tof c g
tof c d
tof e c
tof c b
tof c e
tof g f
tof c g
tof c h
tof d e
tof e d
tof f h
tof e f
tof f c
tof f g
tof h g
tof g b
tof g c
tof g e
tof g h
tof a b
tof a e
tof d h
tof d c
tof d b
tof d e
H d
Z c h d
H d
tof d b
tof c f
tof d c
H d
Z b h d
H d
H h
Z c e h
H h
tof c e
H c
Z g h c
H c
tof e g
tof c e
tof c f
tof h f
tof c b
H f
Z b h f
H f
tof a h
tof a g
tof f a
tof b f
tof e h
H c
Z b g c
H c
tof e b
tof b c
H e
Z b f e
H e
tof a b
tof a c
tof a e
X d
H f
Z g h f
H f
H h
Z a f h
H h
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H h
Z a f h
H h
H f
Z g h f
H f
H g
Z a f g
H g
H 1
Z b c 1
H 1
H 0
Z 1 d 0
H 0
H a
Z 0 e a
H a
H 0
Z 1 d 0
H 0
H 1
Z b c 1
H 1
H g
Z a f g
H g
X d
tof a e
tof b c
tof a b
H e
Z b f e
H e
tof e b
H c
Z b g c
H c
tof e g
tof e h
tof c g
tof b f
tof c b
tof f a
tof a g
tof a h
tof h f
H f
Z b h f
H f
H f
Z c h f
H f
tof c f
tof c e
H c
Z g h c
H c
tof c f
tof c e
H h
Z c e h
H h
H d
Z b h d
H d
tof d f
tof d c
tof d b
H d
Z c h d
H d
tof d e
tof d b
tof d c
tof d h
tof a e
tof a b
tof g h
tof g e
tof g c
tof g b
tof f h
tof h g
tof f c
tof c g
tof g f
X g
tof e h
tof e f
tof e d
tof d e
tof c h
tof c e
X c
tof c b
tof e c
tof b a
tof b d
tof b g
tof b h
tof a c
tof g b
tof a g
tof c a
tof a h
tof h g
tof g f
tof h b
tof h c
H f
Z b d f
H f
tof f b
tof f d
tof f h
H d
Z c g d
H d
tof b g
tof b h
H b
Z c d b
H b
tof b g
tof b h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
tof b h
tof b g
H b
Z c d b
H b
tof b h
tof b g
H d
Z c g d
H d
tof f h
tof f d
tof f b
H f
Z b d f
H f
tof g f
tof h g
tof c b
tof h c
tof a g
tof g b
tof a h
tof g a
tof c g
X c
tof c h
tof c e
tof c f
tof b c
tof c b
tof c a
tof a c
tof a d
tof a g
tof a h
tof f g
tof g a
tof g d
tof g f
tof f h
tof h a
tof h f
tof e h
tof h g
H f
Z c d f
H f
tof f c
tof f d
tof f h
tof e c
tof e a
tof e b
tof e f
H e
Z c d e
H e
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
H e
Z c d e
H e
tof e h
tof e g
tof e f
tof e b
tof e a
tof e c
tof f h
tof f d
tof f c
H f
Z c d f
H f
tof h g
tof h f
tof h a
tof f h
tof g f
tof g a
tof a g
tof g d
X d
tof f g
tof c h
tof a c
tof c a
tof g a
tof c f
tof c e
tof c b
X c
tof c g
tof b c
tof b d
tof b h
tof a h
tof c a
tof a b
tof a d
tof g a
tof a e
tof a f
tof g c
tof h d
tof g h
tof e g
tof h e
tof h a
tof h b
tof h c
tof f b
tof f h
tof e c
tof e b
H e
Z c d e
H e
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
H e
Z c d e
H e
tof e g
tof e b
tof g e
tof e c
tof h b
tof f h
tof g d
tof h g
tof h a
tof a h
tof a f
tof g a
tof a e
tof a d
tof a b
tof c h
tof c g
tof c a
tof a c
tof c a
tof b c
X c
tof b e
tof b g
tof c h
tof a d
tof h g
tof g a
tof g h
tof h g
tof g d
tof h b
tof h c
tof h e
H f
Z b d f
H f
tof f a
tof f b
tof f d
H d
Z c g d
H d
tof b g
tof b h
H b
Z c d b
H b
tof b g
tof b h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
tof b h
tof b g
H b
Z c d b
H b
tof b h
tof b g
H d
Z c g d
H d
tof f d
tof f b
tof f a
H f
Z b d f
H f
tof h g
tof h e
tof c d
tof h c
tof h b
tof g h
X a
tof a d
tof g a
tof h g
tof c h
tof c a
tof a c
tof b h
tof b g
tof b f
tof a e
tof a b
X b
tof b a
tof c b
tof b g
tof a c
tof c h
H g
Z b d g
H g
tof g b
tof g d
tof f h
tof f d
tof h f
tof f b
tof f a
H f
Z c d f
H f
tof f a
tof f h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g d
tof b d
tof c d
tof f h
tof f a
H f
Z c d f
H f
tof f a
tof f d
tof f b
tof h f
tof h d
tof f h
tof g d
H g
Z b d g
H g
tof a h
tof a e
tof a c
tof c d
tof c h
tof b g
tof c b
X c
tof b c
tof b e
tof b a
tof a b
X e
tof c b
tof b c
tof b d
tof b g
tof e c
tof c d
tof c e
tof c g
tof a b
tof a c
tof a e
tof e g
tof g a
tof g c
tof g e
tof e h
tof h a
tof h b
tof h d
tof e f
tof h e
tof f h
tof h g
tof f b
H f
Z c d f
H f
tof f a
tof f b
tof f e
tof f h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
tof f h
tof f e
tof f b
tof f a
H f
Z c d f
H f
tof h b
tof f h
tof h f
tof f g
tof e f
tof h e
tof h d
tof h a
tof e h
tof g e
tof a c
tof g a
tof c e
tof e g
tof a e
tof b d
tof a b
tof c d
tof e c
X g
tof b c
X b
tof b a
tof c b
tof c d
tof e f
tof c e
tof c h
tof e a
tof a b
tof a c
tof a d
tof f e
tof a e
tof a h
tof h g
tof g a
tof g c
tof g h
H h
Z c d h
H h
tof h c
tof h d
tof h g
tof f a
tof f c
tof f d
tof f g
H c
Z b h c
H c
H d
Z b h d
H d
tof f h
H f
Z c d f
H f
tof f h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
tof f h
H f
Z c d f
H f
tof h g
tof f h
tof c d
tof h c
H c
Z b h c
H c
tof c d
tof f e
tof f d
tof f c
tof f a
tof e f
H h
Z c d h
H h
tof g h
tof a c
tof g a
tof c h
tof h g
tof a h
tof a f
tof a e
tof a b
tof c d
tof c e
tof e d
tof e a
X a
tof c f
tof b g
X c
tof b e
tof b f
tof b h
tof c e
tof c h
tof e g
tof g b
tof g c
tof g d
tof g e
tof g f
tof g h
tof e h
tof h a
tof h b
tof h c
tof h e
tof f c
tof f d
tof f h
H d
Z c g d
H d
tof f g
H f
Z c d f
H f
tof f b
tof f g
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof g b
tof h g
tof g c
tof f d
tof b d
tof c d
H f
Z c d f
H f
tof f g
tof g c
H d
Z c g d
H d
tof f h
tof f d
tof f c
tof h e
tof h c
tof h b
tof h a
tof g e
tof e h
tof b f
tof g b
tof e g
tof a d
X e
X h
X c
tof b h
tof b e
tof b a
tof a b
X a
tof b a
tof b f
tof b g
tof g b
tof c g
tof c a
tof h a
tof a c
tof a h
tof g a
tof g c
tof g d
tof e f
tof f g
tof g e
H h
Z c d h
H h
tof h c
tof h d
tof h g
tof f b
tof f d
tof f h
H f
Z c d f
H f
tof f g
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof g b
tof h c
tof g c
tof f b
tof c d
tof b d
H f
Z c d f
H f
tof f h
tof f e
tof f d
tof f b
tof g e
tof e f
tof h d
tof h c
H h
Z c d h
H h
tof g d
tof g c
tof g b
tof g a
tof c h
tof a c
tof h a
tof c e
tof b g
tof c b
X e
X f
tof a b
tof b a
tof b f
tof a b
X d
tof b c
tof b d
tof b e
tof b g
tof c f
tof c g
tof e a
tof a b
tof a c
tof a e
tof g c
tof g e
tof g h
tof f h
tof h a
tof h c
tof h f
tof e f
tof f e
tof f g
tof e c
tof e b
H e
Z c d e
H e
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof g b
tof h g
tof g c
tof f b
tof c d
tof b d
H e
Z c d e
H e
tof e b
tof e c
tof f e
tof e f
tof h f
tof a c
tof h a
tof f h
tof g h
tof g e
tof g c
tof b e
tof a b
tof e a
tof b c
tof c g
tof c f
tof b d
X b
tof b a
tof b e
tof a b
tof b f
tof b h
tof e c
tof c b
tof c d
tof c e
tof c f
tof c g
tof a e
tof g c
H h
Z b d h
H h
tof h a
tof h b
tof h d
tof f b
tof f c
tof f h
tof e d
tof e a
tof e b
tof e f
H e
Z c d e
H e
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
H e
Z c d e
H e
tof f b
tof e f
tof e a
tof e d
tof f h
tof f c
tof h d
tof h b
tof h a
H h
Z b d h
H h
tof g c
tof a h
tof a f
tof a e
tof a b
tof c g
tof c e
tof b f
tof c b
X c
tof c d
tof e c
tof b h
tof b e
tof b a
X a
tof h b
tof b h
tof f c
tof c b
tof c d
tof c f
tof e g
tof g a
tof a d
tof e f
tof g e
tof g h
tof h b
tof f c
tof h f
tof e d
tof e g
tof f e
tof e f
tof e c
tof e h
H e
Z c d e
H e
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof g b
tof h g
tof g c
tof f b
tof c d
tof b d
H e
Z c d e
H e
tof e h
tof f d
tof e f
tof f e
tof c f
tof e c
tof c b
tof h c
tof b h
X b
tof g h
tof g f
tof g e
tof a d
X a
tof g a
tof e g
tof c d
tof f c
tof h b
X c
tof a b
tof b a
tof b e
tof b h
tof h c
tof c h
tof a b
tof a h
tof e g
tof g d
tof g e
tof g f
tof g h
tof e h
tof h b
tof h d
tof h e
tof h f
H f
Z a g f
H f
tof f a
tof f g
H f
Z c d f
H f
tof f h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h b
tof g c
tof f g
tof g b
tof c d
tof b d
tof f h
H f
Z c d f
H f
tof f g
tof f a
H f
Z a g f
H f
tof h f
tof h e
tof h d
tof a h
tof h b
tof g e
tof e h
tof g f
tof g d
tof b e
tof e g
X e
tof c h
tof h c
X d
tof b d
tof b f
tof a c
tof c a
tof c d
tof c e
tof c h
tof e a
tof a b
tof a c
tof a e
tof f g
tof g a
tof a f
tof g b
tof g d
tof g h
tof h b
tof h c
tof f e
tof f g
tof f b
H f
Z c d f
H f
tof f a
tof f b
tof f h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof h g
tof h d
tof b d
tof g c
tof f g
tof g d
tof c d
tof f h
tof f a
H f
Z c d f
H f
tof f g
tof f e
tof h c
tof g h
tof g f
tof g d
tof g a
tof a f
X d
X f
tof f g
tof c e
tof a c
tof a b
tof e a
tof c h
tof a d
tof a c
tof b h
tof b g
tof b f
tof b d
tof b a
tof a b
X b
tof h b
tof b h
tof c a
tof c b
tof c f
tof e a
tof a d
tof a e
tof a f
tof e g
tof e a
tof g e
tof f h
tof h f
tof h b
tof g h
tof h g
tof h c
tof h d
H f
Z c d f
H f
tof f c
tof f d
tof f g
tof e c
tof e d
H e
Z c d e
H e
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
X e
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
X e
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof a h
tof g b
tof h c
tof g c
tof f b
tof c d
tof b d
H e
Z c d e
H e
tof e a
tof e d
tof e c
tof f d
tof f c
H f
Z c d f
H f
tof h f
tof c d
tof c b
tof h c
tof f h
tof g f
tof g e
tof g b
tof g a
tof e g
tof a f
tof a e
tof a d
tof e a
tof c f
X c
tof c a
tof b h
tof h b
X g
tof a d
tof a b
X b
tof d a
tof a c
tof b a
tof c e
tof c f
tof d c
tof d g
tof b e
tof b g
tof b h
tof c a
tof c h
tof a e
tof f g
tof g a
tof a f
tof g h
tof h d
H f
Z b d f
H f
tof f a
tof f b
tof f d
tof f g
tof f h
H d
Z b c d
H d
tof a h
H a
Z c d a
H a
tof a h
tof b d
tof c d
tof g b
tof f g
tof g c
tof h b
tof h g
tof a h
tof a f
tof g a
H g
Z f h g
H g
H f
Z b g f
H f
H h
Z c g h
H h
tof d h
tof d g
tof d f
tof a d
H c
Z a d c
H c
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H c
Z a d c
H c
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
H 1
Z e f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z e f 1
H 1
H 0
Z a c 0
H 0
H b
Z 0 d b
H b
H 0
Z a c 0
H 0
tof a d
tof d f
tof d g
tof d h
H h
Z c g h
H h
H f
Z b g f
H f
H g
Z f h g
H g
tof g a
tof a f
tof g b
tof a g
tof h g
tof g c
tof f b
tof c d
tof b d
H a
Z c d a
H a
tof f a
tof a h
H d
Z b c d
H d
tof f d
tof f b
H f
Z b d f
H f
tof h d
tof g h
tof a f
tof g a
tof f g
tof c a
tof b a
tof a e
tof c h
tof c f
tof d a
tof a c
tof b g
X b
tof b h
tof a b
tof d g
tof e f
tof d e
X f
tof a d
X a
tof g a
tof a g
tof g b
tof b c
tof b g
tof e g
tof g b
tof g e
tof f e
tof f c
tof e h
tof h e
tof h f
tof h g
tof a c
tof b c
tof c h
H c
Z a b c
H c
tof f a
tof g f
tof f b
tof f c
H g
Z a f g
H g
tof h g
tof h f
X e
H b
Z a c b
H b
H 2
Z d e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z d e 2
H 2
H b
Z a c b
H b
H h
Z b c h
H h
H 2
Z d e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z d e 2
H 2
H h
Z b c h
H h
X e
tof h f
tof h g
H g
Z a f g
H g
tof f c
tof f b
tof g f
tof f a
H c
Z a b c
H c
tof c h
tof b c
tof a c
tof h g
tof h f
tof h e
tof e h
tof f e
tof f c
tof g e
tof e f
tof g b
tof e g
tof a g
tof g a
tof a b
X g
tof b a
X h
tof a d
tof a f
tof a h
tof e b
tof b e
tof b f
tof e h
tof h c
tof h e
tof h f
tof c h
H c
Z a b c
H c
X e
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X g
X e
H c
Z a b c
H c
tof c h
tof a c
tof h f
tof h e
tof h c
tof e h
tof b f
tof b e
tof e b
tof a h
tof a g
tof a f
tof d b
tof a d
tof b d
tof d a
X d
tof g a
tof a g
tof h a
tof h b
tof a c
tof b c
tof c h
H c
Z a b c
H c
X e
X f
X g
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X g
X d
H c
Z a b c
H c
tof c h
tof b c
tof a c
tof h b
tof h a
tof b d
tof d b
tof a g
tof b g
tof g a
tof a b
tof b g
X a
X e
tof a d
tof a f
tof a h
tof b c
tof e h
tof h b
tof h e
tof h f
tof a c
tof b c
tof c h
H c
Z a b c
H c
X e
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X e
H c
Z a b c
H c
tof c h
tof h c
tof h b
tof a c
tof h f
tof h e
tof e h
tof g h
X g
tof a g
tof a f
X d
tof a b
tof b a
X b
tof a b
tof a d
tof a e
tof a f
tof a h
tof b e
tof h g
tof c h
H c
Z a b c
H c
X f
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X g
H c
Z a b c
H c
tof c h
tof h g
tof g h
X e
tof a b
tof b e
tof b d
tof a h
tof b f
tof b a
tof a b
tof d b
tof b d
tof h b
tof h g
tof b c
tof c h
H c
Z a b c
H c
X d
X g
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X d
H c
Z a b c
H c
tof c h
tof b c
tof h g
tof h b
tof b d
tof d b
tof a f
tof d a
tof a d
tof d b
X b
X h
tof b c
tof e h
tof a h
tof h b
tof h e
tof h f
tof b c
tof c h
H c
Z a b c
H c
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X e
X d
H c
Z a b c
H c
tof c h
tof b c
tof a c
tof h f
tof h e
tof h b
tof e h
tof b h
tof a d
tof b a
X b
tof a h
tof a c
tof d a
X d
tof a e
tof d b
tof b d
tof h b
tof h g
tof b c
tof c h
H c
Z a b c
H c
X d
X f
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X e
tof a d
X d
H c
Z a b c
H c
tof c h
tof b c
tof h g
tof a b
tof h b
tof b h
tof a b
tof b c
tof a f
tof b a
tof b f
tof b e
tof e h
tof h b
tof h e
tof h f
tof b c
tof c h
H c
Z a b c
H c
X e
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X e
X d
H c
Z a b c
H c
tof c h
tof b c
tof a c
tof h f
tof b e
tof h b
tof e h
X e
tof b f
tof a d
tof b a
tof d b
tof a h
tof a f
tof a e
X c
tof b a
tof a c
tof a b
tof a d
tof a f
tof a g
tof a h
tof e h
tof h b
tof h e
tof h f
tof b c
tof c h
H c
Z a b c
H c
X d
X e
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X e
H c
Z a b c
H c
tof c h
tof h b
X c
tof h c
tof a c
tof h f
tof h e
tof e h
tof a h
tof a g
tof a f
tof d b
tof d a
tof a d
tof d a
X b
tof b a
tof a c
tof a e
tof a f
tof a h
tof b g
tof h b
tof b a
tof a c
tof b c
tof c h
H c
Z a b c
H c
X e
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
H c
Z a b c
H c
tof c h
tof b a
tof a c
tof h b
X h
tof a h
tof b g
tof a d
tof b d
tof d b
tof a f
tof a e
tof b c
tof f b
tof f a
tof a f
X a
tof g h
tof a c
tof h a
tof h g
tof c h
H c
Z a b c
H c
X g
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X g
X f
H c
Z a b c
H c
tof c h
tof h a
tof b c
tof b a
X c
tof h g
tof g h
tof f a
tof a f
tof b f
X f
tof f b
tof b e
tof a e
X g
tof a g
tof f h
tof h a
tof h b
tof h f
tof a c
tof b c
tof c h
H c
Z a b c
H c
X f
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X g
X f
H c
Z a b c
H c
tof c h
X b
X c
tof b a
tof a c
tof h f
tof h b
tof f h
tof e g
tof e b
X f
tof b a
tof b e
tof b f
tof g h
tof a c
tof h a
tof h g
tof c h
H c
Z a b c
H c
X g
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X g
X e
H c
Z a b c
H c
tof c h
tof h a
tof a c
tof h g
tof g h
tof b g
tof b f
tof b e
tof e a
X e
tof e b
tof f h
tof h a
tof h b
tof h f
tof h g
tof a c
tof c h
H c
Z a b c
H c
X f
H 3
Z c d 3
H 3
H 2
Z 3 e 2
H 2
H 1
Z 2 f 1
H 1
H 0
Z 1 g 0
H 0
H a
Z 0 h a
H a
H 0
Z 1 g 0
H 0
H 1
Z 2 f 1
H 1
H 2
Z 3 e 2
H 2
H 3
Z c d 3
H 3
X g
H c
Z a b c
H c
tof c h
tof h b
tof a c
tof h g
tof h f
tof h a
tof f h
tof b a
tof a g
tof a f
tof a e
tof a b
tof h a
tof h b
tof h c
tof h d
tof h e
tof h f
tof h g
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
# size = 2710 cost = 7020
