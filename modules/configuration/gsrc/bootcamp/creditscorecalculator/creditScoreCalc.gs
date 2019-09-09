package bootcamp.creditscorecalculator

uses bootcamp.creditscorecalculator.creditscore.contacts.ContactsPortService
uses bootcamp.creditscorecalculator.creditscore.contacts.elements.GetContactRequest

//ContactID = rut or passport

class creditScoreCalc {
  public static function getCreditScore(contactId : String) : Integer{

    var service = new ContactsPortService()
    var request = new GetContactRequest()
    request.Id = contactId
    var response = service.getContact(request)
    return response.Hc

  }
}