package acmelab.ta.enhancements.entity

enhancement ABContactEnhancementAcme : ABContact {
  property get NextCourtesyContact() : Date {
    if (this.LastCourtesyContact_Ext == null) {
      return null
    } else {
      return this.LastCourtesyContact_Ext.addMonths(6)
    }
  }

  function upgradeToStrategicPartner() : void {
    this.IsStrategicPartner_Ext = true
    if (this.CustomerRating_Ext == null) this.CustomerRating_Ext = 25
    if (this.CustomerRating_Ext >= 0 && this.CustomerRating_Ext <= 989.9)
      this.CustomerRating_Ext = this.CustomerRating_Ext + 10
    if (this.CustomerRating_Ext > 989.9) this.CustomerRating_Ext = 999.9
  }
}
