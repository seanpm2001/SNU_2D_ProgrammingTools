-- Alert
set resultAlertReply to display alert "Alert Text" ¬
	as warning ¬
	buttons {"Skip", "Okay", "Cancel"} ¬
	default button 2 ¬
	cancel button 1 ¬
	giving up after 2