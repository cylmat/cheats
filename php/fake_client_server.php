<?php

/**
 * SERVER
 */
$server = stream_socket_server('tcp://127.0.0.1:8080');
if (false === $server) {/* ... */}

while (($conn = stream_socket_accept($server, -1))) {
    $str = "Hi!";
    fwrite($conn, "HTTP/1.1 200 OK\r\n");
    fprintf($conn, "Content-Length: %d\r\n", strlen($str));
    fwrite($conn, "\r\n");
    fwrite($conn, $str);
    fclose($conn);
}

/**
 * CLIENT
 */
$ip = gethostname('sample.com');
$client = stream_socket_client("tcp://$ip:80");
if (false !== $client) {

}

fwrite($client, "GET / HTTP/1.1\n\r");
fwrite($client, "Host: sample.com\n\r");
fwrite($client, 'User-Agent: Someone');
fwrite($client, '\n\r');

while (!$feof($client)) {
    echo fgets($client);
}
fclose($client);
