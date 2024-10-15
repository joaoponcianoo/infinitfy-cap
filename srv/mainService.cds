using sap.cap.school as school from '../db/schema';
using from '../app/services';

service mainService {

    @readonly entity Students as projection on school.students;

}