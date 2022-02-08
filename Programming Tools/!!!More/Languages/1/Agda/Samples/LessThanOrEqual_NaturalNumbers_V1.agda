data _≤_ : ℕ → ℕ → Set where
	z≤n : {n : ℕ} → zero ≤ n
	s≤s : {n m : ℕ} → n ≤ m → suc n ≤ suc m
