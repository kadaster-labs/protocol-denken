# Principe: meerdere views standaard

*Nooit één model of API - altijd meerdere perspectieven*

## Het probleem

Huidige registers hebben meestal slechts één view, één set gegevens, slechts één _model_. Dit lijkt efficiënt, maar is eigenlijk nooit voldoende:

- **Verschillende gebruikers, verschillende behoeften**: Een gemeente heeft andere informatie nodig dan een notaris
- **Verschillende contexten, verschillende structuren**: Wat handig is voor invoer, is niet handig voor elk gebruik. Sterker nog, elk gebruik kent verschillende behoeften en benodigde structuren
- **Evolutie wordt belemmerd**: Nieuwe behoeften vereisen wijzigingen aan het ene model, met risico's voor bestaande gebruikers
- **Optimalisatie onmogelijk**: Eén model kan niet tegelijk geoptimaliseerd zijn voor invoer én voor complexe analyses

## Het principe: meerdere views standaard

Registers moeten vanaf het begin ontworpen worden met meerdere views als uitgangspunt, niet als uitzondering.

### Kernprincipes

1. **Views zijn projecties** - Elke view toont dezelfde werkelijkheid vanuit een specifiek perspectief
2. **Context bepaalt structuur** - Elke gebruikscontext verdient zijn eigen geoptimaliseerde datastructuur  
3. **Evolutie door toevoegen** - Nieuwe behoeften betekenen nieuwe views, niet wijzigingen aan bestaande views
4. **Synchronisatie by design** - Views worden consistent gehouden door expliciete updatestrategieën

### Praktische implementatie

```
Traditionele aanpak - één model:
API: /personen/{id}
Response: { naam, adres, geboortedatum, burgerlijkeStaat, ... }

Meerdere views aanpak:
API: /personen/{id}/contact -> { naam, adres, telefoon, email }  
API: /personen/{id}/juridisch -> { naam, burgerlijkeStaat, gezinssamenstelling }
API: /personen/{id}/identificatie -> { naam, geboortedatum, bsn }
API: /personen/{id}/specialistisch -> complete informatie voor experts
```

## Voordelen

- **Data-minimalisatie by design**: Elke view bevat alleen relevante gegevens, privacy en GDPR compliance ingebouwd
- **Betere beveiliging**: Toegang kan per view worden geregeld
- **Betere performance**: Elke view bevat precies wat nodig is
- **Flexibelere evolutie**: Nieuwe behoeften vereisen geen breaking changes
- **Duidelijkere verantwoordelijkheden**: Elke view heeft een specifiek doel
- **Eenvoudigere integratie**: Andere systemen kunnen de meest passende view kiezen

## Mindset shift

Meerdere views vereist een fundamentele shift: **van "één waarheid" naar "meerdere perspectieven op één waarheid"**.

### Stap 0: één model denken (traditioneel)
```
// Denken: "Ik maak één perfect model voor iedereen"
class Persoon {
    naam, adres, telefoon, email, geboortedatum, 
    burgerlijkeStaat, inkomen, medischeDossier, ...
}
```
**Probleem**:
- Veel gebruikers krijgen irrelevante informatie
- Privacy concerns - iedereen ziet alles
- Performance issues - altijd alle data ophalen
- Inflexibel - wijzigingen raken alle gebruikers

### Stap 1: filtering denken
```
// Denken: "Ik filter het ene model per gebruik"
API: /personen/{id}?fields=naam,adres
API: /personen/{id}?view=contact
```
**Probleem**: Onderliggende model blijft complex en fragiel.

**Verbetering**: Meer controle over wat wordt getoond, maar geen structurele oplossing.

### Stap 2: multiple views denken
```
// Denken: "Ik maak aparte views per gebruikscontext"
class ContactView { naam, adres, telefoon }
class JuridischView { naam, burgerlijkeStaat, gezinssamenstelling }
class VolledigView { alle informatie }
```
**Probleem**: Nog steeds geen expliciete synchronisatie tussen views.

