DR_TARGETS_JSON=[
  {
    "client": "acustest",
    "tables": {
      "account": "xxx",
      "container": "yyy",
      "base_prefix": "/_unitystorage/schemas"
    },
    "volumes": [
      {
        "name": "received",
        "account": "acusteststrgread",
        "container": "received",
        "dir": "/"
      },
      {
        "name": "work",
        "account": "acusteststrgrw",
        "container": "work",
        "dir": "/"
      }
    ]
  }
]
