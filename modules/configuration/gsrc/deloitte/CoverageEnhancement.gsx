package deloitte

uses gw.api.database.Query
uses gw.transaction.Transaction
uses java.math.BigDecimal

enhancement CoverageEnhancement : Coverage_Ext {

  static function addNewCoverage(name: String, porcent: BigDecimal, covType : CoverableType):void{
    Transaction.runWithNewBundle(\ elt -> {
      var coverage = new Coverage_Ext(){
        :Name = name,
        :ValuePercentage = porcent,
        :CoverableType = covType
      }
    }, "su")
  }
  static function initCoverage():void{
    if(Query.make(Coverage_Ext).select().getCount() == 0){
      CoverageEnhancement.addNewCoverage('Base', 0.85, CoverableType.TC_DWELLING)
      CoverageEnhancement.addNewCoverage('Bienes Personales', 0.75, CoverableType.TC_DWELLING)
      CoverageEnhancement.addNewCoverage('Terremotos', 2, CoverableType.TC_DWELLING)
      CoverageEnhancement.addNewCoverage('Incendios', 1.50, CoverableType.TC_DWELLING)
      CoverageEnhancement.addNewCoverage('Inundaciones',	0.25, CoverableType.TC_DWELLING)
      CoverageEnhancement.addNewCoverage("Daño contra terceros",	2, CoverableType.TC_AUTO)
      CoverageEnhancement.addNewCoverage("Llantas de invierno",	1.20,CoverableType.TC_AUTO)
      CoverageEnhancement.addNewCoverage("Choques",	2.80, CoverableType.TC_AUTO)
      CoverageEnhancement.addNewCoverage("Siniestros",	1.25 ,CoverableType.TC_AUTO)
      CoverageEnhancement.addNewCoverage("Sistemas eléctricos",	5,CoverableType.TC_AUTO)
    }
  }
}
