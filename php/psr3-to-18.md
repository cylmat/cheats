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
```
interface MessageInterface {
  getProtocolVersion(), withProtocolVersion($version)
  getHeaders(), hasHeader($name), getHeader($name), getHeaderLine($name), 
  withHeader($name, $value), withAddedHeader($name, $value), withoutHeader($name)
  getBody(), withBody(StreamInterface $body)
  
  ...
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
