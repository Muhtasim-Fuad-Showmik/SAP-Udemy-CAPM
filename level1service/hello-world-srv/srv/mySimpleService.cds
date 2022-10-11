using myCompany.hr.lms from '../db/Students';

service exportSRV {
    @readonly entity GetStudent as projection on lms.Students;
    @updateonly entity UpdateStudent as projection on lms.Students;
    @insertonly entity InsaartStudent as projection on lms.Students;
    @deleteonly entity DeleteStudent as projection on lms.Students;
}