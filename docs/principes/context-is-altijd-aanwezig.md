---
title: Context is altijd aanwezig
---
# Principe: context is altijd aanwezig[^1]

*Contextvrije gegevens (data) bestaan niet - elk gegeven heeft betekenis binnen een specifieke context*

## Het probleem

We doen vaak alsof gegevens (data) "neutraal" en "contextvrij" zijn. Dit leidt tot problemen:

- **Betekenisverlies**: Gegevens krijgen andere betekenis in nieuwe contexten
- **Verkeerde interpretaties**: Dezelfde waarde betekent iets anders in verschillende systemen  
- **Integratiefouten**: Gegevens worden "zomaar" gekopieerd zonder begrip van context
- **Synchronisatieproblemen**: Wijzigingen in bronnen bereiken een gebruiksdoel met verkeerde betekenis
- **Protocol failures**: Inter-organisatie protocollen falen omdat context niet wordt overgedragen
- **Semantische chaos**: Organisaties praten langs elkaar heen over "dezelfde" gegevens

## Het principe: context is altijd aanwezig

Context is fundamenteel aanwezig in alle gegevens (data). Er bestaan geen contextvrije gegevens. Dit betekent:

### Kernprincipes

1. **Context is inherent** - Elk gegeven heeft betekenis binnen specifieke bounded contexts
2. **Context bepaalt interpretatie** - Dezelfde waarde kan verschillende betekenissen hebben
3. **Contextovergang vereist design** - Data transformatie tussen contexten moet bewust ontworpen worden
4. **Context moet expliciet** - Maak contexten zichtbaar in informatiemodellen en interfaces

## Voorbeelden

### Voorbeeld 1: adres in verschillende contexten

**BRP context**: 
```
Adres = WoonAdres {
  straat: "Hoofdstraat 1",
  betekenis: "Officieel ingeschreven woonadres",
  geldigheid: "Vanaf inschrijfdatum tot uitschrijving",
  verificatie: "Door gemeente gevalideerd"
}
```

**Logistiek context**:
```
Adres = BezorgAdres {
  straat: "Hoofdstraat 1", 
  betekenis: "Adres waar pakket afgeleverd kan worden",
  geldigheid: "Tot klant andere bezorgadres opgeeft",
  verificatie: "Door klant opgegeven, door bezorger bevestigd"
}
```

**Transformatie**: 
- BRP WoonAdres kan basis zijn voor BezorgAdres
- Maar klant kan ander BezorgAdres kiezen
- Context bepaalt welke regels en validaties gelden

### Voorbeeld 2: naam in verschillende registers

**BRP context**: "Marie de Wit-Jansen"
- Juridische naam na huwelijk  
- Officieel, kan alleen via ambtenaar gewijzigd
- Gebruikt voor officiële documenten

**Zorgverzekering context**: "Marie Jansen"
- Naam zoals gebruikt in zorgcommunicatie
- Kan door klant gewijzigd worden
- Gebruikt voor correspondentie en declaraties

**Contextovergang**: 
- BRP naam is uitgangspunt
- Zorgverzekeraar laat klant "communicatienaam" kiezen
- Transformatie is bewuste bedrijfsregel, niet technische mapping

### Voorbeeld 3: personen register

**Traditioneel personen register**:

- Persoon object

**Verandering-gericht personen register**:

- Geboren
- Verhuisd
- Getrouwd
- Gescheiden
- Overleden

> **Let op**: Dit voorbeeld illustreert ook [Focus op verandering](focus-op-verandering.md) - dat is geen toeval. Goede principes versterken elkaar en leiden tot dezelfde ontwerpkeuzes.

## Mindset shift

Context is altijd aanwezig vereist een fundamentele shift: **van contextvrij denken naar context bewust denken**. Hier is de typische denkevolutie:

