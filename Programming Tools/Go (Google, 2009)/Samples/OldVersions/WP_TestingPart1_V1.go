func ExtractUsername(email string) string {
	at := strings.Index(email, "@")
	return email[:at]
}
