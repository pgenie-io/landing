\(x : ./WhatsComingItem.dhall) ->
  ''
  <div class="ftPoint">
    <div class="iconWrapper small circle" style="width:28px;height:28px"><svg class="backdrop" width="28" height="28" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
        <circle cx="40" cy="42" r="14" transform="translate(-26 -28)" fill="rgb(230, 219, 116)" fill-rule="nonzero"></circle>
      </svg>
    </div>
    <div class="ftPoint__meta">
      <h3 class="ftPoint__title color-1 weight-text-m">${x.title}</h3>
      <div class="ftPoint__description">${x.content}</div>
    </div>
  </div>
  ''
