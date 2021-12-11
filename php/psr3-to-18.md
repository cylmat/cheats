# PSR-3: Logger Interface (RFC 5424) (Jordi Boggiano, Composer)
```
interface LoggerInterface
{
  // System is unusable.
  public function emergency($message, array $context = array()); 
  // Action must be taken immediately. Entire website down, database unavailable, etc. 
  public function alert($message, array $context = array()); 
  // Critical conditions. Application component unavailable, etc.
  public function critical($message, array $context = array()); 
  // Runtime errors that do not require immediate action but should typically be logged and monitored.
  public function error($message, array $context = array()); 
  // Exceptional occurrences that are not errors. Use of deprecated APIs, poor use of an API...
  public function warning($message, array $context = array()); 
  // Normal but significant events.
  public function notice($message, array $context = array());
  // Interesting events.
  public function info($message, array $context = array());
  // Detailed debug information.
  public function debug($message, array $context = array());
  // Logs with an arbitrary level.
  public function log($level, $message, array $context = array());
}
```

# PSR-6: Caching Interface (Larry Garfield, Drupal)
