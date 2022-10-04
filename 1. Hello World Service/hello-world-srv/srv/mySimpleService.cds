using myCompany.hr.lms from '../db/Students';

service exportSRV {
    @readonly entity Students as projection on lms.Students;
    function somesrv (msg:String) returns String;
}