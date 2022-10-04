namespace myCompany.hr.lms;
    entity Students {
        key email : String(65) @(title: 'Email');
        first_name : String(20) @(title: 'First Name');
        last_name : String(20) @(title: 'Last Name');
        date_sign_up : Date @(title: 'Date Joined');
    }
