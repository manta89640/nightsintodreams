# Symbol helpers for generated assembly. A function symbol needs a type and size
# so objdiff can split the object into functions.
.macro glabel name
	.global \name
	.type \name, @function
\name:
.endm

.macro dlabel name
	.global \name
	.type \name, @object
\name:
.endm

.macro endlabel name
	.size \name, . - \name
.endm
