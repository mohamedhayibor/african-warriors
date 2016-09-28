# african-warriors

By African warriors, we refer to the kings/queens/leader who fought for a considerable cause or mission.

Who is this app for: history tinkerers, children, anybody getting ready for a test (exam) on the topic.

> great for children preparing for the cm2 exam

## I Do need help (you programmer or not)

I can't scour the whole web and all books. If you know of a warrior that must be included, open an issue with related links.

Even better send me a csv file with the following structure:

```csv
id, name, born, death, kingdom, bio
1, Lat Dior, 1842, 1886, Cayor, "to fill later"
2, Samory Toure, 1830, 1900, Wassoulou Empire, "...."
3, Mamadou Lamine Drame, 1840, 1887, "...", "..."
4, Alboury Ndiaye, "..", "..", "..", ".."
5, Samba Laobe Fall,"..", "..", "..", ".."
6, Oumar Tall,"..", "..", "..", ".."
7, Aline Sitoe diatta, "..", "..", "..", ".."
8, Shaka Zulu, 1787, 1828, Zulu Kingdom, "...."
```

and a folder containing the profile of the warrior. Name the image by the corresponding id.

> example if id = 10, name of the img = "10.png"

We are harvesting data by hand because there is poor or almost no data for some of the warriors. This process is super messy but I plan on hosting a REST JSON Api for anyone who might need this data in the future.

## Implementation details

1. The name of a warrior's image is the the string of warriorId.
2. Built with Xcode 8.1 and Swift 3
