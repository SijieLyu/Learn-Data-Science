# Strings

## Escape
| **Code** | **What You Get** | **Example** | **print(Example)** |
|----------|------------------|-------------|--------------------|
|\\'|'|'What\'s up?'|What's up?|
|\\"|"|"That's \\"cool\\""| That's "cool"|
| \ \ | \  |"Look, a mountain: /\ \ "| Look, a mountain: /\  |
| \\n| new line| "1\n2 3"| 1 <br /> 2 3

## String Methods <br>
`claim = "Pluto is a planet!"`
| **Method Name** | **Description** | **Code** | **Result** |
|-----------------|-----------------|----------|------------|
|.upper()|all caps| claim.upper()|'PLUTO IS A PLANET!'|
|.lower()|all lowecase|claim.lower()|'pluto is a planet!'|
|.index()|searching for the first index of a substring|claim.index('plan')|11|
|.startwith()|returns True if the string starts with the specified value, otherwise, False|claim.startswith('Pluto')|True|
|.endswith()|returns True if the string ends with the specified value, otherwise, False|claim.endswith('planet')|False, becuase missing ! mark|
|.split()|turns a string into a list of smaller strings, breaking on white space by default|claim.split()|['Pluto', 'is', 'a', 'planet!']|
|.join()| sewing a list of strings together into one long string.|'/'.join(['month', 'day','year'])|'month/day/year'|
| + | concatenate strings | ||
|str()| turn other data type to string|||
