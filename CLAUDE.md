# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overzicht

Dit is een documentatieproject genaamd "Protocol-denken" - een conceptueel raamwerk voor de toekomst van de Digitale Overheid ontwikkeld door het Emerging Technology Center van het Kadaster. Het project is een statische documentatiesite gebouwd met MkDocs Material die concepten verkent rondom digitale transformatie, data-uitwisselingsprotocollen, event sourcing en open source samenwerking in overheidscontexten.

## Commando's

### Lokale Ontwikkeling
Start de MkDocs ontwikkelserver:
```bash
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
```
Dit serveert de documentatie op http://localhost:8000 met live reload.

### Documentatie Bouwen
De documentatie wordt automatisch gebouwd en gedeployed via GitHub Pages. Voor handmatig bouwen:
```bash
docker run --rm -v ${PWD}:/docs squidfunk/mkdocs-material build
```

## Architectuur

### Projectstructuur
- `docs/` - Hoofddocumentatie-inhoud in Markdown
  - `index.md` - Homepage die protocol-denken concepten introduceert
  - Individuele onderwerppagina's (automatisering.md, context.md, etc.)
  - `voorbeelden/` - Praktijkvoorbeelden (SensRNet, KOERS)
  - `achtergrond/` - Achtergrondconcepten (event sourcing, agile, open source)
  - `images/` - Diagrammen en illustraties
  - `css/project.css` - Aangepaste styling
- `overrides/` - MkDocs thema-aanpassingen
  - `main.html` - Aangepast template met Kadaster branding
  - `assets/` - Aangepaste assets zoals logo's
- `mkdocs.yml` - MkDocs configuratie
- `requirements.txt` - Python dependencies (mkdocs-material)

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

## Deployment

De site is geconfigureerd voor GitHub Pages deployment:
- Bron repository: https://github.com/kadaster-labs/protocol-denken
- Gepubliceerde URL: https://kadaster-labs.github.io/protocol-denken/
- Edit links wijzen naar de main branch voor eenvoudige bijdragen