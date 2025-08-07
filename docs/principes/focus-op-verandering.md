# Principe: focus op verandering

*Change over state als fundamenteel uitgangspunt*

## Het probleem

Huidige registers zijn 'slechts' gericht op de resulterende _view_ en deze view _ís_ het eigenlijke register. Dit leidt tot verschillende problemen:

- **Verlies van context**: Waarom is een gegeven zo geworden?
- **Geen spoor van wijzigingen**: Welke stappen hebben geleid tot de huidige toestand?
- **Moeilijke correcties**: Hoe corrigeer je iets zonder de historie te verliezen?
- **Beperkte compliance**: Hoe toon je aan dat processen correct zijn gevolgd?
- **Protocol fragiliteit**: Systemen kunnen niet reageren op wijzigingen van andere partijen
- **Synchronisatie problemen**: Geen gedeelde tijdslijn tussen organisaties

## Het principe: focus op verandering

Registers zouden moeten focussen op _change_ (veranderingen) in plaats van alleen op _state_ (toestand). Dit betekent:

### Kernprincipes

1. **Veranderingen zijn eerste klas burgers** - Events en wijzigingen worden expliciet gemodelleerd
2. **Zorgvuldig omgaan met veranderingen** - Elke wijziging wordt gevalideerd en gedocumenteerd  
3. **Precisie in acceptatie** - Nieuwe wijzigingen worden zorgvuldig gecontroleerd voordat ze worden geaccepteerd
4. **Bewaren van intentie** - Niet alleen wat er verandert, maar ook waarom

### Praktische implementatie

```
Traditionele aanpak:
UPDATE personen SET naam = 'Jansen' WHERE id = 456

Focus op verandering aanpak:
COMMAND: RegistreerHuwelijk(manId: 123, vrouwId: 456, datum: 2024-01-15, gekozenAchternaam: 'Jansen')
EVENT: HuwelijkGeregistreerdMetNaamkeuze(manId: 123, vrouwId: 456, datum: 2024-01-15, gekozenAchternaam: 'Jansen')
```

## Voorbeelden

### Voorbeeld 1: Traditioneel vs. Verandering-gericht

**Traditioneel BAG register:**
```
Adres ID: 12345
Straat: Hoofdstraat 1
Woonplaats: Amsterdam
Status: Bestaand
```

**Verandering-gericht BAG register:**
```
Events voor Adres 12345:
- AdresGeregistreerd(straat: "Hoofdstraat 1", woonplaats: "Amsterdam", datum: 2020-01-01)
- StatusGewijzigd(van: "In aanbouw", naar: "Bestaand", datum: 2020-06-01, reden: "Oplevering")
```

### Voorbeeld 2: huwelijk in personen register

**Probleem scenario:** Jan Jansen en Marie de Wit trouwen. Marie neemt de naam Jansen aan. Later blijkt de huwelijksdatum verkeerd geregistreerd.

**Traditionele aanpak:**
1. UPDATE naam → 'de Wit' wordt 'Jansen', geen geschiedenis
2. Correctie → UPDATE huwelijksdatum, oorspronkelijke fout verdwenen

**Verandering-gerichte aanpak:**
1. `RegistreerHuwelijk(manId: 123, vrouwId: 456, datum: 2024-01-15, gekozenAchternaam: 'Jansen')` 
2. Event: `HuwelijkGeregistreerdMetNaamkeuze` → complete business realiteit in één event
3. `CorrigeerHuwelijksdatum(manId: 123, vrouwId: 456, oorspronkelijkeDatum: 2024-01-15, nieuweDate: 2024-01-20)` 
4. Event: `HuwelijksdatumGecorrigeerd` → fout blijft zichtbaar, correctie traceerbaar
5. Huidige view toont: Marie Jansen, huwelijk 20 jan 2024, inclusief correctiehistorie

### Voorbeeld 3: personen register

**Traditioneel personen register**:

- Persoon object

**Verandering-gericht personen register**:

- Geboren
- Verhuisd
- Getrouwd
- Gescheiden
- Overleden

> **Let op**: Dit voorbeeld illustreert ook [context is altijd aanwezig](context-is-altijd-aanwezig.md) - dat is geen toeval. Goede principes versterken elkaar en leiden tot dezelfde ontwerpkeuzes.

## Mindset shift

Focus op verandering vereist een fundamentele shift: **van state denken naar event denken**. Hier is de typische denkevolutie:

