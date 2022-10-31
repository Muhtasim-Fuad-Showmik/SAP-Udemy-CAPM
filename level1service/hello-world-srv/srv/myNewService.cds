using myCompany.hr.lms from '../db/Students';
using exportSRV as exportSRV from './mySimpleService';

// extending our service with more additional functionalities
extend service exportSRV with @(path:'lms',impl:'./myNewService.js') {
    @readonly entity CustomGetStudent as select from lms.Students{
        *,
        first_name || ' ' || last_name as full_name: String
    } excluding {
        date_sign_up
    };
}