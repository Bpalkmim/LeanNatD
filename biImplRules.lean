namespace biImplRules

-- Requer o namespace de implicação
open implRules

print " "
print "Provas com BI_IMPL - início"
print " "

constant bi_impl : Prop → Prop → Prop

constants A B : Prop

-- Definições
constant bi_impl_intro {X Y : Prop} : (Π x : Proof X, Proof Y) → Proof Y → (Π x : Proof Y, Proof X) → Proof X → Proof (bi_impl X Y)
constant bi_impl_elim_leftmost_left {X Y : Prop} : Proof (bi_impl X Y) → Proof X → Proof X
constant bi_impl_elim_leftmost_right {X Y : Prop} : Proof (bi_impl X Y) → Proof X → Proof Y
constant bi_impl_elim_rightmost_left {X Y : Prop} : Proof (bi_impl X Y) → Proof Y → Proof X
constant bi_impl_elim_rightmost_right {X Y : Prop} : Proof (bi_impl X Y) → Proof Y → Proof Y

-- Termos úteis
variable a : Proof A
variable b : Proof B
variable aIMPb : Proof (implies A B)
variable bIMPa : Proof (implies B A)
variable aBIIMPLb : Proof (bi_impl A B)
variable concl : Π x : Proof (bi_impl A B), Proof (bi_impl B A)

-- Testes iniciais
check @bi_impl_intro
check @bi_impl_elim_leftmost_left
check @bi_impl_elim_leftmost_right
check @bi_impl_elim_rightmost_left
check @bi_impl_elim_rightmost_right
check bi_impl_intro (impl_elim aIMPb) b (impl_elim bIMPa) a
check bi_impl_elim_leftmost_left aBIIMPLb a
check bi_impl_elim_leftmost_right aBIIMPLb a
check bi_impl_elim_rightmost_left aBIIMPLb b
check bi_impl_elim_rightmost_right aBIIMPLb b

print "------"

-- Testes parciais
check bi_impl_elim_leftmost_right aBIIMPLb
check bi_impl_elim_rightmost_left aBIIMPLb
check bi_impl_intro
		(bi_impl_elim_rightmost_left
			aBIIMPLb
		)
		a
		(bi_impl_elim_leftmost_right
			aBIIMPLb
		)
		b

print "------"

-- Teste final (A ↔ B) → (B ↔ A)
check impl_intro
		concl
		(bi_impl_intro
			(bi_impl_elim_rightmost_left
				aBIIMPLb
			)
			a
			(bi_impl_elim_leftmost_right
				aBIIMPLb
			)
			b
		)

print " "
print "Provas com BI_IMPL - fim"
print " "

end biImplRules