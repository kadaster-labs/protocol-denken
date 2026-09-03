---
title: Externe bronnen
---

Protocol-denken staat niet op zichzelf. Ook buiten het Kadaster en buiten Nederland wordt nagedacht over dezelfde verschuiving: van gesloten, centraal beheerde systemen naar federatieve netwerken van zelfstandige partijen die volgens gedeelde afspraken samenwerken. Op deze pagina verzamelen we externe artikelen, papers en presentaties die met protocol-denken resoneren, telkens kort toegelicht op wat de bron behandelt en waar de raakvlakken zitten.

## From Applications to Ecosystems

Manish Srivastava, [_From Applications to Ecosystems_](https://digitalstatecraft.substack.com/p/from-applications-to-ecosystems), Digital Statecraft (Substack).

Het artikel beschrijft hoe digitale overheidssystemen moeten evolueren van geïsoleerde applicaties naar federatieve ecosystemen, waarin onafhankelijk bestuurde instellingen samenwerken zonder dat één partij het volledige overzicht bezit. Centrale begrippen zijn een gelaagde architectuur (netwerk-, platform-, intelligentie- en interactielaag), herkomst (_provenance_) van data, gedeelde schemas/standaarden als bestuurlijk vraagstuk, en het expliciete onderscheid tussen wat AI _kan_ (capability) en wat het _mag_ beslissen (authority).

**Raakvlak met protocol-denken:**

-   De kernstelling _"the goal is not to eliminate institutional boundaries, it is to make them interoperable"_ is in essentie hetzelfde uitgangspunt als de [context-overgangen](../context.md) tussen bounded contexts: grenzen worden niet opgeheven maar expliciet ontworpen.
-   _Provenance_ — waar komt data vandaan, wie heeft haar veroorzaakt, wanneer en met welke intentie — is functioneel hetzelfde als wat [Event Sourcing](./event-sourcing.md) oplevert.
-   Het onderscheid tussen automatiseerbare capaciteit en menselijke autoriteit sluit aan bij [Design for Change](../oplossingen.md#design-for-change): vergaande automatisering met ingebouwde ruimte voor menselijke interventie.

Het belangrijkste verschil is het abstractieniveau: Srivastava blijft op het niveau van architectuurlagen en AI-governance, terwijl protocol-denken met Event Sourcing en open samenwerking een concreet technisch en organisatorisch antwoord invult.

## Chronolexografie

[_Chronolexografie: het bijhouden van de rechtstoestand in de tijd_](https://chronolexografie.nl/position-paper/), position paper.

Chronolexografie werkt een conceptueel model uit voor het digitaal vastleggen van de rechtstoestand in een rechtsstaat: niet alleen de resulterende toestand, maar "het registreren van de conclusies die in bedrijfsprocessen worden getrokken". Een **chronolexogram** is de vastlegging van één handeling of besluit, met drie varianten — **lexogram** (wijziging in wetgeving), **decretogram** (concreet besluit bij toepassing van regels) en **executogram** (daadwerkelijke levering/afhandeling). Deze worden bijgehouden in een **chronolexocel** (waar ze ontstaan) en een **chronolexokroniek** (de geordende, tijdgebonden verzameling). Herbruik heet **chronolexoreductie**: het combineren van relevante chronolexogrammen tot een **lexostatus**, de rechtstoestand zoals gezien vanuit een bepaald perspectief.

**Raakvlak met protocol-denken:** het paper noemt Event Sourcing niet expliciet, maar de overeenkomsten zijn direct — chronolexogrammen zijn onveranderlijke gebeurtenissen waaruit een toestand wordt afgeleid, exact zoals bij [Event Sourcing](./event-sourcing.md) en [gebeurtenisgedreven registers](../oplossingen.md#gebeurtenisgedreven-registers). Chronolexografie voegt daar juridische precisie aan toe door binnen één event het onderscheid tussen feit, interpretatie en besluit te expliciteren — hetzelfde onderscheid dat ook in [Nieuwland](./nieuwland.md) centraal staat, waarvan chronolexografie de procesmatige verdieping vormt.

## Handreiking Betrouwbare Registers

[_Handreiking Betrouwbare Registers_](https://uitbetrouwbarebron.rijks.app/handreiking), project Uit Betrouwbare Bron.

De handreiking werkt uit hoe overheidsregisters ontworpen moeten worden om betrouwbaar, transparant en herstelbaar te zijn: "de overheid digitaliseert snel, maar het vermogen om overheidshandelen te begrijpen, controleren en fouten te herstellen houdt geen gelijke tred." Kernbegrippen zijn **epistemische nederigheid** (bescheidenheid over wat een systeem daadwerkelijk kan weten), het onderscheid tussen **happy flow** en **crappy flow**, en een **conceptueel registermodel** opgebouwd uit signaal, taak, gevolg en levering. Vastleggingen komen terecht in een **gevolgenjournaal**, waaruit **projecties** als afgeleide dataweergaven worden opgebouwd, georganiseerd per domein/bounded context.

**Raakvlak met protocol-denken:** het gevolgenjournaal is in essentie dezelfde eventstroom als bij [Event Sourcing](./event-sourcing.md) en [gebeurtenisgedreven registers](../oplossingen.md#gebeurtenisgedreven-registers), en de projecties spelen precies dezelfde rol als de primaire en secundaire projecties daar. Waar Chronolexografie en Nieuwland vooral het conceptuele, juridische vraagstuk van vastlegging uitdiepen, is deze handreiking het meest concreet: ze benoemt expliciet welke functionaliteit een register moet leveren en hoe domeinen/bounded contexts (vgl. [context](../context.md)) daarin structurerend werken. De technische uitwerking, met codevoorbeelden, is aanwezig maar minder ver uitgewerkt dan het conceptuele deel.
