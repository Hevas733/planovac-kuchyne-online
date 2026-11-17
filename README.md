# Plánovač směn kuchyně

Místní plánovač směn. Aplikace nepotřebuje účet ani internet a používá úložiště prohlížeče.

## Spuštění ve Windows

Stáhni repozitář jako ZIP, rozbal jej a spusť `Spustit.cmd`. V prohlížeči se otevře `http://localhost:8765/`. Pokud se stránka otevře dříve než server, obnov ji. Okno serveru musí zůstat otevřené; jeho zavřením se server vypne. Případně lze otevřít `index.html` přímo, ale půjde o jiné úložiště dat a instalace PWA nemusí být dostupná.

## Přenos dat na jiný počítač

Směny a zaměstnanci se ukládají jen do konkrétního prohlížeče. GitHub přenáší program, nikoli automaticky rozpisy. Na původním počítači vyber variantu a klikni na **Záloha**. Na druhém počítači otevři aplikaci, vyber cílovou variantu a klikni na **Obnovit**. Postup opakuj pro každou variantu zvlášť. Obnovení přepíše data vybrané varianty.

## Předpisy a směny

`D` znamená 11 hodin 30 minut a `R` 8 hodin. Výchozí předpis roku 2027 je 2 088 hodin pro plný úvazek a zahrnuje i svátky připadající na pondělí až pátek. Měsíční hodnoty lze upravovat. Pro ostatní roky je nutné předpisy zkontrolovat. Plánovač slouží k modelování rozpisů; neprovádí úplnou pracovněprávní kontrolu.
