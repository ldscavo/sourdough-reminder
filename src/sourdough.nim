import send_text
import os

when isMainModule:
  echo os.getEnv("NAME")
  sendText("867-5309", "This is a text")
