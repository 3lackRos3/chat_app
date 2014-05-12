## TalkBot
Twilio Session Managment System.

##Usage
1. Generate an api_key for your application
2. While creating orders/event send a copy of details to Talkbot as POST request
    * While POSTing api_key as `token` in the  header to authenticate your application.
    * The details of the order/event should be passed as params along with above mentioned token in the header file.
    * The curl equivalent of the above mentioned post request is as follows

      `curl -v -H 'Authorization: Token token="4dee88b4ca2b65b98f52e27e3a3ce250"' -X POST -d 'user[uid_caller]=1222&user[uid_receiver]=56712&meeting[order_id]=551&meeting[duration]=9&meeting[start_at]=31-12-2014 5:00 PM&caller[name]=cane&caller[number]=123456789&caller[call_type]=Phone&receiver[name]=tommy&receiver[number]=588974456&receiver[call_type]=Browser'  http://77.245.75.194:4000/api/v1/meetings`

|   Params         |                      Need                                |
|------------------|----------------------------------------------------------|
| uniq_caller_id   | unique id to represent that caller(user id) eg: `u29if`  |
| uniq_receiver_id | unique id to represent that receiver(user id)            |
| order_id         | order/event/session id as stored in your application     |
| duration         | duration of that order/event/session                     |
| name_of_caller   | name of the caller(user)                                 |
| nubmber          | number of the caller                                     |
| name_of_receiver | name of the receiver(user)                               |
| number           | number of the receiver                                   |


4. In response to the creating the user and order we will send back json data which contains encrypted_caller_id and encrypted_receiver_id in json format

    `{
      "meeting_id":5,
      "encrypted_caller_id":"BAhJIggxMjMGOgZFVA==--45a45db915efc4dd9e79e15c6d7cc54cca9be868",
      "encrypted_receiver_id":"BAhJIgg1NjcGOgZFVA==--0f77e1ef6757389e81669f59ece1ae259832436d"
    }`

5. Store those data in your application.
6. Log in the user into TalkBot by POSTing the encrypted_caller/receiver_id as follows
    
    `http://appdomain.com/sessions?acc_tok=BAhJIggxMjMGOgZFVA==--45a45db915efc4dd9e79e15c6d7cc54cca9be868`

  Now the user will be signed in and he can manage his sessions.
    
