#!/bin/bash
set -e

perl -i -pe '
    s/\bPORT=\K3001/'"$APP_PORT"'/g;
' package.json

perl -i -pe '
    s/"application_clientId"/"'"$AUTH_CLIENT_ID"'"/g;
    s/"application_secret"/"'"$AUTH_SECRET"'"/g;
    s#"applicaiton_redirect_url"#"http://'"$APP_HOST:$APP_PORT"'"#g;
' src/index.js

perl -i -pe '
    s/>Application \K\d+(?=<)/on '"$APP_HOST:$APP_PORT"'/g;
' src/pages/App1.js

npm start

echo ">>>>>>>>>>>>>>>> FINISHED <<<<<<<<<<<<<<<<"
