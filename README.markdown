# Case sensitive Quote

Case sensitive Quote is a handy reader macro to acquire a symbol whose
case is preserved. Let *^* be the case sensitive quote character.

    ^aBc ; => |aBc|

In other words, it works same as the combination of *'* reader macro and
*|* as follows:

    '|aBc|

## Function ENABLE-CASE-SENSITIVE-QUOTE

    enable-case-sensitive-quote &optional (quote-char #\^) => t

    quote-char---a character.

It enables the case sensitive quote by setting up the QUOTE-CHAR as the
quote character for the case sensitive quote. If QUOTE-CHAR is not
specified, then *^* is used.

The reader macro function that is set for QUOTE-CHAR when this function
is called is saved and it will be reverted when the case sensitive quote
reader macro is disabled by DISABLE-CASE-SENSITIVE-QUOTE function.

Only the latest call of ENABLE-CASE-SENSITIVE-QUOTE makes sense if the
function is called 2 or more times without intervening call of
DISABLE-CASE-SENSITIVE-QUOTE. 

## Function DISABLE-CASE-SENSITIVE-QUOTE

    disable-case-sensitive-quote => nil

It disables the case sensitive quote currently used. If the case
sensitive quote character was used as a different reader macro
character, then this function reverts the previous reader macro
function.
