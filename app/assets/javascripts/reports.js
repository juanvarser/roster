var handleReport = function(result){
	
	var labels = [];

	result.events.forEach(function appendLabels(event){
		labels.push(event.event_date)
	});

	var getReceive = function(){
		var receive = [];
		result.events.forEach(function appendData(event){
			var total = 0;
			event.payload[0].forEach(function appendData(value){
			total += value.amount;
			});
            receive.push(total);
		});
        
		return receive;
	};

	var getExpense = function(){
		var receive = [];
		result.events.forEach(function appendData(event){
			var total = 0;
			event.payload[1].forEach(function appendData(value){
				total += value.amount;
			});
            receive.push(total);
		});

		return receive;
	};

	var data = {
    labels: labels,
    datasets: [
        {
            label: "Receive Label",
            fillColor: "rgba(151,205,118,0.2)",
            strokeColor: "rgba(151,205,118,1)",
            pointColor: "rgba(151,205,118,1)",
            pointStrokeColor: "#97cd76",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,205,118,1)",
            data: getReceive()
        },
        {
            label: "Expense Label",
            fillColor: "rgba(237,108,99,0.2)",
            strokeColor: "rgba(237,108,99,1)",
            pointColor: "rgba(237,108,99,1)",
            pointStrokeColor: "#ed6c63",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(237,108,99,1)",
            data: getExpense()
        }
    ]
};

	var options = {

    ///Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines : true,

    //String - Colour of the grid lines
    scaleGridLineColor : "rgba(0,0,0,.05)",

    //Number - Width of the grid lines
    scaleGridLineWidth : 1,

    //Boolean - Whether to show horizontal lines (except X axis)
    scaleShowHorizontalLines: true,

    //Boolean - Whether to show vertical lines (except Y axis)
    scaleShowVerticalLines: true,

    //Boolean - Whether the line is curved between points
    bezierCurve : true,

    //Number - Tension of the bezier curve between points
    bezierCurveTension : 0.7,

    //Boolean - Whether to show a dot for each point
    pointDot : true,

    //Number - Radius of each point dot in pixels
    pointDotRadius : 4,

    //Number - Pixel width of point dot stroke
    pointDotStrokeWidth : 1,

    //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
    pointHitDetectionRadius : 20,

    //Boolean - Whether to show a stroke for datasets
    datasetStroke : true,

    //Number - Pixel width of dataset stroke
    datasetStrokeWidth : 2,

    //Boolean - Whether to fill the dataset with a colour
    datasetFill : true,

    //String - A legend template
    legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

	};

	var ctx = document.getElementById("myChart").getContext("2d");
	var myLineChart = new Chart(ctx).Line(data, options);

    var appendTable = function(){

        result.events.forEach(function appendLabels(event){

            var getReceive = function(){
                var receive = [];
                    var total = 0;
                    event.payload[0].forEach(function appendData(value){
                        total += value.amount;
                    });
                    receive.push(total);
                return receive;
                };

            var getExpense = function(){
                var receive = [];
                    var total = 0;
                    event.payload[1].forEach(function appendData(value){
                        total += value.amount;
                    });
                    receive.push(total);
                return receive;
                };

            var getCommission = function(){ 
                return (getReceive() - getExpense()) * (result.management_comission / 100)
            };

            var html = [
                '<tr>',
                    '<td>' + event.event_date + '</td>',
                    '<td>' + getReceive() + '</td>',
                    '<td>' + getExpense() + '</td>',
                    '<td>' + getCommission() + '</td>',
                '</tr>'
            ].join('\n');   
                            
            $('#event-table-report').append(html);

        });

    }();

};

var getEventReport = function(){
    var base_url = window.location.host;
    var api_resource = window.location.pathname.split("/");

    $.ajax({
        method: 'GET',    
        url: window.location.protocol + base_url + '/users/'+ api_resource[2] + '/bands/' + api_resource[4] + '/events_report',
        success: handleReport,
        error: function(data){console.log(data)},
        dataType: 'json'
    });
};

$(document).on('ready', function(){
    getEventReport();
})