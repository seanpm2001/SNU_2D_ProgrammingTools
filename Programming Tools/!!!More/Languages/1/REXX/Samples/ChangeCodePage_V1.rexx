ChangeCodePage: procedure /* protect SIGNAL settings */
signal on syntax name ChangeCodePage.Trap
return SysQueryProcessCodePage()
ChangeCodePage.Trap: return 1004 /* windows-1252 on OS/2 */
