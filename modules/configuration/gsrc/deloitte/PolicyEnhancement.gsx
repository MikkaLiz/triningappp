package deloitte

uses gw.api.database.Query
uses gw.transaction.Transaction

enhancement PolicyEnhancement : Poliza {

  function setPublicId():String{
    var number = Query.make(Poliza).select().Count + 1
    Transaction.runWithNewBundle(\ elt ->{
      this.PublicID = "pc:"+(number)
      elt.add(this)
    })
    return "pc:"+(number)
  }
}
