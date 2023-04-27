let P =
      https://prelude.dhall-lang.org/v19.0.0/package.dhall
        sha256:eb693342eb769f782174157eba9b5924cf8ac6793897fc36a31ccbd6f56dafe2

let Gtag = ../Gtag/package.dhall

let YandexMetrika = ../YandexMetrika/package.dhall

let CloudflareAnalytics = ../CloudflareAnalytics/package.dhall

let InstallButton = { label : Text, name : Text, extension : Text }

let WhatsComingItem = { title : Text, content : Text }

let WhatPgenieCanDoItem = { title : Text, content : Text }

let Icon = < man-plus | checklist | branching >

let ValuePropItem = { title : Text, content : Text, icon : Icon }

let Page =
      { meta-title : Text
      , meta-description : Text
      , content-title : Text
      , content-subtitle : Text
      , cli-version : Text
      , ga-id : Text
      , yandex-metrika-id : Text
      , cloudflare-analytics-token : Optional Text
      , whats-coming : List WhatsComingItem
      , what-pgenie-can-do : List WhatPgenieCanDoItem
      , install-buttons : List InstallButton
      , value-prop : List ValuePropItem
      }

let gtag-onclick-attributes =
      \(action : Text) ->
      \(category : Text) ->
        Gtag.event-onclick-attributes
          { action
          , category = Some category
          , label = None Text
          , value = None Natural
          }

let what-pgenie-can-do-item-elements =
      \(z : WhatPgenieCanDoItem) ->
        ''
        <div class="ftPoint">
          <div class="iconWrapper small circle" style="width:28px;height:28px"><svg class="backdrop" width="28" height="28" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
              <circle cx="40" cy="42" r="14" transform="translate(-26 -28)" fill="rgb(166, 226, 46)" fill-rule="nonzero"></circle>
            </svg><svg class="icon" xmlns="http://www.w3.org/2000/svg" fill="#000" width="28" height="28" viewBox="0 0 24 24">
              <path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z"></path>
            </svg></div>
          <div class="ftPoint__meta">
            <h3 class="ftPoint__title color-1 weight-text-m">${z.title}</h3>
            <div class="ftPoint__description">${z.content}</div>
          </div>
        </div>
        ''

let whats-coming-item-elements =
      \(z : WhatsComingItem) ->
        ''
        <div class="ftPoint">
          <div class="iconWrapper small circle" style="width:28px;height:28px"><svg class="backdrop" width="28" height="28" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
              <circle cx="40" cy="42" r="14" transform="translate(-26 -28)" fill="rgb(230, 219, 116)" fill-rule="nonzero"></circle>
            </svg>
          </div>
          <div class="ftPoint__meta">
            <h3 class="ftPoint__title color-1 weight-text-m">${z.title}</h3>
            <div class="ftPoint__description">${z.content}</div>
          </div>
        </div>
        ''

