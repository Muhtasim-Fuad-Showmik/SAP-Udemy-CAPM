using exportStructure as studentService from '../../../srv/mySimpleService';

annotate studentService.GetStudent with @(
        UI:{
            SelectionFields: [email],
            LineItem  : [
                {
                    Label: 'Email',
                    Value: email
                },
                {
                    Label: 'First Name',
                    Value: first_name
                },
                {
                    Label: 'Last Name',
                    Value: last_name
                },
                {
                    Label: 'Date Joined',
                    Value: date_sign_up
                }
            ],
            HeaderInfo : {
                TypeName: 'Student',
                TypeNamePlural: 'Students',
                Title: {
                    Value: first_name
                },
                Description: {
                    Value: email,
                    Label: 'First Name'
                }
            },
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Personal Information',
                    Target: '@UI.FieldGroup#PersonalStudentInfo'
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Enrollment Details',
                    Target: 'enrollment/@UI.LineItem'
                }
            ],
            FieldGroup#PersonalStudentInfo: {
                Data: [
                    {
                        Label: 'First Name',
                        Value: first_name
                    },
                    {
                        Label: 'Last Name',
                        Value: last_name
                    },
                    {
                        Label: 'Email',
                        Value: email
                    },
                    {
                        Label: 'Date Sign Up',
                        Value: date_sign_up
                    }
                ]
            }
        }
    );

    annotate studentService.GetEnrollment with @(
        UI:{
            LineItem  : [
                {
                    Label: 'Enrollment ID',
                    Value: ID
                },
                {
                    Label: 'Course ID',
                    Value: course_ID
                }
            ],
        }
    );