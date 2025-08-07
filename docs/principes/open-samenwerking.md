---
title: Open samenwerking
---
# Principe: open samenwerking

*Protocollen ontstaan en evolueren alleen in open samenwerking tussen alle deelnemers*

## Het probleem

Traditionele overheidsystemen worden vaak in isolatie ontwikkeld, wat tot verschillende problemen leidt:

- **Silo-ontwikkeling**: Organisaties ontwikkelen eigen oplossingen zonder afstemming
- **Vendor lock-in**: Commerciële leveranciers bepalen protocol-specificaties in gesloten systemen
- **Incompatibiliteit**: Systemen kunnen niet met elkaar communiceren door gebrek aan gemeenschappelijke afspraken
- **Geen vertrouwen**: Gesloten protocollen maken controle en verificatie onmogelijk
- **Evolutie stagneert**: Protocollen kunnen niet evolueren omdat wijzigingen ondoorzichtig zijn
- **Asymmetrische macht**: Grote organisaties domineren protocol-ontwikkeling ten koste van kleinere partijen

## Het principe: open samenwerking

Protocollen voor gegevensuitwisseling moeten ontwikkeld worden in open samenwerking tussen alle betrokken partijen. Dit betekent:

### Kernprincipes

1. **Transparante ontwikkeling** - Alle beslissingen over protocollen zijn inzichtelijk en traceerbaar
2. **Inclusieve participatie** - Alle belanghebbenden kunnen bijdragen aan protocol-ontwikkeling
3. **Open specificaties** - Protocol-beschrijvingen zijn publiek toegankelijk en begrijpelijk
4. **Gedistribueerde besluitvorming** - Geen enkele organisatie domineert protocol-ontwikkeling
5. **Evolutionaire governance** - Protocollen kunnen evolueren door consensus tussen deelnemers

### Praktische implementatie

```
Traditionele aanpak:
1. Organisatie A definieert intern protocol
2. Organisatie B moet zich aanpassen aan protocol van A
3. Wijzigingen gaan via organisatie A
4. Geen inzicht in ontwerpkeuzes

Open samenwerking aanpak:
1. Alle organisaties participeren in protocol-definitie
2. Open specificaties en ontwerpkeuzes gedocumenteerd
3. Consensusproces voor wijzigingen
4. Transparante governance en besluitvorming
```

## Voorbeelden

### Voorbeeld 1: Internet protocollen als inspiratie

**Hoe het internet werkt:**
- **TCP/IP**: Ontwikkeld door ARPANET gemeenschap, niet door één bedrijf
- **HTTP**: Tim Berners-Lee maakte specificaties publiek beschikbaar
- **HTML/CSS**: W3C coördineert open standaardisatie met alle partijen
- **DNS**: Gedistribueerd systeem zonder centrale controle

**Resultaat**: Wereldwijde interoperabiliteit door open samenwerking

### Voorbeeld 2: Overheids-scenario - BRP uitwisseling

**Traditioneel (gesloten):**
```
1. Ministerie ontwikkelt BRP-interface intern
2. Gemeenten moeten zich aanpassen aan ministerie-specificaties
3. Wijzigingen komen van ministerie zonder consultatieproces
4. Leveranciers bouwen proprietary koppelingen
```

**Open samenwerking:**
```
1. BRP-protocol commissie met vertegenwoordigers van:
   - Ministerie BZK
   - Gemeenten (VNG)
   - Software leveranciers
   - Privacy toezichthouders
2. Open specificatie proces met publieke consultatie
3. Referentie-implementaties beschikbaar
4. Wijzigingsproces met impact-analyse en stemming
```


## Mindset shift

Open samenwerking vereist een fundamentele shift: **van "wij bepalen" naar "samen ontwikkelen"**:

### Stap 0: gesloten ontwikkeling (traditioneel)
```
// Denken: "Wij weten wat goed is, anderen passen zich aan"
1. Interne requirements analyse
2. Interne system design
3. Implementatie door onze leverancier
4. Anderen moeten aansluiten op onze API
```
**Probleem**: 
- Geen begrip van andermans behoeften
- Resistentie bij andere organisaties
- Suboptimale oplossingen
- Langzame adoptie

### Stap 1: consultatie achteraf
```
// Denken: "We vragen feedback op ons ontwerp"
1. Interne ontwikkeling
2. Concept ter review voorleggen
3. Feedback verwerken waar mogelijk
4. Rollout naar anderen
```
**Probleem**: Fundamentele ontwerpkeuzes al gemaakt, alleen details aanpasbaar.

**Verbetering**: Anderen krijgen stem, maar beperkt.

### Stap 2: samenwerking vanaf begin
```
// Denken: "We ontwerpen samen wat voor iedereen werkt"
1. Stakeholder analyse van alle betrokkenen
2. Gezamenlijke requirements en use cases
3. Co-creatie van specificaties
4. Gedeelde implementatie en governance
```
**Probleem**: Traag proces, veel afstemming nodig.

**Verbetering**: Echte samenwerking, betere adoptie.

### Stap 3: open samenwerking denken
```
// Denken: "We creëren een ecosysteem waarin iedereen kan bijdragen"
1. Open governance structuur
2. Transparante besluitvorming
3. Documentatie en tooling voor nieuwe deelnemers
4. Evolutie door consensus
```
**Doorbraak**: Zelfevoluerende protocollen met brede adoptie en vertrouwen.

