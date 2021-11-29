int strlen(const char *s)
{
	int iter = 0;
	if (s == NULL)
		return 0;
	while (s[iter] != '\0') {
		iter++;
	}
	return iter;
}
