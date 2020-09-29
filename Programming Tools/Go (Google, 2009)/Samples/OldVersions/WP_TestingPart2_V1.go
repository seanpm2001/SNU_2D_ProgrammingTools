import (
    "testing"    
)

func TestExtractUsername(t *testing.T) {
	t.Run("withoutDot", func(t *testing.T) {
		username := ExtractUsername("r@google.com")
		if username != "r" {
			t.Fatalf("Got: %v\n", username)
		}
	})

	t.Run("withDot", func(t *testing.T) {
		username := ExtractUsername("jonh.smith@example.com")
		if username != "jonh.smith" {
			t.Fatalf("Got: %v\n", username)
		}
	})

}