### Stap 0: contextvrij denken (traditioneel)
```
// Denken: "Gegevens zijn neutraal, kopieer gewoon"
SELECT naam, adres FROM personen WHERE id = 123
INSERT INTO andere_tabel (naam, adres) VALUES ('Jan Jansen', 'Hoofdstraat 1')
```
**Probleem**:
- Naam uit BRP heeft andere betekenis dan naam in CRM
- Adres uit BAG verschilt van adres in logistiek systeem
- Geen begrip waarom gegevens zo zijn zoals ze zijn
- Geen validatie of transformatie

### Stap 1: bewustwording van verschillen
```
// Denken: "Er zijn wel verschillen, maar we mappen wel"
BRP_naam -> CRM_naam (met simpele mapping)
BAG_adres -> Logistiek_adres (met veld conversie)
```
**Probleem**: Technische mapping zonder begrip van business context. Werkt soms, faalt onverwacht.

**Verbetering**: Eerste bewustwording dat systemen verschillend zijn.

### Stap 2: context als metadata
```
// Denken: "We voegen context toe als extra veld"
SELECT naam, adres, 'BRP' as bron FROM personen
SELECT naam, adres, 'CRM' als bron FROM klanten
```
**Probleem**: Context wordt als extra informatie behandeld, niet als fundamentele eigenschap.

**Verbetering**: Context wordt zichtbaar, maar nog steeds als bijzaak.

### Stap 3: context bewust denken
```
// Denken: "Context bepaalt betekenis - ontwerp transformatie bewust"
BRP_Context: {
  naam: JuridischeNaam(voornaam, tussenvoegsel, achternaam),
  betekenis: "Officiële naam volgens GBA/BRP",
  geldigheid: "Per registratie moment"
}

CRM_Context: {
  naam: ContactNaam(roepnaam, achternaam),
  betekenis: "Naam voor commerciële communicatie", 
  geldigheid: "Tot klant dit wijzigt"
}

Transformatie: BRP_JuridischeNaam -> CRM_ContactNaam (bewuste keuze, gedocumenteerd)
```
**Doorbraak**: Context wordt onderdeel van het informatiemodel. Transformaties zijn expliciete designbeslissingen.

### Waarom stap 3 de beste oplossing is
- **Expliciete semantiek**: Wat betekenen deze gegevens hier?
- **Bewuste transformaties**: Hoe gaat betekenis van A naar B?
- **Gedocumenteerde keuzes**: Waarom is dit zo gemodelleerd?
- **Voorspelbare resultaten**: Systemen gedragen zich consistent

## Voordelen

- **Correcte interpretatie**: Gegevens worden begrepen zoals bedoeld
- **Betere integraties**: Bewuste transformaties tussen systemen
- **Minder fouten**: Expliciete context voorkomt misverstanden
- **Rijkere semantiek**: Betekenis wordt behouden en uitgebreid
- **Betere traceability**: Context vertelt waar data vandaan komt en waarom

## Relatie met protocol-denken

Context is **essentieel** voor [protocol-denken](../index.md) omdat protocollen fundamenteel gaan over het overbruggen van verschillende contexten:

### Protocollen zijn context-overbrugging
Moderne inter-organisatie protocollen zijn niet alleen dataformaten, maar **context-vertalers**:
- **Semantische mapping**: Protocol definieert hoe betekenis van organisatie A wordt vertaald naar organisatie B
- **Context preservation**: Rijke context informatie blijft behouden tijdens uitwisseling
- **Bounded context integration**: [Dikke protocollen](../index.md) bevatten expliciete regels voor context-overgangen

### Context maakt dikke protocollen mogelijk
[Protocol-denken](../index.md) evolueert naar protocollen die meer dan transport regelen:
- **Business rule validation**: Context bepaalt welke validaties gelden in welke situaties
- **Semantic consistency**: Protocollen garanderen dat betekenis consistent blijft
- **Context-aware workflows**: Verschillende organisaties kunnen verschillende contexten hanteren binnen hetzelfde protocol

