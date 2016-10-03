namespace negBotRules

-- Requer o namespace de implicação
open implRules

print " "
print "Provas com NEG & BOT - início"
print " "

constant neg : Prop → Prop
constant Bottom : Prop

constant A : Prop

-- Definições
constant neg_intro {X : Prop} : (Π x : Proof X, Proof Bottom) → Proof Bottom → Proof (neg X)
constant neg_elim {X : Prop} : Proof X → Proof (neg X) → Proof Bottom
constant bot_classic {X : Prop} : (Π x : Proof (neg X), Proof Bottom) → Proof Bottom → Proof X
constant bot_intui {X : Prop} : Proof Bottom → Proof X → Proof X

-- Termos úteis
variable a : Proof A
variable na : Proof (neg A)
variable bot : Proof Bottom
variable aDEPbot : Π x : Proof A, Proof Bottom
variable naDEPbot : Π x : Proof (neg A), Proof Bottom

-- Testes iniciais
check @neg_intro
check @neg_elim
check @bot_classic
check @bot_intui
check neg_intro aDEPbot bot
check neg_elim a na
check bot_classic naDEPbot bot
check bot_intui bot a

print "------"

-- Testes parciais

print "------"

-- Teste final

print " "
print "Provas com NEG & BOT - fim"
print " "

end negBotRules