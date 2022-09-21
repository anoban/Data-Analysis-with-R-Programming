# assignment operators
x = 4
x <- 4.001
56 -> y


# arithmetic operators

2 * 76
87 / 8
87 + 6
786 - 67
# modulus
76 %% 7
# integer division
24 %/% 7

# relational operators
4 > 3
7 < 3
78 == 78.0001
78 != 56
56 <= 56
98.000 >= 98

# logical operators
TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE
FALSE | TRUE
FALSE | FALSE

TRUE & rep(c(TRUE,FALSE),c(2,4))
TRUE | rep(c(TRUE,FALSE),c(2,4))
# logical and &, or | operators are vectorized

TRUE && TRUE
TRUE && rep(c(TRUE,FALSE),c(2,4))
# returns a warning!
# element-wise logical operators are not vectorized! 

!TRUE
!rep(c(TRUE,FALSE),c(2,4))
!!rep(c(TRUE,FALSE),c(2,4)) == rep(c(TRUE,FALSE),c(2,4)) # :)


