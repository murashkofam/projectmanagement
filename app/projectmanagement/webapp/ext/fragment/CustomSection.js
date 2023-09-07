sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onPress: function(oStartDate, oEndDate) {
            var startDate = new Date(oStartDate);
            var endDate = new Date(oEndDate);
            var duration = (endDate - startDate) / (1000 * 60 * 60 * 24);
            
            MessageToast.show("Project duration in days: " + duration);
        }
    };
});
