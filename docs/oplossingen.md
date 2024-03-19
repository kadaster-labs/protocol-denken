---
title: Oplossingen
---
OK. Genoeg beschrijving van de in- en aanleiding voor het **protocol-denken**. Wetende dat we in een
transitie zijn van [papier naar digitaal](./papier-naar-digitaal.md), dat het [ontstaan van
data](./ontstaan-van-data.md) van belang is en gerespecteerd moet worden én rekening houdend met de
[context](./context.md) waarin data _ontstaat_ en meervoudige wordt _gebruikt_ en vergaand
[geautomatiseerd](./automatisering.md), wat zijn dan oplossingen? Of misschien wel
oplossingsrichtingen? Want een complete oplossing is ... misschien nog wel verder weg. Hoewel een
[droombeeld](#droombeeld) wellicht wel mogelijk mis?

## Gebeurtenisgedreven registers

Om te beginnen moeten we _alle_ data als data gaan respecteren. Ook de documenten die aanleiding
voor wijzigingen in de registraties zijn. En _vooral_ die wijzigingen zelf. De
**data-gebeurtenissen** of **events**. Deze beschrijven in detail met welke intentie een register
gewijzigd wordt, wat die wijziging inhoudt, wie dat gedaan heeft, op welk moment, op welke plaats.
En als dat gebeurd is, dan is dat gebeurd. Punt.

Dat betekent om te beginnen dat van _elk register_ moet worden ontworpen wat de
_data-gebeurtenissen/events_ zijn. Welke wijzigingen zijn er? En als er verschillende aanleidingen
zijn, dan zijn dat zeer waarschijnlijk ook verschillende wijzigingen. Alleen al in intentie die
daarin ligt.

Vervolgens moet ook ontworpen worden hoe deze wijzigingen tot een projectie leiden. De primaire
projectie is hier leidend en het meest belangrijk in. Dit behoudt immers dezelfde waarde als de
huidige registers. Met de events hebben we vooral beter vastgelegd hoe het register is geworden tot
wat het geworden is.

Vervolgens dient _per context overgang_ ontworpen te worden welke projectie daar passend is. Zeer
waarschijnlijk zijn dit projecties die afgeleid kunnen worden van de primaire projectie ... maar
vaak vereenvoudigd kunnen worden. Onze inschatting is dat primaire projecties voor het domein, de
context, waarin deze gewijzigd wordt, de meest complexe projectie nodig heeft. Er is namelijk vaak
ook niet meer data beschikbaar dan in de eigen context en dus primaire projectie nodig is.

Uiteraard kan er uniformiteit aangebracht worden in de secundaire projecties om het aantal
transformaties en contextovergangen beperkt te houden. Dat is ook in het voordeel van de bronhouder.
Dat is de actor, de organisatie die de wijzigingen doet en dus events produceert. Zij zijn namelijk
ook verantwoordelijk voor de primaire projectie én alle secundaire projecties die formeel vanuit die
context worden geleverd aan alle contextovergangen. De bronhouder dient dan ook voorzieningen te
leveren en te onderhouden voor het beheer en synchroniseren van alle projecties. Daarover later
meer.

Deze inrichting is nodig om te kunnen beantwoorden aan echt digitale processen. Daarin worden
contract, processen, afspraken geautomatiseerd uitgevoerd. Dat betekent niet dat er geen menselijke
beslissingen meer in zitten, maar die geven alleen richting in de verder geautomatiseerde
uitvoering. Deze uitvoering dient duidelijk, traceerbaar en controleerbaar te zijn.

Met events is het mogelijk om de traceerbaarheid tussen formele beslissingen, bij voorkeur door
mensen gemaakte beslissingen, en de verschillende projecties. Doordat events als een 'stroom van
events' worden opgeslagen en gepubliceerd, is het ook direct mogelijk om bij elke projectie te laten
zien tot hoever deze projectie is bijgewerkt. Het geeft daarmee niet alleen mogelijkheden voor de
traceerbaarheid maar ook voor een expliciete actualiteit!

Als de events als kern van de beslissingen en wijzigingen gezien worden, wat in [Event
Sourcing](./achtergrond/event-sourcing.md) het geval is, dan is ook de historie waterdicht
vastgelegd. Vanuit de stroom van events kan elk historiemodel gevuld worden en kan maximaal herleid
worden hoe 'het is gegaan en geweest'.

Van events is expliciet wat de bron is. Van elk event is bekend wie de actor is die het heeft doen
ontstaan, op welk tijdstip, locatie en intentie. Door projecties en de traceerbaarheid inclusief
actualiteit is het mogelijk om per gebruik te bepalen in welke vorm een projectie het meest passend
is. Als een bronhouder een API aanbiedt op de projectie en dat voorziet in de behoefte vanuit de
vraag, dan is dat een gemakkelijk beheersbare en betrouwbare manier. Echter, het is met _dezelfde
kwaliteit_ mogelijk om een projectie op een andere locatie, dichter bij de vraag te realiseren. Dat
is onder dezelfde kwaliteit want projectie, traceerbaarheid en actualiteit worden op exact dezelfde
manier gerealiseerd als dat die projectie bij de bronhouder zou staan. Dat betekent wel dat de
bronhouder verantwoordelijk is voor die projectie, ook als die niet in zijn data center staat. Daar
zijn aanvullende afspraken voor nodig ... maar dat is goed mogelijk.

Dus gebeurtenisgedreven registers bieden:

- :white_check_mark: traceerbaarheid van het register, de primaire projectie 
- :white_check_mark: mogelijkheden voor secundaire projecties (en daarmee)
- :white_check_mark: ondersteuning voor [context](./context.md) overgangen (transformaties, service
  voorwaarden, data minimalisatie, etc)
- :white_check_mark: ondersteuning voor actualiteit _per_ projectie 
- :white_check_mark: ondersteuning projecties op 'afstand' (in het data center van een andere
  partij)
- :white_check_mark: absolute duidelijkheid over oorsprong (actor, locatie, tijdstip, intentie)
- :white_check_mark: volledige ondersteuning voor historisch begrip (onderzoek, reconstructie,
  historiemodellen, etc)
- :white_check_mark: mogelijkheden voor vergaande [automatisering](./automatisering.md)

> In bovenstaande worden _events_, _data-gebeurtenissen_ en _wijzigingen_ door elkaar gebruikt. Elke
> keer wordt hetzelfde bedoeld: _data-gebeurtenissen_ zíjn _events_ wat de _wijzigingen_ ín een
> register zijn.

## Open samenwerken

In Nederland wordt al langer aan een 'open overheid' gewerkt, maar er is méér nodig. Om vertrouwen
in projecties te hebben in een [gebeurtenisgedreven register](#gebeurtenisgedreven-registers) is het
noodzakelijk dat anderen kunnen controleren en inzien _hoe_ die projectie tot stand komt. Data en
open data zijn 'slechts' één deel van de puzzel. Software is ook een puzzelstuk dat in ogenschouw
genomen moet worden. Dat volgt ook uit de drive van [automatisering](./automatisering.md).

In de overgang van de ene [context](./context.md) naar de andere betreft dat altijd meerdere
partijen. Dat kunnen al afdelingen binnen een organisatie zijn, maar nog vaker zijn dat
verschillende organisaties. Ook en vooral juist dáár is vertrouwen van belang. Door open samen te
werken aan _dezelfde_ software die voor die overgang verantwoordelijk is, wordt vertrouwen en
kwaliteit tussen de partijen haalbaar.

Open samenwerken is in Open Source Software al jaren ontwikkeld en toegepast. We kunnen daar veel
van leren in hoe dat werkt. Open samenwerken zou daarom ook 'open source werken' genoemd kunnen
worden. 'source' is in deze vaak software, maar zou ook heel goed 'documenten' of iets dergelijks
kunnen zijn. Zie ook [Achtergrond: Open Source](./achtergrond/open-source.md).

- :white_check_mark: [Gebeurtenisgedreven registers](#gebeurtenisgedreven-registers) kunnen niet
bestaan _zonder_ open samenwerken!

## Netwerken & Datastromen

Geen enkel proces of bedrijf staat nog volledig op zichzelf. De wereld is verbonden en dat groeit
alleen nog maar verder! Hoe kunnen we daar anders 'antwoord' op geven dan de netwerken recht doen
die zich aandienen? Welke verbindingen zijn er tussen de punten, nodes, onderdelen van het netwerk?
Kunnen we dat inzichtelijk maken? Kunnen we de inzicht geven hoe de data stroomt?

In een netwerk van [gebeurtenisgedreven registers](#gebeurtenisgedreven-registers) stromen events
van het ene proces en organisatie naar het andere. Telkens zijn daar expliciete
[contextovergangen](./context.md) die in [open samenwerking](#open-samenwerken) worden onderhouden.
Op deze manier vertoont zich het netwerk van deelnemers dat verbonden is ... maar ook in welke
richting welke data stroomt en hoe deze getransformeerd wordt in de overgangen van context. En dit
kunnen we ontwerpen. We kunnen actief sturen op de netwerken en de datastromen om richting te geven
aan hoe deze de maatschappij kunnen dienen.

- :white_check_mark: ontwerpen en inzichtelijk maken van netwerken ondersteunt het inzicht en
  overzicht van [gebeurtenisgedreven registers](#gebeurtenisgedreven-registers)
- :white_check_mark: datastromen maken inzichtelijk hoe data van waar naar waar stroomt ... en hoe
  daarop de sturen is

## Droombeeld

In de transitie van [papier naar digitaal](./papier-naar-digitaal.md) nemen we onszelf door een
andere richting te nemen dan zoals we al lang gedaan hebben. Nee, we durven de stap te maken om
digitale processen te ontwerpen en in te richten. Uiteraard hebben we dezelfde zekerheden nodig als
in de huidige situatie ... maar dat kunnen we wél _anders_ doen!

Daarvoor ontwerpen we een [netwerk](#netwerken--datastromen) van [gebeurtenisgedreven
registers](#gebeurtenisgedreven-registers) waarin expliciet is gemaakt hoe
[datastromen](#netwerken--datastromen) gaan en hoe die overgangen van [context](./context.md) zijn.
Er verschijnt een netwerk van elkaar beïnvloedende deelnemers, partijen, nodes die samenwerken in
een **organisme**. Autonome onderdelen die zelf beslissingen maken, zelf gebeurtenissen produceren
én traceerbaarheid wat de impact daarvan is. Vergaand [geautomatiseerd](./automatisering.md) dmv van
[open samenwerking](#open-samenwerken).

Dat biedt de mogelijkheid om expliciet vast te leggen welke data is gebruikt bij een beslissing.
Daaruit kan ook worden geanalyseerd welke impact een mogelijk nieuw inzicht heeft op een genomen
beslissing. Daarmee worden correcties mogelijk. Daarmee wordt het mogelijk om simulaties te doen van
nieuwe regelingen en wetgeving. We kunnen regelingen ontwerpen die _exact_ bereiken wat we voor ogen
hebben!

Hoewel deze gehele infrastructuur in [open samenwerking](#open-samenwerken) tot stand gebracht moet
worden, is het vooral het 'onzichtbare deel van de digitale overheid' dat 'gewoon werkt'. Het is er
gewoon. Het werkt. En het werkt top! Daar kunnen burgers en bedrijven op rekenen. Het kan
gevalideerd worden door toezichthouders. Er kunnen allerlei controlemechanismen ingebouwd worden. En
het kan vooral _gebruikt_ worden.

Het gevolg van een subliem werkende _digitale_ overheid is dat er ruimte komt om de mens meer
centraal te stellen ipv computer systemen. We kunnen ontwerpen waar mensen een beslissing kunnen
sturen en beïnvloeden, zodat de juiste effecten bereikt worden. Het is mogelijk om te ontwerpen dat
er ambtenaren zijn die burgers kunnen ondersteunen en helpen bij hun aanvragen, verwerkingen,
verantwoordelijkheden en rechten. Een subliem werkende _digitale_ overheid brengt een meer
menselijke en persoonlijke overheid! :heart:

