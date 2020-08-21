-- Choose from list
set chosenListItem to choose from list {"A", "B", "3"} ¬
	with title "List Title" ¬
	with prompt "Prompt Text" ¬
	default items "B" ¬
	OK button name "Looks Good!" ¬
	cancel button name "Nope, try again" ¬
	multiple selections allowed false ¬
	with empty selection allowed