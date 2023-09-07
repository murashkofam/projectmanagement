using ProjectManagementService as service from '../../srv/projectmanagement-service';

annotate service.Projects with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Logo',
            Value : imageUrl,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Project name',
            Value : name,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Project description',
            Value : description,
        },
                {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
            Criticality : criticality,
            CriticalityRepresentation : #WithoutIcon,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Start date',
            Value : startDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'End date',
            Value : endDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Number of tickets',
            Value : tasksCount,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ProjectManagementService.complete',
            Label : 'Complete',
            Inline : true,
            ![@UI.Importance] : #High,
        }
    ]
);

annotate service.Projects with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Project name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Project description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
                Criticality : criticality,
                CriticalityRepresentation : #WithoutIcon,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Start date',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'End date',
                Value : endDate,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedGroup1',
            Label : 'Project details',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Tasks',
            Target : 'tasks/@UI.LineItem#Tasks',
            Label : 'Tasks',
        },
    ]
);
annotate service.Projects with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : 'Project',
        TypeNamePlural : 'Projects',
        Description : {
            $Type : 'UI.DataField',
            Value : status,
        },
    }
);

annotate service.Projects with @odata.draft.enabled;
annotate service.Tasks with @odata.draft.enabled;

annotate service.Projects with {
    status @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Projects',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status,
                    ValueListProperty : 'status',
                },
            ],
            Label : 'Project Status',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Tasks with @(
    UI.LineItem #Tasks : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'Title',
            ![@UI.Importance] : #High,
        },{
            $Type : 'UI.DataField',
            Value : status,
            Label : 'Status',
            Criticality : criticality,
            CriticalityRepresentation : #WithoutIcon,
            ![@UI.Importance] : #High,
        },{
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : asignee.name,
            Label : 'Asignee',
        },]
);
annotate service.Tasks with @(
    UI.FieldGroup #TaskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
                Criticality : criticality,
                CriticalityRepresentation : #WithoutIcon,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'asignee/@Communication.Contact#contact',
                Label : 'Asignee',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'TaskDetails',
            Label : 'Task details',
            Target : '@UI.FieldGroup#TaskDetails',
        },
    ]
);
annotate service.Tasks with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : 'Task',
        TypeNamePlural : 'Tasks',
    }
);
annotate service.Users with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : name,
        email : [
            {
                $Type : 'Communication.EmailAddressType',
                type : #work,
                address : email,
            },
        ],
    }
);

annotate service.Tasks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'Title',
        },{
            $Type : 'UI.DataField',
            Value : status,
            Label : 'Status',
        },{
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : asignee.name,
            Label : 'Asignee',
        },]
);

annotate service.Users with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name',
        },{
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email',
        },
        ]
);

annotate service.Projects with @(
    UI.SelectionPresentationVariant #table1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : startDate,
                    Descending : true,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View 0',
    }
);
annotate service.Projects with @(
    UI.SelectionFields : [
        status,
        tasksCount,
    ]
);

annotate service.Projects with {
    status @Common.Label : 'Status'
};

annotate service.Projects with {
    tasksCount @Common.Label : 'Number of tickets'
};
