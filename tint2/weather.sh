 #!/bin/bash

# I take this script from Anachron's i3blocks
# I only slightly modify this script to add an option to show icon, useful for my tint2 executor
# 'weather -i' = with icon, 'weather' = text only
# Cheers!
# Addy

# Open Weather Map API code, register to http://openweathermap.org to get one ;)
API_KEY="73e6ba871d869932ffed1cb851ac9ab0"

# Check on http://openweathermap.org/find
CITY_ID="5746545"

URGENT_LOWER=32
URGENT_HIGHER=100

ICON_SUNNY=" "
ICON_CLOUDY=" "
ICON_RAINY=" "
ICON_STORM=""
ICON_SNOW=" "
ICON_FOG=""
ICON_MISC=" "

TEXT_SUNNY="Clear"
TEXT_CLOUDY="Cloudy"
TEXT_RAINY="Rainy"
TEXT_STORM="Storm"
TEXT_SNOW="Snow"
TEXT_FOG="Fog"

SYMBOL_FARENHEIT="˚F"

WEATHER_URL="http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}&units=imperial"

WEATHER_INFO=$(wget -qO- "${WEATHER_URL}")
WEATHER_MAIN=$(echo "${WEATHER_INFO}" | grep -o -e '\"main\":\"[a-Z]*\"' | awk -F ':' '{print $2}' | tr -d '"')
WEATHER_TEMP=$(echo "${WEATHER_INFO}" | grep -o -e '\"temp\":\-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"')

if [[ "${WEATHER_MAIN}" = *Snow* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_SNOW}"
	else
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_SNOW}"
	fi
elif [[ "${WEATHER_MAIN}" = *Rain* ]] || [[ "${WEATHER_MAIN}" = *Drizzle* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_RAINY}"
	else
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_RAINY}"
	fi
elif [[ "${WEATHER_MAIN}" = *Cloud* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_CLOUDY}"
	else
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_CLOUDY}"
	fi
elif [[ "${WEATHER_MAIN}" = *Clear* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_SUNNY}"
	else
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_SUNNY}"
	fi
elif [[ "${WEATHER_MAIN}" = *Fog* ]] || [[ "${WEATHER_MAIN}" = *Mist* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_FOG}"
	else
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_FOG}"
	fi
else
	if  [[ $1 = "-i" ]]; then
    echo "${WEATHER_MAIN} ${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_MISC}"
	else
    echo "${WEATHER_TEMP}${SYMBOL_FARENHEIT} ${ICON_MAIN}"
	fi	
fi

if [[ "${WEATHER_TEMP}" -lt "${URGENT_LOWER}" ]] || [[ "${WEATHER_TEMP}" -gt "${URGENT_HIGHER}" ]]; then
  exit 33
fi