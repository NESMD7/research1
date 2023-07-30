from robotremoteserver import RobotRemoteServer
from ExchangeLibrary import ExchangeLibrary

# Create an instance
ExchangeLibrary = ExchangeLibrary()

# Create a remote server and serve the library's keywords
server = RobotRemoteServer(ExchangeLibrary, host='localhost', port=8270)
server.serve()
