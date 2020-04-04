import os
import strformat
import json
import httpclient

proc post(url: string, body: JsonNode): void =
  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json" })
  
  discard client.request(
    url,
    httpMethod = HttpPost,
    body = $body
  )  
  client.close()

proc sendText(number: string, message: string): void =
  post(os.getEnv("TILL_URL"), %*{
    "phone": [number],
    "test": message
  })

when isMainModule:
  let name = os.getEnv("NAME")
  let phoneNumber = os.getEnv("PHONE_NUMBER")

  sendText(phoneNumber, fmt"Hello, {name}")
