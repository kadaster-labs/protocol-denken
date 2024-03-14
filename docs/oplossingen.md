---
title: Oplossingen
---
OK. Genoeg beschrijving van de in- en aanleiding voor het **protocol-denken**. Wetende dat we in een
transitie zijn van [papier naar digitaal](./papier-naar-digitaal.md), dat het [ontstaan van
data](./ontstaan-van-data.md) van belang is en gerespecteerd moet worden én rekening houdend met de
[context](./context.md) waarin data _ontstaat_ en meervoudige wordt _gebruikt_, wat zijn dan
oplossingen? Of misschien wel oplossingsrichtingen? Want een complete oplossing is ... misschien nog
wel verder weg.

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
- :white_check_mark: ondersteuning voor [context](./context.md) overgangen (transformaties, service voorwaarden, data minimalisatie, etc)
- :white_check_mark: ondersteuning voor actualiteit _per_ projectie 
- :white_check_mark: ondersteuning projecties op 'afstand' (in het data center van een andere partij)
- :white_check_mark: absolute duidelijkheid over oorsprong (actor, locatie, tijdstip, intentie)
- :white_check_mark: volledige ondersteuning voor historisch begrip (onderzoek, reconstructie, historiemodellen, etc)
- :white_check_mark: mogelijkheden voor vergaande [automatisering](./automatisering.md)

> In bovenstaande worden _events_, _data-gebeurtenissen_ en _wijzigingen_ door elkaar gebruikt. Elke
> keer wordt hetzelfde bedoeld: _data-gebeurtenissen_ zíjn _events_ wat de _wijzigingen_ ín een
> register zijn.