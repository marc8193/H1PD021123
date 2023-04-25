# Python 3 server example
from http.server import BaseHTTPRequestHandler, HTTPServer

hostName = "localhost"
serverPort = 1234

class WebServer(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(open("index.html", "rb").read())
        
        elif self.path == "/img.png":
            self.send_response(200)
            self.send_header("Content-type", "image/png")
            self.end_headers()
            self.wfile.write(open("img.png", "rb").read())

def main():
    webServer = HTTPServer((hostName, serverPort), WebServer)
    print(f"Server started http://{hostName}:{serverPort}")

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        webServer.server_close()
        print("Server stopped.")

if __name__ == "__main__":
    main()        