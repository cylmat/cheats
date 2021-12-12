# PSR SUMMARY
[https://www.php-fig.org/psr]

# PSR-3: Logger Interface
```
interface LoggerInterface {
  public function emergency(string $message, array $context = array()): void; // System is unusable.
  // Action must be taken immediately. Entire website down, database unavailable, etc. 
  public function alert(string $message, array $context = array()): void; 
  // Critical conditions. Application component unavailable, etc.
  public function critical(string $message, array $context = array()): void; 
  // Runtime errors that do not require immediate action but should typically be logged and monitored.
  public function error(string $message, array $context = array()): void; 

  // Exceptional occurrences that are not errors. Use of deprecated APIs, poor use of an API...
  public function warning(string $message, array $context = array()): void; 
  public function notice(string $message, array $context = array()): void; // Normal but significant events.
  public function info(string $message, array $context = array()): void; // Interesting events.
  public function debug(string $message, array $context = array()): void; // Detailed debug information.
  public function log(mixed $level, string $message, array $context = array()): void; // Logs with an arbitrary level.

interface LoggerAwareInterface {
    public function setLogger(LoggerInterface $logger): void;
```
# PSR-4: Autoloading
FQCN: \<NamespaceName>(\<SubNamespaceNames>)*\<ClassName>  
- The fully qualified class name MUST have a top-level namespace name, also known as a "vendor namespace".
- The fully qualified class name MAY have one or more sub-namespace names.
- The fully qualified class name MUST have a terminating class name. (Underscores have no special meaning)
(PSR-0: Each _ character in the CLASS NAME is converted to a DIRECTORY_SEPARATOR)

# PSR-6: Caching Interface
- If it is not possible to return the exact saved value, MUST respond with a cache miss rather than corrupted data.
- An Item represents a single key/value pair within a Pool (a collection of items in a caching system)
```
interface CacheItemInterface {
   public function getKey(): string;
   public function get(): mixed; // can return a "null" cached value
   public function isHit(): bool;
   public function set(mixed $value): static;
   public function expiresAt(\DateTimeInterface|null $expiration): static;
   public function expiresAfter(int|\DateInterval|null $time); // TTL (sec)

interface CacheItemPoolInterface {
   public function getItem(string $key): CacheItemInterface; // @throws InvalidArgumentException
   public function getItems(array $keys = []): @return iterable; // @throws InvalidArgumentException
   public function hasItem(string $key): bool; // @throws InvalidArgumentException
   public function clear();
   public function deleteItem(string $key): bool; // @throws InvalidArgumentException
   public function deleteItems(array $keys): bool; / @throws InvalidArgumentException
   public function save(CacheItemInterface $item): bool;
   public function saveDeferred(CacheItemInterface $item): bool;
   public function commit(): bool;
```

# PSR-7: HTTP Message Interface
 RFC 7230 and RFC 7231
```
interface MessageInterface {
  getProtocolVersion(), withProtocolVersion($version)
  getHeaders(), hasHeader($name), getHeader($name), getHeaderLine($name), 
  withHeader($name, $value), withAddedHeader($name, $value), withoutHeader($name)
  getBody(), withBody(StreamInterface $body)
  
interface RequestInterface extends MessageInterface {
  public function getRequestTarget(): string;
  public function withRequestTarget(mixed $requestTarget): static;
  public function getMethod(): string;
  public function withMethod(string $method): static;
  public function getUri(): UriInterface;
  public function withUri(UriInterface $uri, bool $preserveHost = false): static;
  
interface ServerRequestInterface extends RequestInterface {
  public function getServerParams(): array;
  public function getCookieParams(): array;
  public function withCookieParams(array $cookies): static;
  public function getQueryParams(): array;
  public function withQueryParams(array $query): static;
  public function getUploadedFiles(): array;
  public function withUploadedFiles(array $uploadedFiles): static;
  public function getParsedBody(): null|array|object;
  public function withParsedBody(null|array|object $data): static;
  public function getAttributes(): mixed[];
  public function getAttribute(string $name, mixed $default = null): mixed;
  public function withAttribute($string name, mixed $value): static;
  public function withoutAttribute(string $name): static;

interface ResponseInterface extends MessageInterface {
  public function getStatusCode(): int;
  public function withStatus(int $code, string $reasonPhrase = ''): static;
  public function getReasonPhrase(): string;
  
interface StreamInterface {
  __toString, close, detach, getSize, tell, eof, isSeekable, seek
  rewind, isWritable, write, isReadable, read, getContents, getMetadata
  
interface UriInterface {
  __toString, getScheme, getAuthority([user-info@]host[:port]), getUserInfo, getHost, getPort, 
  getPath, getQuery, getFragment, withScheme, withUserInfo, withHost, withPort, withPath, withQuery, withFragment
  
interface UploadedFileInterface: getStream, moveTo, getSize, getError, getClientFilename, getClientMediaType
```

# PSR-11: Container interface
```
interface ContainerInterface {
  public function get(string $id): mixed; // @throws NotFoundExceptionInterface, ContainerExceptionInterface
  public function has(string $id): bool;
```

# PSR-13: Hypermedia Links (RFC 5988, 6570)
```
interface LinkInterface: getHref, isTemplated, getRels, getAttributes
interface EvolvableLinkInterface: withHref, withRel, withoutRel, withAttribute, withoutAttribute
interface LinkProviderInterface: getLinks, getLinksByRel
interface EvolvableLinkProviderInterface: withLink, withoutLink
```

# PSR-14: Event Dispatcher
Event - Message produced by an Emitter.
Listener - Callable that expects to be passed an Event. 
Emitter - Code that wishes to dispatch an Event. 
Dispatcher - Service object that is given an Event object by an Emitter. 
Listener Provider - Responsible for determining what Listeners are relevant for a given Event.
```
interface EventDispatcherInterface {
    public function dispatch(object $event): object; // event
interface ListenerProviderInterface {
    public function getListenersForEvent(object $event) : iterable; // callable
interface StoppableEventInterface {
    public function isPropagationStopped() : bool;
```

# PSR-15: HTTP Server Request Handlers
 - Use PSR-7: HTTP Message  
Middleware processing of an incoming request and the creation of a resulting response (ResponseInterface), as defined by PSR-7.
```
interface RequestHandlerInterface {
    public function handle(ServerRequestInterface $request): ResponseInterface;
    
interface MiddlewareInterface {
    // If unable to produce the response itself, it may delegate to the provided request handler to do so.
    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface;
```

# PSR-16: Common Cache Interface
CacheInterface corresponds to a single collection of cache items with a single key namespace, and is equivalent to a "Pool" in PSR-6
```
interface CacheInterface {
  public function get(string $key, mixed $default = null): mixed; // @throws \Psr\SimpleCache\InvalidArgumentException
  public function set(string $key, mixed $value, null|int|\DateInterval $ttl = null): bool;
  public function delete(string $key): bool;
  public function clear(): bool;
  public function getMultiple(iterable $keys, $default = null): iterable;
  public function setMultiple(iterable $values, null|int|\DateInterval $ttl = null): bool;
  public function deleteMultiple(iterable $keys): bool;
  // can return true and immediately after, another script can remove it, making the state of your app out of date!
  public function has(string $key): bool;
```

# PSR-17: HTTP Factories
```
interface RequestFactoryInterface {
    public function createRequest(string $method, UriInterface|string $uri): RequestInterface;
interface ResponseFactoryInterface {
    public function createResponse(int $code = 200, string $reasonPhrase = ''): ResponseInterface;
interface ServerRequestFactoryInterface {
    public function createServerRequest(string $method, UriInterface|string $uri, array $serverParams = []): ServerRequestInterface;
interface StreamFactoryInterface: createStream, createStreamFromFile, createStreamFromResource (StreamInterface)
interface UploadedFileFactoryInterface: createUploadedFile (UploadedFileInterface)
interface UriFactoryInterface { public function createUri(string $uri = '') : UriInterface;
```

# PSR-18: HTTP Client
- Sending HTTP requests and receiving HTTP responses
- Well-formed HTTP request or HTTP response MUST NOT cause an exception 
- ClientExceptionInterface only if it is unable to send the HTTP request at all
- The request message is not a well-formed HTTP request or is missing some critical information, the Client MUST throw an instance of RequestExceptionInterface
- Request cannot be sent due to a network failure of any kind, MUST throw an instance of NetworkExceptionInterface
```
interface ClientInterface {
  public function sendRequest(RequestInterface $request): ResponseInterface; // @throws \Psr\Http\Client\ClientExceptionInterface
interface RequestExceptionInterface/NetworkExceptionInterface extends ClientExceptionInterface {} {
  public function getRequest(): RequestInterface;
```