### Stap 0: state denken (traditioneel)
```
// Denken: "Ik update de huidige toestand"
UPDATE personen SET achternaam = 'Jansen' WHERE id = 456
UPDATE huwelijken SET datum = '2024-01-15' WHERE man_id = 123 AND vrouw_id = 456
```
**Probleem**: 
- Geen geschiedenis - oude waarden zijn weg
- Geen context - waarom werd dit gewijzigd?
- Geen atomiciteit - wat als één UPDATE faalt?
- Geen causale relatie - huwelijk en naamswijziging lijken onafhankelijk

### Stap 1: object denken met events
```
// Denken: "Ik heb een huwelijk object en dan wijzig ik een naam"
EVENT: HuwelijkGeregistreerd(manId: 123, vrouwId: 456, datum: 2024-01-15)
EVENT: AchternaamGewijzigd(persoonId: 456, nieuweAchternaam: 'Jansen', oorzaak: 'Huwelijk')
```
**Probleem**: Twee aparte events voor één business actie. Wat als één event faalt?

**Verbetering**: Events bewaren geschiedenis, maar nog steeds object-georiënteerd denken.

### Stap 2: object denken met referenties
```
// Denken: "Ik verwijs naar het huwelijk object"
EVENT: HuwelijkGeregistreerd(manId: 123, vrouwId: 456, datum: 2024-01-15)
EVENT: AchternaamGewijzigdDoorHuwelijk(persoonId: 456, nieuweAchternaam: 'Jansen', huwelijkId: 789)
```
**Probleem**: Nog steeds afhankelijkheid tussen events. Event heeft referentie naar ander event nodig.

**Verbetering**: Expliciete relaties, maar nog steeds geen atomiciteit.

### Stap 3: event denken
```
// Denken: "Wat gebeurde er werkelijk? Het complete verhaal in één event"
EVENT: HuwelijkGeregistreerdMetNaamkeuze(manId: 123, vrouwId: 456, datum: 2024-01-15, gekozenAchternaam: 'Jansen')
```
**Doorbraak**: Eén event beschrijft de complete business realiteit. Self-contained en atomisch.

### Waarom stap 3 de beste oplossing is
- **Atomiciteit**: Alles gebeurt samen of helemaal niet
- **Self-contained**: Event vertelt het hele verhaal
- **Geen afhankelijkheden**: Event handlers zijn eenvoudiger
- **Business getrouw**: Modelleert werkelijkheid (naamkeuze hoort bij huwelijk)

## Voordelen

- **Volledige traceability**: Elke wijziging is terug te vinden
- **Betere compliance**: Audit trail is ingebouwd
- **Flexibelere correcties**: Fouten kunnen worden rechtgezet zonder dataverlies  
- **Rijkere informatie**: Context en intentie worden bewaard
- **Betere synchronisatie**: Andere systemen kunnen reageren op wijzigingen

## Relatie met protocol-denken

Focus op verandering is het **hart** van [protocol-denken](../index.md). Zonder gebeurtenissen kunnen organisaties niet effectief samenwerken omdat:

### Protocollen zijn fundamenteel event-driven
Moderne inter-organisatie protocollen zijn niet gebaseerd op "data delen" maar op "gebeurtenissen delen":
- **Tijdsvolgorde cruciaal**: Wie deed wat wanneer bepaalt de uitkomst van protocollen
- **Causaliteit behoud**: Oorzaak-gevolg relaties tussen organisaties blijven bewaard
- **Asynchrone samenwerking**: Organisaties kunnen reageren op hun eigen tempo zonder real-time synchronisatie

### State-based protocollen falen bij schaal
Traditionele "snapshot sharing" protocollen breken bij meerdere organisaties:
- **Race conditions**: Verschillende organisaties wijzigen dezelfde data tegelijk
- **Inconsistente views**: Elk systeem heeft andere "huidige toestand"
- **Geen conflict resolution**: Hoe bepaal je welke wijziging leidend is?

### Events maken dikke protocollen mogelijk  
[Protocol-denken](../index.md) gaat naar protocollen die business regels afdwingen:
- **Event validation**: Protocollen kunnen gebeurtenissen valideren voordat ze geaccepteerd worden
- **Governance via events**: Alle besluiten en wijzigingen zijn traceerbaar
- **Distributed consensus**: Gebeurtenissen creëren overeenstemming tussen organisaties

