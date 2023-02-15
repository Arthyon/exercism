BEGIN {
    FS="";
}
{
    rna=""
    for(i=1;i<=NF;i++){
        switch($i){
            case "G":
                rna=rna "C"
                break;
            case "C":
                rna=rna "G"
                break;
            case "T":
                rna=rna "A"
                break;
            case "A":
                rna=rna "U"
                break;
            default:
                print "Invalid nucleotide detected."
                exit 1;
                break;
        }

    }
    print rna
}
