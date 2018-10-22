import unittest, ../src/slackdown

suite "test can handle id":
    setup:
        let singleIdHtml = [
            "*Single Id*{#has-some-id}",
            "<em id='has-some-id'>Single Id</em>"
        ]

    test "can generate html with single id":
        let res = slackdown.parse(singleIdHtml[0])
        check(res == singleIdHtml[1])

suite "test can handle class(es)":
    setup:
        let singleClassHtml = [
            "*Single Class*{.has-some-class}",
            "<em class='has-some-class'>Single Class</em>"
        ]
        
        let multipleClassHtml = [
            "*Multiple Classes*{.some-class .some-other-class}",
            "<em class='some-class some-other-class'>Multiple Classes</em>"
        ]

    test "can generate html with single class":
        let res = slackdown.parse(singleClassHtml[0])
        check(res == singleClassHtml[1])

    test "can generate html with multiple classes":
        let res = slackdown.parse(multipleClassHtml[0])
        check(res == multipleClassHtml[1])

suite "test can handle attribute(s)":
    setup:
        let singleAttrHtml = [
            "*Single Attr*{data-attr=has-some-attribute}",
            "<em data-attr='has-some-attribute'>Single Attr</em>"
        ]
        
        let multipleAttrHtml = [
            "*Multiple Attrs*{data-attr=has-some-attribute data-test=true}",
            "<em data-attr='has-some-attribute' data-test='true'>Multiple Attrs</em>"
        ]

    test "can generate html with single attribute":
        let res = slackdown.parse(singleAttrHtml[0])
        check(res == singleAttrHtml[1])

    test "can generate html with multiple attributes":
        let res = slackdown.parse(multipleAttrHtml[0])
        check(res == multipleAttrHtml[1])
