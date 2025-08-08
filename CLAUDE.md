# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Important Instructions

- **NO Claude References**: Never add Claude Code references like "Generated with Claude Code" or "Co-Authored-By: Claude" to commit messages or documentation. Follow standard development practices without self-attribution.

## Overzicht

Dit is een documentatieproject genaamd "Protocol-denken" - een conceptueel raamwerk voor de toekomst van de Digitale Overheid ontwikkeld door het Emerging Technology Center van het Kadaster. Het project is een statische documentatiesite gebouwd met MkDocs Material die concepten verkent rondom digitale transformatie, data-uitwisselingsprotocollen, event sourcing en open source samenwerking in overheidscontexten.

## Commando's

### Multi-language Development
Dit project ondersteunt zowel Nederlands als Engels via aparte configuraties:

**Lokale ontwikkeling:**
```bash
# Bouw beide taalversies
./build-local.sh

# Start lokale server 
./serve-local.sh
```

**Handmatig bouwen:**
```bash
# Nederlandse versie
docker run --rm -v ${PWD}:/docs --entrypoint="" squidfunk/mkdocs-material:latest sh -c "pip install -r requirements.txt && mkdocs build -f mkdocs.nl.yml"

# Engelse versie  
docker run --rm -v ${PWD}:/docs --entrypoint="" squidfunk/mkdocs-material:latest sh -c "pip install -r requirements.txt && mkdocs build -f mkdocs.en.yml"
```

**Test URLs:**
- Language selector: http://localhost:8000
- Nederlandse site: http://localhost:8000/nl/
- Engelse site: http://localhost:8000/en/

## Architectuur

### Projectstructuur (Multi-language)
- `docs/` - Documentatie-inhoud georganiseerd per taal
  - `nl/` - Nederlandse content
    - `index.md` - Nederlandse homepage
    - Alle Nederlandse pagina's en assets
  - `en/` - Engelse content (vertalingen + placeholders)
    - `index.md` - Engelse homepage
    - Alle Engelse pagina's en assets
- `overrides/` - MkDocs thema-aanpassingen (gedeeld)
  - `main.html` - Aangepast template met Kadaster branding
  - `assets/` - Aangepaste assets zoals logo's
- `mkdocs.nl.yml` - Nederlandse site configuratie
- `mkdocs.en.yml` - Engelse site configuratie  
- `index.html` - Language selector met auto-redirect
- `requirements.txt` - Python dependencies (mkdocs-material)
- `build-local.sh` - Script voor lokaal bouwen beide talen
- `serve-local.sh` - Script voor lokale preview
- `.github/workflows/deploy.yml` - Multi-language GitHub Pages deployment

### Inhoudorganisatie
De documentatie volgt een logische stroom van probleem naar oplossing:
1. Historische context van digitalisering (papier-naar-digitaal.md)
2. Data-oorsprong en semantiek (ontstaan-van-data.md, taal-en-semantiek.md)
3. Context en automatiseringsconcepten (context.md, automatisering.md)
4. Voorgestelde oplossingen en visie (oplossingen.md)
5. Praktijkvoorbeelden en achtergrondtheorie

### Thema en Styling
- Gebruikt MkDocs Material thema met Nederlandse taal
- Aangepaste Kadaster branding via overrides
- Navigatiefeatures ingeschakeld (instant loading, tracking, inhoudsopgave)
- Aangepaste CSS voor organisatie-specifieke styling
- Material iconen en emoji ondersteuning

### Kernconcepten
- **Protocol-denken**: Het kernconceptt van het ontwerpen van "dikke protocollen" voor overheidsdata-uitwisseling
- **Event Sourcing**: Patroon voor data-integriteit en audit trails
- **Linked Data APIs**: Moderne benadering van data-interoperabiliteit
- **Open Source Samenwerking**: Methodologie voor protocolontwikkeling
- **Digitale Transformatie**: Evolutie van papier-gebaseerde naar digitale processen

## Contentrichtlijnen

Bij het werken met de documentatie:
- Inhoud is in het Nederlands (language: nl in config)
- Handhaaf de conceptuele stroom van historische context naar toekomstvisie
- Afbeeldingen moeten in `docs/images/` geplaatst worden en relatief gerefereerd
- Gebruik Material Design conventies voor opmaak
- Behoud de academische maar toegankelijke toon uit bestaande inhoud
- Voorbeelden moeten waar mogelijk betrekking hebben op Nederlandse overheid/Kadaster contexten

## Principe-structuur

Alle principe-documenten volgen deze gestandaardiseerde structuur:

### Verplichte sectievolgorde:
1. **Het probleem** - Waarom is dit principe nodig?
2. **Het principe: [naam]** - Wat is het principe? (met Kernprincipes en Praktische implementatie)
3. **Voorbeelden** - Concrete uitleg helpt begrip van principe
4. **Mindset shift** - Denkwijze-evolutie (Stap 0→1→2→3 met problemen/verbeteringen)
5. **Voordelen** - Nu begrijp je waarom deze voordelen kloppen
6. **Relatie met protocol-denken** - Specifieke connectie met protocol-denken concepten
7. **Relatie met andere principes** - Cross-referenties naar andere principes
8. **Waarom dit principe altijd geldt** - Fundamentele argumenten
9. **Implementatie overwegingen** - Praktische aspecten en uitdagingen

### Stijlrichtlijnen:
- Gebruik markdown links: `[tekst](bestand.md)` niet `[[wiki-links]]`
- Voorbeelden eerst, theorie daarna - helpt begrip
- "Relatie met protocol-denken" moet specifiek zijn voor dat principe
- Mindset shift altijd met Stap 0→1→2→3 evolutie
- Implementatie overwegingen onderverdeeld in: protocol-specifiek, technisch, organisatorisch

## Deployment

De site is geconfigureerd voor GitHub Pages deployment:
- Bron repository: https://github.com/kadaster-labs/protocol-denken
- Gepubliceerde URL: https://kadaster-labs.github.io/protocol-denken/
- Edit links wijzen naar de main branch voor eenvoudige bijdragen

## Work log

Dit is de work log waar we samen nog aan moeten werken:

- [ ] Pagina's van het Nederlands in het Engels vertalen
- [ ] Lokale build verbeteren zodat er één build ontstaat of tenminste (weer) een live view
- [ ] Pull Request maken en verwerken en controleren of de GitHub Actions werken en de gewenste resultaten opleveren
