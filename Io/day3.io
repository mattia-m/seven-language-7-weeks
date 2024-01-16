# enhance the xml program to add spaces to show the indentation structure

Builder := Object clone do (
    indent := ""
    forward := method(
    writeln (indent, "<", call message name, ">")
    call message arguments foreach(
        arg,
        indent = "  " .. indent
        content := self doMessage(arg);
        if (content type == "Sequence", writeln(indent, content))
        indent = indent exSlice(2)
    writeln(indent, "</", call message name, ">")
    )
    )
)


Builder ul(
    li("foo"))