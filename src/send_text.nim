import strformat

proc sendText*(number: string, message: string): void =
  echo fmt"Sent '{message}' to {number}"