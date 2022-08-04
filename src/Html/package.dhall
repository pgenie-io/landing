let P =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v21.1.0/Prelude/package.dhall

let attribute-content = P.Text.replace "\"" "\$quot;"

let attribute =
      \(name : Text) ->
      \(value : Text) ->
        "${name}=\"${attribute-content value}\""

in  { attribute, attribute-content }
