namespace sap.cap.school;

entity students {
    key email       : String(70);
        first_name  : String(30);
        last_name   : String(30);
        create_date : Date;

}
