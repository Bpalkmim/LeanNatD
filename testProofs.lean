namespace testProofs

-- Requer os namespaces
open implRules
open andRules
open orRules
open negBotRules

print " "
print "Provas AVANÇADAS - início"
print " "

constants A B C D : Prop

--- Termos úteis
variable a : Proof A
variable b : Proof B
variable NEGb : Proof (neg B)
variable c : Proof C
variable NEGc : Proof (neg C)
variable d : Proof D
variable NEGd : Proof (neg D)
variable NEGdIMPNEGb : Proof (implies (neg D) (neg B))
variable aORb : Proof (or A B)
variable bDEPb : Π x : Proof B, Proof B
variable aIMPc : Proof (implies A C)
variable aDEPb : Π x : Proof A, Proof B
variable concl : Π x : Proof (and (or A B) (and (implies A C) (implies (neg D) (neg B)))), Proof (or C D)

--- Testes parciais

-- Parte direita
check impl_elim NEGdIMPNEGb NEGd

-- Parte esquerda
check impl_elim aIMPc a
check

-- Junção
check neg_elim
		b
		(impl_elim NEGdIMPNEGb NEGd)

check bot_intui
		(neg_elim
			(or_elim aORb aDEPb bDEPb b b)
			(impl_elim NEGdIMPNEGb NEGd)
		)
		d


--- Teste final ((A ∨ B) ∧ (A → C) ∧ (¬D → ¬B)) → (C ∨ D) INTUICIONISTA
--- USAR OUTRA SENTENÇA!!!
check impl_intro
		concl
		(or_intro_right
			c
			(bot_intui
				(neg_elim
					(or_elim
						aORb
						aDEPb --- CONSERTARRRRR!!! TODO
						bDEPb
					)
					(impl_elim
						NEGdIMPNEGb
						NEGd
					)
				)
				d
			)
		)

print " "
print "Provas AVANÇADAS - fim"
print " "

end testProofs