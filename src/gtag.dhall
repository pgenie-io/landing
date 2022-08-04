let P =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v21.1.0/Prelude/package.dhall

let head-elements =
      \(id : Text) ->
        ''
        <script async src="https://www.googletagmanager.com/gtag/js?id=${id}"></script>
        <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '${id}', {'anonymize_ip': true});
        </script>
        ''

let Event = { action : Text, category : Optional Text, label : Optional Text }

let event-trigger-js =
      \(z : Event) ->
        let attribute =
              \(name : Text) ->
              \(value : Text) ->
                ''
                ${name}:"${value}"
                ''

        let attribute-texts =
              P.List.unpackOptionals
                Text
                [ P.Optional.map Text Text (attribute "category") z.category
                , P.Optional.map Text Text (attribute "label") z.label
                ]

        let attributes-text =
              if    P.List.null Text attribute-texts
              then  ""
              else  ''
                    ,{${P.Text.concatSep "," attribute-texts}}
                    ''

        in  ''
            gtag("event","${z.action}"${attributes-text})
            ''

let event-trigger-attributes =
      P.Function.compose
        Event
        Text
        Text
        event-trigger-js
        (P.Text.replace "\"" "\$quot;")

in  { head-elements, event-trigger-attributes, Event }
