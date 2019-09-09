package bootcamp.rut
 uses bootcamp.rut.rutvalidator.rut.RutsPortService
 uses bootcamp.rut.rutvalidator.rut.elements.GetRutValidationRequest
 uses gw.api.database.Query
 uses gw.transaction.Transaction

class RutValidation {

  public static function validate(rut : String) : String{

    var errMessage = new StringBuilder();
    var service = new RutsPortService()
    var request = new GetRutValidationRequest()
    request.Rut = rut
    var response = service.getRutValidation(request)
    var validator = response.getIsValid()?null:errMessage.append("Rut Invalido")
    if(isDuplicated(rut) != null){
      if(errMessage.toString().length() == 0){
        return errMessage.append("Rut Duplicado").toString()
      }
      else{
        return errMessage.append(" y Debe ser unico").toString()
      }
    }else{
      if (validator == null){
        return null
      }else{
        return errMessage.toString()
      }
    }
  }

  public static function isDuplicated(rutOrPassport : String) : Boolean{
    var myQuery = Query.make(ABContact)
    var queryResult = myQuery.select()
    var isDuplicatedCheck = false
    queryResult.each(\elt -> {
      if(elt.Rut_Ext != null) {
        if (new String(elt.Rut_Ext).toUpperCase() == rutOrPassport.toUpperCase()) {
          //print("El rut especificado ya existe!")
          isDuplicatedCheck = true
        }
      }
    })
    return (isDuplicatedCheck)?true:null
  }

}