### soap

- (WsdlToPhp)

```
ini_set("soap.wsdl_cache_enabled", 0);
            $soapClient = new MySoapClient(
                $this->getWsdlPath($serviceName), [
                    'cache_wsdl' => WSDL_CACHE_NONE,
                    'trace' => 1,
                    'stream_context' => stream_context_create($this->getContext($action)),
                    //'location' => $this->wsdlNamespace,
                ]
            );
			
class MySoapClient extends SoapClient
{
    public function __doRequest(string $request, string $location, string $action, int $version, bool $oneWay = false): ?string
    {
        $this->fixNamespace($request);

        return parent::__doRequest($request, $location, $action, $version, $oneWay);
    }

    private function fixNamespace(string &$request): void
    {
        $request = preg_replace('/SOAP-ENV/', 'soap', $request);
        $request = preg_replace('/<\/?part>/', '', $request);
        $request = preg_replace('/DemandeReseauRequest/', 'tns:DemandeReseauRequest xmlns:tns="http://ReseauGen/V1.0"', $request);
    }
```
