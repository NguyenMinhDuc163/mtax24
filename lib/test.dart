bool validateMst(String mstnmua) {
  var isMst = true;
  if (mstnmua.length == 0) {
    // truong hop ng mua le khong nhap msthue
    return true;
  }
  if (mstnmua.length < 10 || mstnmua.length > 14) {
    isMst = false;
  }
  if (mstnmua.length == 10) {
    var n1 = int.parse(mstnmua.substring(0, 1)) * 31;
    var n2 = int.parse(mstnmua.substring(1, 2)) * 29;
    var n3 = int.parse(mstnmua.substring(2, 3)) * 23;
    var n4 = int.parse(mstnmua.substring(3, 4)) * 19;
    var n5 = int.parse(mstnmua.substring(4, 5)) * 17;
    var n6 = int.parse(mstnmua.substring(5, 6)) * 13;
    var n7 = int.parse(mstnmua.substring(6, 7)) * 7;
    var n8 = int.parse(mstnmua.substring(7, 8)) * 5;
    var n9 = int.parse(mstnmua.substring(8, 9)) * 3;
    var n10 = int.parse(mstnmua.substring(9, 10));
    var soDu = (n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9) % 11;
    var hieuSo = 10 - soDu;
    if (mstnmua != "" && hieuSo != n10) {
      isMst = false;
    }
  }
  if (10 < mstnmua.length && mstnmua.length < 14) {
    isMst = false;
  }
  if (mstnmua.length == 14) {
    var n11 = mstnmua.substring(10, 11);
    var n12 = int.parse(mstnmua.substring(11, 12));
    var n13 = int.parse(mstnmua.substring(12, 13));
    var n14 = int.parse(mstnmua.substring(13, 14));
    if (n11.toString() != '-') {
      isMst = false;
    } else if (!(n12 >= 0 || n12 <= 9) ||
        !(n13 >= 0 || n13 <= 9) ||
        !(n14 >= 0 || n14 <= 9)) {
      isMst = false;
    }
  }
  return isMst;
}

int main() {
  print(validateMst('0102454468-990'));
}
