using sap.cap.school as school from '../db/schema';
using from '../app/services';

service mainService @(path: 'view') {

    @readonly
    entity GetStudents    as projection on school.students;

    @updateonly
    entity UpdateStudents as projection on school.students;

    @insertonly
    entity InsertStudents as projection on school.students;

    @deleteonly
    entity DeleteStudents as projection on school.students;

    entity Students as projection on school.students;

}

extend service mainService with {

    @readonly
    entity View as projection on school.students {
        *,
        first_name || ' ' || last_name as full_name: String
    } excluding {
        create_date
    }
}