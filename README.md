# Java API — Learning by Doing

A hands-on, Bootstrap-powered “learn by doing” reference for popular **Core Java** APIs.  
Browse by **package → class → method**. Each method entry includes:

- **Signature**
- **Purpose / Parameters / Returns / Throws**
- **Javadoc-style summary** (concise, paraphrased)
- **Runnable-style demo snippet**
- **Expected console output**
- One‑click **Copy Code/Output** with Toast feedback

---

## 🎯 Objectives

- Learn core Java APIs with minimal context switching.
- Keep examples runnable and small.
- Standardize method documentation so you can expand effortlessly.

---

## 🗂️ Project Structure

```
├─ index.html                 # The interactive tutorial UI
├─ README.md                  # You are here
├─ docker/
│  ├─ Dockerfile              # Nginx static image
│  ├─ default.conf            # Nginx server config
│  └─ .dockerignore
└─ docker-compose.yml         # Optional: easy local run
```

---

## 🚀 Running Locally

### Option A: Open `index.html` directly
Just double‑click `index.html` (works offline via CDN).  
Tip: if network-restricted, swap CDN links to local assets.

### Option B: Docker (single command)
```bash
docker build -t java-api-lbd ./docker
docker run --rm -p 9999:80 -v "$PWD":/usr/share/nginx/html:ro java-api-lbd
# Open http://localhost:9999
```

### Option C: Docker Compose

```bash
docker compose up --build
# Open http://localhost:9999
```

### 🧱 UI Layout (ASCII)

```
+-------------------------------------------------------------+
| Navbar + Offcanvas Package Index                            |
+-----------------------+-------------------------------------+
| Hero (Jumbotron)      | Carousel                            |
+-----------------------+-------------------------------------+
| Tabs: [java.lang] [java.util] [java.time] [java.util.stream]|
+-------------------------------------------------------------+
| Card(Class) → Accordion(Methods)                            |
|   • Signature / Purpose / Params / Returns / Throws         |
|   • Javadoc summary                                         |
|   • Code snippet + Copy buttons                             |
|   • Console output + Copy                                   |
+-------------------------------------------------------------+
```

