namespace my.projectmanagement;

using { cuid, sap.common.CodeList } from '@sap/cds/common';


entity Projects: cuid {
    name: String;
    description: String;
    status: Association to one Status;
    startDate: Date;
    endDate: Date;
    tasks: Association to many Tasks on tasks.project = $self;
    @UI.IsImageURL imageUrl: String;
    statusColor: String;
}

entity Users: cuid {
    name: String;
    email: String;
    tasks: Association to many Tasks on tasks.asignee = $self;
}

entity Tasks: cuid {
    title: String;
    description: String;
    status: Association to one Status;
    project: Association to one Projects;
    asignee: Association to one Users;
}

@readonly
entity Status : CodeList {
    key code : String enum {
        PLANNED; 
        IN_PROGRESS; 
        COMPLETED;
    };
    criticality: Integer;
    
}