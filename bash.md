BASH
----
**Return when sourced or bashed script**  
echo "return" #executed from source  
return 1 2>/dev/null  
echo "exit" #executed from bash  
exit 1  

**Return when sourced or bashed script**  
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo "source" || echo "bash"  
