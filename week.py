#What day today
from datetime import datetime, timedelta
import re

#from datetime import date
#now = datetime.datetime.now()
week   = [    'Monday', 
              'Tuesday', 
              'Wednesday', 
              'Thursday',  
              'Friday', 
              'Saturday', 
              'Sunday']
#print week[datetime.datetime.today().weekday()]
#print datetime.datetime.today().weekday()

#Plan for each day
# open/close file
#open('inf2.txt', 'w').close()

#inputfile = open("inf.txt", 'r').read()

open('week.ics', 'w').close()
outputfile = open("week.ics", "w")
outputfile.write("BEGIN:VCALENDAR\nVERSION:2.0")
go = 1
weekd = datetime.today().weekday()
workday = ""
nowday = datetime.now().strftime("%Y%m%d") #string to date
countday = 0
if weekd == 4:
	numbers = "%s" % ((datetime.now() + timedelta(days=countday)).strftime("%Y%m%d"))
	weekd = 5
while go == 1 :
	print week[weekd]
	numbers = "%s" % ((datetime.now() + timedelta(days=countday)).strftime("%Y%m%d"))
	if weekd == 4:
		#if countday != 0 :
			go = 0
			workday = workday + """
BEGIN:VEVENT
DTSTART:%sT120000Z
DTEND:%sT130000Z
SUMMARY:Planning: Calendar work and week.py
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT120000Z
DTEND:%sT130000Z
SUMMARY:Economy:1. SEB 2. www.skatteverket.se 3. www.csn.se/minasidormobil 4. https://auth2.forsakringskassan.se/necs/mbidlogon.jsp?TARGET=https://www.forsakringskassan.se/wps/myportal/privatpers/minasidor
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT140000Z
DTEND:%sT150000Z
SUMMARY:Food planning for next week
END:VEVENT
""" % (numbers, numbers, numbers, numbers,numbers, numbers)
	#if weekd < 6 and countday != 0:
	if weekd < 6 or countday < 14 :
		workday = workday + """
BEGIN:VEVENT
DTSTART:%sT024500Z
DTEND:%sT025900Z
SUMMARY:Possible to blues-sing about "going up" ; else planned moves in GO :: walk the dog + voice voice worm up -- (sirine i-o :: ba ba ba :: lip-farting :: la la la la :: rrrrrr :: sighing with bird flying and deep-breath) :: in toilet: exercise:Wim hoff(30 strong inhales) + reboot :: social mail :: Prepare diapers for the day :: Check activites at home.
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT031500Z
DTEND:%sT032900Z
SUMMARY:Charge: I brew coffee/tea and smell it :: II field of view (quadrans), torch test :: III ptosis? :: IV eye: adduct, up :: V gape and bite, clean head, eye, teeth :: VI eye:abduct=look behind :: VII (central and taste:smile, rins cheeks with salt water) ; Grimace - (peripheral: forehead, bottom eyelid, and symptoms as in central) :: VIII balance on one leg :: IX taste tooth brush, tongue blub :: X valsalva maneuver :: XI shrug shoulders :: XII swollow chili  
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT033000Z
DTEND:%sT034500Z
SUMMARY:Going to bus the station.
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT040000Z
DTEND:%sT060000Z
SUMMARY:20min work/5min tidy ; Charge (read topic from Sammanfattningar -> blog -> list questions -> ask social forum) / Shoot (fix other things)
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT070000Z
DTEND:%sT115900Z
SUMMARY:Repeat memory palace.
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT120000Z
DTEND:%sT140000Z
SUMMARY:20min work/5min tidy ; Charge (read topic from Sammanfattningar -> blog -> list questions -> ask social forum) / Shoot (fix other things)
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT190000Z
DTEND:%sT195900Z
SUMMARY:Prepare: dog food :: tea :: breakfast :: clothes :: watch and tidy up :: TEST
END:VEVENT

BEGIN:VEVENT
DTSTART:%sT200000Z
DTEND:%sT220000Z
SUMMARY:Prepare: alarms :: go through the morning routines, what is the first thing I should do in the morning? :: fire meditation :: relax body :: 4-7-8 breathing technique
END:VEVENT
""" % (numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers, numbers)

	#What days to delete

	#Put new days in ICS
	#workday = workday.strip('\t')
	weekd = weekd + 1
	if weekd==7:
		weekd=0
	countday=countday + 1
pattern = re.compile(r'[\n\r]\s*(?=[\n\r])',re.MULTILINE)
workday = pattern.sub('', workday)
pattern = re.compile(r'\s*(?=[\n\r])',re.MULTILINE)
workday = pattern.sub('', workday)
outputfile.write(workday)
outputfile.write("END:VCALENDAR")
outputfile.close()



