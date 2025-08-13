# Java API — Learning by Doing

A hands‑on reference for popular **Core Java** APIs. Browse by **package → class → method**.  
Each method entry includes **Signature • Purpose • Parameters • Returns • Throws • Javadoc‑style summary • Demo • Console output**.  
UI is Bootstrap‑based; code is highlighted via **self‑hosted Highlight.js**. Includes a **search box** to jump to any method in the active tab.

---

## Table of Contents

- [Objectives](#objectives)
- [What You Get](#what-you-get)
- [Project Structure](#project-structure)
- [Quick Start](#quick-start)
  - [Open directly](#open-directly)
  - [Docker (Nginx)](#docker-nginx)
  - [Docker Compose](#docker-compose)
- [Setup Highlight.js Locally (One‑time)](#setup-highlightjs-locally-one-time)
  - [Script: scripts/setup-highlightjs.sh](#script-scriptsssetup-highlightjssh)
  - [Make Executable & Run](#make-executable--run)
  - [Local vs CDN in index.html](#local-vs-cdn-in-indexhtml)
- [Using the UI](#using-the-ui)
  - [Tabs & Cards](#tabs--cards)
  - [Method Entries](#method-entries)
  - [Search Box](#search-box)
- [Included API Coverage](#included-api-coverage)
  - [java.lang](#javalang)
  - [java.util](#javautil)
  - [java.time](#javatime)
  - [java.util.stream](#javautilstream)
  - [java.util.regex](#javautilregex)
- [Extending the Content](#extending-the-content)
- [Diagrams (PlantUML / ASCII)](#diagrams-plantuml--ascii)
- [FAQ](#faq)
- [License](#license)

---

## Objectives

- Learn widely‑used Java APIs with **minimal context switching**.
- Keep examples **small, runnable, and consistent**.
- Be easy to **extend** (copy an existing class card and edit).

---

## What You Get

- **index.html** — A polished Bootstrap page with:
  - Navbar, Off‑canvas menu, Hero, Carousel
  - Tabs by package (`java.lang`, `java.util`, `java.time`, `java.util.stream`, `java.util.regex`)
  - For each class: **Cards → Accordions → Method entries**
  - **Copy Code / Copy Output** buttons with toasts
  - **Search box** to filter methods in the current tab
- **Dockerized static server** (Nginx) for `http://localhost:9999`
- **This README** with PlantUML/ASCII diagrams and instructions
- **A setup script** to fetch Highlight.js assets locally

---

## Project Structure

```
.  
├─ index.html  
├─ README.md  
├─ docker/  
│  ├─ Dockerfile  
│  ├─ default.conf  
│  └─ .dockerignore  
├─ docker-compose.yml  
├─ assets/  
│  └─ highlightjs/  
│     ├─ highlight.min.js  
│     └─ styles/  
│        ├─ github-dark.min.css  
│        └─ github.min.css  
└─ scripts/  
   └─ setup-highlightjs.sh
```

Tip: If you don’t have the `assets/highlightjs` folder yet, run the setup script below.

---

## Quick Start

### Open directly

Open `index.html` in your browser. (For reliable CSS reloads, prefer Docker or any local static server.)

### Docker (Nginx)

```
1) Build the image:  
   docker build -t java-api-lbd ./docker  
2) Run (mount project root read‑only):  
   docker run --rm -p 9999:80 -v "$PWD":/usr/share/nginx/html:ro java-api-lbd  
3) Open:  
   http://localhost:9999
```

### Docker Compose

```
1) Start:  
   docker compose up --build  
2) Open:  
   http://localhost:9999
```
---

## Setup Highlight.js Locally (One‑time)

Run a tiny script that fetches a pinned Highlight.js version + two themes (dark/light) into `assets/highlightjs/`.

### Script: scripts/setup-highlightjs.sh

Save this file at `scripts/setup-highlightjs.sh`:

```sh
    #!/usr/bin/env bash
    set -euo pipefail

    # Pinned Highlight.js version for reproducible builds
    HL_VERSION="11.9.0"

    # Resolve project root (script may be called from anywhere)
    ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
    ASSET_DIR="$ROOT_DIR/assets/highlightjs"
    STYLE_DIR="$ASSET_DIR/styles"

    mkdir -p "$STYLE_DIR"

    echo "Downloading Highlight.js v$HL_VERSION into $ASSET_DIR ..."

    curl -fL "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${HL_VERSION}/highlight.min.js" \
      -o "$ASSET_DIR/highlight.min.js"

    curl -fL "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${HL_VERSION}/styles/github-dark.min.css" \
      -o "$STYLE_DIR/github-dark.min.css"

    curl -fL "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${HL_VERSION}/styles/github.min.css" \
      -o "$STYLE_DIR/github.min.css"

    echo "OK. Files downloaded:"
    echo "  - $ASSET_DIR/highlight.min.js"
    echo "  - $STYLE_DIR/github-dark.min.css"
    echo "  - $STYLE_DIR/github.min.css"
    echo
    echo "Next steps:"
    echo "  1) In index.html <head>:"
    echo "       <link id=\"hljs-theme\" rel=\"stylesheet\" href=\"assets/highlightjs/styles/github-dark.min.css\">"
    echo "  2) At end of <body>:"
    echo "       <script src=\"assets/highlightjs/highlight.min.js\"></script>"
    echo "       <script>hljs.highlightAll();</script>"
    echo
    echo "Done."
```

### Make Executable & Run

From the project root:

```
    chmod +x scripts/setup-highlightjs.sh
    bash scripts/setup-highlightjs.sh
```

This will create:

```
- assets/highlightjs/highlight.min.js  
- assets/highlightjs/styles/github-dark.min.css  
- assets/highlightjs/styles/github.min.css
```

### Local vs CDN in index.html

Use **local** (recommended, offline‑friendly):

- In `<head>` (single link):  
  <link id="hljs-theme" rel="stylesheet" href="assets/highlightjs/styles/github-dark.min.css">
- At end of `<body>` (init):  
  <script src="assets/highlightjs/highlight.min.js"></script>  
  <script>hljs.highlightAll();</script>

If you prefer **CDN** instead, swap the link/script to cdnjs versions. Keep only **one** stylesheet link at a time.

---

## Using the UI

### Tabs & Cards

- Tabs represent **packages** (e.g., `java.util`).
- Inside each tab, each **card** represents a **class/interface** (e.g., `HashSet`).
- Expand the accordion items to see **methods**.

### Method Entries

Each method shows:
- **Signature** (monospace line)
- **Purpose / Parameters / Returns / Throws** (bulleted)
- **Javadoc‑style summary** (concise, paraphrased)
- **Code snippet** (copyable)
- **Expected console output** (copyable)

### Search Box

- Large **Search** input near the top of the page.
- Filters **methods within the active tab** only (keeps context clean).
- Matches are **highlighted**; non‑matches are hidden (methods and whole cards if no method matches).
- Press **Esc** or click the ✕ button to clear.

---

## Included API Coverage

### `java.lang`  {#javalang}

#### String (immutable UTF‑16 sequence)
1) `length()` — Purpose: count chars. Parameters: — Returns: `int`. Throws: —  
   Example: `"Hello, Java!"` → prints `13`  
2) `substring(int beginIndex, int endIndex)` — Purpose: slice text. Params: begin inclusive, end exclusive. Returns: `String`. Throws: `IndexOutOfBoundsException`.  
   Example: `"Transaction#INV-2025".substring(0,12)` → `Transaction`  
3) `contains(CharSequence s)` — Purpose: membership test. Returns: `boolean`.  
   Example: `"alpha,beta,gamma".contains("beta")` → `true`  
4) `replace(CharSequence target, CharSequence replacement)` — Purpose: replace all occurrences. Returns: `String`.  
   Example: `"alpha,beta,gamma".replace("beta","B")` → `alpha,B,gamma`  
5) `split(String regex)` — Purpose: tokenize by regex. Returns: `String[]`. Throws: `PatternSyntaxException`.  
   Example: `"a,b,c".split(",")` → `[a, b, c]`

#### StringBuilder (mutable sequence)
1) `append(...)` — Purpose: append values; many overloads. Returns: `this`.  
   Output: `Hello, Java 21`  
2) `insert(int offset, ...)` — Purpose: insert at index. Throws: `StringIndexOutOfBoundsException`.  
   Output: `Hello dear, Java`  
3) `delete(int start, int end)` / `deleteCharAt(int index)` — Purpose: remove range or single char.  
   Output: `Hello, Java**!`  
4) `replace(int start, int end, String str)` — Purpose: replace by range.  
   Output: `Order #INV-2025`  
5) `reverse()` — Purpose: reverse sequence in place.  
   Output: `LEVEL`

---

### `java.util`  {#javautil}

#### List (ArrayList)
1) `add(E e)` — Append element. Returns: `boolean` (usually `true`). Throws: `UnsupportedOperationException` for fixed‑size lists.  
   Output: `[Apple, Orange]`  
2) `get(int index)` — Access by position. Throws: `IndexOutOfBoundsException`.  
   Output: `B`  
3) `set(int index, E element)` — Replace at index; returns old value.  
   Output: `B -> [A, X, C]`  
4) `remove(int index)` / `remove(Object o)` — Delete by index or first match.  
   Output: `[A, B]`  
5) `sort(Comparator<? super E> c)` — In‑place sort. Throws: `ClassCastException` for incompatible natural order.  
   Output: `[apple, kiwi, mango]`

#### Map (HashMap)
1) `put(K key, V value)` — Insert/replace mapping. Returns previous value or `null`.  
   Output: `null`, then `2`, then `{apple=3}`  
2) `getOrDefault(Object key, V defaultValue)` — Lookup with fallback.  
   Output: `99`  
3) `containsKey(Object key)` — Key existence.  
   Output: `true`  
4) `computeIfAbsent(K key, Function<? super K,? extends V> f)` — Lazily create value.  
   Output: `{apple=2}`  
5) `merge(K key, V value, BiFunction<? super V,? super V,? extends V> f)` — Combine values.  
   Output: `4`

#### HashSet (no duplicates; average O(1))
1) `add(E e)` — Returns `true` if set changed.  
   Output: `true`, `false`, `[A]`  
2) `contains(Object o)` — Membership test.  
   Output: `true`, `false`  
3) `remove(Object o)` — Remove if present.  
   Output: `true`, `false`, `[A, C]`  
4) `size()` — Count elements.  
   Output: `2`  
5) `isEmpty()` — Quick emptiness test.  
   Output: `true`, then `false`

