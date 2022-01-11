import sys
from PIL import Image, ImageDraw, ImageFont

loc = sys.argv[1][8:][:-1]
loc=loc.replace("%20"," ")
# loc=loc.replace("(","\(")
# loc=loc.replace(")","\)")
print(loc)




img = Image.open(loc)
font = ImageFont.truetype('font/OpenSans-Regular.ttf',90)
text = "Testing"
imgNew = ImageDraw.Draw(img)
imgNew.text((2320,40), text, (0, 255, 220), font=font)

index = loc.rindex('/')
# print(dir)

dirSave = loc[:index+1]
img.save(dirSave+"result.jpg")



