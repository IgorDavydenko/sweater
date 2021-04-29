<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Sign Out"/>
    </form>
</div>
<div>
    <form method="post" action="/index">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="text" name="message" placeholder="input message" />
        <input type="text" name="tag" placeholder="input tag" />
        <button type="submit">Add</button>
    </form>
</div>
<div>
    <div>
        <form method="get" action="/filter">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="text" name="filter" />
            <button type="submit">Filter by tag</button>
        </form>
    </div>
    <div>
        <h2>Messages:</h2>
        <#list messages>
            <table>
                <#items as message>
                    <tr>
                        <th>${message.text}</th>
                        <th>${message.tag}</th>
                    </tr>
                </#items>
            </table>
        <#else>
            No messages
        </#list>
    </div>
</div>
</body>
</html>