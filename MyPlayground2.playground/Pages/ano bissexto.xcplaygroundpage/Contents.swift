var aAno = Int (readLine() !)!


func isLeap ( ano : Int){
    var leap = "NAO"

    if ano % 4 == 0
    {
        leap = "SIM"
    }
    else if ano % 100 != 0
    {
        leap = "nao"
    }
    else if ano % 400 == 0
    {
        leap = "SIM"
    }

    print(leap)

}

isLeap(ano: aAno)

