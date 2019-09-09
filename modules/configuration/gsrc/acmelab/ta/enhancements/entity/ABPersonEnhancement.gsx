package acmelab.ta.enhancements.entity


enhancement ABPersonEnhancement : ABPerson {

  public static function verifyAge(DateBirth : Date) : String{
    var ageinDays = 0
    var msg = "El contacto debe ser mayor de edad"
    ageinDays = (DateBirth.DaysSince)
    if ((ageinDays/365) > 17){
      return null
    }
    else{
      return msg
    }

  }
}
