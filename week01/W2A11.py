min, hour = map(int, input().split())
sec = min*60 + hour*3600 # Convert hours and minutes to seconds
print(sec) 