package com.hb.tripus.model.dto;

public class TourAreaLeportsDto implements TourAreaInterface{
   private String accomcountleports,chkbabycarriage,chkpetleports,expagerangeleports,infocenterleports;
   private String openperiod,parkingfeeleports,parkingleports,reservation,restdateleports,usefeeleports,usetimeleports;
   
   @Override
   public String[] getTags() {
      String[] tags ={"accomcountleports","chkbabycarriage","chkpetleports","expagerangeleports","infocenterleports","openperiod"
            ,"parkingfeeleports","parkingleports","reservation","restdateleports","usefeeleports","usetimeleports"}; 
      return tags;
   }

   @Override
   public void setTagValue(String[] tags) {
      this.accomcountleports=tags[0];    this.chkbabycarriage=tags[1];
      this.chkpetleports=tags[2];this.expagerangeleports=tags[3]; 
      this.infocenterleports=tags[4];this.openperiod=tags[5];
      this.parkingfeeleports=tags[6];this.parkingleports=tags[7]; 
      this.reservation=tags[8];this.restdateleports=tags[9]; 
      this.usefeeleports=tags[10];this.usetimeleports=tags[11];
      
   }

   @Override
   public String toString() {
      return "TourAreaLeportsDto [accomcountleports=" + accomcountleports + ", chkbabycarriage=" + chkbabycarriage
            + ", chkcreditcardleports=" + ", chkpetleports=" + chkpetleports
            + ", expagerangeleports=" + expagerangeleports + ", infocenterleports=" + infocenterleports
            + ", openperiod=" + openperiod + ", parkingfeeleports=" + parkingfeeleports + ", parkingleports="
            + parkingleports + ", reservation=" + reservation + ", restdateleports=" + restdateleports
            + ", usefeeleports=" + usefeeleports + ", usetimeleports=" + usetimeleports + "]";
   }

   public String getAccomcountleports() {
      return accomcountleports;
   }

   public void setAccomcountleports(String accomcountleports) {
      this.accomcountleports = accomcountleports;
   }

   public String getChkbabycarriage() {
      return chkbabycarriage;
   }

   public void setChkbabycarriage(String chkbabycarriage) {
      this.chkbabycarriage = chkbabycarriage;
   }

   public String getChkpetleports() {
      return chkpetleports;
   }

   public void setChkpetleports(String chkpetleports) {
      this.chkpetleports = chkpetleports;
   }

   public String getExpagerangeleports() {
      return expagerangeleports;
   }

   public void setExpagerangeleports(String expagerangeleports) {
      this.expagerangeleports = expagerangeleports;
   }

   public String getInfocenterleports() {
      return infocenterleports;
   }

   public void setInfocenterleports(String infocenterleports) {
      this.infocenterleports = infocenterleports;
   }

   public String getOpenperiod() {
      return openperiod;
   }

   public void setOpenperiod(String openperiod) {
      this.openperiod = openperiod;
   }

   public String getParkingfeeleports() {
      return parkingfeeleports;
   }

   public void setParkingfeeleports(String parkingfeeleports) {
      this.parkingfeeleports = parkingfeeleports;
   }

   public String getParkingleports() {
      return parkingleports;
   }

   public void setParkingleports(String parkingleports) {
      this.parkingleports = parkingleports;
   }

   public String getReservation() {
      return reservation;
   }

   public void setReservation(String reservation) {
      this.reservation = reservation;
   }

   public String getRestdateleports() {
      return restdateleports;
   }

   public void setRestdateleports(String restdateleports) {
      this.restdateleports = restdateleports;
   }

   public String getUsefeeleports() {
      return usefeeleports;
   }

   public void setUsefeeleports(String usefeeleports) {
      this.usefeeleports = usefeeleports;
   }

   public String getUsetimeleports() {
      return usetimeleports;
   }

   public void setUsetimeleports(String usetimeleports) {
      this.usetimeleports = usetimeleports;
   }

}