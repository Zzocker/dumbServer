const http = require('http');

const PORT = 8080;

const requestListener = function (req, res) {
  res.writeHead(200);
  res.end('pong');
}

const server = http.createServer(requestListener);
server.listen(PORT);
// 13389.48 1000
// 13013.84 1000
// 13163.64 1000