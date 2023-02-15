# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
    x=""
    if (num%3 == 0)
        x=x "Pling"
    if (num%5 == 0)
        x=x "Plang"
    if (num%7 == 0)
        x=x "Plong"

    if(length(x) > 0)
        print x
    else
        print num

}
