# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/mitmproxy/mitmproxy.png" width="48" height="48"/> [mitmproxy](https://chocolatey.org/packages/mitmproxy)

## Features
### Command Line
mitmproxy is your swiss-army knife for debugging, testing, privacy measurements, and penetration testing. It can be used to intercept, inspect, modify and replay web traffic such as HTTP/1, HTTP/2, WebSockets, or any other SSL/TLS-protected protocols. You can prettify and decode a variety of message types ranging from HTML to Protobuf, intercept specific messages on-the-fly, modify them before they reach their destination, and replay them to a client or server later on.

### Web Interface
Use mitmproxy's main features in a graphical interface with mitmweb. Do you like Chrome's DevTools? mitmweb gives you a similar experience for any other application or device, plus additional features such as request interception and replay.

### Python API
Write powerful addons and script mitmproxy with mitmdump. The scripting API offers full control over mitmproxy and makes it possible to automatically modify messages, redirect traffic, visualize messages, or implement custom commands.

addon.py
``
from mitmproxy import http
def request(flow: http.HTTPFlow):
    # redirect to different host
    if flow.request.pretty_host == "example.com":
        flow.request.host = "mitmproxy.org"
    # answer from proxy
    elif flow.request.path.endswith("/brew"):
      flow.response = http.HTTPResponse.make(
            418, b"I'm a teapot",
        )
``

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/mitmproxy/screenshot.png)