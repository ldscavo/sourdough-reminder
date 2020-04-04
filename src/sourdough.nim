import os
import strformat
import json
import httpclient

proc sendText(number: string, message: string): void =
  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json" })
  let body = %*{
    "phone": [number],
    "test": message
  }
  let response = client.request(
    os.getEnv("TILL_URL"),
    httpMethod = HttpPost,
    body = $body
  )
  echo response.status

when isMainModule:
  let name = os.getEnv("NAME")
  let phoneNumber = os.getEnv("PHONE_NUMBER")

  sendText(phoneNumber, fmt"Hello, {name}")
