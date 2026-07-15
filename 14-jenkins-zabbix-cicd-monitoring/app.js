const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "text/plain" });
    res.end("Jenkins CI/CD Pipeline Working Successfully!\n");
});

server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
