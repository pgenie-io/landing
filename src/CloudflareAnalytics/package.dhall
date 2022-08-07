let P =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v21.1.0/Prelude/package.dhall

let Html = ../Html/package.dhall

let body-elements =
      \(token : Text) ->
        ''
        <script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "${token}"}'></script>
        ''

in  { body-elements }
