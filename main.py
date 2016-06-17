import requests
import json
from bottle import get, run, template, static_file
import os
from datetime import datetime, timedelta

UTC_OFFSET = timedelta(hours=3)

CURRENT_CONDITION_TEMPLATE = 'http://api.openweathermap.org/data/2.5/weather?id=%s&appid=%s&units=metric&lang=ro'
FORECAST_TEMPLATE = 'http://api.openweathermap.org/data/2.5/forecast?id=%s&appid=%s&units=metric&lang=ro&cnt=8'

class Configuration(object):
	"""docstring for Configuration"""
	def __init__(self, config_path):
		super(Configuration, self).__init__()

		config_file = open(config_path)
		config_json = json.load(config_file)

		self.weather_api_key = config_json['weather_api_key']
		self.location_id = config_json['location_id']

def get_icon_name(condition_json):
	tod_prefix = 'day' if condition_json['icon'][-1] == 'd' else 'night'
	return 'wi-owm-%s-%s' % (tod_prefix, condition_json['id'])

def get_current_condition_payload(observation_json):
	result = {}
	result['temp'] = observation_json[u'main'][u'temp']
	result['icon'] = get_icon_name(observation_json['weather'][0])
	result['description'] = observation_json['weather'][0]['description'].capitalize()
	result['wind'] = observation_json['wind']['speed']

	return result

def get_forecast_payload(forecast_json):
	result = []
	for single_json in forecast_json['list']:
		entry = {}
		entry['temp_min'] = single_json['main']['temp_min']
		entry['temp_max'] = single_json['main']['temp_max']
		entry['icon'] = get_icon_name(single_json['weather'][0])
		entry['description'] = single_json['weather'][0]['description'].capitalize()
		entry['wind'] = single_json['wind']['speed']
		local_time = datetime.fromtimestamp(single_json['dt']) + UTC_OFFSET
		entry['time'] = local_time.time().strftime("%H:%M")

		result.append(entry)

	return result

def fetch_current_conditions(conf):
	endpoint = CURRENT_CONDITION_TEMPLATE % (conf.location_id, conf.weather_api_key)
	print 'fetching current: ', endpoint

	response = requests.get(endpoint)
	print response

	if response.status_code == 200:
		return get_current_condition_payload(response.json())
	else:
		return { 'error': response.status_code }

def fetch_forecast(conf):
	endpoint = FORECAST_TEMPLATE % (conf.location_id, conf.weather_api_key)
	print 'fetching forecast', endpoint
	response = requests.get(endpoint)
	print response

	if response.status_code == 200:
		return get_forecast_payload(response.json())
	else:
		return { 'error': response.status_code }

@get('/')
def index():
	# current_json =  fetch_current_conditions(conf)
	# forecast_json = fetch_forecast(conf)

	current_payload = fetch_current_conditions(conf)
	forecast_payload = fetch_forecast(conf)

	return template('index.tpl',
		current=current_payload,
		forecast=forecast_payload
		)

@get('/mock')
def mock():
	return template('mock.tpl')

@get('/static/<path:path>')
def asset(path):
	return static_file(path, os.path.abspath('.'))

conf = Configuration('config.json')

if __name__ == '__main__':
	run(host='localhost', port=8083, reloader=True, debug=True)

