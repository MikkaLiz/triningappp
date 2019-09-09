package acmelab.ta.classes

uses gw.api.database.Query
uses gw.api.database.Relop
uses gw.transaction.Transaction

class TechTest {
  public function labTestTech(): void {
    var company = Query.make(ABCompany).startsWith(ABCompany#Name, 'p', true).select()
    var person = Query.make(ABPerson).startsWith(ABPerson#LastName, 'p', true).select()
    company.each(\elt -> print(elt.Name+""))
    person.each(\elt -> print(elt.LastName+""))
    Transaction.runWithNewBundle(\etl -> {
      var bundPers = Query.make(ABPerson).startsWith(ABPerson#LastName, 'p', true)
      var bundComp = Query.make(ABCompany).startsWith(ABCompany#Name, 'p', true)
      bundPers.select().each(\elt -> {
        var abperson = Query.make(ABPerson).compare(ABPerson#PublicID, Relop.Equals, elt.PublicID).select().AtMostOneRow
        etl.add(abperson)
        abperson.LastName = '_' + abperson.LastName
      })
      bundComp.select().each(\elt -> {
        var abcomp = Query.make(ABCompany).compare(ABCompany#PublicID, Relop.Equals, elt.PublicID).select().AtMostOneRow
        etl.add(abcomp)
        abcomp.Name = '_' + abcomp.Name
      })
    }, "su")
  }

  function pDays(): void{
    var person_ = Query.make(ABPerson).startsWith(ABPerson#LastName, "_P", true)
    var person = Query.make(ABPerson).startsWith(ABPerson#LastName, "P", true)
    person_.select().each(\elt -> print(elt.FullName + " " + elt.AgeInDays))
    person.select().each(\elt -> print(elt.FullName + " " + elt.AgeInDays))
  }
}