TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE
FALSE | TRUE
FALSE | FALSE

# bitwise and
TRUE && TRUE
3 && 12

nums <- seq(1,200,3)
nums > 2
nums[nums > 3]

boolVec <- nums <= 67
boolVec_ <- nums <= 80
# we have two logical vectors here

boolVec + boolVec_
# numerical addition

boolVec & boolVec_
# & is vectorized

boolVec && boolVec_
# not vectorized

boolVec | boolVec_

! boolVec