### Waarom stap 3 de beste oplossing is
- **Netwerkeffecten**: Meer deelnemers maken protocol waardevoller
- **Collective intelligence**: Betere oplossingen door diverse input
- **Snellere adoptie**: Eigenaarschap leidt tot commitment
- **Langetermijn stabiliteit**: Geen afhankelijkheid van één organisatie

## Voordelen

- **Betere kwaliteit**: Diverse perspectieven leiden tot robuustere protocollen
- **Snellere adoptie**: Deelnemers implementeren eerder wat ze mee hebben ontworpen
- **Lagere kosten**: Gedeelde ontwikkeling en onderhoud
- **Vertrouwen en legitimatie**: Transparantie creëert vertrouwen, overheidsprotocollen krijgen democratische legitimatie
- **Evolutionaire veerkracht**: Protocollen overleven organisatieveranderingen
- **Innovatie acceleratie**: Open specificaties stimuleren innovatie

## Relatie met protocol-denken

Open samenwerking is **fundamenteel** voor [protocol-denken](../index.md) omdat dikke protocollen alleen kunnen ontstaan door intensieve samenwerking:

### Dikke protocollen vereisen consensus
[Dikke protocollen](../index.md) bevatten business logica en governance regels die alleen succesvol zijn bij breed draagvlak:
- **Business rule consensus**: Organisaties moeten overeenstemming bereiken over validatieregels
- **Governance alignment**: Wie mag wat wijzigen en onder welke voorwaarden
- **Conflict resolution**: Expliciete procedures voor wanneer organisaties het oneens zijn

### Netwerken ontstaan door open samenwerking
[Netwerken van datastromen](../oplossingen.md#netwerken--datastromen) kunnen alleen groeien in open ecosystemen:
- **Organic growth**: Nieuwe organisaties kunnen aanhaken zonder permission van bestaande partijen
- **Federated governance**: Geen centrale autoriteit, maar gedistribueerde besluitvorming
- **Innovation at edges**: Nieuwe use cases ontstaan bij deelnemers, niet bij centrale partij

## Relatie met andere principes

- **Enabler voor**: [Context is altijd aanwezig](context-is-altijd-aanwezig.md) - context-mappings ontstaan door samenwerking tussen bounded contexts
- **Enabler voor**: [Meerdere views standaard](meerdere-views-standaard.md) - verschillende organisaties definiëren verschillende views samen
- **Versterkt**: [Focus op verandering](focus-op-verandering.md) - event schemas vereisen consensus over betekenis van gebeurtenissen
- **Vereist**: [Digitaal als fundament](digitaal-als-fundament.md) - open samenwerking gebeurt via digitale platforms

## Waarom dit principe altijd geldt

Open samenwerking is geen "nice-to-have" maar een noodzaak voor werkende inter-organisatie protocollen:

### Complexiteit vereist samenwerking
Moderne overheidsprocessen zijn te complex voor één organisatie:
- **Domein-overstijgende expertise**: Juridisch, technisch, domeinkennis verspreid over organisaties
- **Impact analyse**: Wijzigingen hebben gevolgen die één organisatie niet kan overzien
- **Schaalvereisten**: Protocollen moeten werken voor duizenden implementaties

### Vertrouwen en legitimatie zijn voorwaarden
Overheidsorganisaties implementeren alleen protocollen die ze vertrouwen en als legitiem ervaren:
- **Transparantie**: Open processen maken controle en verificatie mogelijk
- **Verantwoordelijkheid**: Duidelijke rollen en besluitvormingslijnen
- **Voorspelbaarheid**: Betrouwbare procedures voor wijzigingen en evolutie

### Evolutie vereist flexibiliteit
Protocollen moeten kunnen evolueren met veranderende behoeften:
- **Toekomstbestendigheid**: Onbekende toekomstige use cases moeten mogelijk blijven
- **Geleidelijke veroudering**: Oude versies moeten blijven werken
- **Innovatieruimte**: Ruimte voor experimentatie zonder alles te breken

## Implementatie overwegingen

### Protocol-specifieke aspecten
- **Governance model**: Wie neemt welke beslissingen via welk proces (consensus, stemming, delegatie)?
- **Conflictoplossing**: Procedures voor meningsverschillen en geschillen
- **Lidmaatschap**: Criteria voor toetreding en procedures voor vertrek
- **Evolutie management**: Hoe evolueren specificaties zonder breaking changes?

### Technische uitdagingen
- **Specificatie tooling**: Tools voor collaboratieve specificatie-ontwikkeling
- **Versie beheer**: Hoe beheer je evoluerende specificaties?
- **Test frameworks**: Gedeelde test suites voor protocol compliance
- **Referentie implementaties**: Wie onderhoudt referentie implementaties?

### Organisatorische aspecten
- **Resource inzet**: Wie betaalt voor open samenwerking activiteiten?
- **Tijdsinvestering**: Open processen kosten meer tijd dan unilaterale beslissingen
- **Cultuurverandering**: Van concurrentie naar samenwerking mindset
- **Juridische kaders**: Contractuele afspraken voor open samenwerking
- **Intellectueel eigendom**: Wie bezit de gezamenlijk ontwikkelde specificaties?

---

*Dit principe maakt alle andere principes mogelijk door een fundament van vertrouwen en samenwerking tussen organisaties te creëren.*