#### ArrayDeque (fast queue/deque/stack)
1) `addFirst(E e)` / `addLast(E e)` — Insert head/tail (may throw on capacity).  
   Output: `[A, B, C]`  
2) `offerFirst(E e)` / `offerLast(E e)` — Insert head/tail (non‑throwing).  
   Output: `true`, `true`, `[1, 2]`  
3) `pollFirst()` / `pollLast()` — Remove head/tail; returns `null` if empty.  
   Output: `A`, `C`, `[B]`  
4) `peekFirst()` / `peekLast()` — View head/tail; `null` if empty.  
   Output: `A`, `B`, `[A, B]`  
5) `push(E e)` / `pop()` — Stack‑style ops on front. Throws `NoSuchElementException` if empty.  
   Output: `30`, `[20, 10]`

---

### `java.time`  {#javatime}

#### LocalDate (date without time‑zone)
1) `now()` — Current date.  
   Output: `<today>`  
2) `of(int y, int m, int d)` — Specific date. Throws `DateTimeException` if invalid.  
   Output: `2025-10-20`  
3) `plusDays(long days)` — Add/subtract days.  
   Output: `2025-10-25`  
4) `format(DateTimeFormatter f)` — Format to text.  
   Output: `<today in dd-MMM-yyyy>`  