## 🌱 How to Extend (Add Classes/Methods)
	1.	Pick the package tab (e.g., #java-lang).
	2.	Within the tab’s grid, add a Card for the new class:
	•	Give it an id like class-stringbuilder.
	3.	Inside the card, add an Accordion with one accordion-item per method.
	4.	For each method, include:
	•	Signature line (.sig)
	•	Bullet list: Purpose / Parameters / Returns / Throws / Javadoc summary
	•	A demo <pre><code class="language-java" id="code-..."> ... </code></pre>
	•	A console <div class="console" id="out-..."> ... </div>
	•	Copy buttons with data-copy-target="code-..." and data-copy-target="out-..."

Reuse any existing class block as a template to keep consistency.

⸻

## 🧪 Example Class You Can Paste (StringBuilder)

See “Appendix: StringBuilder block” below for a complete, paste‑ready class card (5 methods).

⸻

## 🧩 PlantUML Diagrams

Save as docs/diagrams.puml if you want to render, or paste into https://www.plantuml.com/plantuml/

### Component View

```uml
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
```

## 🧱 Appendix: Paste‑ready StringBuilder Class Block

Copy this entire block into the java.lang tab’s grid (e.g., after String) in index.html.

```html
<!-- StringBuilder -->
<div class="col-12" id="class-stringbuilder">
  <div class="card border-0 shadow-sm">
    <div class="card-body">
      <h3 class="card-title">
        <span class="badge text-bg-primary badge-pkg">java.lang.StringBuilder</span>
      </h3>
      <p class="text-secondary">Mutable sequence of characters; efficient concatenation and in-place edits.</p>

      <div class="accordion" id="acc-stringbuilder">

        <!-- append(...) -->
        <div class="accordion-item">
          <h2 class="accordion-header" id="sb-append-h">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#sb-append">append(…)</button>
          </h2>
          <div id="sb-append" class="accordion-collapse collapse show" data-bs-parent="#acc-stringbuilder">
            <div class="accordion-body">
              <p class="mb-2"><span class="sig">StringBuilder append(<em>overloads</em>)</span></p>
              <ul class="small mb-3">
                <li><strong>Purpose:</strong> Append representations of arguments (primitives, char[], String, Object, etc.).</li>
                <li><strong>Parameters:</strong> value to append; many overloads.</li>
                <li><strong>Returns:</strong> <code>this</code> (for chaining).</li>
                <li><strong>Throws:</strong> —</li>
                <li><strong>Javadoc (summary):</strong> Appends the string representation of the argument to this sequence.</li>
              </ul>
<pre><code id="code-sb-append" class="language-java">public class Demo {
  public static void main(String[] args) {
    StringBuilder sb = new StringBuilder("Hello");
    sb.append(", ").append("Java ").append(21);
    System.out.println(sb.toString());
  }
}</code></pre>
              <div class="d-flex gap-2 mb-2">
                <button class="btn btn-sm btn-outline-primary" data-copy-target="code-sb-append">Copy Code</button>
              </div>
              <div class="console" id="out-sb-append">Hello, Java 21</div>
            </div>
          </div>
        </div>

        <!-- insert(int, …) -->
        <div class="accordion-item">
          <h2 class="accordion-header" id="sb-insert-h">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sb-insert">insert(int offset, …)</button>
          </h2>
          <div id="sb-insert" class="accordion-collapse collapse" data-bs-parent="#acc-stringbuilder">
            <div class="accordion-body">
              <p class="mb-2"><span class="sig">StringBuilder insert(int offset, <em>overloads</em>)</span></p>
              <ul class="small mb-3">
                <li><strong>Purpose:</strong> Insert text at a given index.</li>
                <li><strong>Parameters:</strong> <code>offset</code> (0..length); value to insert.</li>
                <li><strong>Returns:</strong> <code>this</code>.</li>
                <li><strong>Throws:</strong> <code>StringIndexOutOfBoundsException</code> if offset invalid.</li>
                <li><strong>Javadoc (summary):</strong> Inserts the string representation of the argument into this sequence.</li>
              </ul>
<pre><code id="code-sb-insert" class="language-java">public class Demo {
  public static void main(String[] args) {
    StringBuilder sb = new StringBuilder("Helo, Java");
    sb.insert(2, "l"); // fix "Hello"
    sb.insert(5, " dear"); 
    System.out.println(sb.toString());
  }
}</code></pre>
              <div class="d-flex gap-2 mb-2">
                <button class="btn btn-sm btn-outline-primary" data-copy-target="code-sb-insert">Copy Code</button>
              </div>
              <div class="console" id="out-sb-insert">Hello dear, Java</div>
            </div>
          </div>
        </div>

        <!-- delete(int, int) / deleteCharAt(int) -->
        <div class="accordion-item">
          <h2 class="accordion-header" id="sb-delete-h">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sb-delete">delete(int start, int end) / deleteCharAt(int index)</button>
          </h2>
          <div id="sb-delete" class="accordion-collapse collapse" data-bs-parent="#acc-stringbuilder">
            <div class="accordion-body">
              <p class="mb-2"><span class="sig">StringBuilder delete(int start, int end) • StringBuilder deleteCharAt(int index)</span></p>
              <ul class="small mb-3">
                <li><strong>Purpose:</strong> Remove a range or a single char.</li>
                <li><strong>Parameters:</strong> start (inclusive), end (exclusive) / index.</li>
                <li><strong>Returns:</strong> <code>this</code>.</li>
                <li><strong>Throws:</strong> <code>StringIndexOutOfBoundsException</code> for invalid indices.</li>
                <li><strong>Javadoc (summary):</strong> Deletes characters in the specified range or at index.</li>
              </ul>
<pre><code id="code-sb-delete" class="language-java">public class Demo {
  public static void main(String[] args) {
    StringBuilder sb = new StringBuilder("Hello, ***Java***!");
    sb.delete(7, 10);        // remove first "***"
    sb.deleteCharAt(sb.length()-2); // remove last '*'
    System.out.println(sb.toString());
  }
}</code></pre>
              <div class="d-flex gap-2 mb-2">
                <button class="btn btn-sm btn-outline-primary" data-copy-target="code-sb-delete">Copy Code</button>
              </div>
              <div class="console" id="out-sb-delete">Hello, Java**!</div>
            </div>
          </div>
        </div>

        <!-- replace(int, int, String) -->
        <div class="accordion-item">
          <h2 class="accordion-header" id="sb-replace-h">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sb-replace">replace(int start, int end, String str)</button>
          </h2>
          <div id="sb-replace" class="accordion-collapse collapse" data-bs-parent="#acc-stringbuilder">
            <div class="accordion-body">
              <p class="mb-2"><span class="sig">StringBuilder replace(int start, int end, String str)</span></p>
              <ul class="small mb-3">
                <li><strong>Purpose:</strong> Replace a substring by range.</li>
                <li><strong>Parameters:</strong> start (inclusive), end (exclusive), replacement.</li>
                <li><strong>Returns:</strong> <code>this</code>.</li>
                <li><strong>Throws:</strong> <code>StringIndexOutOfBoundsException</code> if range invalid.</li>
                <li><strong>Javadoc (summary):</strong> Replaces characters in the specified subsequence.</li>
              </ul>
<pre><code id="code-sb-replace" class="language-java">public class Demo {
  public static void main(String[] args) {
    StringBuilder sb = new StringBuilder("Order #INV-2024");
    sb.replace(9, 13, "2025");
    System.out.println(sb.toString());
  }
}</code></pre>
              <div class="d-flex gap-2 mb-2">
                <button class="btn btn-sm btn-outline-primary" data-copy-target="code-sb-replace">Copy Code</button>
              </div>
              <div class="console" id="out-sb-replace">Order #INV-2025</div>
            </div>
          </div>
        </div>

        <!-- reverse() -->
        <div class="accordion-item">
          <h2 class="accordion-header" id="sb-reverse-h">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sb-reverse">reverse()</button>
          </h2>
          <div id="sb-reverse" class="accordion-collapse collapse" data-bs-parent="#acc-stringbuilder">
            <div class="accordion-body">
              <p class="mb-2"><span class="sig">StringBuilder reverse()</span></p>
              <ul class="small mb-3">
                <li><strong>Purpose:</strong> Reverse the character sequence in place.</li>
                <li><strong>Parameters:</strong> —</li>
                <li><strong>Returns:</strong> <code>this</code>.</li>
                <li><strong>Throws:</strong> —</li>
                <li><strong>Javadoc (summary):</strong> Causes this character sequence to be replaced by its reverse.</li>
              </ul>
<pre><code id="code-sb-reverse" class="language-java">public class Demo {
  public static void main(String[] args) {
    StringBuilder sb = new StringBuilder("LEVEL");
    sb.reverse();
    System.out.println(sb.toString());
  }
}</code></pre>
              <div class="d-flex gap-2 mb-2">
                <button class="btn btn-sm btn-outline-primary" data-copy-target="code-sb-reverse">Copy Code</button>
              </div>
              <div class="console" id="out-sb-reverse">LEVEL</div>
            </div>
          </div>
        </div>

      </div><!-- /accordion -->
    </div>
  </div>
</div>
```

## 🔧 Roadmap (suggested next adds)

```
	•	java.util.Set (HashSet): add, contains, remove, size, isEmpty
	•	java.util.regex (Pattern, Matcher): compile, matcher, find, group, replaceAll
	•	java.util (ArrayDeque): addFirst/addLast, offerFirst/offerLast, pollFirst/pollLast, peek, push/pop
	•	java.time (Instant, ZoneId, ZonedDateTime): now, of, atZone, toEpochMilli, parse
```

# Docker 

## docker/Dockerfile

```dockerfile
# Simple static server using Nginx
FROM nginx:stable-alpine

# Copy server config
COPY default.conf /etc/nginx/conf.d/default.conf

# Serve everything from /usr/share/nginx/html
# We'll mount the project root at runtime.
WORKDIR /usr/share/nginx/html

# Healthcheck (optional)
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost/ || exit 1
```

## docker/default.conf

```
server {
  listen 80;
  server_name localhost;

  root   /usr/share/nginx/html;
  index  index.html;

  location / {
    try_files $uri $uri/ /index.html;
  }

  # Basic cache headers for static assets if you add local assets later
  location ~* \.(?:css|js|png|jpg|jpeg|gif|svg|ico)$ {
    expires 7d;
    add_header Cache-Control "public, max-age=604800";
  }
}
```

## docker/.dockerignore

```
**/.DS_Store
**/.git
**/node_modules
```

## docker-compose.yml (at project root)

```yml
services:
  java-api:
    build: ./docker
    ports:
      - "9999:80"
    volumes:
      - ./:/usr/share/nginx/html:ro
```



