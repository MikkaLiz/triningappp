package acmelab.ta.classes

uses gw.api.database.Query
uses gw.api.database.Relop
uses gw.transaction.Transaction

class ABContactSummary {
  private static var intID = 1000
  private var externalID = 0
  private var contactID : String
  private var name : String
  private var numCheckingAccounts : int
  private var assignedUserWorkload : int

  property get ExternalID():int{
    return externalID;
  }
  property get ContactID():String{
    return contactID;
  }
  property get Name():String{
    return name;
  }
  property get NumCheckingAccounts():int{
    return numCheckingAccounts;
  }
  property get AssignedUserWorkload(): int{
    return assignedUserWorkload
  }

  property set ContactID(exID: String){
    this.contactID = exID
  }
  property set Name(exName: String){
    this.name = exName
  }
  property set ExternalID(exID: int){
    this.externalID = exID
  }
  property set NumCheckingAccounts(nAccounts : int){
    this.numCheckingAccounts = nAccounts
  }

  property set AssignedUserWorkload(exAuw: int){
    this.assignedUserWorkload = exAuw
  }

  function InitializeExternalID():void{
    if (this.ExternalID == 0) this.ExternalID = intID
    intID ++
  }

  function loadSummaryData(myContact : ABContact){
    this.ContactID = myContact.PublicID
    this.Name = myContact.DisplayName

    var  count = myContact.BankAccounts.where(\elt ->
        elt.AccountType == BankAccountType.TC_CHECKING
    )
    this.NumCheckingAccounts = count.length

    if (myContact.AssignedUser == null){
      this.AssignedUserWorkload = 0
    }
    else {
      var query = Query.make(entity.ABContact)
      var rs = query.compare(ABContact#AssignedUser, Relop.Equals, myContact.AssignedUser)
      this.AssignedUserWorkload = rs.select().Count
    }
  }

  function getConcatenatedSummary() : String {
    return new StringBuilder().append(ExternalID).append(',').append(ContactID).append(',').append(Name).append(',').append(NumCheckingAccounts).append(',').append(AssignedUserWorkload).toString()
  }

  function saveSummaryNote() : void {
    if (ContactID != null) {
      var body = new StringBuilder().append("○ External ID: ").append(ExternalID).append('\n')
      body.append("○ Name: ").append(Name).append('\n')
      body.append("○ Number of Checkings Accounts: ").append(NumCheckingAccounts)
      var contact = Query.make(entity.ABContact).compare(entity.ABContact#PublicID, Relop.Equals, this.contactID).select().AtMostOneRow
      Transaction.runWithNewBundle(\etl -> {
        var note = new ContactNote(){
            :Subject="ABContactSummary",
            :Body=body.toString()
        }
        contact = etl.add(contact)
        contact.addToContactNotes(note)
      },"su")
    }
  }
}
