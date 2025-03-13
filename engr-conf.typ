#let conf(
  doc,
) = {
  // Style raw blocks
  show raw: it => block(fill: rgb("#E6E6E6"), inset: 1em, width: 100%, it)

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
