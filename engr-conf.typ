#let conf(
  doc,
  title: [Clever Title],
  author: (
    first_name: "First",
    last_name: "Last",
  ),
  date: datetime.today(),
) = {
  // Document Metadata
  let author_name = author.first_name + " " + author.last_name
  set document(
    title: title,
    author: author_name,
  )

  // Page size and numbering
  set page(
    "us-letter",
    header: align(right)[
      #author.last_name
      #context counter(page).display("1")
    ],
  )

  // Style raw blocks
  show raw.where(block: true): it => block(fill: rgb("#E6E6E6"), inset: 0.6em, width: 100%, it)

  // Title
  stack(
    dir: direction.ttb,
    spacing: 1em,
    text(17pt, weight: "bold", title),
    text(14pt, author_name),
    text(14pt, date.display("[month repr:long] [day padding:none], [year]")),
  )
  // Main Document
  doc
}

#let py_script(fname, put_fname: false) = {
  set raw(block: true)

  let script = read("scripts/" + fname + ".py")
  let output = read("output/" + fname + ".output")

  if (put_fname) {
    block(sticky: true)[*#fname\.py*]
  }
  raw(script, lang: "python")

  if (output.len() != 0) {
    block(sticky: true)[*Output:*]
    raw(output)
  }
}
