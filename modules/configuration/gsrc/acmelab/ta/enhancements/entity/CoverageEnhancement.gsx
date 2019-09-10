package acmelab.ta.enhancements.entity

uses gw.api.database.Query

enhancement CoverageEnhancement : Coverage_Ext {

  static function getAuto(): List<Coverage_Ext>{
    var result = Query.make(Coverage_Ext).select().where(\elt -> elt.CoverableType == CoverableType.TC_AUTO)
    return result
  }

  static function getDwelling(): List<Coverage_Ext>{
    var result = Query.make(Coverage_Ext).select().where(\elt -> elt.CoverableType == CoverableType.TC_DWELLING)
    return result
  }

}
