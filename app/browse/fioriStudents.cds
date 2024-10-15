using sap.cap.school as school from '../../db/schema';

annotate school.students with @UI: {
    SelectionFields: [
        email,
        first_name
    ],
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: email,
            Label: 'Email'
        },
        {
            $Type: 'UI.DataField',
            Value: first_name,
            Label: 'First Name'
        }
    ],
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Student',
        TypeNamePlural: 'Students',
        Title         : {Value: first_name},
        Description   : {Value: email}
    },
};
