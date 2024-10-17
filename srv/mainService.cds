using sap.cap.school as school from '../db/schema';
using from '../app/services';

service mainService {

    @readonly
    entity getStudents    as projection on school.students;

    @updateonly
    entity updateStudents as projection on school.students;

}