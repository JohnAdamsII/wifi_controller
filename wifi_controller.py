import datetime
import subprocess
import time
 
while (True):
	d = datetime.datetime.now()

	# check if weekday
	is_week_day = d.isoweekday() in range (1,6)

	# check if hour between 11 PM and 4 AM
	is_past_weekday_curfew = d.hour >= 23 or d.hour <= 4

	# check if hour between 1 AM and 4 AM
	is_past_weekend_curfew = d.hour >= 1 and d.hour <= 4

	if is_week_day and is_past_weekday_curfew:
		print "Killing Wifi"

	elif not is_week_day and is_past_weekend_curfew:
		print "Killing wifi"
	else:
		time.sleep(60)
	


