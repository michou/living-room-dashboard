<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Meteo cu Busu</title>
	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600|Roboto:400,300,500|Raleway:400,300,500,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="/static/css/weather-icons.css">
	<style>
	.huge {
		font-size: 3em;
	}
	.left {
		float: left;
		border-right: 0.2em solid transparent;
	}
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
	</style>
</head>
<body>
	<div class="backdrop">
			<div class="forecast">
				<div class="card now">
					<div class="icon"><i class="wi wi-owm-day-500"></i></div>
					<div class="temperature">27&deg;C</div>
					<div class="description">Cer noros</div>
				</div>
				<div class="slug">
					<div class="time">
						09:00
					</div>
					<div class="details">
						<i class="wi wi-owm-day-800"></i>
						20&deg;C Cer senin
					</div>
				</div>
				<div class="slug">
					<div class="time">
						12:00
					</div>
					<div class="details">
						<i class="wi wi-owm-day-803"></i>
						28&deg;C Cer fragmentat
					</div>
				</div>
				<div class="slug">
					<div class="time">
						15:00
					</div>
					<div class="details">
						<i class="wi wi-owm-day-800"></i>
						32&deg;C Cer senin
					</div>
				</div>
				<div class="slug">
					<div class="time">
						18:00
					</div>
					<div class="details">
						<i class="wi wi-owm-day-800"></i>
						36&deg;C Cer senin
					</div>
				</div>
				<div class="slug">
					<div class="time">
						21:00
					</div>
					<div class="details">
						<i class="wi wi-owm-day-500"></i>
						35&deg;C Ploaie ușoară
					</div>
				</div>
				<div class="slug">
					<div class="time">
						00:00
					</div>
					<div class="details">
						<i class="wi wi-owm-day-500"></i>
						23&deg;C Ploaie ușoară
					</div>
				</div>
				<div class="slug">
					<div class="time">
						03:00
					</div>
					<div class="details">
						<i class="wi wi-owm-night-803"></i>
						22&deg;C Cer fragmentat
					</div>
				</div>
				<div class="slug">
					<div class="time">
						06:00
					</div>
					<div class="details">
						<i class="wi wi-owm-night-500"></i>
						19&deg;C Ploaie ușoară
					</div>
				</div>
			</div>
	</div>
	<style>
	.card {
		/*float: left;*/
		padding: 2em;
		/*font-family: 'Source Sans Pro', sans-serif;*/
		/*font-family: 'Roboto', sans-serif;*/
		font-family: 'Raleway', sans-serif;
		font-weight: 500;
		border: 1px solid black;
		text-align: center;
		font-size: 36px;
	}
	.card.now {
		clear: both;
	}
	.card .icon {
		font-size: 2em;
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
</body>
</html>