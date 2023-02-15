{
    if ($0 % 4 != 0){
        print "false"
        exit;
    }

    result="true"

    if($0 % 100 == 0){
        if($0 % 400 == 0){
            result="true"
        }
        else{
            result="false"
        }
    }

    print result
}
