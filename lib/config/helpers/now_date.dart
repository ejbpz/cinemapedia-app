class NowDate {
  static String _textMonth(int month) {
    switch(month) {
      case 1: return 'de enero';
      case 2: return 'de febrero';
      case 3: return 'de marzo';
      case 4: return 'de abril';
      case 5: return 'de mayo';
      case 6: return 'de junio';
      case 7: return 'de julio';
      case 8: return 'de agosto';
      case 9: return 'de septiembre';
      case 10: return 'de octubre';
      case 11: return 'de noviembre';
      case 12: return 'de diciembre';
    }

    return '';
  }

  static String getNowDate() => ('${DateTime.now().day} ${_textMonth(DateTime.now().month)}');
}