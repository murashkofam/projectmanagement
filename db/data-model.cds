namespace my.projectmanagement;

using { cuid } from '@sap/cds/common';


entity Projects: cuid {
    name: String;
    description: String;
    status: Status;
    startDate: Date;
    endDate: Date;
    tasks: Association to many Tasks on tasks.project = $self;
    @UI.IsImageURL imageUrl: String;
    criticality: Integer;
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
    status: Status;
    project: Association to one Projects;
    asignee: Association to one Users;
    criticality: Integer;
}

type Status : String enum {
    PLANNED; 
    IN_PROGRESS; 
    COMPLETED;
}