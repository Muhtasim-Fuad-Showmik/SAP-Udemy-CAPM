using myCompany.hr.lms from '../db/Students';
using {myCompany.hr.lms1 as lms1} from '../db/Structure';

service exportSRV {
    @readonly entity GetStudent as projection on lms.Students;
    @updateonly entity UpdateStudent as projection on lms.Students;
    @insertonly entity InsertStudent as projection on lms.Students;
    @deleteonly entity DeleteStudent as projection on lms.Students;
}

service exportStructure {
    @readonly entity GetStudent as projection on lms1.Students;
    @readonly entity GetCourse as projection on lms1.Courses;
    @readonly entity GetEnrollment as projection on lms1.Enrollments;
    @readonly entity GetContent as projection on lms1.Contents;
}