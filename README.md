## TalkBot
Twilio Session Managment System.

##Usage
1. Generate and api_key for your application
2. While creating orders/event send a copy of details to Talkbot as POST request
    * While POSTing api_key as `token` in the  header to authenticate your application.
    * The details of the order/event should be passed as params along with above mentioned token in the header file.
    * The crul equivalent of the above mentioned post request is as follows

    `curl -v -H 'Authorization: Token token="0eb60c38d4b813dd65faa4602a11f253", non="abc"' -X POST -d 'user[uid_caller]=123&user[uid_receiver]=123&meeting[order_id]=55&meeting[duration]=9&meeting[start_at]="31-12-2014"&caller[name]="Hari"&caller[number]=123456789&receiver[name]="Machi"&receiver[number]=588974456'  http://localhost:3000/api/v1/meetings`

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
    
    `http://localhost:3000/sessions?acc_tok=BAhJIggxMjMGOgZFVA==--45a45db915efc4dd9e79e15c6d7cc54cca9be868`

  Now the user will be signed in and he can manage his sessions.
    
