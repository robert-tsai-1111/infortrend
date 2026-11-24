

from pathlib import Path
import html
import markdown

SOURCE_DIR = Path(__file__).resolve().parent
OUTPUT_DIR = SOURCE_DIR / "html"


faq_items = []

# 搜尋所有子目錄中的 Markdown
for md_file in sorted(SOURCE_DIR.rglob("*.md")):
    if OUTPUT_DIR in md_file.parents:
        continue

    content = md_file.read_text(encoding="utf-8")

    lines = content.splitlines()
    title = md_file.stem

    if lines and lines[0].startswith("# "):
        title = lines[0][2:].strip()
        content = "\n".join(lines[1:])

    category = (
        md_file.parent.relative_to(SOURCE_DIR).as_posix()
        if md_file.parent != SOURCE_DIR
        else "Technical"
    )

    # Markdown 轉 HTML
    body_html = markdown.markdown(
        content,
        extensions=["fenced_code", "tables"]
    )

    faq_items.append({
        "title": title,
        "category": category,
        "body": body_html
    })

print(f"Converted: {md_file}")


# 產生 FAQ HTML
faq_html = ""

for item in faq_items:

    search_text = html.escape(
        f"{item['title']} {item['category']} {item['body']}"
        .replace("<", " ")
        .replace(">", " ")
        .lower(),
        quote=True
    )

    faq_html += f"""
    <article class="faq-item"
             data-category="{html.escape(item['category'], quote=True)}"
             data-search="{search_text}">

        <details>
            <summary>{html.escape(item['title'])}</summary>

            <div class="answer">
                {item['body']}
            </div>
        </details>

    </article>
    """


# 產生分類按鈕
categories = sorted(set(
    item["category"] for item in faq_items
))

category_html = '<button data-category="all">全部</button>'

for category in categories:
    category_html += (
        f'<button data-category="{html.escape(category, quote=True)}">'
        f'{html.escape(category)}</button>'
    )


# 完整 HTML
page = f"""<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>產品 FAQ 支援中心</title>

<style>
body {{
    font-family: Arial, sans-serif;
    background: #f5f7fa;
    color: #263238;
    line-height: 1.7;
    margin: 0;
}}

.container {{
    max-width: 900px;
    margin: 50px auto;
    padding: 20px;
}}

header {{
    text-align: center;
    margin-bottom: 30px;
}}

input {{
    width: 100%;
    padding: 14px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
}}

.categories {{
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin: 20px 0;
}}

button {{
    border: 0;
    padding: 8px 16px;
    border-radius: 6px;
    cursor: pointer;
    background: #e5eaf0;
}}

button:hover {{
    background: #cbd5e1;
}}

.faq-item {{
    background: white;
    padding: 18px;
    margin-bottom: 12px;
    border-radius: 8px;
}}

summary {{
    cursor: pointer;
    font-weight: bold;
}}

.answer {{
    border-top: 1px solid #eee;
    margin-top: 15px;
    padding-top: 12px;
    overflow-wrap: anywhere;
}}

.answer img {{
    max-width: 100%;
}}

[hidden] {{
    display: none !important;
}}

@media(max-width: 600px) {{
    .container {{
        margin: 20px auto;
        padding: 15px;
    }}
}}
</style>
</head>

<body>
<main class="container">

<header>
    <h1>產品 FAQ 支援中心</h1>
    <p>搜尋產品問題與使用說明</p>
    <input id="search" type="search"
           placeholder="輸入關鍵字搜尋...">
</header>

<nav class="categories">
    {category_html}
</nav>

<section id="faq-list">
    {faq_html}
</section>

<p id="no-result" hidden>
    找不到符合條件的問題。
</p>

</main>

<script>
const input = document.getElementById('search');
const items = [...document.querySelectorAll('.faq-item')];
const buttons = document.querySelectorAll('[data-category]');
const noResult = document.getElementById('no-result');

let currentCategory = 'all';

function filterFaq() {{
    const keyword = input.value.trim().toLowerCase();
    let count = 0;

    items.forEach(item => {{
        const content = item.dataset.search || '';
        const category = item.dataset.category || '';

        const matchedKeyword = content.includes(keyword);
        const matchedCategory =
            currentCategory === 'all' ||
            category === currentCategory;

        const visible = matchedKeyword && matchedCategory;

        item.hidden = !visible;

        if (visible) count++;
    }});

    noResult.hidden = count !== 0;
}}

input.addEventListener('input', filterFaq);

buttons.forEach(button => {{
    button.addEventListener('click', () => {{
        currentCategory = button.dataset.category;
        filterFaq();
    }});
}});
</script>

</body>
</html>
"""

OUTPUT_DIR.joinpath("index.html").write_text(
    page,
    encoding="utf-8"
)

print(f"Build completed: {len(faq_items)} FAQ(s)")


