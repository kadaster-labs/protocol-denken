---
title: Nieuwland
---

**Nieuwland** is een ontwerp voor "een gezonde, wenselijke digitale rechtsstaat", uitgewerkt door de denktank <a href="https://achterkantvandeoverheid.nl/" target="_blank">Achterkant van de Overheid</a>. De publicatie beschrijft geen losse verbeteringen, maar een samenhangend ontwerp voor hoe de "achterkant van de overheid" — de onzichtbare informatie-infrastructuur achter elk vooringevuld formulier en elke beslissing — anders ingericht kan worden. Het ontwerp rust op vier pijlers: **organiseren**, **registreren**, **ontwerpen van systemen en processen** en **normeren**.

Voor protocol-denken is vooral de pijler **Nieuwlands registreren** relevant. Daarin wordt uitgewerkt hoe de _rechtstoestand_ — "de stand van zaken met betrekking tot rechten en plichten van burgers en de overheid" — digitaal vastgelegd zou moeten worden.

## Papier was ook een informatietechnologie

In Nieuwland realiseerden ze zich dat digitalisering niet betekent dat je papier digitaliseert, maar dat je vastlegt wat je vroeger _met_ papier deed: het bijhouden van de rechtstoestand. Papier gaf namelijk vanzelf context mee — naam en logo van de organisatie, instructies bij velden, aantekeningen in de kantlijn. Toen gegevens in databases werden losgemaakt van die context, ontstond een probleem:

> Gegevens die niet herleidbaar zijn naar hun oorsprong, ontdaan zijn van hun context of volgens allerlei verschillende criteria zijn vastgelegd betekenen niets. Ze zijn waardeloos. [...] Gegevens zonder context, herkomst en/of constante definitie zijn een soort "anti-informatie".

Dit is niet hypothetisch: het onderzoek van KPMG naar de Fraude Signalering Voorziening (FSV, 2020) liet precies dit mechanisme zien. Daarom geldt in Nieuwland: "elk gebruik is een overgang naar een nieuwe context" en zijn contextovergangen expliciet ontworpen.

## Registreren, interpreteren en besluiten uit elkaar houden

Nieuwland maakt drie stappen expliciet die vandaag vaak samenvallen in één vastlegging:

-   **Registreren**: het vastleggen van een feit in termen uit de leefwereld (bijv. "dit bedrag is ontvangen met deze referentie").
-   **Interpreteren**: het feit begrijpen vanuit de wettelijke taak van een organisatie (bijv. "dit is een afbetaling op vordering X").
-   **Besluiten**: de conclusie die volgt uit feiten én de op dat moment geldende regels — de **producerende context** van een besluit.

Dat onderscheid is essentieel bij hergebruik: wat in de ene juridische context een doorslaggevend criterium is (zoals geslacht of woonadres), kan in een andere context arbitrair of zelfs uitsluitend werken. Door feit, interpretatie en besluit gescheiden en traceerbaar vast te leggen, kan elke afnemer zelf — in de eigen context — herinterpreteren in plaats van de interpretatie van de bron klakkeloos over te nemen.

## Samen zien

Wat dit uiteindelijk oplevert, noemt Nieuwland "samen zien": burgers en overheden hebben gelijktijdige en gelijkwaardige toegang tot dezelfde tijdlijn van vastleggingen, feiten en besluiten. Burgers kunnen daardoor feiten corrigeren of aanvullen vóórdat een besluit genomen wordt, en begrijpen op basis waarvan een besluit tot stand kwam. Voor de rechtspraak wordt hiermee oordeelsvorming over de totstandkoming van een besluit als geheel mogelijk.

## Relatie met protocol-denken

-   Rechtstoestand vastleggen is uitgebreider uitgeschreven als [Chronolexografie](./externe-bronnen.md#chronolexografie) en gaat over die rechtstoestand vastleggen als expliciete feiten, met een strikt onderscheid tussen registreren, interpreteren en besluiten, is een verdere verfijning van wat protocol-denken [gebeurtenisgedreven registers](../oplossingen.md#gebeurtenisgedreven-registers) noemt: events met een expliciete actor, tijdstip, locatie en intentie, zie ook [Event Sourcing](./event-sourcing.md).
-   "Elk gebruik is een overgang naar een nieuwe context" is letterlijk hetzelfde uitgangspunt als [context](../context.md): data ontstaat in één context, gebruik gebeurt in vele gebruikscontexten, en die overgangen moeten expliciet ontworpen worden.
-   "Samen zien" is de burgerkant van [open samenwerken](../oplossingen.md#open-samenwerken): niet alleen de software die contextovergangen verzorgt is open, ook de vastgelegde feiten en besluiten zelf zijn gelijktijdig en gelijkwaardig inzichtelijk.
-   De verbinding is niet toevallig: de architectuur voor de bijhouding van de Basisregistratie Kadaster op basis van Event Sourcing — de kern van protocol-denken — is ontworpen door een van de leden van de denktank achter Nieuwland.

## Meer lezen

-   Volledige publicatie en uitwerkingen: <a href="https://achterkantvandeoverheid.nl/" target="_blank">achterkantvandeoverheid.nl</a>
-   Procesmatige verdieping van "registreren": [Chronolexografie](./externe-bronnen.md#chronolexografie)
-   Beknopte samenvatting: <a href="https://marcvanandel.nl/nl/publicatie/nieuwland/" target="_blank">marcvanandel.nl/nl/publicatie/nieuwland</a>
