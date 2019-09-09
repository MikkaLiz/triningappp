package deloitte

uses gw.transaction.Transaction

enhancement ProyectABContact : ABContact {
  function addCarToCoberables(cov: Coverable_Ext):void{
    cov.CoverableType = CoverableType.TC_AUTO
    Transaction.runWithNewBundle(\elt->{
      this.addToCoverables(cov)
    })
  }

  function addDwellingToCoberables(cov: Coverable_Ext):void{
    cov.CoverableType = CoverableType.TC_DWELLING
    Transaction.runWithNewBundle(\elt->{
      this.addToCoverables(cov)
    })
  }

}
