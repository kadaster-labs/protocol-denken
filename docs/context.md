---
title: Context
---
Bij het respecteren van het [ontstaan van data](./ontstaan-van-data.md) moeten we ook constateren en
respecteren dat data ontstaat vanuit een duidelijke **context**. De stelling is dat het ontstaan
_altijd_ één context heeft, welke heel duidelijk en expliciet is. Data ontstaat _altijd_ op één
plaats, één tijd door één actor. Dit is de context waarin de data ontstaat.

Daar waar de data gebruikt wordt, is steeds vaker veelzijdig en vanuit heel verschillende
perspectieven. Dit duiden we aan met _gebruikscontexten_. Vanuit de _ontstaanscontext_ zijn er vaak
vele _gebruikscontexten_ en elke 'overgang' dient expliciet ontworpen te worden. Hierin wordt
verantwoord hoe begrippen en semantiek op elkaar aansluiten (of niet) tussen de contexten en welke
transformatie(s) er nodig zijn en toegepast worden.

![Bounded Contextx](images/ddd-bounded-contexts.png)

Data uitwisseling vindt altijd plaats _tussen_ partijen. Er zijn dus altijde _meerdere_ partijen
betrokken. Hoe die uitwisseling plaatsvindt, is daarom een afspraak tussen de partijen. Voor een
ontstaanscontext is het prettiger als er een beperkt aantal context overgangen gedefinieerd zijn en
geleverd worden. Dit is in het belang van de ontstaanscontext eigenaar welke ook wel bronhouder
genoemd wordt. Daar ontstaat tenslotte de data. Het is daarom aan de ontstaanscontext eigenaar /
bronhouder om te organiseren dat alle gebruikscontexten goed worden voorzien en geoptimaliseerd
worden door uniformiteit.

> Vanuit [Domain Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html) worden
> [Bounded Contexts](https://martinfowler.com/bliki/BoundedContext.html) een expliciet begrip. Dit
> is goede basis om dit hoofdstuk goed te doorgronden.
