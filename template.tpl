___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "ABTShield",
  "categories": [
    "UTILITY",
    "ANALYTICS"
  ],
  "brand": {
    "id": "brand_abtshield",
    "displayName": "ABTShield"
  },
  "description": "ABTShield protects against ad fraud by using behavioral and configuration-based tests to analyze web traffic",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "serviceId",
    "displayName": "ABTShield service id",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "gTagId",
    "displayName": "Google Tag Id",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// ABTShield Google Tag Template - EDGE NPD
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const callInWindow = require('callInWindow');
const setInWindow = require('setInWindow');

if (queryPermission('access_globals', 'readwrite', '_abtshield') && queryPermission('access_globals', 'execute', 'gtag')) {
  setInWindow("_abtshield", [
    ["create", data.serviceId, {timezone:"Europe/Warsaw"}],
    ["callback","uid", (a)=>{
      if(a.b === 1 && data.gTagId !== undefined){
        callInWindow("gtag", "event","conversion",{send_to:data.gTagId,aw_remarketing_only:!0});
      }
    }],
    ["send","page_view"]
  ], true);
}

const url = 'https://cdn.snippet.abtshield.com/static/prod/abtshield-snippet.js';
injectScript(url, data.gtmOnSuccess(), data.gtmOnFailure, url);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.snippet.abtshield.com/static/prod/abtshield-snippet.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_abtshield"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtag"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 18/04/2023, 10:47:48