let icon-elements =
      \(z : Icon) ->
        merge
          { man-plus =
              ''
              <svg class="icon" xmlns="http://www.w3.org/2000/svg" fill="#000" height="28" width="28" viewBox="0 0 640 512">
                <path d="M624 208h-64v-64c0-8.8-7.2-16-16-16h-32c-8.8 0-16 7.2-16 16v64h-64c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h64v64c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16v-64h64c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zm-400 48c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"></path>
              </svg>
              ''
          , checklist =
              ''
              <svg class="icon" xmlns="http://www.w3.org/2000/svg" fill="#000" height="28" width="28" viewBox="0 0 512 512">
                <path d="M208 132h288c8.8 0 16-7.2 16-16V76c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16zm0 160h288c8.8 0 16-7.2 16-16v-40c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16zm0 160h288c8.8 0 16-7.2 16-16v-40c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16v40c0 8.8 7.2 16 16 16zM64 368c-26.5 0-48.6 21.5-48.6 48s22.1 48 48.6 48 48-21.5 48-48-21.5-48-48-48zm92.5-299l-72.2 72.2-15.6 15.6c-4.7 4.7-12.9 4.7-17.6 0L3.5 109.4c-4.7-4.7-4.7-12.3 0-17l15.7-15.7c4.7-4.7 12.3-4.7 17 0l22.7 22.1 63.7-63.3c4.7-4.7 12.3-4.7 17 0l17 16.5c4.6 4.7 4.6 12.3-.1 17zm0 159.6l-72.2 72.2-15.7 15.7c-4.7 4.7-12.9 4.7-17.6 0L3.5 269c-4.7-4.7-4.7-12.3 0-17l15.7-15.7c4.7-4.7 12.3-4.7 17 0l22.7 22.1 63.7-63.7c4.7-4.7 12.3-4.7 17 0l17 17c4.6 4.6 4.6 12.2-.1 16.9z"></path>
              </svg>
              ''
          , branching =
              ''
              <svg class="icon" xmlns="http://www.w3.org/2000/svg" fill="#000" height="28" width="28" viewBox="0 0 384 512">
                <path d="M384 144c0-44.2-35.8-80-80-80s-80 35.8-80 80c0 36.4 24.3 67.1 57.5 76.8-.6 16.1-4.2 28.5-11 36.9-15.4 19.2-49.3 22.4-85.2 25.7-28.2 2.6-57.4 5.4-81.3 16.9v-144c32.5-10.2 56-40.5 56-76.3 0-44.2-35.8-80-80-80S0 35.8 0 80c0 35.8 23.5 66.1 56 76.3v199.3C23.5 365.9 0 396.2 0 432c0 44.2 35.8 80 80 80s80-35.8 80-80c0-34-21.2-63.1-51.2-74.6 3.1-5.2 7.8-9.8 14.9-13.4 16.2-8.2 40.4-10.4 66.1-12.8 42.2-3.9 90-8.4 118.2-43.4 14-17.4 21.1-39.8 21.6-67.9 31.6-10.8 54.4-40.7 54.4-75.9zM80 64c8.8 0 16 7.2 16 16s-7.2 16-16 16-16-7.2-16-16 7.2-16 16-16zm0 384c-8.8 0-16-7.2-16-16s7.2-16 16-16 16 7.2 16 16-7.2 16-16 16zm224-320c8.8 0 16 7.2 16 16s-7.2 16-16 16-16-7.2-16-16 7.2-16 16-16z"></path>
              </svg>
              ''
          }
          z

let value-prop-item-elements =
      \(z : ValuePropItem) ->
        ''
        <div class="ftPoint">
          <div class="iconWrapper small circle" style="width:28px;height:28px"><svg class="backdrop" width="28" height="28" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
              <circle cx="40" cy="42" r="14" transform="translate(-26 -28)" fill="rgb(166, 226, 46)" fill-rule="nonzero"></circle>
            </svg>${icon-elements z.icon}</div>
          <div class="ftPoint__meta">
            <h3 class="ftPoint__title color-1 weight-text-m">${z.title}</h3>
            <div class="ftPoint__description">${z.content}</div>
          </div>
        </div>
        ''

let install-button-elements =
      \(version : Text) ->
      \(z : InstallButton) ->
        ''
        <a class="btn btn--large" href="https://github.com/pgenie-io/cli/releases/download/${version}/pgenie-cli-${version}-${z.name}.${z.extension}"
        ${gtag-onclick-attributes "download_${z.name}" "call_to_action"}
        >${z.label}</a>
        ''

