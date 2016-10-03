namespace implRules

print " "
print "Provas com IMPL - início"
print " "

constant Proof : Prop → Type
constant implies : Prop → Prop → Prop
constants A B C : Prop

-- Definições
constant impl_intro {X Y : Prop} : (Π x : Proof X, Proof Y) → Proof Y → Proof (implies X Y)
constant impl_elim {X Y : Prop} : Proof (implies X Y) → Proof X → Proof Y

-- Termos úteis
variable a : Proof A
variable b : Proof B
variable aIMPb : Proof (implies A B)
variable aIMPc : Proof (implies A C)
variable aDEPb : Π x : Proof A, Proof B
variable aIMPbIMPc : Proof (implies A (implies B C))
variable bIMPaIMPc : Proof (implies B (implies A C))
variable concl : Π x : Proof (implies A (implies B C)), Proof (implies B (implies A C))

-- Teste (A → (B → C)) → (B → (A → C))
check impl_intro
		concl
		(impl_intro
			(impl_elim
				bIMPaIMPc
			)
			(impl_intro
				(impl_elim
					aIMPc
				)
				(impl_elim
					(impl_elim aIMPbIMPc a)
					b
				)
			)
		)


-- Testes iniciais
check @impl_intro
check @impl_elim
check impl_intro aDEPb b
check impl_elim aIMPb a

print "------"

-- Testes parciais
check impl_elim aIMPc
check impl_elim (impl_elim aIMPbIMPc a) b
check impl_intro (impl_elim aIMPc) (impl_elim (impl_elim aIMPbIMPc a) b)
check impl_intro (impl_elim bIMPaIMPc) (impl_intro (impl_elim aIMPc) (impl_elim (impl_elim aIMPbIMPc a) b))

print "------"


print " "
print "Provas com IMPL - fim"
print " "

end implRules