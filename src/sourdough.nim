import send_text
import dotenv
import os

let env = initDotEnv()
env.load()

when isMainModule:
  echo os.getEnv("NAME")
  sendText("867-5309", "This is a text")
