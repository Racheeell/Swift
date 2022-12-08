var now = Date().timeIntervalSince1970
let oneSecondFromNow = now + 1

while now < oneSeconsFromNow {
    now = Date().timeIntervalSince1970
    print("waiting...")
}
