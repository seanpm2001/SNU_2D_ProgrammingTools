check-even-tactic : {n : ℕ} → isJust (check-even n) → Even n
check-even-tactic {n} = Tactic (check-even n)

lemma0 : Even zero
lemma0 = check-even-tactic auto

lemma2 : Even (suc (suc zero))
lemma2 = check-even-tactic auto