### Context is de basis voor netwerken van datastromen
[Netwerken van datastromen](../oplossingen.md#netwerken--datastromen) werken alleen met expliciete context:
- **Multi-organizational views**: Elke organisatie heeft zijn eigen context, maar kan deelnemen aan gedeelde protocollen
- **Context evolution**: Nieuwe organisaties kunnen toetreden door hun context te mappen op bestaande protocollen
- **Federated semantics**: Verschillende definities van "hetzelfde" concept kunnen naast elkaar bestaan

## Relatie met andere principes

- Versterkt [Focus op verandering](focus-op-verandering.md) - events behouden context van veranderingen
- Ondersteunt [Meerdere views standaard](meerdere-views-standaard.md) - elke view heeft eigen context
- Basis voor contextovergang-ontwerp - expliciete context transformaties

## Waarom dit principe altijd geldt

Context is niet optioneel - het is fundamenteel aanwezig in alle business processen:

### In elk register
Elk register heeft zijn eigen business context:
- **BRP**: Juridisch-administratieve context van burgerregistratie
- **BAG**: Geo-administratieve context van adressen en gebouwen
- **Handelsregister**: Economische context van bedrijfsvoering
- **Zorgregisters**: Medische context van zorgverlening

### Bij elke gegevensuitwisseling
Zodra gegevens een systeemgrens overschrijden, wijzigt de context:
- Van **interne opslag** naar **externe communicatie**
- Van **administratief** naar **operationeel** gebruik
- Van **historisch** naar **actueel** perspectief
- Van **detail** naar **samenvatting** niveau

### In alle business processen
Elk proces heeft eigen betekenis voor dezelfde gegevens:
- **Aanvragen**: Context van burger die iets wil
- **Toetsen**: Context van ambtenaar die valideert  
- **Verstrekken**: Context van afnemer die gebruikt
- **Archiveren**: Context van juridische bewaring

**Conclusie**: Context negeren is een ontwerpfout, niet een keuze. Dit principe geldt altijd.

## Implementatie overwegingen

**Voordelen van context bewust ontwerp:**
- **Minder integratiefouten** door expliciete transformaties
- **Betere gegevenskwaliteit** door context validatie
- **Duidelijkere communicatie** tussen teams over data betekenis
- **Flexibelere systemen** die kunnen evolueren met context

### Protocol-specifieke uitdagingen:
- **Context governance**: Wie bepaalt de "officiële" betekenis van concepten in protocollen?
- **Semantic versioning**: Hoe evolueren contexten zonder protocollen te breken?
- **Multi-party consensus**: Hoe bereik je overeenstemming over betekenis tussen organisaties?
- **Context conflict resolution**: Wat gebeurt er als organisaties verschillende definities hebben?

### Technische uitdagingen:
- **Meer complexiteit** in informatiemodellen en transformaties
- **Performance overhead** door context validatie en transformatie
- **Cross-boundary validation**: Context validatie over organisatiegrenzen heen
- **Semantic drift detection**: Herkennen wanneer context-betekenis onbedoeld verandert

### Organisatorische uitdagingen:
- **Team alignment** vereist begrip van business contexten
- **Protocol governance**: Wie beheert gedeelde context-definities?
- **Change management**: Context wijzigingen hebben impact op alle deelnemers
- **Documentatie** van context en transformaties is essentieel voor protocol-werking
- **Protocol als context-contract**: Protocollen documenteren exact wat elk veld betekent in elke context
- **Context evolution management**: Backwards compatibility en gradual migration tussen context-versies

---

*Dit principe vormt de basis voor betrouwbare gegevensuitwisseling tussen organisaties met verschillende contexten via robuuste protocollen.*

[^1]: NOTE Oorspronkelijk ontstaan uit en overgenomen vanuit [project Uit betrouwbare bron](https://uitbetrouwbarebron.nl) en aangepast naar protocol-denken
