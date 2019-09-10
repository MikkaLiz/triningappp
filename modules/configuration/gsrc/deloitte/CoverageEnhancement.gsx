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
    /*new Coverage_Ext(){:Name='Base',:ValuePercentage=0.85, :CoverableType=CoverableType.TC_DWELLING}
    new Coverage_Ext(){:Name='Bienes Personales',:ValuePercentage=0.75, :CoverableType=CoverableType.TC_DWELLING}
    new Coverage_Ext(){:Name='Terremotos',:ValuePercentage=2, :CoverableType=CoverableType.TC_DWELLING}
    new Coverage_Ext(){:Name='Incendios',:ValuePercentage=1.5, :CoverableType=CoverableType.TC_DWELLING}
    new Coverage_Ext(){:Name='Inundaciones',:ValuePercentage=0.25, :CoverableType=CoverableType.TC_DWELLING}
    new Coverage_Ext(){:Name='Daño contra terceros',:ValuePercentage=2, :CoverableType=CoverableType.TC_AUTO}
    new Coverage_Ext(){:Name='Llantas de invierno',:ValuePercentage=1.2, :CoverableType=CoverableType.TC_AUTO}
    new Coverage_Ext(){:Name='Choques',:ValuePercentage=2.8, :CoverableType=CoverableType.TC_AUTO}
    new Coverage_Ext(){:Name='Siniestros',:ValuePercentage=1.25, :CoverableType=CoverableType.TC_AUTO}
    new Coverage_Ext(){:Name='Sistemas eléctricos',:ValuePercentage=5, :CoverableType=CoverableType.TC_AUTO}*/
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
