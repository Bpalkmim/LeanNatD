namespace andRules

-- Requer o namespace de implicação
open implRules

print " "
print "Provas com AND - início"
print " "

constant and : Prop → Prop → Prop

constants A B : Prop

-- Definições
constant and_intro {X Y : Prop} : Proof X → Proof Y → Proof (and X Y)
constant and_elim_left {X Y : Prop} : Proof (and X Y) → Proof X
constant and_elim_right {X Y : Prop} : Proof (and X Y) → Proof Y

-- Termos úteis
variable a : Proof A
variable b : Proof B
variable aANDb : Proof (and A B)
variable bANDa : Proof (and B A)
variable concl : Π x : Proof (and A B), Proof (and B A)

-- Testes iniciais
check @and_intro
check @and_elim_left
check @and_elim_right
check and_intro a b
check and_elim_left aANDb
check and_elim_right aANDb

print "------"

-- Testes parciais
check and_intro (and_elim_right aANDb) (and_elim_left aANDb)

print "------"

-- Teste final (A ∧ B) → (B ∧ A)
check impl_intro
		concl 
		(and_intro 
			(and_elim_right aANDb)
			(and_elim_left aANDb)
		)

print " "
print "Provas com AND - fim"
print " "

end andRules