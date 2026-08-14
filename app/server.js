const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
    res.writeHead(200, {
        "Content-Type": "text/html"
    });

    res.end(`
        <html>
            <head>
                <title>AutoDeploy</title>
            </head>

            <body style="font-family: Arial; text-align: center; padding-top: 100px;">
                <h1>AutoDeploy</h1>
                <h2>DevOps Project is Running!</h2>

                <p>Application: AutoDeploy</p>
                <p>Version: 1.0.0</p>
                <p>Status: Running</p>
                <p>vishnu s</p>
            </body>
        </html>
    `);
});

server.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});