<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Meteo cu Busu</title>
	<link rel="stylesheet" href="/static/css/weather-icons.css">
	<style>
	.huge {
		font-size: 3em;
	}
	.left {
		float: left;
		border-right: 0.2em solid transparent;
	}
	</style>
</head>
<body>
	% if 'error' in current:
	<strong>EROARE {{current['error']}}</strong>
	% else:
	<h1><i class="wi huge {{current['icon']}}"></i></h1>
	<p>{{current['description']}}, {{current['temp']}}&deg;C</p>
	<p>Vânt: {{current['wind']}}m/s</p>
	% end

		% if 'error' in forecast:
		<strong>EROARE {{forecast['error']}}</strong>
		% else:
			% for e in forecast:
			<div class="left">
			<h2>{{e['time']}}</h2>
			<p><i class="wi wi-fw left huge {{e['icon']}}"></i> {{e['description']}}, {{e['temp_min']}}&deg;C / {{e['temp_max']}}&deg;C</p>
			<p>Vânt: {{e['wind']}}m/s</p>
			<hr>
			</div>
			% end
		% end
</body>
</html>