**Verbetering**: Context-specifieke structuren, maar synchronisatie is ad-hoc.

### Stap 3: views als projecties denken
```
// Denken: "Views zijn bewuste projecties van events naar specifieke doelen"
ContactView = projectie(PersonenEvents, optimizedFor: "dagelijks contact")
JuridischView = projectie(PersonenEvents, optimizedFor: "juridische procedures") 
AnalyseView = projectie(PersonenEvents, optimizedFor: "statistische analyse")
```
**Doorbraak**: Expliciete relatie tussen bron (events) en views, met heldere doelen.

## Relatie met andere principes

- Versterkt [[Principe/focus-op-verandering]] - events kunnen naar verschillende views worden geprojecteerd
- Ondersteunt [[Principe/context-is-altijd-aanwezig]] - elke view heeft een specifieke context en doel
- Basis voor [[Patroon/contextovergang-ontwerp]] - bewuste mapping tussen verschillende contexten

## Patronen die dit principe toepassen

- [[Patroon/cqrs]] - schrijven en lezen zijn verschillende views
- [[Patroon/event-sourcing]] - events als bron, views als projecties
- [[Patroon/gelaagde-register-architectuur]] - verschillende lagen hebben verschillende views

## Voorbeelden

### Voorbeeld 1: BAG register - verschillende perspectieven op één adres

**Traditioneel BAG - één model:**
```
Adres {
  id: "1234AB567",
  straat: "Hoofdstraat",
  huisnummer: 42,
  postcode: "1234AB", 
  woonplaats: "Amsterdam",
  oppervlakte: 85,
  bouwjaar: 1995,
  energielabel: "B",
  monument: false,
  eigenaarId: "789",
  huurders: [...],
  wozWaarde: 350000,
  vastgoedtax: 2100
}
```

**Meerdere views BAG:**
```
// Voor postbode (eenvoudig, snel)
AdresContactView {
  straat: "Hoofdstraat",
  huisnummer: 42,
  postcode: "1234AB",
  woonplaats: "Amsterdam"
}

// Voor gemeente (administratief)
AdresAdministratiefView {
  id: "1234AB567",
  straat: "Hoofdstraat", 
  huisnummer: 42,
  status: "Bestaand",
  datumIngebruikname: "1995-03-15",
  laatsteWijziging: "2024-01-10"
}

// Voor energieadviseur (technisch)
AdresTechnischView {
  id: "1234AB567", 
  oppervlakte: 85,
  bouwjaar: 1995,
  energielabel: "B",
  isolatiegegevens: {...}
}

// Voor belastingdienst (financieel)
AdresFinancieelView {
  id: "1234AB567",
  wozWaarde: 350000,
  vastgoedtax: 2100,
  eigendomshistorie: [...]
}
```

### Voorbeeld 2: BRP register - verschillende perspectieven op één persoon

**Traditioneel BRP - alles in één:**
```
Persoon {
  bsn: "123456789",
  naam: "Jan Jansen", 
  adres: "Hoofdstraat 42",
  telefoon: "06-12345678",
  geboortedatum: "1985-05-15",
  geboorteplaats: "Utrecht", 
  nationaliteit: "Nederlandse",
  burgerlijkeStaat: "Gehuwd",
  partner: "Marie Jansen",
  kinderen: ["Anna Jansen", "Piet Jansen"],
  inkomen: 45000,
  zorgverzekering: "VGZ",
  rijbewijs: "B",
  paspoort: "NL123456",
  medischeDossier: {...}
}
```

