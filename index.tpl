<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Meteo cu Busu</title>
	<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="/static/css/weather-icons.css">
	<style>
	html, body {
		margin: 0;
		padding: 0;
		font-family: sans-serif;
	}
	.backdrop {
		background: url('https://farm7.staticflickr.com/6203/6074810680_d4bb65667e_o_d.jpg');
		background-size: cover;
		border: 1px solid black;
		width: 1440px;
		height: 900px;
		overflow: auto;
	}
	.card {
		/*float: left;*/
		padding: 1.5em;
		/*font-family: 'Source Sans Pro', sans-serif;*/
		/*font-family: 'Roboto', sans-serif;*/
		font-family: 'Raleway', sans-serif;
		font-weight: 500;
		border: 1px solid black;
		text-align: center;
		font-size: 36px;
	}
	.card .icon {
		font-size: 3em;
	}
	.slug {
		border: 1px solid black;
		font-family: 'Raleway', sans-serif;
		font-size: 24px;
		margin-top: .4em;
		/*float: left;*/
		/*display: inline-block;*/
	}
	.slug .time {
		text-align: center;
		font-weight: 700;
		background: silver;
		width: 3em;
	}
	.slug .details {
		font-weight: 300;
	}
	.slug .details,
	.slug .time {
		display: inline-block;
		padding: .5em;
	}
	.card,
	.slug {
		background-color: rgba(255, 255, 255, 0.75);
	}
	.forecast {
		display: inline-block;
		padding: 1em 0 0 1em;
	}
	</style>
	</style>
</head>
<body>
	<div class="backdrop">
		<div class="forecast">
		</div>
	</div>
	<script>
	function replaceCurrentForecast(newForecastMarkup) {
		var parent = document.querySelector('.forecast');
		parent.innerHTML = newForecastMarkup;
	}
	function asyncRefresh(finalCallback) {
		var req = new XMLHttpRequest();
		req.addEventListener("load", function() {
			replaceCurrentForecast(this.responseText);
			if (finalCallback) {
				setInterval(finalCallback, 1000 * 60 * 30 /* 30 min */);
			}
		});
		req.open("GET", "/data");
		req.send();
	}
	document.addEventListener('DOMContentLoaded', function() {
		asyncRefresh(asyncRefresh);
	})
	</script>
</body>
</html>