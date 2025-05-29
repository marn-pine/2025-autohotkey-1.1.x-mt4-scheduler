#                                                   old update  10-Dec-24    
#                                                   last update 15-May-25
#

# compile .py to .exe
# pip install pyinstaller 
# pyinstaller --onefile --noconsole pushbullet-mt4-opened.py --distpath .\

# pip install pushbullet-python
from pushbullet import API

def Push_Bullet(head, msg):
    access_token = "your PushBullet token"
    api = API()
    api.set_token(access_token)
    api.send_note(head, msg)

Push_Bullet("MT4" , "OPENED")