**Meerdere views BRP:**
```
// Voor gemeente (basis contact)  
PersoonContactView {
  naam: "Jan Jansen",
  adres: "Hoofdstraat 42, 1234AB Amsterdam", 
  telefoonnummer: "06-12345678"
}

// Voor juridische procedures
PersoonJuridischView {
  bsn: "123456789",
  volledigeNaam: "Johannes Petrus Jansen",
  geboortedatum: "1985-05-15",
  geboorteplaats: "Utrecht",
  nationaliteit: "Nederlandse", 
  burgerlijkeStaat: "Gehuwd sinds 2010-06-15",
  partner: "Maria Elisabeth Jansen-de Wit"
}

// Voor onderwijs (privacy-vriendelijk)
PersoonOnderwijsView {
  voornaam: "Jan",
  achternaam: "Jansen", 
  geboortejaar: 1985,
  woonplaats: "Amsterdam"
}

// Voor zorgverlening (medisch relevant)
PersoonZorgView {
  naam: "Jan Jansen",
  geboortedatum: "1985-05-15", 
  adres: "Hoofdstraat 42",
  contactpersoon: "Marie Jansen (partner)",
  zorgverzekering: "VGZ",
  // geen BSN voor privacy
}
```

### Voorbeeld 3: evolutie zonder breaking changes

**Situatie**: Gemeente krijgt nieuwe taak - energietransitie ondersteuning. Ze hebben nu adresgegevens nodig gecombineerd met eigendomsinformatie.

**Traditionele aanpak**: 
```
// Uitbreiding van bestaand model - BREAKING CHANGE
Adres {
  id, straat, huisnummer, ..., // bestaande velden
  eigenaar: {...},              // NIEUW - kan null zijn  
  energieadvies: {...}          // NIEUW - complex object
}
```
**Probleem**: Alle bestaande gebruikers krijgen extra data die ze niet willen.

**Meerdere views aanpak**:
```
// Nieuwe view toevoegen - NO BREAKING CHANGE
AdresEnergietransitieView {
  id: "1234AB567",
  straat: "Hoofdstraat",
  huisnummer: 42,
  energielabel: "B", 
  eigenaar: "Jan Jansen",
  potentieelZonnepanelen: 8.5,
  isolatiestatus: "Matig",
  advies: "Dak isoleren, zonnepanelen overwegen"
}
```
**Voordeel**: Gemeente krijgt precies wat ze nodig heeft, bestaande gebruikers merken niets.

## Wanneer toepassen?

### Altijd toepassen bij:
- **Meerdere gebruikersgroepen**: Verschillende rollen hebben verschillende informatiebehoeften
- **Evolutionaire systemen**: Behoeften zullen veranderen over tijd
- **Privacy-gevoelige data**: Verschillende autorisatieniveaus vereist
- **Performance-kritische systemen**: Verschillende use cases hebben andere performance-eisen

### Voorzichtig toepassen bij:
- **Zeer eenvoudige systemen**: Soms is één view werkelijk voldoende
- **Strikte real-time consistentie**: Meerdere views kunnen synchronisatie-uitdagingen geven
- **Resource-beperkte omgevingen**: Overhead van meerdere views kan te groot zijn

## Implementatie overwegingen

### Synchronisatie strategieën:
- **Event-driven updates**: Views worden bijgewerkt door events
- **Eventual consistency**: Views kunnen tijdelijk inconsistent zijn met de bron (events) - in gedistribueerde cloud infrastructuren is eventual consistency inherent een gegeven, niet een keuze
- **Transactionele updates**: Alleen mogelijk binnen één database/service boundary - over service grenzen heen is eventual consistency onvermijdelijk  

### Performance overwegingen:
- **Geoptimaliseerde storage**: Elke view kan zijn eigen optimale datastructuur hebben
- **Caching strategies**: Views kunnen individueel gecached worden
- **Index optimization**: Elke view krijgt de juiste indexes voor zijn use case

### Beheer complexiteit:
- **View lifecycle**: Duidelijke procedures voor toevoegen, wijzigen, verwijderen van views
- **Documentation**: Elke view heeft heldere documentatie over doel en gebruik
- **Monitoring**: Synchronisatie tussen views moet gecontroleerd worden - in gedistribueerde systemen wordt monitoring inherent exponentieel complexer met eigen health checks, latency metrics, en consistency monitoring per view

---

*Dit principe zorgt ervoor dat registers flexibel kunnen evolueren zonder bestaande gebruikers te verstoren, door verschillende perspectieven op dezelfde werkelijkheid aan te bieden.*