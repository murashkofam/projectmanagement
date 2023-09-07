sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectmanagement/test/integration/FirstJourney',
		'projectmanagement/test/integration/pages/ProjectsList',
		'projectmanagement/test/integration/pages/ProjectsObjectPage',
		'projectmanagement/test/integration/pages/TasksObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectsList, ProjectsObjectPage, TasksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectsList: ProjectsList,
					onTheProjectsObjectPage: ProjectsObjectPage,
					onTheTasksObjectPage: TasksObjectPage
                }
            },
            opaJourney.run
        );
    }
);