import os
import strformat
import json
import httpclient

proc post(url: string, body: JsonNode): void =
  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json" })
  
  echo fmt"Sending the request to {url}"
  
  let response = client.request(
    url,
    httpMethod = HttpPost,
    body = $body
  )
  
  if response.code == Http200:
    echo "Successfully sent request!"
  else:
    echo "Something went wrong"
    echo fmt"Response: {response.body}"
    
  client.close()

proc sendText(number: string, message: string): void =
  post(os.getEnv("TILL_URL"), %*{
    "phone": [number],
    "text": message
  })

when isMainModule:
  let name = os.getEnv("NAME")
  let phoneNumber = os.getEnv("PHONE_NUMBER")

  sendText(phoneNumber, fmt"Hello, {name}")