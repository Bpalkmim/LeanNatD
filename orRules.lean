namespace orRules

-- Requer o namespace de implicação
open implRules

print " "
print "Provas com OR - início"
print " "

constant or : Prop → Prop → Prop

constants A B C : Prop

-- Definições
-- or_intro_right introduz o operador ∨ com as proposições recebidas por parâmetro na ordem
constant or_intro_right {X Y : Prop} : Proof X → Proof Y → Proof (or X Y)
-- or_intro_left inverte a ordem dos parâmetros para inserir no ∨ introduzido
constant or_intro_left {X Y : Prop} : Proof X → Proof Y → Proof (or Y X)
constant or_elim {X Y Z : Prop} : Proof (or X Y) → (Π x : Proof X, Proof Z) → (Π x : Proof Y, Proof Z) → Proof Z → Proof Z → Proof Z

-- Termos úteis
variable a : Proof A
variable b : Proof B
variable c : Proof C
variable aORb : Proof (or A B)
variable aDEPc : Π x : Proof A, Proof C
variable bDEPc : Π x : Proof B, Proof C
variable concl : Π x : Proof (or A B), Proof (or B A)

-- Testes iniciais
check @or_intro_left
check @or_intro_right
check @or_elim
check or_intro_right a b
check or_intro_left b a
check or_elim aORb aDEPc bDEPc c c

print "------"

-- Testes parciais
check or_intro_left a -- (λx. x ∨ a)
check or_intro_right b -- (λx. b ∨ x)
check or_elim aORb (or_intro_right b) (or_intro_left a)

print "------"

-- Teste final (A ∨ B) → (B ∨ A)

check impl_intro
		concl
		(or_elim
			aORb
			(or_intro_right b)
			(or_intro_left a)
			(or_intro_right b a)
			(or_intro_left a b)
		)

print " "
print "Provas com OR - fim"
print " "

end orRules