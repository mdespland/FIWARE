[KEYROCK OAUTH](https://fiware-idm.readthedocs.io/en/v5.1.1/oauth2.html#oauth2-authentication)

générer l'identifiant de l'application
```
base64(client_id:client_secret)
```

```YjE0OGQ3MmItMTg0Yi00N2NkLWE0ZTItM2I1MTgwY2I4ZWM2OjY3NDAxZGQ1LTBkMzYtNDU2NC1hMjk5LTliYzU5ZjBkZDhlMg==```

```
curl -v -X POST -H "Authorization: Basic YjE0OGQ3MmItMTg0Yi00N2NkLWE0ZTItM2I1MTgwY2I4ZWM2OjY3NDAxZGQ1LTBkMzYtNDU2NC1hMjk5LTliYzU5ZjBkZDhlMg==" -H "Content-Type: application/x-www-form-urlencoded" http://172.25.1.5:3000/oauth2/token  -d @- <<EOF

grant_type=password&username=demo%40test.com&password=12345678
EOF
``` 

```
curl -H "X-Auth-Token: af4a3edc1d5ec4dfc19e60abcbb8a69aa3f2a4fb" -v http://172.25.1.9:8080/orion/version
```