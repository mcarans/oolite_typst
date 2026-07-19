#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1cm, top: 1cm, bottom: 1cm),
  paper: "a4",
  flipped: true,
  lang: "en",
  region: "US",
  font: ("DejaVu Sans", "Liberation Sans", "Arial"),
  fontsize: 11pt,
  stretch: 85%,
  sectionnumbering: none,
  pagenumbering: "1",
  doc,
) = {
  set document(
    title: title,
    author: authors.map(author => content-to-string(author.name)),
    keywords: keywords,
  )
  set page(
    paper: paper,
    margin: margin,
    flipped: flipped,
    numbering: pagenumbering,
    columns: cols,
    )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize,
           stretch: stretch)
  set heading(numbering: sectionnumbering)

  place(top, float: true, scope: "parent", clearance: 4mm)[
  #if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
      #(if subtitle != none {
        parbreak()
        text(weight: "bold", size: 1.25em)[#subtitle]
      })
    ]]
  }

  #if authors != none and authors != [] {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  #if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  #if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[Abstract] #h(1em) #abstract
    ]
  }
  ]

  doc
}

#show: conf.with(title: "Oolite Quick Reference Sheet", paper: "a4", flipped: true)
#figure(
  align(center)[#table(
    columns: 7,
    align: (auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [],),
    table.hline(),
    [Flight Controls], [], [], [], [], [], [],
    [], [], [], [], [], [], [],
    [F1], [], [1], [ Forward (front) view], [], [V], [ External
    views#super[ 2];],
    [], [], [], [], [], [], [],
    [F2], [], [2], [ Aft (rear) view], [], [Z], [ Cycle IFF Scanner
    zoom#super[ 3];],
    [], [], [], [], [], [], [],
    [F3], [], [3], [ Port (left) view], [⇫], [Z], [ Reset IFF Scanner
    zoom],
    [], [], [], [], [], [], [],
    [F4], [], [4], [ Starboard (right) view], [], [\\], [ Select next
    Space Compass target #super[4]

    #super[ †]

    ],
    [], [], [], [], [], [], [],
    [↑], [], [↓], [ Pitch down (dive) / up (climb)], [], [|], [ Select
    previous Space Compass target #super[4];],
    [], [], [], [], [], [], [],
    [←], [], [→], [ Roll clockwise / anticlockwise], [⇫], [L], [ Contact
    Station Traffic Control#super[ 5];],
    [], [], [], [], [], [], [],
    [,], [], [.], [ Yaw (turn) left / right], [], [C], [ Activate
    Docking Computer

    #super[ †]

    ],
    [], [], [], [], [], [], [],
    [], [], [Ctrl], [ Fine control of pitch, roll and yaw], [⇫], [C], [
    Activate Fast Docking Computer#super[ 6]

    #super[ †]

    ],
    [], [], [], [], [], [], [],
    [W], [], [S], [ Speed increase / decrease], [], [S], [ Turn off the
    music while auto-docking

    #super[ †]

    ],
    [], [], [], [], [], [], [],
    [], [], [I], [ Witchspace Fuel Injectors], [⇫], [D], [ Dump one
    cargo canister#super[ 7]

    #super[ †]

    ],
    [], [], [], [], [], [], [],
    [], [], [J], [ Engage Jump (torus) drive], [⇫], [R], [ Rotate
    through the manifest#super[ 7]

    #super[ †]

    ],
    [], [], [], [], [], [], [],
    [], [], [H], [ Hyperspace jump], [], [\`], [ Show the communication
    log],
    [], [], [], [], [], [], [],
    [], [], [G], [ Galactic Hyperspace jump#super[ 1];], [Esc], [Esc], [
    Launch Escape Pod],
    [], [], [], [], [], [], [],
    [], [], [;], [ Cycle current MFD #super[8];], [], [:], [ Select next
    MFD #super[8];],
    [Ctrl], [;], [ Cycle current MFD in reverse
    #super[8];], [Ctrl], [:], [ Select previous MFD #super[8];], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 8,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [], [],),
    table.hline(),
    [Combat Controls], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [], [], [A], [ Fire laser], [\+], [], [\-], [ Cycle to next /
    previous target],
    [], [], [], [], [], [], [], [],
    [], [], [T], [ Missile target seek], [], [ ], [R], [ Activate ID
    recognition],
    [], [], [], [], [], [], [], [],
    [], [], [M], [ Fire missile (if locked)], [], [ ], [E], [ Activate
    ECM system],
    [], [], [], [], [], [], [], [],
    [], [], [U], [ Unlock missile target], [], [\_], [ Toggle weapon
    lockdown], [],
    [], [], [], [], [], [], [], [],
    [], [], [Y], [ Cycle through available missiles#super[
    †];], [⇫], [T], [ Target nearest incoming missile], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 8,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [], [],),
    table.hline(),
    [Commodities Market Controls], [], [Planetary
    Data], [], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [F8], [], [8], [ Commodities Market], [F7], [], [7], [ Data on
    Planet],
    [F8], [F8], [], [8], [8], [ Commodity Details], [Home], [ Select
    current system],
    [Enter], [ Buy / sell maximum amount], [End], [ Select current
    destination system], [], [], [], [],
    [↑], [], [↓], [ Move cursor up / down the list], [←], [], [→], [
    Select previous / next system on course],
    [←], [], [→], [ Sell / buy one unit of commodity], [], [], [], [],
    [\/], [], [?], [ Change commodity list sort /
    filter], [], [], [], [],
  )]
  , kind: table
  )

\
#emph[Note: holding shift while buying or selling will also]

buy or sell the maximum amount.

#figure(
  align(center)[#table(
    columns: 10,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [], [], [], [],),
    table.hline(),
    [Ship, Systems & Status
    Controls], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [F1], [], [1], [ Launch the ship], [], [F2], [], [2], [], [ Game
    Menu],
    [], [], [], [], [], [], [], [], [], [],
    [F3], [], [3], [ Ship Outfitting#super[
    #emph[‡];];], [F3], [F3], [], [3], [3], [ Ships For Sale#super[
    #emph[‡];];],
    [], [], [], [], [], [], [], [], [], [],
    [F5], [], [5], [ Commander's Profile], [F5], [F5], [], [5], [5], [
    Ship's Manifest],
    [], [], [], [], [], [], [], [], [], [],
    [↑], [], [↓], [Move cursor up / down the list], [], [⇫], [N], [Prime
    next special equipment], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Enter], [], [Select the highlighted
    entry], [Ctrl], [⇫], [N], [Prime previous special
    equipment], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Tab], [], [0], [Fast-activate special
    equipment], [N], [], [B], [Activate special equipment#super[
    9];], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 8,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [], [],),
    table.hline(),
    [Navigation Controls], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [F6], [F6], [], [6], [6], [ Galactic Chart], [Arrows], [ Move cursor
    around the charts],
    [], [], [], [], [], [], [], [],
    [], [F6], [], [6], [], [ Short Range Chart], [Pg Up], [ Zoom chart
    in],
    [], [], [], [], [], [], [], [],
    [I], [ Toggle name/system information view], [Pg Dn], [ Zoom chart
    out], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [?], [ Cycle highlight mode], [Home], [ Return cursor to current
    system], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [^], [ Advanced navigation -- cycle route
    mode], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [Note: typing a planet's name while in the Galactic Chart will
    automatically move the cursor to the world matching the text. When
    more than one planet matches the text, use shift-arrow keys to move
    the cursor to the next highlighted world. Use Alt + left / right
    arrow keys to select the system for which information will be
    displayed in the F7 system data
    screen.], [], [], [], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 8,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [], [],),
    table.hline(),
    [Ship-Station Interfaces Controls], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [],
    [F4], [], [4], [ List available interfaces
    #super[#emph[‡];];], [↑], [], [↓], [ Move cursor up / down the
    list],
    [], [], [], [], [], [], [], [],
    [Enter], [ Activate selected interface], [←], [], [→], [ Move
    between pages on list], [], [],
    [], [], [], [], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 7,
    align: (auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [],),
    table.hline(),
    [Other Controls -- All Systems], [], [], [], [], [], [],
    [], [], [], [], [], [], [],
    [], [P], [ Pause the game], [], [], [O], [ Turn the HUD off / on
    while paused],
    [], [], [], [], [], [], [],
    [⇫], [F], [ Toggle the game frame rate display], [], [], [\*], [
    Take a screenshot],
    [], [], [], [], [], [], [],
    [⇫], [M], [ Toggle mouse flight control in full

    screen mode (roll on x-axis)

    ], [Ctrl], [⇫], [M], [ Toggle mouse flight control in full

    screen mode (yaw on x-axis)

    ],
    [], [], [], [], [], [], [],
    [Caps Lock], [ Toggle free-look camera in ext.
    view], [], [], [], [], [],
    [], [], [], [], [], [], [],
    [], [F12], [ Toggle window / full screen mode], [⇫], [Esc], [ Quit
    the game], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 7,
    align: (auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [],),
    table.hline(),
    [], [], [], [], [], [], [],
    [], [], [], [], [], [], [],
    [], [], [], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([], [], [], [],),
    table.hline(),
    [Notes], [], [], [],
    [], [], [], [],
    [X], [X], [ Tap this key twice], [],
    [], [], [], [],
    [F2], [ Function key], [], [],
    [], [], [], [],
    [⇫], [ Shift key], [], [],
    [], [], [], [],
    [], [], [], [],
    [Ctrl], [ Ctrl key], [], [],
    [], [], [], [],
    [X], [Key only available when equipment installed], [X], [Key only
    available with mod pack equipment],
    [], [], [], [],
    [ ‡], [Only GCW (Galactic Cooperative of Worlds) Stations support
    all of these functions. Other anchorages may only carry a limited
    range.], [], [],
    [1], [Galactic Hyperdrives are one time use only. To jump again
    another drive must be bought.], [], [],
    [2], [The key cycles through the available external views of your
    craft. Ships featured in OXPs may not have external views
    available.], [], [],
    [3], [The key cycles through the five magnification setting of the
    IFF Scanner.], [], [],
    [4], [See the Space Compass section on the next page for more
    information.], [], [],
    [5], [The key requests a docking window from station launch control.
    Use the same key to cancel or renew a request. ], [], [],
    [6], [Usually allowed at GCW Stations only], [], [],
    [7], [Unless cargo is selected by the commander, dumping cargo will
    dump one unit from the first commodity listed in your
    manifest.], [], [],
    [8], [MFDs are multi-function displays which can be configured to
    show information from various equipped items. Different HUDs will
    have different numbers of MFDs available. See #strong[page 6] for
    more information on MFD's.], [], [],
    [9], [Function of N and B keys varies with equipment. Not all
    equipment will define functions for both keys. See specific mod
    documentation for more information.], [], [],
    [This reference sheet makes several references to mod packs. The
    1000+ Oolite eXpansion Packs (OXP's) can add extra missions,
    equipment, ships or change the game mechanics. These mods are not
    part of the default installation of the game and will not be covered
    by this sheet. For more information on them and how to install them,
    visit the Oolite Wiki or consult the in-game #strong[Expansions Pack
    Manager] (see #strong[page 5] for more information).], [], [], [],
    [Attention non-US/UK keyboard users

    Some keys may vary from the ones listed here. All keys are alterable
    via the keyboard configuration screen, accessed from the F2 Game
    options menu, which is available when docked or paused.

    ], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [1], [Speed],
    [This is a percentage gauge showing how fast the ship is travelling
    relative to its maximum speed.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [2], [Roll and Pitch],
    [The diamonds show how much the ship is anti/clockwise rolling and
    climbing/diving relative to its maximum turn rate.], [],
    [Some ships and HUDs may also feature a Yaw indicator. \
    It functions exactly the same way as the Roll and Pitch units.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [3], [Energy Banks],
    [The multiple meters of the Energy Banks show how much energy you
    have available for ship systems. Recharging your shields, firing
    your lasers or ECM and direct hits to the ship's hull will drain the
    banks. If completely drained, the collapse of the energy banks
    destroys the ship. The number and size of energy banks installed is
    dependent on the model of ship being flown.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [4], [Shields],
    [The front (FWD) and rear (AFT) shields, where the bar length equals
    the shield strength. As the shields weaken, the risk of weapons fire
    penetrating the shield increases. Any penetration will result in
    energy drain, along with the risk of equipment damage and the
    destruction of cargo.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [5], [Fuel],
    [A gauge displaying how much witchspace fuel is available. If a
    destination has been selected for a hyperspace jump, a marker line
    will show how much you need to activate the drive.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [6], [Cabin Temperature],
    [This gauge shows the ship's life support temperature. Exposure to
    excessive amounts of heat will overload the life support resulting
    in the crew's death.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [7], [Laser Temperature],
    [Displays the heat level of the active laser. Continuous fire raises
    the laser temperature. An overheated laser will shut down, requiring
    a cool-down period before it will fire again.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [8], [Altitude],
    [Shows the proximity of a nearby planet or sun. Exposure to
    excessive atmospheric and gravitational pressures of such bodies
    will destroy the ship.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [9], [Missiles],
    [These icons show what types of, and how many, missiles or other
    pylon-mounted devices you are carrying, and which one is active
    (yellow border). When a weapon has been locked on to the target, its
    icon turns red.], [],
    [#box(image("./assets/Pictures/1000000000000022000000281FCBE9BB.png", height: 0.4cm, width: 0.33cm))], [Empty
    pylon],
    [#box(image("./assets/Pictures/100000000000002200000028D4D07A4C.png", height: 0.4cm, width: 0.319cm))], [Active
    standard missile ],
    [#box(image("./assets/Pictures/10000000000000200000002E7CBB0BAA.png", height: 0.4cm, width: 0.319cm))], [ECM
    hardened missile target locked],
    [#box(image("./assets/Pictures/100000000000001200000021B10E8A7A.png", height: 0.4cm, width: 0.25cm))], [Quirium
    cascade mine target locked],
    [Should you see a green square replacing the missile information,
    this means that you have used ID Recognition without a missile being
    active.

    #box(image("./assets/Pictures/1000000000000163000000398104FD70.png", height: 0.76cm, width: 4.734cm))Installing
    additional equipment will allow you to keep a target lock with one
    missile while target seeking with another.

    ], [],
    [Mods may add additional pylon-based equipment for purchase. See the
    mod documentation for more information.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [10], [Fuel Scoop],
    [The Fuel Scoop icon will be added to the HUD when one is fitted to
    the ship. When the fuel scoop is active, the icon strobes. If the
    tail of the icon becomes red, then your cargo bay is full and any
    new object scooped will be destroyed.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [11], [Station Aegis],
    [The Station Aegis is the area of space around a GCW station where
    its Vipers will provide protection to your ship should you come
    under attack.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [#box(image("./assets/Pictures/10000000000004FD000000F6FBD54C2B.png", height: 2.611cm, width: 13.6cm))12], [Primed
    Equipment],
    [Displays currently primed OXP equipment, which can be activated
    with the “b” and “n” keys. See page 6 “MFDs and Primable Equipment”
    for more information.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [13], [Threat Indicator],
    [This is an indicator showing the current level of risk to your
    ship. When green, there are no other ships within scanner range.
    Yellow indicates that there are objects within scanner range. When
    the indicator turns red, other ships have targeted you.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [14], [Date and Time],
    [The current date and time, set to Galactic Cooperative of Worlds
    Mean Time.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [15], [Scanner Zoom],
    [The zoom ratio displays the current magnification setting of the
    IFF scanner.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([], [], [],),
    table.hline(),
    [16], [Space Compass], [],
    [The Space Compass shows the direction of the target relative to the
    direction of the ship. The default target of the space compass is
    the planet. When inside the GCW Station Aegis, the compass will
    target the station.], [], [],
    [Fore], [Target position relative to the ship], [Aft],
    [#box(image("./assets/Pictures/100000000000001A0000001BDAF5F305.png", height: 0.499cm, width: 0.48cm))], [Planet], [#box(image("./assets/Pictures/100000000000001A0000001B2F958552.png", height: 0.499cm, width: 0.48cm))],
    [#box(image("./assets/Pictures/100000000000001A0000001BD7300663.png", height: 0.499cm, width: 0.48cm))], [Sun
    †], [#box(image("./assets/Pictures/100000000000001A0000001B58669CF2.png", height: 0.499cm, width: 0.48cm))],
    [#box(image("./assets/Pictures/100000000000001A0000001BCA6AC27F.png", height: 0.499cm, width: 0.48cm))], [GCW
    Stations
    †], [#box(image("./assets/Pictures/100000000000001A0000001BE62838D0.png", height: 0.499cm, width: 0.48cm))],
    [#box(image("./assets/Pictures/10000001000000200000001B5CCDDEA4.png", height: 0.499cm, width: 0.589cm))], [Navigation
    beacon
    †], [#box(image("./assets/Pictures/10000001000000200000001B4A583528.png", height: 0.499cm, width: 0.589cm))],
    [#box(image("./assets/Pictures/10000000000000250000001BF70A17D2.png", height: 0.499cm, width: 0.681cm))], [Witchspace
    beacon
    †], [#box(image("./assets/Pictures/10000000000000250000001BF44F930B.png", height: 0.499cm, width: 0.681cm))],
    [#box(image("./assets/Pictures/100000000000001B0000001BE51ACE22.png", height: 0.499cm, width: 0.499cm))], [Active
    target
    †], [#box(image("./assets/Pictures/100000000000001B0000001BE57F8F9A.png", height: 0.499cm, width: 0.499cm))],
    [Additional compass targets may become available with the
    installation of mods. Refer to the individual mod documentation for
    more information. \

    † In order for stations to become manually selectable the Advanced
    Space Compass equipment is required to be installed.

    ], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [17], [IFF Scanner],
    [The IFF Scanner Grid shows the relative positions of all objects
    within scanner range of the ship. The V lines show which direction
    you are currently viewing. The rule lines show the scale the scanner
    is working in. ], [],
    [#box(image("./assets/Pictures/10000000000000FF000000563F8646EA.png", height: 0.75cm, width: 2.221cm))], [#box(image("./assets/Pictures/10000000000000FF0000005AFB8D923A.png", height: 0.75cm, width: 2.12cm))],
    [Forward (front) View], [Aft (rear) View],
    [#box(image("./assets/Pictures/100000000000010100000056BE214D26.png", height: 0.75cm, width: 2.24cm))], [#box(image("./assets/Pictures/1000000000000101000000579099A9EE.png", height: 0.75cm, width: 2.21cm))],
    [Port (left) View], [Starboard (right) View],
    [Each object is represented by a colour-coded flag and pole. The
    length and position of the flag pole represents the object's
    direction and distance from your ship. The flag's position on the
    pole indicates whether the object is above or below your ship.], [],
    [#box(image("./assets/Pictures/10000000000000160000001DFAF65A99.png", height: 0.4cm, width: 0.3cm))], [Non-powered
    objects #super[1];],
    [#box(image("./assets/Pictures/10000000000000150000001C4FDF0A1D.png", height: 0.4cm, width: 0.3cm))], [Civilian
    craft],
    [#box(image("./assets/Pictures/10000000000000150000001CF558530D.png", height: 0.4cm, width: 0.3cm))], [Hostile
    craft],
    [#box(image("./assets/Pictures/10000000000000150000001CF1E62719.png", height: 0.4cm, width: 0.3cm))], [Police/Government
    craft],
    [#box(image("./assets/Pictures/10000000000000150000001CE7AD75FC.png", height: 0.4cm, width: 0.3cm))], [Police/Government
    craft on intercept],
    [#box(image("./assets/Pictures/10000000000000150000001CC4692DC0.png", height: 0.4cm, width: 0.3cm))], [Thargoid
    craft],
    [#box(image("./assets/Pictures/10000000000000150000001C05BD88D4.png", height: 0.4cm, width: 0.3cm))], [Missile
    #super[2];],
    [#box(image("./assets/Pictures/10000000000000150000001CF51053F8.png", height: 0.4cm, width: 0.3cm))], [Mine
    about to detonate #super[2];],
    [#box(image("./assets/Pictures/10000000000000150000001C18B01FE9.png", height: 0.4cm, width: 0.3cm))], [Space
    stations and other anchorages],
    [#box(image("./assets/Pictures/10000000000000150000001C51CE1B0C.png", height: 0.4cm, width: 0.3cm))], [Navigation
    and witchpoint beacons],
    [#box(image("./assets/Pictures/10000000000000150000001C53E46C30.png", height: 0.4cm, width: 0.3cm))], [Witchspace
    cloud],
    [The twin colour flags are the colours that those IFF flags cycle
    through.], [],
    [1], [Non-powered objects include asteroids, cargo pods, escape
    pods, and abandoned craft.],
    [2], [Certain OXPs will add extra types of munitions to Oolite. The
    game will use the missile or mine IFF flag to show them.],
    [], [],
    [Note: The layout shown here is for the Faulcon deLacy Cobra Mk III
    which you are issued with at the start of the game. Other vessels
    may have alternative instrument configurations.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([], [], [],),
    table.hline(),
    [Equipment Guide], [], [],
    [Item], [TL], [Cost ₢],
    [Advanced Navigational Array (ANA)], [7], [2250],
    [Advanced Space Compass (ASC)], [8], [650],
    [Beam Laser], [5], [1000],
    [Docking Computers (DC)], [10], [1500],
    [ECM Hardened Missile], [10], [350],
    [ECM System (ECM)], [3], [600],
    [Escape Pod (EP)], [7], [1000],
    [External Heat Shielding (HS)], [5], [1500],
    [Extra Energy Unit (EU)], [9], [1500],
    [Fuel], [All], [Varies],
    [Fuel Scoop (FS)], [6], [525],
    [Galactic Hyperdrive (GH)], [11], [5000],
    [Integrated Targeting System (ITS)], [12], [1500],
    [Large Cargo Bay (LCB)], [2], [400],
    [Maintenance Overhaul], [7], [Varies],
    [Military Laser], [11], [6000],
    [Military Shield Enhancement (MSE)], [14], [47550],
    [Mining Laser], [11], [800],
    [Missile], [2], [30],
    [Multi-Targeting System (MTS)], [6], [325],
    [Passenger Berth], [6], [825],
    [Pulse Laser], [4], [400],
    [Quirium Cascade Mine], [7], [2500],
    [Remove Passenger Berth], [2], [100],
    [Scanner Targeting Enhancement (STE)], [12], [450],
    [Shield Boosters (SB)], [11], [14750],
    [Target System Memory Expansion (TSME)], [9], [1250],
    [Unmount and sell all pylon-mounted weapons], [2], [20],
    [Witchdrive Fuel Injectors (FI)], [11], [600],
    [Wormhole Scanner (WS)], [10], [2395],
    [], [], [],
    [Equipment damage can only be repaired in systems of that Tech Level
    or one lower. The listed prices apply only to GCW station shipyards.
    Prices may vary in other anchorages. Additional equipment can be
    obtained by installing mods. See the individual mod documentation
    for more information on their cost, availability and use.], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [Commodities Guide], [], [], [], [],
    [Commodities ], [Price ₢], [per], [], [],
    [Min], [Avg], [Max], [], [],
    [Food], [2.0], [4.8], [7.9], [t],
    [Textiles], [5.2], [7.0], [9.0], [t],
    [Radioactives], [17.3], [22.8], [28.8], [t],
    [Slaves †], [2.4], [14.7], [27.9], [t],
    [Liquor/Wines], [20.7], [28.6], [37.4], [t],
    [Luxuries], [78.4], [90.8], [101.9], [t],
    [Narcotics † ], [0.5], [50.9], [101.4], [t],
    [Computers ], [61.3], [83.0], [102.2], [t],
    [Machinery ], [46.5], [56.4], [65.5], [t],
    [Alloys], [31.6], [38.8], [45.6], [t],
    [Firearms † ], [49.8], [70.3], [88.5], [t],
    [Furs], [45.4], [69.7], [95.2], [t],
    [Minerals], [10.0], [11.9], [13.9], [t],
    [Gold], [35.3], [38.7], [42.2], [kg],
    [Platinum], [62.6], [71.6], [81.0], [kg],
    [Gem-stones], [15.3], [19.5], [23.8], [g],
    [Alien Items ], [21.3], [44.8], [65.7], [t],
    [† Trafficking in these commodities is illegal in all GCW member
    systems.

    Note: These prices are indicative only. GalCop regulations expressly
    forbids the broadcasting of actual prices beyond the current system.
    Prices may also vary widely at non-GCW stations.

    ], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [Combat Rank], [],
    [Rank], [Kills],
    [Harmless], [0],
    [Mostly Harmless], [8],
    [Poor], [16],
    [Average], [32],
    [Above Average], [64],
    [Competent ], [128],
    [Dangerous], [512],
    [Deadly], [2560],
    [Elite], [6400],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([], [], [],),
    table.hline(),
    [Government Guide], [], [],
    [Risk], [Icon], [Type],
    [Negligible], [#box(image("./assets/Pictures/1000000100000051000000759760F827.png", height: 0.4cm, width: 0.27cm))], [Corporate
    State],
    [▲

    Low

    ▼

    ], [#box(image("./assets/Pictures/10000001000000620000007491CB753A.png", height: 0.4cm, width: 0.34cm))], [Democracy],
    [#box(image("./assets/Pictures/10000001000000480000007DA945B054.png", height: 0.4cm, width: 0.229cm))], [Confederacy], [],
    [▲

    Medium

    ▼

    ], [#box(image("./assets/Pictures/10000001000000710000007122FFE589.png", height: 0.4cm, width: 0.4cm))], [Communist
    ],
    [#box(image("./assets/Pictures/10000001000000740000007BD09C1539.png", height: 0.4cm, width: 0.379cm))], [Dictatorship], [],
    [▲

    High

    ▼

    ], [#box(image("./assets/Pictures/100000010000007400000074792CD40E.png", height: 0.4cm, width: 0.4cm))], [Multi-Government],
    [#box(image("./assets/Pictures/10000001000000620000007407B6C1A1.png", height: 0.4cm, width: 0.34cm))], [Feudal], [],
    [Extreme], [#box(image("./assets/Pictures/100000010000007400000083C7C5AE78.png", height: 0.4cm, width: 0.349cm))], [Anarchy],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([], [], [],),
    table.hline(),
    [Economy Guide], [], [],
    [Produces], [Icon], [Type],
    [ Advanced
    technology], [#box(image("./assets/Pictures/100000010000008300000077963A92E0.png", height: 0.4cm, width: 0.439cm))], [Rich
    Industrial],
    [▲

    Basic technology and

    Advance Materials

    ▼

    ], [#box(image("./assets/Pictures/100000010000007100000078FA85F0DF.png", height: 0.4cm, width: 0.379cm))], [Average
    Industrial],
    [#box(image("./assets/Pictures/1000000100000048000000788DA803FC.png", height: 0.4cm, width: 0.24cm))], [Poor
    Industrial], [],
    [▲

    Mixture of both

    ▼

    ], [#box(image("./assets/Pictures/100000010000004D00000083607D4C06.png", height: 0.4cm, width: 0.229cm))], [Mainly
    Industrial],
    [#box(image("./assets/Pictures/10000001000000510000007AFDBB9150.png", height: 0.4cm, width: 0.259cm))], [Mainly
    Agricultural], [],
    [▲

    Advanced organics and Refined Materials

    ▼

    ], [#box(image("./assets/Pictures/100000010000005F00000087EAEB72C4.png", height: 0.4cm, width: 0.28cm))], [Rich
    Agricultural],
    [#box(image("./assets/Pictures/10000001000000580000008CA29FCABF.png", height: 0.4cm, width: 0.25cm))], [Average
    Agricultural], [],
    [Basic organics and

    Raw Materials

    ], [#box(image("./assets/Pictures/100000010000003D0000007ED4693E48.png", height: 0.4cm, width: 0.191cm))], [Poor
    Agricultural],
    [], [], [],
    [On the #strong[F6] chart screen, press the “#strong[?];” key to
    cycle the highlighted information between: \
    \- Sun color

    \- Economy type \
    \- Government type \
    \- Tech level

    ], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([], [],),
    table.hline(),
    [Legal Status], [],
    [Status], [The commander can expect],
    [Clean

    ▼

    ], [Free travel and access to GCW Stations. Full protection by
    GalCop Vipers.],
    [Offender

    ▼

    ], [Free travel and access to GCW Stations. Limited protection by
    GalCop Vipers, but could also be targeted at law enforcer\'s
    discretion. Small bounty on the commander.],
    [Fugitive], [Limited travel and access to GCW Stations. Actively
    targeted by GalCop Vipers. Large bounty on the commander.],
    [All commanders start as #emph[Clean];, with any criminal acts
    reducing their legal standing. Performing services for the GCW will
    repair their reputation.], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 1,
    align: (auto,),
    table.header([],),
    table.hline(),
    [GCW Orbital Laws],
    [Services],
    [Defence Of GCW Space

    Providing assistance to the Galactic Navy by the destruction of
    Thargoid Invasion Fleet craft.

    ],
    [Space Lane Hazard Clearance

    Destruction of navigation hazards from the space lanes, i.e.
    asteroids and wreckage.

    ],
    [Termination Of Criminals

    Providing assistance to GalCop by the destruction of Offender and
    Fugitive rated craft.

    ],
    [Crimes],
    [Murder

    The destruction of any law-abiding vessel with the resulting loss of
    life.

    ],
    [Piracy

    Attacking any law-abiding craft to force them to discharge cargo.

    ],
    [Property Destruction

    Attacking a Galactic Cooperative of Worlds Station, Rock Hermitage
    or other anchorages.

    ],
    [Trafficking

    Leaving a GCW station with any of the following commodities
    on-board: Slaves, Narcotics or Firearms.

    ],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 1,
    align: (auto,),
    table.header([],),
    table.hline(),
    [#strong[Autosave] --#emph[ on / off]

    Automatically saves your game as ‘autosave' before you leave a GCW
    Station.

    ],
    [Docking Clearance Protocol --#emph[ on / off]

    Enables docking clearance requests for GCW stations (and some OXP
    stations)

    ],
    [#strong[Music] --#emph[ off / on]

    Turns the in-game music on and off.

    ],
    [#strong[Sound Volume] --#emph[ sliding scale]

    Volume slider controls both in-game music and sound effects.

    ],
    [#strong[Spoken Messages] -- #emph[off / on]

    Makes the computer read all messages. (if “on”, Voice and Gender
    options are available)

    ],
    [#strong[Full Screen Mode ];#emph[width x height]

    Rotate through screen resolutions choices for full screen mode.

    ],
    [#strong[Play in Window / Full Screen]

    Toggle between playing the game in the full screen or a window.

    ],
    [#strong[HDR Max Brightness (nits)] - #emph[value]

    HDR Mode only. Max brightness monitor is able to produce.

    ],
    [#strong[HDR Paper White Brightness (nits) ];-- #emph[sliding scale]

    HDR mode only. Controls how bright a paper white surface should be.

    ],
    [#strong[Wireframe Graphics] -- #emph[on / off]

    Play Oolite with visuals reminiscent of the original Elite. This
    visual style does not alter the game speed.

    ],
    [#strong[Graphics Detail] --#emph[ minimum / normal / shaders /
    extra]

    Changes the levels of in-game graphics detail. Higher settings may
    be unavailable on old hardware, and use more processing power

    ],
    [Gamma -- #emph[sliding scale]

    Adjust gamma setting for Oolite to suit your display hardware.

    ],
    [Field Of View -- #emph[sliding scale, in degrees]

    Adjust field of view of your viewscreen, value range 30-80.

    ],
    [#quote(block: true)[
    Colorblind Mode --#emph[ None / Protanopia / Deuteranopia /
    Tritanopia]
    ]

    Available when “Graphics Detail” set to “Shaders” or “Extra detail”.
    Adjusts the colors of the game to help colorblind players see things
    more clearly.],
    [Joystick Configuration

    Assign most game actions to your joystick.

    ],
    [Keyboard Configuration

    Reassign any game actions to keys on your keyboard.

    ],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 1,
    align: (auto,),
    table.header([],),
    table.hline(),
    [Propulsion],
    [Roll

    Direction axis for roll anti/clockwise.

    ],
    [Pitch

    Direction axis for dive/climb.

    ],
    [Yaw

    Direction axis for turn left/right.

    ],
    [Increase / Decrease thrust

    Buttons or direction axis to fly faster or slower.

    ],
    [Fuel injection

    Button to activate the Witchspace Fuel Injectors.

    ],
    [Torus drive

    Button to activate the Torus drive hyperspeed system.

    ],
    [Witchspace jump

    Button to initiate a witchspace jump.

    ],
    [Galactive jump

    Button to initiate a galactic jump.

    ],
    [Roll/pitch precision toggle

    Button to toggle the degree of thrust relative to angle of the
    joystick.

    ],
    [Navigation],
    [Next / Previous compass target

    Buttons to select the next/previous space compass target.

    ],
    [Zoom scanner

    Button to zoom out the scanner.

    ],
    [Unzoom scanner

    Button to reset the scanner zoom factor.

    ],
    [Forward / aft / port / starboard view

    Buttons or axes to change the view screen direction.

    ],
    [Cycle external views

    Button to cycle the available external views.

    ],
    [Ident system

    Button to activate the ID Recognition System.

    ],
    [Request docking clearance

    Button to request docking clearance from a station.

    ],
    [Docking computer

    Button to activate/deactivate the docking computer.

    ],
    [Fast docking

    Button to activate the fast docking computer.

    ],
    [Toggle docking music on/off

    Button to turn on/off the docking music.

    ],
    [],
    [],
    [Offensive],
    [Weapons toggle

    Button to toggle weapons online/offline.

    ],
    [Fire laser

    Button to fire the energy weapon.

    ],
    [Fire missile/bomb

    Button to fire currently active pylon-mounted weapon or equipment.

    ],
    [Arm missile/bomb

    Button to activate / target seek currently highlighted pylon-mounted
    weapon or equipment.

    ],
    [Disarm missile/bomb

    Button to deactivate highlighted pylon-mounted weapon or equipment.

    ],
    [Target incoming missile

    Button to automatically target the incoming missile nearest to the
    player ship.

    ],
    [Select next missile/bomb

    Button to rotate through the available range of pylon-mounted
    weapons or equipments.

    ],
    [Next / Previous target

    Buttons to cycle to next/previous target.

    ],
    [Defensive],
    [ECM

    Button to activate the Electronic Counter-Measure Systems.

    ],
    [Dump cargo

    Button to dump one cargo canister

    ],
    [Rotate cargo

    Button to rotate through the manifest

    ],
    [Escape pod

    Button to activate the Escape Pod, if installed. Requires fast
    double press.

    ],
    [Special equipment],
    [Select next / previous MFD

    Buttons to select the next/previous MFD.

    ],
    [Cycle next / previous MFD

    Buttons to cycle to the next/previous MFD display.

    ],
    [Prime next / previous equipment

    Buttons to cycle through selectable equipment.

    ],
    [Activate equipment

    Button to activate primed selectable equipment.

    ],
    [Set equipment mode

    Button to change the mode of the primed equipment.

    ],
    [],
    [Fast-activate first equipment item

    Button to fast-activate the first equipment item.

    ],
    [Fast-activate second equipment item

    Button to fast-activate the second equipment item.

    ],
    [Miscellaneous],
    [Take Snapshot

    Button to capture a screen shot

    ],
    [Pause

    Button to pause the game.

    ],
    [Toggle HUD

    Button to toggle the HUD on/off.

    ],
    [Comms log

    Button to view the comms log.

    ],
    [],
    [Mouse Flight Controls],
    [Fly by mouse control is only available when the game is in Full
    Screen mode.],
    [Move Mouse Up and Down

    Ship dives and climbs.

    ],
    [Move Mouse Left and Right

    Roll anticlockwise and clockwise.

    ],
    [#strong[Left Mouse Button] \
    Fire primary weapon.],
    [#strong[Right Mouse Button] \
    Zero flight roll and pitch.],
    [Mouse Wheel Up

    Increase speed

    ],
    [Mouse Wheel Down

    Decrease speed

    ],
    [],
    [With Caps Lock active and Left Mouse Button down: on external
    views],
    [Move Mouse Up and Down

    External Camera rotates Up / Down

    ],
    [Move Mouse Left and Right

    External Camera rotates Left / Right

    ],
    [],
    [With Caps Lock active on external views],
    [Mouse Wheel Up

    Zoom View In

    ],
    [Mouse Wheel Down

    Zoom View Out

    ],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([], [], [],),
    table.hline(),
    [Career Choices], [], [],
    [Bounty Hunting

    Collect bounties for pirate/fugitive craft destroyed. Bounties are
    also paid if you capture/rescue the escape pods of the
    criminals/victims.

    No additional equipment required. Recommend minimum of: Beam Laser,
    ECM, Fuel Scoop and Shield Booster be fitted before attempting this
    profession.

    ], [], [],
    [Carrier Service

    With a big enough ship you can get paid for moving someone else's
    bulk goods from A to B. Contracts are available through the
    Interfaces screen.

    Requires a ship with larger cargo bays. Recommend an Advanced
    Navigation Array be fitted.

    ], [], [],
    [Mining

    Blast asteroids, scoop up the fragments and sell the minerals on the
    commodities market.

    Requires a Fuel Scoop and Mining Laser. Recommend a Cargo Bay
    Expansion be fitted.

    ], [], [],
    [Passenger or Courier Service

    With a passenger berth fitted, you take a traveller from point A to
    point B for profit. Small packages may also be carried without
    requiring extra equipment. Contracts are available through the
    Interfaces screen.

    May require a Passenger Berth. Recommend an Advanced Navigation
    Array be fitted.

    ], [], [],
    [Piracy

    Attack other ships and steal their cargo, which will make you a
    fugitive very quickly. You will then have GalCop, bounty hunters and
    opportunist commanders after you.

    Requires a Fuel Scoop and upgraded combat systems. Recommend fitting
    an Escape Pod.

    ], [], [],
    [Trading

    Buy low-priced commodities on one world and sell at a higher price
    on another.

    No additional equipment required. Recommend a Cargo Bay Expansion be
    fitted.

    ], [], [],
    [Trafficking In Illegal Goods

    Illegal goods can be traded for massive profit. Doing so will
    eventually make you a fugitive and limit the systems you can trade
    in.

    No additional equipment required. Recommend a Cargo Bay Expansion
    and upgraded combat systems be fitted.

    ], [], [],
    [], [], [],
    [Additional careers can be added by installing mods.

    Refer to the Oolite Wiki for more details.

    ], [], [],
    [], [], [],
    [], [], [],
    [Expansion Pack Manager], [], [],
    [The Expansion Pack Manager is accessed from the main game menu, and
    provides easy access to hundreds of Oolite mods that have been
    created by community members over a number of years. However, please
    note that these mods are not endorsed or vetted by the Oolite
    development team. They are provided “as-is”, with no warranty or
    guarantee whatsoever. Care should be taken to read all the
    documentation for each mod to fully understand the changes it will
    make to the game and your playing experience.], [], [],
    [Guide to colors

    The color of the various expansions in the list is used to indicate
    the following:

    ], [], [],
    [Yellow], [Ready to download and install], [],
    [White], [Installed and at the current version], [],
    [Cyan], [Installed; updated mod available for download.], [],
    [Orange], [Ready to download, but Oolite will also download extra
    mods to make it work.], [],
    [Brown], [Conflicts with an already installed mod.], [],
    [Gray], [Incompatible with this version of Oolite.], [],
    [Red], [Manually installed: cannot also be installed automatically
    (eg. a tweaked mod in the AddOns folder)], [],
    [Blue], [Installed but no longer available for download.], [],
    [Special key controls

    The following keys perform special functions within the Expansion
    Pack Manager

    ], [], [],
    [F], [], [Filter sets. Allows custom filter to be applied to list.],
    [], [], [],
    [I], [], [Display information about the mod.

    Additionally, copies the URL to the clipboard so it can be pasted
    into a browser.

    ],
    [], [], [],
    [X], [], [Extracts mod content to the AddOns folder.

    Folder will initially have an extension of “.off”.

    Change this to “.oxp” to enable it.

    ],
    [], [], [],
    [], [], [],
    [], [], [],
    [], [], [],
    [], [], [],
    [], [], [],
    [Frequently Asked Questions], [], [],
    [Q: Where is my log file?], [], [],
    [#strong[A:] While Oolite Runs, various diagnostic information is
    written to a file called #emph[Latest.log];. Where that file is
    located depends on your operating system: \

    #emph[#strong[Windows:];] In Oolite's folder (typically in
    #emph[C:\\Oolite];), there is a folder called #emph[oolite.app];,
    which contains a folder called #emph[Logs];. A shortcut to this
    folder is created at Oolite\'s Start Menu entries during
    installation.

    #emph[#strong[Linux and other Unix-like systems:];]
    #emph[\~/.Oolite/Logs] (that is, in the hidden folder #emph[.Oolite]
    in your home folder). If you're using Nautilus or Konqueror---if
    you've never heard of them, you probably are---select Show Hidden
    Files from the View menu.

    ], [], [],
    [Q: Why do none of the mods I have installed appear to work in the
    game?], [], [],
    [#strong[A:] Check you do not have Oolite in “Strict Play” mode.
    Also, make sure any mods you have added manually to the AddOns
    folder have an extension of “#emph[.oxp];”.], [], [],
    [Q: I made a tweak to one of the expansions I added, but the tweak
    hasn't been applied in game?], [], [],
    [#strong[A:] After making a change to an expansion pack, make sure
    to hold down the right shift key when starting the game, and hold it
    until you see the spinning Cobra. This will force Oolite to rebuild
    its game cache, thus applying your change to the game
    files.], [], [],
    [Q: I am getting destroyed by pirates everywhere I go!], [], [],
    [#strong[A:] Make sure to avoid dangerous systems if you aren't
    prepared for them. Pirates will generally demand some cargo from
    you, so always keep some cheap cargo on hand which you can eject
    when asked.

    Watch out for parcel or passenger contracts that have a higher than
    normal payout as they might attract unwanted attention. They might
    also require you to travel through dangerous systems.

    For more detailed information on combat tactics and dealing with
    pirates, visit this page on the wiki:
    #link("https://wiki.alioth.net/index.php/Oolite_Tactics")

    ], [], [],
    [], [], [],
    [], [], [],
    [], [], [],
    [], [], [],
    [], [], [],
    [], [], [],
    [Frequently Asked Questions], [], [],
    [Q: I keep crashing when trying to dock!], [], [],
    [#strong[A:] Make sure to use the navigation beacon in front of the
    docking port to help with lining up your ship. Keep the docking port
    centred in your front view, and the navigation beacon centred in
    your rear view. Match the rotation of the station and accelerate
    slowly towards the dock. When you enter the dock, keep moving
    forwards towards the back wall of the dock until the docking
    animation appears.

    For more detailed discussions on docking methods, please visit the
    wiki, and in particular, this page:
    #link("https://wiki.alioth.net/index.php/How_to_Dock")

    ], [], [],
    [Q: It takes a \*long\* time to travel to the station after arriving
    in a new system!], [], [],
    [#strong[A:] Yes it does. However, if there are no powered ships in
    scanner range, you can make use of the torus drive, which can be
    activated by pressing the “#strong[J];” key. The system will speed
    up the flight time considerably, but will auto-disengage whenever
    another ship comes inside scanner range. Which will occur frequently
    because most ships are travelling along the direct route from the
    witchpoint beacon to the planet and main station. But that doesn't
    mean you have to. Flying at right angles a short distance away from
    the main route will put you out of the way of most ships and allow
    your torus drive to operate for longer periods without
    interruption.], [], [],
  )]
  , kind: table
  )

MFDs

MFDs, or Multi-function displays, are a part of the HUD that can show
additional information to the player. Mods are the primary way MFDs are
used, and each mod will use them in different ways - you will need to
check the documentation for each mod to learn about what information
will be displayed.

Each HUD can define multiple MFD positions or slots, and the content of
each MFD can be cycled through the available options. For the default
HUD, there are 2 MFD slots defined: slot 1 being located in the top left
of the screen, and slot 2 in the top right of the screen.

#box(image("./assets/Pictures/10000000000004E000000438D03D351A.png", height: 5.669cm, width: 6.551cm))

Each MFD slot can be made active in turn, but only one MFD slot can be
active at any one time.

To activate an MFD slot, use the #strong[\":\" key];. Press the key
multiple times to move through all the MFD positions. As each position
is activated, a console message will appear on your HUD indicating which
MFD slot has just become active.

#box(image("./assets/Pictures/100000000000025C0000013812D8115F.png", height: 3.383cm, width: 6.551cm))

To move in reverse order through the MFD slots, use the #strong[Ctrl +
\":\" key] combination.

To cycle through the available content for an MFD slot, use the
#strong[\";\" key];. The initial display of any MFD slot is blank. As
you cycle through the available content options, eventually you will
return to the blank item. The available content will be defined by what
mods are installed and what equipment items have been purchased by the
player.

To cycle in reverse order through the available content for an MFD slot,
use the #strong[Ctrl + \";\" key] combination.

Primable equipment

Some mods will give the player custom equipment that can be activated
and used in flight. If the activation of the equipment is not automatic
(that is, based on some condition or situation) then it is likely a
piece of primable equipment has been installed on the player\'s ship so
it can be manually activated.

On the default HUD, the currently primed equipment is displayed on the
bottom right of the screen, below the energy banks. If there are no
primable equipment items installed, nothing will be displayed in this
position. If there are some available, the text \"Primed: None\" will
initially be shown.

#box(image("./assets/Pictures/10000000000001690000002AF07E3454.png", height: 0.76cm, width: 6.551cm))

To \"prime\" a piece of equipment, use the #strong[Shift + \"N\" key]
combination. If there are several pieces of equipment installed, you may
have to press the combination multiple times until the desired equipment
is primed. As each piece of equipment is primed, a console message will
appear on your HUD indicating what equipment has been primed, and the
currently primed equipment will be displayed at the bottom of the
screen.

#box(image("./assets/Pictures/10000000000002D000000138672A921C.png", height: 2.838cm, width: 6.551cm))

To move in reverse order through the primable equipment, use the
#strong[Ctrl + Shift + \"N\" key] combination.

Once primed, there are two functions keys available to a piece of
equipment. The \"mode\" function is called by pressing the #strong[\"b\"
key];, and the \"activate\" function is called by pressing the
#strong[\"n\" key];. As these functions can be used in a variety of
different ways, it is important to read the documentation for each
equipment item to learn how the functions are utilised.

Fast activation

Along with the standard priming and activation methods described above,
2 keys have been allocated to directly execute the activation function
of a particular piece of primable equipment. The first is the
#strong[\"0\" key];, the second is the #strong[\"Tab\" key];. In
essence, once configured, these keys allow the player to bypass the need
to prime an equipment item individually in order to activate it.

To set up what equipment is assigned to each key, you will need to be
docked at a station and then go to the #strong[F4 \"Available
Interfaces\"] screen, and select the \"Manage primable equipment\"
option.

#box(image("./assets/Pictures/10000000000004EC00000438F01BADF5.png", height: 5.614cm, width: 6.551cm))

When selected, you will be asked what equipment should be allocated to
the #strong[\"0\" key.]

#box(image("./assets/Pictures/10000000000005190000043835D9093B.png", height: 5.42cm, width: 6.551cm))

This will be followed by what equipment should be allocated to the
#strong[\"Tab\" key];.

#box(image("./assets/Pictures/10000000000004F400000436D4E346DC.png", height: 5.57cm, width: 6.553cm))

After both equipment items have been selected, the new arrangement will
be displayed as confirmation.

#box(image("./assets/Pictures/10000000000005080000043891731C27.png", height: 5.493cm, width: 6.553cm))

Custom keys for mod equipment

To avoid the need to prime individual equipment items to make use of its
functions, after you have purchased a new piece of primable equipment,
you can go to the Keyboard configuration screen in the Game options
menu, and allocate individual keys to the “mode” and “activate”
functions of the equipment.

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Adder];], [30w x 8h x 45l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001F5000001F56C366291.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.24/0.030], [#strong[Banks & Charge];], [C20],
    [#strong[Roll & Pitch];], [NJ], [#strong[Weapon Mounts];], [F
    M1], [],
    [#strong[Cargo Space (t)];], [2], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [5], [#strong[Base Price
    (cr)];], [65000], [],
    [#strong[Base Equipment];], [Pulse Laser, 1 Missile,
    HS], [], [], [],
    [An agile compact ship favoured by couriers, customisers and
    professional racers.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Anaconda];], [75w x 60h x 170l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001D4000001D4A7A4711C.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.14/0.014], [#strong[Banks & Charge];], [P30],
    [#strong[Roll & Pitch];], [DB], [#strong[Weapon Mounts];], [All
    M7], [],
    [#strong[Cargo Space (t)];], [750], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [9], [#strong[Base Price
    (cr)];], [650000], [],
    [#strong[Base Equipment];], [Pulse Laser, 3 Missiles], [], [], [],
    [The biggest mass produced freighter available, built like an
    asteroid and steers like one.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Asp Mk II];], [65w x 20h x 70l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001ED000001EE6077E5C0.png", height: 2.041cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.40/0.050], [#strong[Banks & Charge];], [P30],
    [#strong[Roll & Pitch];], [JE], [#strong[Weapon Mounts];], [FA
    M1], [],
    [#strong[Cargo Space (t)];], [N/A], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [11], [#strong[Base Price
    (cr)];], [375000], [],
    [#strong[Base Equipment];], [Pulse Laser, 1 Missile], [], [], [],
    [The civilian version of the Galactic Navy's premier long range
    scouting / commando craft.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Boa];], [65w x 60h x 115l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001DA000001DAE98C5EA8.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.24/0.036], [#strong[Banks & Charge];], [P30],
    [#strong[Roll & Pitch];], [NE], [#strong[Weapon Mounts];], [All
    M4], [],
    [#strong[Cargo Space (t)];], [125], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [7], [#strong[Base Price
    (cr)];], [450000], [],
    [#strong[Base Equipment];], [Pulse Laser, 3 Missiles], [], [], [],
    [The replacement for the ageing Python, with better performance and
    capacity.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Boa Cruiser / Mk II];], [65w x 60h x 115l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001FA000001FA5D6E4AD9.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.31/0.040], [#strong[Banks & Charge];], [P32],
    [#strong[Roll & Pitch];], [LE], [#strong[Weapon Mounts];], [All
    M5], [],
    [#strong[Cargo Space (t)];], [175], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [8], [#strong[Base Price
    (cr)];], [495000], [],
    [#strong[Base Equipment];], [Beam Laser, 5 Missiles], [], [], [],
    [The long haul version of the Boa, trading some agility for more
    capacity and speed.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Cobra Mk I];], [70w x 15h x 55l m], [], [], [],
    [#box(image("./assets/Pictures/100000000000021300000213D03D3F2A.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.26/0.025], [#strong[Banks & Charge];], [E25],
    [#strong[Roll & Pitch];], [JF], [#strong[Weapon Mounts];], [FA
    M1], [],
    [#strong[Cargo Space (t)];], [10], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [5], [#strong[Base Price
    (cr)];], [100000], [],
    [#strong[Base Equipment];], [Pulse Laser, 1 Missile], [], [], [],
    [The first truly effective solo fighter/trader ship, but now
    superseded by the Mk III.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Cobra Mk III];], [130w x 30h x 65l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001DA000001DA544F3181.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.35/0.032], [#strong[Banks & Charge];], [H40],
    [#strong[Roll & Pitch];], [JE], [#strong[Weapon Mounts];], [All
    M4], [],
    [#strong[Cargo Space (t)];], [20
    (+15)], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [7], [#strong[Base Price
    (cr)];], [150000], [],
    [#strong[Base Equipment];], [Pulse Laser, 3 Missiles], [], [], [],
    [The most successful medium size ship ever built and an excellent
    fighter/trader.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Constrictor #super[ ];#super[#strong[†];];];], [54w x 10h x
    60l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001DD000001DD5F3CFDBB.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [Unknown], [#strong[Banks & Charge];], [?],
    [#strong[Roll & Pitch];], [Unknown], [#strong[Weapon
    Mounts];], [?], [],
    [#strong[Cargo Space
    (t)];], [Unknown], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Unknown], [], [], [],
    [Currently under test by the Galactic Navy, the rumours say it's
    extremely deadly.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Escape #strong[Pod];];], [7w x 6h x 6l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001AD000001B2ABDD0914.png", height: 2.06cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.05/0.005], [#strong[Banks & Charge];], [P30],
    [#strong[Roll & Pitch];], [AA], [#strong[Weapon Mounts];], [N/A], [],
    [#strong[Cargo Space (t)];], [N/A], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [7], [#strong[Base Price
    (cr)];], [1000], [],
    [#strong[Base Equipment];], [N/A], [], [], [],
    [Only technically a ship, the Escape Pod is the primary lifeboat
    system of GCW ships.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Fer-de-Lance];], [45w x 20h x 85l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001880000018733605447.png", height: 2.032cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.30/0.036], [#strong[Banks & Charge];], [H45],
    [#strong[Roll & Pitch];], [RE], [#strong[Weapon Mounts];], [All
    M2], [],
    [#strong[Cargo Space (t)];], [12], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [9], [#strong[Base Price
    (cr)];], [485000], [],
    [#strong[Base Equipment];], [Beam Laser, 2 Missiles, 2 Passenger
    Berths, MTS, STE, ECM, ASC, FI, FS, DC, SB, EP], [], [], [],
    [An agile and deadly assault class ship favoured by bounty hunters
    and the well-to-do.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Gecko#super[ ];#super[#strong[†];];];], [65w x 12h x 40l
    m], [], [], [],
    [#box(image("./assets/Pictures/10000000000002010000020158BBFC18.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.30/0.045], [#strong[Banks & Charge];], [H40],
    [#strong[Roll & Pitch];], [OG], [#strong[Weapon Mounts];], [F
    M1], [],
    [#strong[Cargo Space (t)];], [3], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Beam Laser, 1 Missile], [], [], [],
    [Produced in unlicensed shipyards, this fighter is a favourite of
    pirates and assassins.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Krait#super[ ];#super[#strong[†];];];], [90w x 20h x 80l
    m], [], [], [],
    [#box(image("./assets/Pictures/100000010000024300000243411D4F1F.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.30/0.035], [#strong[Banks & Charge];], [H25],
    [#strong[Roll & Pitch];], [MG], [#strong[Weapon Mounts];], [F
    M0], [],
    [#strong[Cargo Space (t)];], [2], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Beam Laser], [], [], [],
    [A discontinued fighter design finding a new life in the
    professional racing circuit.], [], [], [], [],
    [#strong[Mamba #super[#strong[†];];];], [65w x 12h x 55l
    m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001C9000001C9B36345D5.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.32/0.032], [#strong[Banks & Charge];], [H30],
    [#strong[Roll & Pitch];], [JG], [#strong[Weapon Mounts];], [F
    M0], [],
    [#strong[Cargo Space (t)];], [4], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Beam Laser], [], [], [],
    [Originally used in professional racing, this fighter is used by
    pirates and escorts alike.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Moray Star Boat];], [60w x 25h x 65l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001EA000001EAF9566E8E.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.30/0.032], [#strong[Banks & Charge];], [H30],
    [#strong[Roll & Pitch];], [JG], [#strong[Weapon Mounts];], [All
    M2], [],
    [#strong[Cargo Space (t)];], [7], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [6], [#strong[Base Price
    (cr)];], [125000], [],
    [#strong[Base Equipment];], [Pulse Laser, 2 Missiles,
    HS], [], [], [],
    [A multi-role ship, often seen as a medical or tourist craft. It's
    popular with pirates too.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Moray #strong[Medical] Boat];], [60w x 25h x 65l
    m], [], [], [],
    [#box(image("./assets/Pictures/10000001000001E1000001E1C71A26B2.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.30/0.032], [#strong[Banks & Charge];], [H30],
    [#strong[Roll & Pitch];], [JG], [#strong[Weapon Mounts];], [F
    M2], [],
    [#strong[Cargo Space (t)];], [7
    (+15)], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [6], [#strong[Base Price
    (cr)];], [145000], [],
    [#strong[Base Equipment];], [HS], [], [], [],
    [Largely used for medical applications, standard model comes with no
    offensive capbilities.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Orbital Shuttle #super[ ];#super[#strong[†];];];], [20w x
    20h x 35l m], [], [], [],
    [#box(image("./assets/Pictures/100000000000020600000205F1255681.png", height: 2.032cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.08/0.016], [#strong[Banks & Charge];], [D10],
    [#strong[Roll & Pitch];], [JD], [#strong[Weapon Mounts];], [N/A], [],
    [#strong[Cargo Space (t)];], [30], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [None], [], [], [],
    [O#emph[ften unmanned, this ship is the GCW's primary in-system
    heavy cargo hauler.];], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Python];], [#strong[#strong[80w x 40h x 130l
    m];];], [], [], [],
    [#box(image("./assets/Pictures/10000000000001B1000001B17B569ADA.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.20/0.020], [#strong[Banks & Charge];], [N25],
    [#strong[Roll & Pitch];], [JD], [#strong[Weapon Mounts];], [All
    M2], [],
    [#strong[Cargo Space (t)];], [100
    (+15)], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [5], [#strong[Base Price
    (cr)];], [200000], [],
    [#strong[Base Equipment];], [Pulse Laser, 1 Missile], [], [], [],
    [An ageing design that's still popular with commanders needing a
    simple robust freighter.], [], [], [], [],
    [#strong[Sidewinder Scout Ship #super[ ];#super[#strong[†];];];], [65w
    x 15h x 35l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001EC000001ECC595B883.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.37/0.037], [#strong[Banks & Charge];], [H25],
    [#strong[Roll & Pitch];], [NH], [#strong[Weapon Mounts];], [F
    M0], [],
    [#strong[Cargo Space (t)];], [N/A], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Pulse Laser], [], [], [],
    [A tough compact fighter popular with racers, freighter escorts and
    pirates alike.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Thargoid Warship #super[ ];#super[#strong[†];];];], [180w x
    40h x 180l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000002510000025171CDF272.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.50/0.050], [#strong[Banks & Charge];], [S40],
    [#strong[Roll & Pitch];], [JE], [#strong[Weapon Mounts];], [All
    M5], [],
    [#strong[Cargo Space (t)];], [N/A], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Thargoid Laser, ECM, 5 Robotic
    fighters], [], [], [],
    [The primary vessel of the Thargoid Invasion Fleet. Deadly and
    fights without fear.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Thargoid Robotic Fighter #super[
    ];#super[#strong[†];];];], [38w x 9h x 36l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001F0000001F1D4B783D7.png", height: 2.041cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.45/0.040], [#strong[Banks & Charge];], [E30],
    [#strong[Roll & Pitch];], [JE], [#strong[Weapon Mounts];], [F
    M0], [],
    [#strong[Cargo Space (t)];], [N/A], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Pulse Laser], [], [], [],
    [Small remote-controlled fighters designed to swarm their
    victims.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Transporter #super[#strong[†];];];], [30w x 10h x 35l
    m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001CE000001CE9AA2BC17.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.10/0.020], [#strong[Banks & Charge];], [E30],
    [#strong[Roll & Pitch];], [JE], [#strong[Weapon Mounts];], [All
    M0], [],
    [#strong[Cargo Space (t)];], [12], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [None], [], [], [],
    [Predating the GCW, this ship serves as shuttle, cargo hauler and
    industrial platform.], [], [], [], [],
    [#strong[Viper #super[ ];#super[#strong[†];];];], [50w x 16h x 55l
    m], [], [], [],
    [#box(image("./assets/Pictures/100000000000020400000204B5CE487B.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.32/0.032], [#strong[Banks & Charge];], [F40],
    [#strong[Roll & Pitch];], [NI], [#strong[Weapon Mounts];], [F
    M1], [],
    [#strong[Cargo Space (t)];], [N/A], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Beam Laser, ECM, 1 Missile,
    EP], [], [], [],
    [GalCop's mainstay patrol vessel, capable of dealing with the most
    deadly threat.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Viper Interceptor #super[ ];#super[#strong[†];];];], [50w x
    16h x 55l m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001F5000001F57CEA1A18.png", height: 2.037cm, width: 2.037cm))], [#strong[Speed/Thrust
    (lm)];], [0.52/0.050], [#strong[Banks & Charge];], [I60],
    [#strong[Roll & Pitch];], [UJ], [#strong[Weapon Mounts];], [F
    M3], [],
    [#strong[Cargo Space (t)];], [N/A], [#strong[Hyperspace];], [yes], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [Military Laser, ECM, 3 Missiles,
    EP], [], [], [],
    [GalCop's best pilots fly these ships to fight threats of an
    interstellar scale.], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [],),
    table.hline(),
    [#strong[Worm #super[ ];#super[#strong[†];];];], [35w x 12h x 35l
    m], [], [], [],
    [#box(image("./assets/Pictures/10000000000001BF000001BFC7AE7144.png", height: 2.043cm, width: 2.043cm))], [#strong[Speed/Thrust
    (lm)];], [0.11/0.012], [#strong[Banks & Charge];], [C20],
    [#strong[Roll & Pitch];], [JE], [#strong[Weapon Mounts];], [F
    M0], [],
    [#strong[Cargo Space (t)];], [2], [#strong[Hyperspace];], [no], [],
    [#strong[Sold at Tech Level];], [N/A], [#strong[Base Price
    (cr)];], [N/A], [],
    [#strong[Base Equipment];], [None], [], [], [],
    [A simple support craft, often seen as a ship's launch, lifeboat or
    miner.], [], [], [], [],
    [], [], [], [], [],
    [Stations and Other Anchorages], [], [], [], [],
    [#box(image("./assets/Pictures/100000000000021F0000021F6251BA5B.png", height: 2.03cm, width: 2.03cm))], [#box(image("./assets/Pictures/100000000000020D0000020DF901DFA4.png", height: 2.032cm, width: 2.032cm))], [#box(image("./assets/Pictures/10000000000001EC000001EC11F34CC1.png", height: 2.032cm, width: 2.032cm))], [#box(image("./assets/Pictures/100000000000023600000235FD1968EA.png", height: 2.027cm, width: 2.032cm))], [],
    [Coriolis Station], [Dodecahedron Station], [Icosahedron
    Station], [Rock Hermit], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([], [], [],),
    table.hline(),
    [Notes], [], [],
    [†], [Ships which are unavailable for purchase at the GCW station
    shipyards for the following reasons:], [],
    [], [•], [GCW shipyards specialise in currently manufactured models
    fitted with hyperspace drives.],
    [], [•], [GCW shipyards will not deal in craft from unlicensed
    manufacturers.],
    [], [•], [It is illegal for civilians to own Local Government,
    Galactic Navy and GalCop ships. It is also illegal for civilians to
    be in possession of craft constructed outside of the Galactic
    Cooperative of Worlds.],
    [•], [Speed is measured against #emph[Light Mach];, which is the
    maximum velocity a ship can reach before suffering relativistic
    effects.], [],
    [•], [The ships' banks and charge rate are graded on the
    #emph[KeZecky] scale. The higher letter (#emph[A] being the lowest)
    and number value, the larger and faster charging the energy bank
    is.], [],
    [•], [A vessel's agility is measured using the #emph[Holdstock]
    method. The higher value of each letter (#emph[A] being the lowest)
    the better the performance.], [],
    [•], [Ships have laser mounts in the #emph[F];orward, #emph[A];ft,
    or #emph[All] view screen directions. The number of pylons is shown
    by the #emph[M] value.], [],
    [•], [Cargo space is measured in GCW standardised 1 TC cargo
    canisters.], [],
    [•], [The base price is calculated for craft with the base equipment
    fitted. Ships available for sale may be fitted with extra equipment,
    with a corresponding increase in price.], [],
    [•], [Images shown here are not to scale and measurements are listed
    in metres.], [],
    [], [], [],
    [Other Objects], [], [],
    [#box(image("./assets/Pictures/10000000000002530000025325D15D12.png", height: 2.032cm, width: 2.032cm))], [#box(image("./assets/Pictures/10000000000001AF000001AFC99D1065.png", height: 2.032cm, width: 2.032cm))], [#box(image("./assets/Pictures/100000000000006400000060E96C64EB.png", height: 1.254cm, width: 1.341cm))],
    [Cargo Canister], [Missile], [Quirium Cascade Mine],
    [#box(image("./assets/Pictures/10000001000000C8000000C3F906FB25.png", height: 1.207cm, width: 1.217cm))], [#box(image("./assets/Pictures/10000000000002560000025678643601.png", height: 2.03cm, width: 2.03cm))], [#box(image("./assets/Pictures/10000000000001DC000001DCF65B6051.png", height: 1.568cm, width: 1.667cm))],
    [Beacon], [Asteroid], [Boulder],
    [#box(image("./assets/Pictures/10000000000001F5000001F53D288C22.png", height: 1.111cm, width: 1.053cm))], [#box(image("./assets/Pictures/1000000000000252000002529E9BFB84.png", height: 2.073cm, width: 1.993cm))], [#box(image("./assets/Pictures/10000000000000ED000000EADE86F00A.png", height: 1.981cm, width: 2.007cm))],
    [Splinter], [Metal Fragment], [Witchcloud],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 10,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [], [], [], [],),
    table.hline(),
    [Solar System -- Galaxy], [Commander
    Status], [Manifest], [], [], [], [], [], [], [],
    [GCW MT], [Ship], [Commodity], [Quantity], [Buy Price], [Sell
    Price], [], [], [], [],
    [Present System], [Destination System], [Credits], [Cargo
    Capacity], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Government], [Government], [Legal Status:], [Combat
    Rating:], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Economy], [Economy], [Outstanding
    Contracts], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Tech Level], [Tech Level], [], [], [], [], [], [], [], [],
    [Notes], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 10,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([], [], [], [], [], [], [], [], [], [],),
    table.hline(),
    [Solar System -- Galaxy], [Commander
    Status], [Manifest], [], [], [], [], [], [], [],
    [GCW MT], [Ship], [Commodity], [Quantity], [Buy Price], [Sell
    Price], [], [], [], [],
    [Present System], [Destination System], [Credits], [Cargo
    Capacity], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Government], [Government], [Legal Status], [Combat
    Rating], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Economy], [Economy], [Outstanding
    Contracts], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [Tech Level], [Tech Level], [], [], [], [], [], [], [], [],
    [Notes], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
    [], [], [], [], [], [], [], [], [], [],
  )]
  , kind: table
  )
