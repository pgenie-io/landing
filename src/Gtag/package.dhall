let P =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v21.1.0/Prelude/package.dhall

let Html = ../Html/package.dhall

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
              \(name : Text) -> \(value : Text) -> "${name}:\"${value}\""

        let attributes-texts =
              P.List.unpackOptionals
                Text
                [ P.Optional.map Text Text (attribute "category") z.category
                , P.Optional.map Text Text (attribute "label") z.label
                ]

        let attributes-params =
              if    P.List.null Text attributes-texts
              then  ""
              else  ",{${P.Text.concatSep "," attributes-texts}}"

        let action = P.Text.replace "-" "_" z.action

        in  "gtag(\"event\",\"${action}\"${attributes-params})"

let event-onclick-attributes =
      \(z : Event) -> Html.attribute "onclick" (event-trigger-js z)

in  { head-elements, event-onclick-attributes, Event }
