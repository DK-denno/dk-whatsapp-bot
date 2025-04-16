import json
import requests
import os
from chatbot_session_flow.models import Session

def test():
    print("Hellow :-> ")

def formatRequest():
    print("Hellow formatRequest :-> ")
    pass

def sendWhatsappMessage(session, phoneNumber, message):
    print("Send Whatsapp Message {} for {} ".format(phoneNumber, message))
    url = "https://ngumzo.com/v1/send-message"

    payload = json.dumps({
        # "sender": "254716554593",
        "sender": "254783211317",
        "recipient": phoneNumber,
        "message": message
    })
    headers = {
        'Content-Type': 'application/json',
        'api-key': os.environ.get('NGUMZO_API_KEY')
    }

    response = requests.request("POST",
        url, headers=headers, data=payload)
    res = response.text
    print(res)
    return res

def clearSession(*args, **kwargs):
    print("clear session over here ")
    pass