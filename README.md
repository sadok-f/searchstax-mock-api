
Simulate SearchStax API response.
Based on https://www.searchstax.com/docs/searchstax-cloud-deployment-api/


## Install

```bash
git clone github.com/sadok-f/searchstax-mock-api
cd searchstax-mock-api/
go install
```


## Serve Mock Server
```bash
./searchstax-mock-api
```

### Docker
```bash

docker run -p 3000:3000 sadokf/searchstax-mock-api
```

### Accessing the server:

```bash
curl -XPOST localhost:3000/api/rest/v2/obtain-auth-token/

{
  "token": "aa70cb0a180a0532ae8855f7a1712eeceb81e080"
}
```
### Forked from
https://github.com/tkc/go-json-server