5) `parse(CharSequence text)` — Parse ISO‑8601. Throws `DateTimeParseException`.  
   Output: `2025-10-20`

#### Instant / ZoneId / ZonedDateTime
1) `Instant.now()` — Current UTC instant.  
   Output: `<current UTC instant>`  
2) `Instant.parse(CharSequence text)` — Parse ISO‑8601.  
   Output: `2025-08-13T00:01:30Z` (after `plusSeconds(90)`)  
3) `ofEpochMilli(long)` / `toEpochMilli()` — Convert to/from epoch millis.  
   Output: `true` (round trip)  
4) `ZoneId.of(String id)` — Get zone by ID.  
   Output: `Asia/Kolkata`  
5) `Instant.atZone(ZoneId)` — View instant in zone as `ZonedDateTime`.  
   Output: `2025-08-13T12:00+05:30[Asia/Kolkata]`

---

### `java.util.stream`  {#javautilstream}

#### Stream (functional pipelines)
1) `filter(Predicate)` — Keep matching elements.  
   Output: `[zebra, apple, mango]` (length ≥ 5)  
2) `map(Function)` — Transform elements.  
   Output: `[5, 5, 5]` (word lengths)  
3) `distinct()` — Remove duplicates (per `equals`).  
   Output: `[apple, mango, kiwi]`  
