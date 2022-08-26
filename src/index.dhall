let Index = ./Index/package.dhall

in  Index.page-doc
      { ga-id = "G-TTTTY8GJZQ"
      , yandex-metrika-id = "89787597"
      , cloudflare-analytics-token = None Text
      , title = "pGenie"
      , description = "Reduce the development by generating client SDKs from plain SQL. Raise the quality with automatic validation of migrations and queries. No more mapping fuss, impedance mismatch or compatibility bugs! Haskell, Java, more coming."
      , value-prop =
        [ { title = "Release the development resources"
          , content =
              "There is no need to develop, maintain or test the DB layer of your app. It can be automated."
          , icon = Index.Icon.man-plus
          }
        , { title = "Increase the reliability of your applications"
          , content =
              "Most DB-compatiblity bugs become impossible. The generated code is guaranteed to correctly match your schema."
          , icon = Index.Icon.checklist
          }
        , { title = "Version-control your DB development"
          , content =
              "pGenie facilitates database evolution under version control and continuous deployment by design."
          , icon = Index.Icon.branching
          }
        ]
      , whats-coming =
        [ { title = "Stored procedures support"
          , content =
              "Generation of code that integrates with stored procedures and functions."
          }
        , { title = "Advanced datatypes support"
          , content =
              "Generation of code that integrates with composites, enums and other advanced types."
          }
        , { title = "GitHub Actions"
          , content =
              "Specialized GitHub actions for continuous deployment of the generated code. For instance, for publishing the generated packages into your private Maven repository."
          }
        , { title = "Support for more languages"
          , content =
              "The ultimate goal is to support all languages that can interact with Postgres."
          }
        , { title = "Early compatibility issues detection"
          , content =
              "Via checks of schema-compatibility at connection time. Instead of waiting for an incompatible query to get triggered by a user, it&#x27;s possible to detect incompatibilities at the initialisation phase of your app. This will allow to make it a continuous deployment stage, ensuring that versions of your app that are incompatible with your DB do not get deployed. This can become a major boost in the reliability of your app."
          }
        , { title = "API service generation"
          , content =
              "Generation of binary executables of servers that run REST or gRPC applications. Support for standards like OpenAPI."
          }
        , { title = "Query performance-checking"
          , content = "Avoid Seq Scan with index configuration validation."
          }
        , { title = "Optimization suggestions"
          , content =
              "When all queries are known it&#x27;s possible to resolve which indices are lacking."
          }
        , { title = "Documentation hosting"
          , content = "Accurate, up-to-date documentation generation."
          }
        , { title = "Mocking DB hosting"
          , content =
              "A freshly instantiated mocking DB might come in handy for testing and development."
          }
        , { title = "Deep query analysis"
          , content =
              "Simulations on generated data helping fine-grained performance tuning."
          }
        , { title = "DSLs support"
          , content =
              "Modern alternatives to SQL arise. E.g., Prql. pGenie can be extended to support such formats alongside SQL."
          }
        ]
      , what-pgenie-can-do =
        [ { title = "Schema migrations validation"
          , content =
              ''
                <p>Ensure that the schema migration scripts that you provide won&#x27;t cause any errors.</p>
              ''
          }
        , { title = "Queries validation"
          , content =
              ''
                <p>Ensure that the queries won&#x27;t cause any compatibility errors.</p>
              ''
          }
        , { title = "Client SDKs generation"
          , content =
              ''
                <p>Generate client libraries for <b>Haskell</b> and <b>Java</b>. These libraries provide high-level typesafe APIs specialised to your DB. Type-mapping, parameterisation, result decoding, query execution and not only - are all solved for you and are hidden under the hood of very simple APIs.</p>
              ''
          }
        ]
      , cli-version = "v1.0.1"
      , install-buttons =
        [ { label = "Windows x64", name = "windows-x64", extension = "zip" }
        , { label = "macOS x64", name = "macos-x64", extension = "tar.xz" }
        , { label = "Linux x64", name = "linux-x64", extension = "tar.xz" }
        ]
      }