## Relatie met andere principes

- **Versterkt**: [Context is altijd aanwezig](context-is-altijd-aanwezig.md) - veranderingen behouden context
- **Ondersteunt**: [Meerdere views standaard](meerdere-views-standaard.md) - wijzigingen kunnen naar verschillende views worden geprojecteerd
- **Vereist**: [Digitaal als fundament](digitaal-als-fundament.md) - gebeurtenissen kunnen alleen digitaal goed vastgelegd worden

## Waarom dit principe altijd geldt

Verandering is de enige constante in overheidsregisters. State denken maskeert deze werkelijkheid:

### Elk register verandert continu
Registers zijn nooit statisch:
- **BRP**: Mensen verhuizen, trouwen, overlijden, krijgen kinderen
- **BAG**: Adressen ontstaan, wijzigen, verdwijnen, worden hernummerd  
- **Handelsregister**: Bedrijven starten, fuseren, wijzigen activiteiten, stoppen
- **Kadaster**: Eigendom wisselt, percelen worden gesplitst, grenzen wijzigen

### Elke wijziging heeft context
Iedere verandering gebeurt om een reden:
- **Wie** heeft de wijziging aangevraagd of vastgesteld?
- **Waarom** is deze wijziging doorgevoerd?
- **Wanneer** is deze wijziging van kracht geworden?
- **Op basis waarvan** is deze beslissing genomen?

### Verantwoording is wettelijke verplichting
Overheidsregisters moeten kunnen verantwoorden:
- **Rechtmatigheid**: Was deze wijziging toegestaan?
- **Doelmatigheid**: Was deze wijziging noodzakelijk?
- **Controleerbaarheid**: Kan deze wijziging worden getoetst?
- **Herstelbaarheid**: Kan een fout worden rechtgezet?

### Nuance: vastgestelde gegevens in protocollen
Sommige gegevens zijn "immutable by nature" maar ook bij deze speelt verandering een rol in protocollen:

**Immutable content, dynamic protocol context**:
- **Luchtfoto's**: Inhoud wijzigt niet, maar publicatie, validatie, en gebruik via protocollen wel
- **Meetresultaten**: Waarde is vast, maar certificering, kwaliteit, en geaccepteerdheid evolueren
- **Juridische documenten**: Tekst is vast, maar status (concept→definitief→ingetrokken) wijzigt via protocollen

In protocollen is ook voor "immutable" gegevens de **gebeurtenis van vastleggen** cruciaal:
- **"Foto gemaakt"**: Wanneer, door wie, met welke apparatuur, voor welk doel?
- **"Meting uitgevoerd"**: Door welk lab, volgens welke methode, met welke nauwkeurigheid?
- **"Document ondertekend"**: Door wie, wanneer, onder welke omstandigheden?

**Protocol-perspectief**: Ook immutable content heeft een **lifecycle** die via gebeurtenissen wordt gestuurd.

## Implementatie overwegingen

### Voor protocol-denken specifiek
- **Event schemas**: Gebeurtenissen tussen organisaties vereisen gestandaardiseerde formats
- **Temporal ordering**: Tijdsstempels moeten synchroon zijn tussen organisaties (bijv. NTP)
- **Event versioning**: Protocollen moeten kunnen evolueren door expliciete versionering en regels voor het oplossen van verschillen
- **Conflict resolution**: Heldere regels voor wanneer gebeurtenissen conflicteren

### Technische uitdagingen
- **Storage overhead**: Events nemen meer ruimte in, maar bieden veel meer mogelijkheden
- **Query complexiteit**: [Meerdere views](meerdere-views-standaard.md) worden gegenereerd uit event streams
- **Performance**: Event sourcing vereist goede tooling en caching strategieën
- **Cross-boundary events**: Gebeurtenissen die organisatiegrenzen overschrijden vereisen extra validatie

### Organisatorische aspecten
- **Event governance**: Wie mag welke gebeurtenissen publiceren?
- **Schema evolution**: Hoe evolueren event formats zonder systemen te breken?
- **Migratie**: Bestaande state-based systemen incrementeel naar event-sourcing
- **Training**: Teams moeten leren denken in gebeurtenissen ipv toestanden

---

*Dit principe vormt de basis voor verantwoorde overheidsregistratie en robuuste inter-organisatie protocollen waarin organisaties effectief kunnen samenwerken.*