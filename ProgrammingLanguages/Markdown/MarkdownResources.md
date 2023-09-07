# Markdown Resources

## Guides and specifications

- [Github flavored markdown specification](https://github.github.com/gfm/)
    - [Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [MarkdownGuide](https://www.markdownguide.org/)

## Useful utilities

- [Tables Generator](http://www.tablesgenerator.com/markdown_tables)
- [Table to Markdown](https://tabletomarkdown.com/)

## Citeproc examples and resources

pandoc-citeproc is a pandoc "extension" of sorts that allows you to use citations in your markdown documents see [pandoc](../../OtherSoftware/PandocCommands.md) for more details

## Mermaid.js

- [Mermaid.js](https://mermaid.js.org/) is a "diagramming and charting tool" that can be used in markdown to create complicated flowcharts.
    - I use this with the [VSCode extension vscode-markdown-mermaid](https://github.com/mjbvz/vscode-markdown-mermaid) to view the results.
        - I then use the [live editor](https://mermaid.live/edit) to export the diagrams into `.svg` or `.png` formats (other formats are available too). These are found under the "Actions" tab.
    - [Documentation can be found at this link](https://mermaid.js.org/intro/).

```mermaid
graph TD;
    subgraph Investment Banks
    A1[Repeal Glass Steagal - Banks start using normal peoples money on investments]
    B1[CDOs - Pooled mortgages]
    C1[Tranche - subbundle of CDOs based on risk]
    D1[CDS - Credit Default Swaps - insurance for CDOs];
    E1[Derivatives - betting on the price of CDOs or shorting];
    F1[Don't need capital backing up loans when they have a CDS]
    A1-->B1
    B1-->C1
    C1-->D1
    C1-->E1
    D1-->F1
    end
    subgraph Family
    A2[Family wants a house]
    B2[broker connects them to a mortgage lender]
    C2[lender sells mortgages to investment banks]
    D2[Family buys mortgage]
    E2[lender no longer at risk if family can't pay]
    A2-->B2;
    B2-- lender has more incentive to create more mortgages -->C2;
    C2-- incentive to create subprime mortgages, also predictory lending -->A2
    end
```

```mermaid
graph TD;
    subgraph 1[Prior Factors]
    1A[Glass-Steagal Increases Money Available to Invest]
    1B[Low Fed Rates]
    end
    subgraph 2[Rating Agencies]
    2A[Used data based on business not mortgages]
    2B[Used Average FICO Scores which made groups of mostly bad mortgages look much better]
    2C[Didn't look at thickness of FICO scores which made many thin scores look just as good as thick scores]
    end
    subgraph 3[Mortgage Lenders]
    3A[Gave out floating rate mortgages]
    3B[Gave mortgages to individuals with thin credit]
    3C[Gave mortgages to individuals with bad credit]
    end
    subgraph 4[Mortgage Based Investments]
    4B[Used Mortgages for Investments]
    4C[Increase in Subprime Mortgages]
    4D[Created Synthetic CDOs and other creations for rating bad mortgages as good]
    4E[AIG Starts to Insure CDOs]
    4B-->4C
    4C-->4D
    4D-->4E
    end
    subgraph 5[The Financial Crisis]
    5A[Subprime Mortgages Start Defaulting in Large Numbers]
    5B[Mortgage Based Investments Lose Value]
    5C[AIG Can't Pay Out for Loss in Value]
    5D[Banks Lose Most of Their Value]
    5A-->5B
    end
    1-- impact of prior factors created demand for more investment opportunities -->4
    2-- impact of rating agencies -->4
    3-- Due to demand for mortgages, lenders gave worse mortgages to less-qualified borrowers -->4
```

```mermaid
graph TD;
    subgraph 1[Prior Factors]
        subgraph 1A[Deregulation]
            1AA[Glass-Steagal]
        end
        subgraph 1B[General Economic Conditions]
            1BA[Low Fed Rates]
        end
    end
    subgraph 2[Other Important Institutions]
        subgraph 2A[Investment Bankers]
            2AA[Take Advantage of Rating Agencies]
            2AB[Create Demand for More Mortgages]
        end
        subgraph 2B[Rating Agencies]
            direction BT
            2BA[Data Based on Business Loans]
            2BB[Averaged FICO Scores]
            2BC[No Info About Thickness of FICO Scores]
            2BA---2BB
            2BA---2BC
            2BB---2BC
        end
        subgraph 2C[Mortgage Lenders]
            2CA[Floating Rate Mortgages]
            2CB[Mortgages to Individuals With Thin Credit]
            2CC[Mortgages to Individuals With Bad Credit]
            2CA---2CB
            2CA---2CC
            2CB---2CC
        end
        direction BT
        2AA--->2B
        2AB--->2C
        2B---2C
    end
    subgraph 4[Mortgage Based Investments]
        4A[Created Mortgage Backed Securities]
        4B[Increased Demand for Mortgages]
        4C[Increase in Subprime Mortgages]
        4D[Synthetic CDOs for Rating Bad Mortgages As Good]
        4E[AIG Starts to Insure CDOs]
        4A-->4B
        4A-->4C
        4A-->4D
        4B-->4C
        4B-->4D
        4C-->4D
        4D-->4E
    end
    subgraph 5[The Financial Crisis]
        5A[Subprime Mortgages Start Defaulting in Large Numbers]
        5B[Mortgage Backed Securities and CDOs Lose Value]
        5C[AIG Can't Pay Out for Loss in Value]
        5D[Banks Lose Lots of Value]
        5E[Banks Don't Lend]
        5F[Companies Go Under or Become Cautious, Startups Slow Down]
        5G[Greater Unemployment]
        5A-->5B
        5B-->5C
        5C-->5D
        5D-->5E
        5E-->5F
        5F-->5G
    end
    subgraph 6[The Bailouts, TARP Other Interventions]
        6A[The Investments Allowed Banks to Continue Lending]
        6B[Continued Lending Helped Stave Off Some Negative Consequences]
        6A-->6B
    end
    1A-- Prior Conditions Drove Investors to Look for New Places to Make Money -->4
    2B-- Flawed Ratings Made Risky MBSs and CDOs Look Very Safe and Valuable -->4
    2C-- Due to High Demand for Mortgages, Lenders Gave Bad Mortgages to Less-Qualified Borrowers -->4
    4-- These conditions primed the financial sector of the economy for a collapse -->5
    5-- Congress, The Fed and Other Government Officials Intervene -->6
    6-->99
    99[Stuff still to add: Derivatives, Credit Default Swaps, More Relevant Regulations]
```
