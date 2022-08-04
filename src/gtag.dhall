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

let Event =
      { action : Text
      , category : Optional Text
      , label : Optional Text
      , value : Optional Integer
      }

let event-trigger-attributes =
      \(z : Event) ->
        let attribute =
              \(name : Text) ->
              \(value : Text) ->
                ''
                ${name}:&quot;${value}&quot;
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
            onclick="gtag(&quot;event&quot;,&quot;${z.action}&quot;${attributes-text})"
            ''

in  { head-elements, event-trigger-attributes, Event }
