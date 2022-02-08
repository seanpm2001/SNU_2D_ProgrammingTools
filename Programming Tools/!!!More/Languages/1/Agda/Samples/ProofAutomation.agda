data Maybe (A : Set) : Set where
	Just : A → Maybe A
	Nothing : Maybe A

data isJust {A : Set} : Maybe A → Set where
	auto : ∀ {x} → isJust (Just x)

Tactic : ∀ {A : Set} (x : Maybe A) → isJust x → A
Tactic Nothing ()
Tactic (Just x) auto = x

