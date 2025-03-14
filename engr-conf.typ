#let conf(
  doc,
  title: [Clever Title],
  author: (
    first_name: "First",
    last_name: "Last",
  ),
) = {
  let author_name = author.first_name + " " + author.last_name
  // Style raw blocks
  show raw: it => block(fill: rgb("#E6E6E6"), inset: 1em, width: 100%, it)

  // Title
  stack(
    dir: direction.ttb,
    spacing: 1em,
    text(17pt, weight: "bold", title),
    text(14pt, author_name),
  )
  // Main Document
  doc
}

#let py_script(fname) = {
  set raw(block: true)

  let script = read("scripts/" + fname + ".py")
  let output = read("output/" + fname + ".output")

  raw(script, lang: "python")

  if (output.len() != 0) {
    strong[Output:]
    raw(output)
  }
}
