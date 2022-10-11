using myCompany.hr.lms from '../db/Students';

service exportSRV @(path: 'lms') {
    @readonly entity GetStudent as projection on lms.Students;
    @updateonly entity UpdateStudent as projection on lms.Students;
    @insertonly entity InsertStudent as projection on lms.Students;
    @deleteonly entity DeleteStudent as projection on lms.Students;
}

// extending our service with more additional functionalities
extend service exportSRV with {
    @readonly entity CustomGetStudent as select from lms.Students{
        *,
        first_name || ' ' || last_name as full_name: String
    } excluding {
        date_sign_up
    };
}