4) `sorted()` — Natural order sort.  
   Output: `[apple, mango, zebra]`  
5) `collect(Collector)` — Terminal reduce to container/string.  
   Output: `APPLE, MANGO, ZEBRA`

---

### `java.util.regex`  {#javautilregex}

#### Pattern / Matcher (compile once, reuse)
1) `Pattern.compile(String regex)` — Precompile pattern. Throws `PatternSyntaxException`.  
   Output: `\d+` pattern echoed  
2) `Pattern.matcher(CharSequence input)` — Create matcher over input.  
   Output: `true` (has a match)  
3) `Matcher.find()` — Iterate next match.  
   Output (two lines): `12 @ 1` and `345 @ 3`  
4) `Matcher.group()` / `group(int)` — Return matched text / capturing group. Throws `IllegalStateException` if no match yet.  
   Output: `INV / 2025`  
5) `Matcher.replaceAll(String repl)` — Replace every match (supports `$1` etc.).  
   Output: `13/08/2025`

---

## Extending the Content

1) Choose the **package tab** (e.g., `java.util`).  
2) Duplicate a **class card** (`<div class="card">…</div>`).  
3) For each new method, duplicate an **accordion item** and update:
   - Signature (in `<span class="sig">…`), and the **Purpose / Parameters / Returns / Throws / Javadoc summary**
   - Code snippet (inside `<pre><code id="code-…">`)
   - Console output (inside `<div class="console" id="out-…">`)
   - Copy button targets (`data-copy-target="code-…` and `…out-…`)  
4) Keep examples concise and deterministic so the output is obvious.

---

## Diagrams (PlantUML / ASCII)

Component diagram (paste into PlantUML renderer):

```PlantUML
@startuml  
skinparam shadowing false  
skinparam componentStyle rectangle  
package "Browser" {  
  [index.html] as UI  
  [Bootstrap] as BS  
  [Highlight.js] as HL  
}  
node "Nginx (Docker)" as N {  
  [Static Server]  
}  
UI -down-> BS  
UI -down-> HL  
UI --> N : GET / (index.html, assets)  
N --> UI : 200 OK (HTML/CSS/JS)  
@enduml

Sequence (Copy Code flow):

@startuml  
actor User  
boundary UI as "index.html"  
control Clipboard as "navigator.clipboard"  
User -> UI : Click "Copy Code"  
UI -> UI : Find target <code> by id  
UI -> Clipboard : writeText(source)  
Clipboard --> UI : Promise resolved  
UI -> UI : showToast("Copied!")  
@enduml
```

## ASCII UI layout:

```
+-------------------------------------------------------------+  
| Navbar + Offcanvas Package Index                            |  
+-----------------------+-------------------------------------+  
| Hero (Jumbotron)      | Carousel                            |  
+-----------------------+-------------------------------------+  
| Tabs: [java.lang] [java.util] [java.time] [streams] [regex] |  
+-------------------------------------------------------------+  
| Card(Class) → Accordion(Methods)                            |  
|   • Signature / Purpose / Params / Returns / Throws         |  
|   • Javadoc summary                                         |  
|   • Code snippet + Copy buttons                             |  
|   • Console output + Copy                                   |  
+-------------------------------------------------------------+
```
---

## FAQ

**Why paraphrase Javadoc instead of quoting?**  
To keep entries clear and concise. For exact language, use the official JDK docs for your version.

**Which Java version do snippets target?**  
Java 8+ features are used. Prefer an LTS (17 or 21) for local testing.

**Can I run without Docker?**  
Yes—open `index.html` directly, or use any static server (e.g., `python -m http.server 9999`).

**How do I add a new package?**  
Add a new **tab** panel in the HTML, copy card patterns inside it, and wire the tab button (`data-bs-target="#your-tab-id"`).

---

## License

MIT
