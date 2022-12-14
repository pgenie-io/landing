let P =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v21.1.0/Prelude/package.dhall

let Html = ../Html/package.dhall

let head-elements =
      \(id : Text) ->
        ''
        <script type="text/javascript" >
           (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
           m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
           (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

           ym(${id}, "init", {
                clickmap:true,
                trackLinks:true,
                accurateTrackBounce:true,
                webvisor:true
           });
        </script>
        <noscript><div><img src="https://mc.yandex.ru/watch/${id}" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
        ''

in  { head-elements }
