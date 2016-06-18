% if 'error' in current:
	<strong>EROARE {{current['error']}}</strong>
% else:
	<div class="card now">
		<div class="icon"><i class="wi {{current['icon']}}"></i></div>
		<div class="temperature">{{current['temp']}}&deg;C</div>
		<div class="description">{{current['description']}}</div>
	</div>
% end

% if 'error' in forecast:
<strong>EROARE {{forecast['error']}}</strong>
% else:
	% for e in forecast:
	<div class="slug">
		<div class="time">
			{{e['time']}}
		</div>
		<div class="details">
			<i class="wi wi-fw {{e['icon']}}"></i>
			{{e['temp']}}&deg;C {{e['description']}}
		</div>
	</div>
	% end
% end