let page-doc =
      \(page : Page) ->
        ''
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8">
          <meta http-equiv="x-ua-compatible" content="ie=edge">
          <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
          <title>${page.meta-title}</title>
          <meta name="twitter:title" content="${page.meta-title}">
          <meta name="description" content="${page.meta-description}">
          <meta name="twitter:description" content="${page.meta-description}">
          <link rel="canonical" href="https://pgenie.io">
          <link rel="stylesheet" href="main.css">
          <link href="https://fonts.googleapis.com/css?family=Fira+Sans:700|Inter:700,400,500&amp;display=fallback" rel="stylesheet">
          ${Gtag.head-elements page.ga-id}
          ${YandexMetrika.head-elements page.yandex-metrika-id}
        </head>

        <body>
          <div id="header" class="section header section--cxhfw30xith6voui" style="--wr-max:1030px;color:rgb(249, 38, 114)">
            <div class="wr color-1" style="margin-top:10px;margin-bottom:10px">
              <div id="headerNav"><a id="headerLogo" href="https://pgenie.io" class="header__logo" style="font-weight:700;font-size:26px">pGenie</a>
                <div class="spacer"></div>
                <div class="headerNav__links"></div>
                <div class="header__navCtas"></div>
              </div>
            </div>
          </div>
          <div id="titles" class="section section--titles section--center" style="background-color:black;padding:180px 0 120px 0;--pdx-min-height:0px;--wr-max:1030px">
            <div class="wr">
              <h1 class="color-1 weight-title-h font-title section__title center">${page.content-title}</h1>
              <p class="weight-text section__subtitle center" style="margin-bottom:0">${page.content-subtitle}</p>
            </div>
          </div>
          <div class="section section--feature section--noPadding section--center" style="background-color:rgb(22, 22, 22);--pdx-min-height:0px;--wr-max:1030px">
            <div class="divider divider--curve divider--back"><svg viewBox="0 0 1695 72" preserveAspectRatio="none">
                <path d="M0 0c282.5 45 565 67.5 847.5 67.5S1412.5 45 1695 0v72H0V0z" fill="rgb(40, 40, 40)" fill-rule="evenodd"></path>
              </svg></div>
            <div class="ft ft--center ft--noPdx" style="--pdx-pt:0;--pdx-pb:0; margin-top: -30px;">
              <div class="ft__half">
                <div class="ft__wrapper" style="max-width:485px">
                  <div class="ft__content">
                    <div class="ft__description">
                      ${P.Text.concatMap
                          ValuePropItem
                          value-prop-item-elements
                          page.value-prop}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="section section--zigzag section--center section--r95i0858iu42dkki" style="background-color:rgb(40, 40, 40);padding-bottom:60px;padding-top:60px;--pdx-min-height:0px;--wr-max:1030px;color:rgb(248, 248, 242)">
            <div class="divider divider--slantedCrossed divider--back"><svg viewBox="0 0 1695 347">
                <g fill="rgb(248, 248, 242)" fill-rule="evenodd">
                  <path d="M0 341.993L1695 0v347H0z"></path>
                  <path opacity=".61" d="M1695 341.993L0 0v347h1695z"></path>
                </g>
              </svg></div>
            <div class="wr">
              <h2 id="how-it-works" class="color-1 weight-title-h font-title section__title center" style="margin-bottom:50px">How it works</h2>
              <div class="zigzag showNumbers">
                <div class="zigzagItem">
                  <div class="zigzagItem__graphic"><img src="stage-1.png" class="" srcset="stage-1-2x.png 2x" alt="Migration"></div>
                  <div class="zigzagItem__content"><span class="zigzagItem__number"></span>
                    <h3 class="zigzagItem__title color-1 weight-text-m">Specify Schema</h3>
                    <div class="zigzagItem__text"><p>Using schema migration files in SQL</p></div>
                  </div>
                </div>
                <div class="zigzagItem">
                  <div class="zigzagItem__graphic"><img src="stage-2.png" class="" srcset="stage-2-2x.png 2x" alt="Queries"></div>
                  <div class="zigzagItem__content"><span class="zigzagItem__number"></span>
                    <h3 class="zigzagItem__title color-1 weight-text-m">Specify Queries</h3>
                    <div class="zigzagItem__text"><p>In SQL as well</p></div>
                  </div>
                </div>
                <div class="zigzagItem">
                  <div class="zigzagItem__graphic"><img src="stage-3.png" class="" srcset="stage-3-2x.png 2x" alt="Generated Code"></div>
                  <div class="zigzagItem__content"><span class="zigzagItem__number"></span>
                    <h3 class="zigzagItem__title color-1 weight-text-m">Generate SDKs</h3>
                    <div class="zigzagItem__text"><p>By running the pGenie CLI app</p></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="section section--hero section--noPadding section--center dark" style="background-color:rgb(248, 248, 242);--pdx-min-height:0px;--wr-max:1030px">
            <div class="divider divider--curve"><svg viewBox="0 0 1695 72" preserveAspectRatio="none">
                <path d="M0 0c282.5 45 565 67.5 847.5 67.5S1412.5 45 1695 0v72H0V0z" fill="rgb(22, 22, 22)" fill-rule="evenodd"></path>
              </svg></div>
            <div class="ft ft--center ft--noPdx" style="--pdx-pt:0;--pdx-pb:0">
              <div class="ft__half">
                <div class="ft__wrapper" style="max-width:485px">
                  <div class="ft__content">
                    <h2 id="try-out-the-demo" class="hero__title color-1 weight-title-h font-title">Try out the demo</h2>
                    <p class="hero__subtitle weight-text">Get a quick feel of pGenie by playing with our demonstration project.</p>
                    <div class="ctas"><a class="btn btn--large" href="https://github.com/pgenie-io/demo" target="_blank"
                        ${gtag-onclick-attributes "open_demo" "call_to_action"}
                        ><div class="iconWrapper medium true" style="width:1em;height:1em"><svg class="icon icon--button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" width="1em" height="1em">
                            <path d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252a250.7 250.7 0 0 0 169.5 239.2c12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9a94.5 94.5 0 0 1 2.6-67.9c20.9-6.5 69 27 69 27a235 235 0 0 1 125.6 0s48.1-33.6 69-27a94.4 94.4 0 0 1 2.6 67.9c16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z" fill="rgb(255, 255, 255)"></path>
                          </svg></div><span style="margin-left:0.3em;padding-left:2px">Open the demo project at GitHub</span>
                      </a></div>
                    <div class="hero__ctaInfo"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="section section--hero section--noPadding section--center" style="background-color:rgb(22, 22, 22);--pdx-min-height:0px;--wr-max:1030px">
            <div class="divider divider--curve divider--back"><svg viewBox="0 0 1695 72" preserveAspectRatio="none">
                <path d="M0 0c282.5 45 565 67.5 847.5 67.5S1412.5 45 1695 0v72H0V0z" fill="rgb(31, 31, 31)" fill-rule="evenodd"></path>
              </svg></div>
            <div class="ft ft--center ft--noPdx" style="--pdx-pt:0;--pdx-pb:0">
              <div class="ft__half">
                <div class="ft__wrapper" style="max-width:485px">
                  <div class="ft__content">
                    <h2 id="status-and-pricing" class="hero__title color-1 weight-title-h font-title">Status and pricing</h2>
                    <p class="hero__subtitle weight-text">pGenie is in <span style="color:#66D9EF;font-weight:bold">public beta</span>. All features are available for <span style="color:#66D9EF;font-weight:bold">free</span> until it goes out of beta. <span style="color:#66D9EF;font-weight:bold">Free tier</span> will remain afterwards.</p>
                    <div class="ctas"></div>
                    <div class="hero__ctaInfo"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="section section--feature section--noPadding section--center" style="background-color:rgb(31, 31, 31);--pdx-min-height:0px;--wr-max:1030px;color:rgb(159, 158, 154)">
            <div class="divider divider--curve"><svg viewBox="0 0 1695 72" preserveAspectRatio="none">
                <path d="M0 0c282.5 45 565 67.5 847.5 67.5S1412.5 45 1695 0v72H0V0z" fill="rgb(40, 40, 40)" fill-rule="evenodd"></path>
              </svg></div>
            <div class="ft ft--center ft--noPdx" style="--pdx-pt:0;--pdx-pb:0">
              <div class="ft__half">
                <div class="ft__wrapper" style="max-width:485px">
                  <div class="ft__content">
                    <h2 id="what-pgenie-can-do" class="color-1 weight-title-h font-title section__title center" style="margin-bottom:0">What pGenie can do</h2>
                    <div class="ft__description">
                      ${P.Text.concatMap
                          WhatPgenieCanDoItem
                          what-pgenie-can-do-item-elements
                          page.what-pgenie-can-do}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="section section--feature section--noPadding section--center" style="background-color:rgb(40, 40, 40);--pdx-min-height:0px;--wr-max:1030px;color:rgb(159, 158, 154)">
            <div class="divider divider--curve"><svg viewBox="0 0 1695 72" preserveAspectRatio="none">
                <path d="M0 0c282.5 45 565 67.5 847.5 67.5S1412.5 45 1695 0v72H0V0z" fill="rgb(248, 248, 242)" fill-rule="evenodd"></path>
              </svg></div>
            <div class="ft ft--center ft--noPdx" style="--pdx-pt:0;--pdx-pb:0">
              <div class="ft__half">
                <div class="ft__wrapper" style="max-width:485px">
                  <div class="ft__content">
                    <h2 id="whats-coming" class="color-1 weight-title-h font-title section__title center" style="margin-bottom:0">What&#x27;s coming</h2>
                    <div class="ft__description">
                      ${P.Text.concatMap
                          WhatsComingItem
                          whats-coming-item-elements
                          page.whats-coming}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="section section--hero section--noPadding section--center dark" style="background-color:rgb(248, 248, 242);--pdx-min-height:0px;--wr-max:1030px">
            <div class="divider divider--curve"><svg viewBox="0 0 1695 72" preserveAspectRatio="none">
                <path d="M0 0c282.5 45 565 67.5 847.5 67.5S1412.5 45 1695 0v72H0V0z" fill="rgb(22, 22, 22)" fill-rule="evenodd"></path>
              </svg></div>
            <div class="ft ft--center ft--noPdx" style="--pdx-pt:0;--pdx-pb:0">
              <div class="ft__half">
                <div class="ft__wrapper" style="max-width:485px">
                  <div class="ft__content">
                    <h2 id="keep-informed" class="hero__title color-1 weight-title-h font-title">Keep informed</h2>
                    <p class="hero__subtitle weight-text">Stay up to date with our latest developments by subscribing to our Twitter feed.</p>
                    <div class="ctas"><a class="btn btn--large" href="https://twitter.com/pgenie_io" target="_blank"
                      ${gtag-onclick-attributes "open-twitter" "call_to_action"}
                      >
                        <div class="iconWrapper medium true" style="width:1em;height:1em"><svg class="icon icon--button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1em" height="1em">
                            <path d="M459.4 151.7c.3 4.6.3 9.1.3 13.7 0 138.7-105.6 298.5-298.6 298.5A296.5 296.5 0 0 1 0 417a217 217 0 0 0 25.3 1.2c49 0 94.3-16.6 130.3-44.8-46.1-1-84.8-31.2-98.1-72.8a111 111 0 0 0 47.4-2 105 105 0 0 1-84.1-103v-1.2c14 7.8 30.2 12.6 47.4 13.3A104.9 104.9 0 0 1 35.7 67.2a298.3 298.3 0 0 0 216.4 109.9 104.9 104.9 0 0 1 179-95.8 206.6 206.6 0 0 0 66.6-25.4 104.7 104.7 0 0 1-46.1 57.8c21-2.3 41.6-8.1 60.4-16.2a225.6 225.6 0 0 1-52.6 54.2z" fill="rgb(255, 255, 255)"></path>
                          </svg></div><span style="margin-left:0.3em;padding-left:2px">Open pGenie Twitter</span>
                      </a></div>
                    <div class="hero__ctaInfo"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="section section--hero section--noPadding section--center" style="background-color:rgb(22, 22, 22);--pdx-min-height:0px;--wr-max:1030px">
            <div class="ft ft--center ft--noPdx" style="--pdx-pt:0;--pdx-pb:0">
              <div class="ft__half">
                <div class="ft__wrapper" style="max-width:485px">
                  <div class="ft__content">
                    <h2 id="install-pgenie" class="hero__title color-1 weight-title-h font-title">Install pGenie</h2>
                    <p class="hero__subtitle weight-text">Precompiled distros are available for the following platforms:</p>
                    <div class="ctas">
                      ${P.Text.concatMap
                          InstallButton
                          (install-button-elements page.cli-version)
                          page.install-buttons}
                    </div>
                    <div class="hero__ctaInfo">
                      <p>Place the downloaded binary in any location listed in the <code>PATH</code> env variable. E.g., <code>/usr/local/bin</code>.</p>
                      <p>If your platform is not available, you can build from source. Check out <a href="https://github.com/pgenie-io/cli#building-from-source">the instructions</a>.</p>
                      <p>Check out <a href="https://github.com/pgenie-io/demo">the demo</a> for an exhaustive explanation on how to use pGenie.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <footer id="footer" class="section section--footer section--center" style="background-color:rgb(0, 0, 0);padding-bottom:15px;padding-top:15px;--pdx-min-height:0px;--wr-max:1030px">
            <div class="wr">
              <div class="footer footer--simple">
                <div class="footer__primary">
                  <nav class="footer__linkRow"></nav><span>© 2022 pGenie.io</span>
                  <nav class="footer__linkRow"></nav>
                </div>
                <ul class="footer__social">
                  <li><a href="https://twitter.com/pgenie_io" target="_blank" class="color-2"
                    ${gtag-onclick-attributes "open-twitter" "contacts"}
                    ><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z" fill="#F92672"></path>
                      </svg></a></li>
                </ul>
              </div>
            </div>
          </footer>
          ${P.Text.defaultMap
              Text
              CloudflareAnalytics.body-elements
              page.cloudflare-analytics-token}
        </body>

        </html>
        ''

in  { page-doc
    , Page
    , WhatsComingItem
    , WhatPgenieCanDoItem
    , InstallButton
    , Icon
    , ValuePropItem
    }
